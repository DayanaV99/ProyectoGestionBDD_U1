<?php

    define('SERVERNAME' , 'localhost');
    define('USERNAME' , 'root');
    define('PASSWORD' , 'administrador');
    define('DBNAME' , 'ProyectoGestionBDDu1');

    //Craear conexion a la base de datos
    $conn = new mysqli(SERVERNAME, USERNAME, PASSWORD, DBNAME);

    //Controlar conexion
    if($conn -> connect_error){
        die("Conexion fallida: " . $conn -> connect_error);
    }else{
        echo "";
    }

?>
