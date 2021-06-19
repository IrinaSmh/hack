package com.visdom.med_expert.dao;

import com.visdom.med_expert.model.Service;
import com.visdom.med_expert.model.patients_ervices.PatientsServices;
import com.visdom.med_expert.model.patients_ervices.PatientsServicesKey;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PatientsServicesDao extends CrudRepository<PatientsServices, PatientsServicesKey> {

    List<PatientsServices> findByKey_Snils(String snils);
}
