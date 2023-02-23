package org.vfem.gitpodtest.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
public class SimpliestRestController {

    @GetMapping
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public String simpleResponse() {
        return "Simple response string";
    }

}
