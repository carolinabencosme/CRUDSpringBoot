<#import "layout.ftl" as layout>

<@layout.page title=title>
    <div class="actions">
        <a class="button" href="/estudiantes/new">Registrar estudiante</a>
    </div>

    <#if estudiantes?size == 0>
        <p>No hay estudiantes registrados.</p>
    <#else>
        <div class="table-wrapper">
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
                        <td class="row-actions">
                            <a href="/estudiantes/${estudiante.matricula}">Ver</a>
                            <a href="/estudiantes/${estudiante.matricula}/edit">Editar</a>
                            <form action="/estudiantes/${estudiante.matricula}/delete" method="post">
                                <button class="link-button" type="submit">Borrar</button>
                            </form>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </#if>
</@layout.page>