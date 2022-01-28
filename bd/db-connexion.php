<?php
require 'db-config.php';

try
{
    $option =
    [
        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        #PDO::ATTR_PERSISTENT => true,
    ];
    
    $PDO = new PDO($DB_DSN, $DB_USER, $DB_PASS, $option);

    //echo 'Connexion &eacute;tablie !';
}
catch(PDOException $pe)
{
    echo 'ERREUR : '.$pe->getMessage();
}