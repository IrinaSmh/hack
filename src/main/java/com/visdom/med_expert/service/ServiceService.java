package com.visdom.med_expert.service;

import com.visdom.med_expert.dao.ServiceDao;
import org.apache.commons.collections4.IterableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceService {

    private final ServiceDao serviceDao;

    @Autowired
    public ServiceService(ServiceDao serviceDao) {
        this.serviceDao = serviceDao;
    }

    public List<com.visdom.med_expert.model.Service> findAllServices() {

        return IterableUtils.toList(serviceDao.findAll());
    }
}
