<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
<h1>${title}</h1>

<dl>
    <dt>Matrícula</dt>
    <dd>${estudiante.matricula}</dd>
    <dt>Nombre</dt>
    <dd>${estudiante.nombre}</dd>
    <dt>Apellido</dt>
    <dd>${estudiante.apellido}</dd>
    <dt>Teléfono</dt>
    <dd>${estudiante.telefono}</dd>
</dl>

<p>
    <a href="/estudiantes/${estudiante.matricula}/edit">Editar</a>
    <a href="/estudiantes">Volver al listado</a>
</p>
<form action="/estudiantes/${estudiante.matricula}/delete" method="post">
    <button type="submit">Borrar</button>
</form>
</body>
</html>