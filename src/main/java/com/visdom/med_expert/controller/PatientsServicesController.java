package com.visdom.med_expert.controller;

import com.visdom.med_expert.model.Service;
import com.visdom.med_expert.model.patients_ervices.PatientsServices;
import com.visdom.med_expert.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/users")
public class PatientsServicesController {

    private final UserService userService;

    @Autowired
    public PatientsServicesController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/user/services")
    public List<PatientsServices> findServices(@RequestParam(value = "snils") String snils) {
        return userService.findServices(snils);
    }

    @GetMapping("/user/services/all")
    public List<PatientsServices> findServices() {
        return userService.findAll();
    }
}
