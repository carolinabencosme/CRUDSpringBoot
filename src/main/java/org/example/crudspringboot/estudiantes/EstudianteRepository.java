package org.example.crudspringboot.estudiantes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class EstudianteRepository {
    private static final Map<String, Estudiante> ESTUDIANTES = new HashMap<>();

    public Estudiante insertar(Estudiante estudiante) {
        ESTUDIANTES.put(estudiante.getMatricula(), estudiante);
        return estudiante;
    }

    public Optional<Estudiante> actualizar(Estudiante estudiante) {
        if (!ESTUDIANTES.containsKey(estudiante.getMatricula())) {
            return Optional.empty();
        }
        ESTUDIANTES.put(estudiante.getMatricula(), estudiante);
        return Optional.of(estudiante);
    }

    public boolean borrar(String matricula) {
        return ESTUDIANTES.remove(matricula) != null;
    }

    public Optional<Estudiante> buscarPorId(String matricula) {
        return buscarPorMatricula(matricula);
    }

    public Optional<Estudiante> buscarPorMatricula(String matricula) {
        return Optional.ofNullable(ESTUDIANTES.get(matricula));
    }

    public List<Estudiante> listarTodos() {
        return new ArrayList<>(ESTUDIANTES.values());
    }
}