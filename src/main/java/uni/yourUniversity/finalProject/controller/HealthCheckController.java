package uni.yourUniversity.finalProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HealthCheckController {

    @GetMapping("/health")
    @ResponseBody
    public String healthCheck() {
        return "Application is running";
    }

    // If you don't already have a root mapping
    @GetMapping("/")
    public String home() {
        return "redirect:/home";  // Redirect to your actual home controller
    }
}