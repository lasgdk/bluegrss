<?php

if (!function_exists('each')) {
    function each(&$array) {
        if (!is_array($array)) {
            return false;
        }

        $key = key($array);
        if ($key === null) {
            return false;
        }

        $value = current($array);
        next($array);

        return array(
            1 => $value,
            'value' => $value,
            0 => $key,
            'key' => $key,
        );
    }
}

if (!function_exists('ereg')) {
    function ereg($pattern, $string, &$regs = null) {
        $delimiter = '~';
        $pattern = str_replace($delimiter, '\\' . $delimiter, $pattern);
        $result = preg_match($delimiter . $pattern . $delimiter, $string, $matches);
        if ($regs !== null) {
            $regs = $matches;
        }
        return $result;
    }
}

if (!function_exists('eregi')) {
    function eregi($pattern, $string, &$regs = null) {
        $delimiter = '~';
        $pattern = str_replace($delimiter, '\\' . $delimiter, $pattern);
        $result = preg_match($delimiter . $pattern . $delimiter . 'i', $string, $matches);
        if ($regs !== null) {
            $regs = $matches;
        }
        return $result;
    }
}

function rss_cookie_options($expires = 0, $path = null) {
    if ($path === null) {
        $path = '/';
        if (function_exists('getPath')) {
            $path = getPath();
        }
    }

    $secure = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off';

    return array(
        'expires' => $expires,
        'path' => $path,
        'secure' => $secure,
        'httponly' => true,
        'samesite' => 'Lax',
    );
}

function rss_set_cookie($name, $value, $expires = 0, $path = null) {
    $options = rss_cookie_options($expires, $path);

    if (PHP_VERSION_ID >= 70300) {
        return setcookie($name, $value, $options);
    }

    return setcookie(
        $name,
        $value,
        $options['expires'],
        $options['path'] . '; SameSite=' . $options['samesite'],
        $options['secure'],
        $options['httponly']
    );
}

function rss_ensure_session($allowTransSid = false) {
    if (session_status() === PHP_SESSION_ACTIVE) {
        return true;
    }

    if ($allowTransSid) {
        @ini_set('session.use_trans_sid', true);
    }

    if (PHP_VERSION_ID >= 70300) {
        $options = rss_cookie_options(0, '/');
        session_set_cookie_params($options);
    }

    return session_start();
}

function rss_csrf_token() {
    rss_ensure_session();

    if (empty($_SESSION['rss_csrf_token'])) {
        $_SESSION['rss_csrf_token'] = bin2hex(random_bytes(32));
    }

    return $_SESSION['rss_csrf_token'];
}

function rss_verify_csrf_token($token) {
    if (!is_string($token) || $token === '') {
        return false;
    }

    rss_ensure_session();

    if (empty($_SESSION['rss_csrf_token'])) {
        return false;
    }

    return hash_equals($_SESSION['rss_csrf_token'], $token);
}

function rss_require_valid_csrf_token($token) {
    if (!rss_verify_csrf_token($token)) {
        rss_error('Invalid request token.', RSS_ERROR_ERROR, true);
        exit();
    }
}

function rss_normalize_id_list($rawIds) {
    if (!is_string($rawIds) && !is_numeric($rawIds)) {
        return '';
    }

    $parts = preg_split('/\s*,\s*/', (string) $rawIds);
    $normalized = array();

    foreach ($parts as $part) {
        if ($part === '' || !preg_match('/^\d+$/', $part)) {
            continue;
        }

        $normalized[(string) ((int) $part)] = (string) ((int) $part);
    }

    return implode(',', array_values($normalized));
}
