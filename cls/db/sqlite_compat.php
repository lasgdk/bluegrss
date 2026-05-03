<?php
if (!function_exists('sqlite_open')) {
    if (!class_exists('SQLite3')) {
        return;
    }

    if (!defined('SQLITE_ASSOC')) define('SQLITE_ASSOC', 1);
    if (!defined('SQLITE_NUM')) define('SQLITE_NUM', 2);

    class GregariusSqliteCompatResult {
        var $rows = array();
        var $idx = 0;

        function GregariusSqliteCompatResult($rows) {
            $this->rows = $rows;
            $this->idx = 0;
        }
    }

    function sqlite_open($filename, $mode = 0666, &$error_message = null) {
        try {
            $db = new SQLite3($filename);
            return $db;
        } catch (Exception $e) {
            $error_message = $e->getMessage();
            return false;
        }
    }

    function sqlite_query($db, $query) {
        $res = @$db->query($query);
        if ($res === false) return false;

        $rows = array();
        while (($row = $res->fetchArray(SQLITE3_ASSOC)) !== false) {
            $rows[] = $row;
        }
        return new GregariusSqliteCompatResult($rows);
    }

    function sqlite_num_rows($result) {
        return is_object($result) ? count($result->rows) : 0;
    }

    function sqlite_fetch_array($result, $result_type = SQLITE_BOTH) {
        if (!is_object($result) || $result->idx >= count($result->rows)) return false;

        $row = $result->rows[$result->idx++];
        if ($result_type == SQLITE_ASSOC) return $row;
        if ($result_type == SQLITE_NUM) return array_values($row);

        $both = array_values($row);
        foreach ($row as $k => $v) $both[$k] = $v;
        return $both;
    }

    function sqlite_last_error($db) { return $db->lastErrorCode(); }
    function sqlite_error_string($error_code) { return 'SQLite error code: ' . $error_code; }
    function sqlite_last_insert_rowid($db) { return $db->lastInsertRowID(); }
    function sqlite_escape_string($string) { return SQLite3::escapeString($string); }
    function sqlite_create_function($db, $name, $callback, $argcount = -1) {
        return $db->createFunction($name, $callback, $argcount);
    }
}
