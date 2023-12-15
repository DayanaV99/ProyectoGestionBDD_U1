<?php
require('bd.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los datos del formulario
    $nombrep = $_POST["nombreP"];
    $nombreS = $_POST["nombreS"];
    $apellidop = $_POST["apellidoP"];
    $apellidos = $_POST["apellidoS"];
    $fechaNacimien = $_POST["fechaNac"];
    $genero = $_POST["genero"];
    $telefono = $_POST["telefono"];
    $estadocivil = $_POST["estadocivil"];
    $direccion = $_POST["direccion"];
    $fechaBautismo = $_POST["Fechabautismo"];
    $organizacion = $_POST["organizacion"];



    // Insertar los datos en la base de datos
    $sql = "INSERT INTO Personas ( nombre1, nombre2, apellido1, apellido2, fecha_nacimiento, genero, telefono, estado_civil, direccion, fecha_bautismo_id, organizacion_id)
    VALUES
      ( '$nombrep', '$nombreS', '$apellidop', '$apellidos' ,'$fechaNacimien', '$genero', '$telefono', '$estadocivil', '$direccion', $fechaBautismo, $organizacion)";
    // Otros campos del formulario...

    if ($conn->query($sql) === TRUE) {
        echo "Datos guardados correctamente";
    } else {
        echo "Error al guardar los datos: " . $conn->error;
    }

    // Cerrar la conexión
    $conn->close();
    header("location: administrarNiños.php");

}
?>

