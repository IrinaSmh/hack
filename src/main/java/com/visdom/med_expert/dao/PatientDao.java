package com.visdom.med_expert.dao;

import com.visdom.med_expert.model.Patient;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PatientDao extends CrudRepository<Patient, String> {
}
