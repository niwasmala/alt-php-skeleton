<?php if(!defined("__DIR__")) define('__DIR__', dirname(__FILE__));

define('ALT_PATH', __DIR__ . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'alt-php' . DIRECTORY_SEPARATOR . 'alt-php' . DIRECTORY_SEPARATOR);
define('APP_PATH', __DIR__ . DIRECTORY_SEPARATOR);

ini_set('xdebug.show_exception_trace', 'Off');
error_reporting(E_ALL ^ E_NOTICE);

require ALT_PATH . 'Alt.php';
spl_autoload_register(array('Alt', 'autoload'));

Alt::start();