package org.example.crudspringboot;

import static spark.Spark.get;
import static spark.Spark.port;
import static spark.Spark.staticFiles;

import java.util.HashMap;
import java.util.Map;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

public class CrudSpringBootApplication {

    public static void main(String[] args) {
        port(4567);
        staticFiles.location("/public");

        FreeMarkerEngine freeMarkerEngine = new FreeMarkerEngine();

        get("/", (request, response) -> {
            Map<String, Object> model = new HashMap<>();
            model.put("title", "CRUD con SparkJava");
            model.put("message", "Aplicación migrada desde Spring Boot.");
            return new ModelAndView(model, "index.ftl");
        }, freeMarkerEngine);

        get("/health", (request, response) -> {
            response.type("application/json");
            return "{\"status\":\"ok\"}";
        });
    }
}
