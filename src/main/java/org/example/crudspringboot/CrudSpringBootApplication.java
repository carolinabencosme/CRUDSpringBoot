package org.example.crudspringboot;

import static spark.Spark.get;
import static spark.Spark.port;
import static spark.Spark.post;
import static spark.Spark.staticFiles;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import freemarker.template.Configuration;
import org.example.crudspringboot.estudiantes.Estudiante;
import org.example.crudspringboot.estudiantes.EstudianteRepository;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

public class CrudSpringBootApplication {

    public static void main(String[] args) {
        port(4567);
        staticFiles.location("/public");

        Configuration cfg = new Configuration(Configuration.VERSION_2_3_33);
        cfg.setClassForTemplateLoading(CrudSpringBootApplication.class, "/templates");
        FreeMarkerEngine freeMarkerEngine = new FreeMarkerEngine(cfg);
        EstudianteRepository estudianteRepository = new EstudianteRepository();

        get("/", (request, response) -> {
            Map<String, Object> model = new HashMap<>();
            model.put("title", "CRUD con SparkJava");
            model.put("message", "Aplicación migrada desde Spring Boot.");
            return new ModelAndView(model, "index.ftl");
        }, freeMarkerEngine);

        get("/estudiantes", (request, response) -> {
            Map<String, Object> model = new HashMap<>();
            model.put("title", "Listado de estudiantes");
            model.put("estudiantes", estudianteRepository.listarTodos());
            return new ModelAndView(model, "estudiantes_list.ftl");
        }, freeMarkerEngine);

        get("/estudiantes/new", (request, response) -> {
            Map<String, Object> model = new HashMap<>();
            model.put("title", "Nuevo estudiante");
            model.put("estudiante", new Estudiante());
            model.put("errors", Map.of());
            model.put("action", "/estudiantes");
            model.put("isEdit", false);
            return new ModelAndView(model, "estudiante_form.ftl");
        }, freeMarkerEngine);

        post("/estudiantes", (request, response) -> {
            Estudiante estudiante = new Estudiante(
                    request.queryParams("matricula"),
                    request.queryParams("nombre"),
                    request.queryParams("apellido"),
                    request.queryParams("telefono")
            );
            Map<String, String> errors = validarEstudiante(estudiante);
            if (!errors.isEmpty()) {
                Map<String, Object> model = new HashMap<>();
                model.put("title", "Nuevo estudiante");
                model.put("estudiante", estudiante);
                model.put("errors", errors);
                model.put("action", "/estudiantes");
                model.put("isEdit", false);
                return new ModelAndView(model, "estudiante_form.ftl");
            }
            estudianteRepository.insertar(estudiante);
            response.redirect("/estudiantes");
            return null;
        }, freeMarkerEngine);

        get("/estudiantes/:id", (request, response) -> {
            Optional<Estudiante> estudiante = estudianteRepository.buscarPorId(request.params("id"));
            if (estudiante.isEmpty()) {
                response.redirect("/estudiantes");
                return null;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("title", "Detalle del estudiante");
            model.put("estudiante", estudiante.get());
            return new ModelAndView(model, "estudiantes_show.ftl");
        }, freeMarkerEngine);

        get("/estudiantes/:id/edit", (request, response) -> {
            Optional<Estudiante> estudiante = estudianteRepository.buscarPorId(request.params("id"));
            if (estudiante.isEmpty()) {
                response.redirect("/estudiantes");
                return null;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("title", "Editar estudiante");
            model.put("estudiante", estudiante.get());
            model.put("errors", Map.of());
            model.put("action", "/estudiantes/" + estudiante.get().getMatricula());
            model.put("isEdit", true);
            return new ModelAndView(model, "estudiante_form.ftl");
        }, freeMarkerEngine);

        post("/estudiantes/:id", (request, response) -> {
            Estudiante estudiante = new Estudiante(
                    request.params("id"),
                    request.queryParams("nombre"),
                    request.queryParams("apellido"),
                    request.queryParams("telefono")
            );
            Map<String, String> errors = validarEstudiante(estudiante);
            if (!errors.isEmpty()) {
                Map<String, Object> model = new HashMap<>();
                model.put("title", "Editar estudiante");
                model.put("estudiante", estudiante);
                model.put("errors", errors);
                model.put("action", "/estudiantes/" + estudiante.getMatricula());
                model.put("isEdit", true);
                return new ModelAndView(model, "estudiante_form.ftl");
            }
            estudianteRepository.actualizar(estudiante);
            response.redirect("/estudiantes/" + estudiante.getMatricula());
            return null;
        }, freeMarkerEngine);

        post("/estudiantes/:id/delete", (request, response) -> {
            estudianteRepository.borrar(request.params("id"));
            response.redirect("/estudiantes");
            return null;
        });

        get("/health", (request, response) -> {
            response.type("application/json");
            return "{\"status\":\"ok\"}";
        });
    }

    private static Map<String, String> validarEstudiante(Estudiante estudiante) {
        Map<String, String> errors = new HashMap<>();
        if (esVacio(estudiante.getMatricula())) {
            errors.put("matricula", "La matrícula es requerida.");
        }
        if (esVacio(estudiante.getNombre())) {
            errors.put("nombre", "El nombre es requerido.");
        }
        if (esVacio(estudiante.getApellido())) {
            errors.put("apellido", "El apellido es requerido.");
        }
        if (esVacio(estudiante.getTelefono())) {
            errors.put("telefono", "El teléfono es requerido.");
        }
        return errors;
    }

    private static boolean esVacio(String valor) {
        return valor == null || valor.trim().isEmpty();
    }
}
