package uni.yourUniversity.finalProject.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {
    @GetMapping("/healthCheck")
    public String health() {
        return "OK";
    }
}