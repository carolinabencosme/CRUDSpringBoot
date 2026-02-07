<#import "layout.ftl" as layout>

<@layout.page title=title>
    <form class="form-grid" action="${action}" method="post">
        <label for="matricula">Matrícula</label>
        <div>
            <#if isEdit>
                <input id="matricula" name="matricula" value="${estudiante.matricula}" readonly>
            <#else>
                <input id="matricula" name="matricula" value="${estudiante.matricula}">
            </#if>
            <#if errors.matricula??>
                <p class="error">${errors.matricula}</p>
            </#if>
        </div>

        <label for="nombre">Nombre</label>
        <div>
            <input id="nombre" name="nombre" value="${estudiante.nombre}">
            <#if errors.nombre??>
                <p class="error">${errors.nombre}</p>
            </#if>
        </div>

        <label for="apellido">Apellido</label>
        <div>
            <input id="apellido" name="apellido" value="${estudiante.apellido}">
            <#if errors.apellido??>
                <p class="error">${errors.apellido}</p>
            </#if>
        </div>

        <label for="telefono">Teléfono</label>
        <div>
            <input id="telefono" name="telefono" value="${estudiante.telefono}">
            <#if errors.telefono??>
                <p class="error">${errors.telefono}</p>
            </#if>
        </div>

        <div class="form-actions">
            <button class="button" type="submit"><#if isEdit>Actualizar<#else>Crear</#if></button>
            <a class="button secondary" href="/estudiantes">Cancelar</a>
        </div>
    </form>
</@layout.page>