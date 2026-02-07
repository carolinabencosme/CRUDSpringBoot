<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
<h1>${title}</h1>

<form action="${action}" method="post">
    <div>
        <label for="matricula">Matrícula</label>
        <#if isEdit>
            <input id="matricula" name="matricula" value="${estudiante.matricula}" readonly>
        <#else>
            <input id="matricula" name="matricula" value="${estudiante.matricula}">
        </#if>
        <#if errors.matricula??>
            <p class="error">${errors.matricula}</p>
        </#if>
    </div>
    <div>
        <label for="nombre">Nombre</label>
        <input id="nombre" name="nombre" value="${estudiante.nombre}">
        <#if errors.nombre??>
            <p class="error">${errors.nombre}</p>
        </#if>
    </div>
    <div>
        <label for="apellido">Apellido</label>
        <input id="apellido" name="apellido" value="${estudiante.apellido}">
        <#if errors.apellido??>
            <p class="error">${errors.apellido}</p>
        </#if>
    </div>
    <div>
        <label for="telefono">Teléfono</label>
        <input id="telefono" name="telefono" value="${estudiante.telefono}">
        <#if errors.telefono??>
            <p class="error">${errors.telefono}</p>
        </#if>
    </div>
    <button type="submit"><#if isEdit>Actualizar<#else>Crear</#if></button>
</form>

<p><a href="/estudiantes">Volver al listado</a></p>
</body>
</html>