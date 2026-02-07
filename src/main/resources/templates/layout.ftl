<#macro page title>
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${title}</title>
        <link rel="stylesheet" href="/styles.css">
    </head>
    <body>
    <header class="site-header">
        <div class="container header-content">
            <div>
                <p class="eyebrow">Gestor académico</p>
                <h1>CRUD Estudiantes</h1>
            </div>
            <nav class="site-nav">
                <a href="/">Inicio</a>
                <a href="/estudiantes">Estudiantes</a>
                <a class="button" href="/estudiantes/new">Nuevo</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <header class="page-header">
            <h2>${title}</h2>
        </header>
        <section class="card">
            <#nested>
        </section>
    </main>

    <footer class="site-footer">
        <div class="container">
            <p>CRUD con SparkJava · FreeMarker</p>
        </div>
    </footer>
    </body>
    </html>
</#macro>