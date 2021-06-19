package com.visdom.med_expert.dao;

import com.visdom.med_expert.model.Service;
import org.springframework.data.repository.CrudRepository;

public interface ServiceDao extends CrudRepository<Service, String> {
}
