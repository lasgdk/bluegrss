# PHP-kompatibilitetscheck (2026-04-23)

## Branch-status
- Lokal branch: `work`
- Ingen remotes konfigureret
- Ingen ekstra lokale branches fundet

## Konklusion
Projektet er **stadig ikke kompatibelt med moderne PHP (PHP 8.x)** i nuværende tilstand.

## Fundne blocker-typer

1. **Direkte parse-fejl i PHP 8**
   - `extlib/JSON.php` bruger streng-offset med krøllede parenteser (`$utf16{0}`), som giver parse-fejl i PHP 8.

2. **Fjernede MySQL-funktioner (`mysql_*`)**
   - Installer og database-wrapper bruger `mysql_connect`, `mysql_query`, `mysql_*`, der blev fjernet efter PHP 5.x.

3. **Fjernede regex-funktioner (`ereg`/`eregi`)**
   - Flere filer bruger `ereg`/`eregi`, som er fjernet i moderne PHP.

4. **Fjernet `split()`**
   - Flere steder bruger `split()`, som er fjernet.

5. **Fjernet `each()`**
   - Iteration med `each()` findes flere steder og er fjernet i PHP 8.

6. **Fjernet `create_function()`**
   - Forekommer i `extlib/uri_util.php`.

7. **Gammel constructor-stil**
   - Klasse-konstruktør navngivet som klassen (`function MysqlDB()`) i stedet for `__construct()`.

## Kommandoer brugt
- `git status --short --branch && git branch -a`
- `git remote -v; git show-ref --heads --tags`
- `rg -n "\b(mysql_|ereg\(|eregi\(|split\(|create_function\(|each\(|\$HTTP_|__autoload\b|\bvar\s+\$|&\$this|session_register\()" --glob '*.php'`
- `php -v | head -n 2; for f in $(rg --files -g '*.php'); do php -l "$f" >/tmp/php_lint_out 2>&1 || { echo "FAIL $f"; cat /tmp/php_lint_out; break; }; done; echo 'lint_done'`

## Prioriteret migrationsretning
1. Fikse parse-fejl i `extlib/JSON.php` (krøllede string offsets -> `[]`).
2. Udskifte `mysql_*` med `mysqli` eller PDO.
3. Erstatte `ereg`/`eregi` med `preg_match`/`preg_replace`.
4. Erstatte `split()` med `preg_split()` eller `explode()`.
5. Erstatte `each()` med `foreach`.
6. Erstatte `create_function()` med anonyme funktioner.
7. Opdatere gamle constructors til `__construct()`.
