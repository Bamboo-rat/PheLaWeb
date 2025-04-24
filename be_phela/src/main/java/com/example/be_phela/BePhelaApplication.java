package com.example.be_phela;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.example.be_phela.repository")
public class BePhelaApplication {

    public static void main(String[] args) {
        SpringApplication.run(BePhelaApplication.class, args);
    }

}
