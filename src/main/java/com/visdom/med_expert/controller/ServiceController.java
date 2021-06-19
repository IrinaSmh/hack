package com.visdom.med_expert.controller;

import com.visdom.med_expert.model.Service;
import com.visdom.med_expert.service.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/services")
public class ServiceController {

    private final ServiceService serviceService;

    @Autowired
    public ServiceController(ServiceService serviceService) {
        this.serviceService = serviceService;
    }

    @GetMapping()
    @ResponseBody
    public List<Service> findAllServices() {
        List<Service> services = new ArrayList<>();
        List<Service> allServices = serviceService.findAllServices();
        for(int i = 0; i < 10; i++){
            services.add(allServices.get(i));
        }
        return services;
    }
}
