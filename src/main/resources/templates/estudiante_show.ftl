<#import "layout.ftl" as layout>

<@layout.page title=title>
    <dl class="details">
        <div>
            <dt>Matrícula</dt>
            <dd>${estudiante.matricula}</dd>
        </div>
        <div>
            <dt>Nombre</dt>
            <dd>${estudiante.nombre}</dd>
        </div>
        <div>
            <dt>Apellido</dt>
            <dd>${estudiante.apellido}</dd>
        </div>
        <div>
            <dt>Teléfono</dt>
            <dd>${estudiante.telefono}</dd>
        </div>
    </dl>

    <div class="actions">
        <a class="button" href="/estudiantes/${estudiante.matricula}/edit">Editar</a>
        <a class="button secondary" href="/estudiantes">Volver al listado</a>
        <form action="/estudiantes/${estudiante.matricula}/delete" method="post">
            <button class="button danger" type="submit">Borrar</button>
        </form>
    </div>
</@layout.page>