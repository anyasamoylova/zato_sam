package ru.sam.zato_sam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.sam.zato_sam.domain.User;
import ru.sam.zato_sam.service.UserService;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@Valid User user,
                          BindingResult bindingResult,
                          Model model,
                          @RequestParam(name = "password2") String password2) {
        if (StringUtils.isEmpty(password2)){
            model.addAttribute("password2Error", "Пароли не совпадают");
        }else if(!password2.equals(user.getPassword())){
            model.addAttribute("password2Error", "Пароли не совпадают");
        }
        if (bindingResult.hasErrors()){
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "registration";
        } else {
            if (!userService.addUser(user)) {
                model.addAttribute("message", "User exists!");
                return "registration";
            }
        }
        return "redirect:/login";
    }
}
