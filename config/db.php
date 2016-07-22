<?php

return [
    'driver' => 'pdo_pgsql',
    'host' => '127.0.0.1',
    'dbname' => getenv('PGDB'),
    'user' => getenv('PGUSER'),
    'password' => getenv('PGPASS'),
    'charset' => 'UTF8',
];
