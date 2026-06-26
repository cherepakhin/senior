//usr/bin/env jbang "$0" "$@" ; exit $? //
// DEPS org.springframework.boot:spring-boot-starter-web
// DEPS org.springframework.boot:spring-boot-starter-actuator
// JAVA 21
//
package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class AppScript {
    public static void main(String args) {
        SpringApplication.run(AppScript.class, args);
    }
}