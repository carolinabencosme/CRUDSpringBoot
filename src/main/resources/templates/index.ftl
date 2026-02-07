<#import "layout.ftl" as layout>

<@layout.page title=title>
    <p>${message}</p>
    <div class="actions">
        <a class="button" href="/estudiantes">Ir al listado</a>
        <a class="button secondary" href="/estudiantes/new">Registrar estudiante</a>
    </div>
</@layout.page>