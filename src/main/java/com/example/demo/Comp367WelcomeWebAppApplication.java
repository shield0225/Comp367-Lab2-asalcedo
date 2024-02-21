package com.example.demo;

import java.time.LocalTime;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class Comp367WelcomeWebAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(Comp367WelcomeWebAppApplication.class, args);
		System.out.println("Starting TestWebAppApplication...");
	}
	
    @RestController
    public class WelcomeController {

        @GetMapping("/")
        public String welcome() {
                return "Welcome to COMP367";
            }
        }
    }

