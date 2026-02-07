<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
<h1>${title}</h1>
<p><a href="/estudiantes/new">Registrar estudiante</a></p>

<#if estudiantes?size == 0>
    <p>No hay estudiantes registrados.</p>
<#else>
    <table>
        <thead>
        <tr>
            <th>Matrícula</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Teléfono</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <#list estudiantes as estudiante>
            <tr>
                <td>${estudiante.matricula}</td>
                <td>${estudiante.nombre}</td>
                <td>${estudiante.apellido}</td>
                <td>${estudiante.telefono}</td>
                <td>
                    <a href="/estudiantes/${estudiante.matricula}">Ver</a>
                    <a href="/estudiantes/${estudiante.matricula}/edit">Editar</a>
                    <form action="/estudiantes/${estudiante.matricula}/delete" method="post" style="display:inline;">
                        <button type="submit">Borrar</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</#if>

<p><a href="/">Volver al inicio</a></p>
</body>
</html>