<?php defined("ALT_PATH") OR die("No direct access allowed.");

return array (
    "app"                       => array(
        "id"                    => "alt-php",
        "name"                  => "Alt PHP Framework",
        "environment"           => "development",
    ),
    "log"                       => array(
        "level"                 => 5,
    ),
    "session"                   => array(
        "lifetime"              => 43200,
    ),
    "security"                  => array(
        "key"                   => "89432hjfsd891787",
        "iv"                    => "fdsfds85435nfdfs",
    ),
    "database"                  => array(
        "default"               => array (
            "type"              => "Mysql",
            "charset"           => "utf8",
            "connection"        => array(
                "hostname"      => "localhost",
                "database"      => "alt-php",
                "username"      => "root",
                "password"      => "w2e3r4",
                "persistent"    => FALSE,
            ),
        ),
    ),
);