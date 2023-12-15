<?php
require('bd.php');
// $consulta = "SELECT * FROM VistaPersonas";
// $resultado = mysqli_query($conn, $consulta) or die('Problema con la BDD');
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Niños</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
 
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('ruta/de/la/imagen-religiosa.jpg'); /* Reemplaza con la ruta de tu imagen religiosa */
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h3 {
            color: #343a40;
            margin-bottom: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            margin-bottom: 5px;
        }

        input,
        select {
            margin-bottom: 10px;
        }

        button {
            background-color: #8b4513;
            color: #fff;
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            border: 1px solid #dee2e6;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #a76637;
            color: #fff;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #mensaje-error-edad {
            color: red;
            margin-top: 10px;
            display: block;
        }
    </style>
       <script>
    function openBienvenidos() {
        window.location.href = 'Bienvenido.html';
    }
    </script>
</head>

<body>

    <form id="persona-form" action="registro.php" method="POST" class="col-md-6 mx-auto">

        <h3 class="text-center">Niños Catecismo</h3>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <label for="nombreP" class="form-label">Nombre:</label>
                <input type="text" id="nombreP" name="nombreP" class="form-control" required>
            </div>
     
            <div class="col-md-6">
                <label for="apellidoS" class="form-label">Apellido:</label>
                <input type="text" id="apellidoS" name="apellidoS" class="form-control" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="fechaNac" class="form-label">Fecha Nacimiento:</label>
                <input type="date" id="fechaNac" name="fechaNac" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label for="genero" class="form-label">Género:</label>
                <select id="genero" name="genero" class="form-select" required>
                    <option value="Masculino">Masculino</option>
                    <option value="Femenino">Femenino</option>
                </select>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="telefono" class="form-label">Teléfono:</label>
                <input type="number" id="telefono" name="telefono" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label for="estadoCivil" class="form-label">Estado Civil:</label>
                <select id="estadoCivil" name="estadocivil" class="form-select" required>
                    <option value="Soltero">Soltero</option>
                    <option value="Casado">Casado</option>
                    <option value="Divorciado">Divorciado</option>
                    <option value="Viudo">Viudo</option>
                </select>
            </div>
        </div>

        <div class="mb-3">
            <label for="direccion" class="form-label">Dirección:</label>
            <input type="text" id="direccion" name="direccion" class="form-control" required>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="FechaBautismo" class="form-label">Fecha Bautismo:</label>
                <select id="FechaBautismo" name="Fechabautismo" class="form-select" required>
                    <option value="1">1995-12-20</option>
                    <option value="2">2005-08-15</option>
                    <option value="3">2010-04-30</option>
                </select>
            </div>
            <div class="col-md-6">
                <label for="Organizacion" class="form-label">Organizacion:</label>
                <select id="Organizacion" name="organizacion" class="form-select" required>
                    <option value="1">Hermanos SD</option>
                    <option value="2">Organizacion Quito</option>
                    <option value="3">Bendecidos del señor</option>
                </select>
            </div>
        </div>


        <span id="mensaje-error-edad"></span>

        <div class="mb-3 text-center">
            <button type="submit" class="btn btn-primary mr-4">Agregar</button>
            <button type="submit" class="btn btn-warning mr-4">Editar</button>
            <button type="submit" class="btn btn-danger mr-4">Eliminar</button>
            <button type="button" class="btn btn-secondary" onclick="openBienvenidos()">Regresar</button>
        </div>

    </form>

    <table id="tabla-personas">
        <thead>
            <tr>
                <th>Nombre y Apellidos</th>
                <th>Fecha Nacimiento</th>
                <th>Género</th>
                <th>Teléfono</th>
                <th>Estado Civil</th>
                <th>Dirección</th>
                <th>Fecha Bautismo</th>
                <th>Organización</th>
            </tr>
        </thead>
        <tbody id="personas-list">
            <?php
            while ($columna = mysqli_fetch_assoc($resultado)) {
                echo "<tr>";
                echo "<td>" . $columna['Nombre y Apellidos'] . "</td>";
                echo "<td>" . $columna['Fecha Nacimiento'] . "</td>";
                echo "<td>" . $columna['Genero'] . "</td>";
                echo "<td>" . $columna['Telefono'] . "</td>";
                echo "<td>" . $columna['Estado Civil'] . "</td>";
                echo "<td>" . $columna['Direccion'] . "</td>";
                echo "<td>" . $columna['Fecha Bautismo'] . "</td>";
                echo "<td>" . $columna['Organizacion'] . "</td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</body>

</html>
<footer class="container-fluid bg-dark fixed-bottom">
        <div class="row">
            <div class="col-md text-light text-center py-3">
                Desarrollado por Floril Steven y Vergara Dayana
            </div>
        </div>
    </footer>

<?php
$conn->close();
?>