package ufp.esof.project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ufp.esof.project.models.Degree;
import ufp.esof.project.services.DegreeService;

import java.util.Optional;

@Controller
@RequestMapping("/degree")
public class DegreeController {

    private DegreeService degreeService;

    @Autowired
    public DegreeController(DegreeService degreeService) {
        this.degreeService = degreeService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Iterable<Degree>> getAllDegrees() {
        return ResponseEntity.ok(this.degreeService.findAllDegrees());
    }

    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Degree> createDegree(@RequestBody Degree degree) {
        Optional<Degree> degreeOptional = this.degreeService.createDegree(degree);
        if (degreeOptional.isPresent()) {
            return ResponseEntity.ok(degreeOptional.get());
        }
        throw new DegreeNotCreatedException(degree.getName());
    }

    @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Degree not created")
    public static class DegreeNotCreatedException extends RuntimeException {
        public DegreeNotCreatedException(String name) {
            super("The degree with name \"" + name + "\" was not created");
        }
    }
}
