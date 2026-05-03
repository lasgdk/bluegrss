# PHP-kompatibilitetscheck (opdateret 2026-04-24)

## Branch-status
- Lokal branch: `work`
- Ingen remotes konfigureret
- Ingen ekstra lokale branches fundet

## Konklusion
Projektet er **stadig ikke kompatibelt med moderne PHP (PHP 8.x)** i nuværende tilstand og kan ikke starte stabilt i et almindeligt webserver-miljø med PHP 8.

## Praktisk test i webserver-miljø (kørt 2026-04-24)
1. Startet PHP indbygget webserver: `php -S 127.0.0.1:8090 -t .`
2. Kaldt applikationen: `curl -i http://127.0.0.1:8090/index.php`
3. Resultat: **HTTP 500 Internal Server Error**.
4. Fatal fejl i server-log:
   - `Undefined constant "ASSERT_QUIET_EVAL"` i `constants.php` linje 44.

Det betyder, at applikationen fejler tidligt i bootstrap og ikke er kørbar som webapp på PHP 8 uden ændringer.

## Ekstra syntakstjek
Kørsel af `php -l` over PHP-filer finder også en blocker:
- `extlib/JSON.php` giver parse-fejl ved streng-offset med krøllede parenteser (`$utf16{0}`).

## Fundne blocker-typer
1. **Direkte parse-fejl i PHP 8**
   - `extlib/JSON.php` bruger streng-offset med krøllede parenteser (`$utf16{0}`), som giver parse-fejl i PHP 8.
2. **Fjernede MySQL-funktioner (`mysql_*`)**
   - Installer og database-wrapper bruger `mysql_connect`, `mysql_query`, `mysql_*`.
3. **Fjernede regex-funktioner (`ereg`/`eregi`)**
   - Flere filer bruger `ereg`/`eregi`.
4. **Fjernet `split()`**
   - Flere steder bruger `split()`.
5. **Fjernet `each()`**
   - Iteration med `each()` findes flere steder.
6. **Fjernet `create_function()`**
   - Forekommer i `extlib/uri_util.php`.
7. **Gammel constructor-stil**
   - Klasse-konstruktør navngivet som klassen (`function MysqlDB()`) i stedet for `__construct()`.

## Kommandoer brugt
- `git status --short --branch`
- `git branch -a`
- `git remote -v; git show-ref --heads --tags`
- `php -S 127.0.0.1:8090 -t .`
- `curl -i --max-time 10 http://127.0.0.1:8090/index.php`
- `rg -n "\b(mysql_|ereg\(|eregi\(|split\(|create_function\(|each\(|\$HTTP_|__autoload\b|\bvar\s+\$|&\$this|session_register\()" --glob '*.php'`
- `php -v | head -n 2; for f in $(rg --files -g '*.php'); do php -l "$f" >/tmp/php_lint_out 2>&1 || { echo "FAIL $f"; cat /tmp/php_lint_out; break; }; done; echo 'lint_done'`

## Prioriteret migrationsretning
1. Fikse bootstrap-fejl omkring `ASSERT_QUIET_EVAL` i `constants.php`.
2. Fikse parse-fejl i `extlib/JSON.php` (krøllede string offsets -> `[]`).
3. Udskifte `mysql_*` med `mysqli` eller PDO.
4. Erstatte `ereg`/`eregi` med `preg_match`/`preg_replace`.
5. Erstatte `split()` med `preg_split()` eller `explode()`.
6. Erstatte `each()` med `foreach`.
7. Erstatte `create_function()` med anonyme funktioner.
8. Opdatere gamle constructors til `__construct()`.
