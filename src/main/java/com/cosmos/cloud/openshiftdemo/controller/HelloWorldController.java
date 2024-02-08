package com.cosmos.cloud.openshiftdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/hello")
public class HelloWorldController {

    @RequestMapping(method = RequestMethod.GET)
    public String helloWorld(@RequestParam(required = false) String name)  {
        return "Hello World" + (name != null ? " "+name : "");
    }
}
