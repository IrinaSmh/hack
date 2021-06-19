package com.visdom.med_expert.service;

import com.visdom.med_expert.dao.PatientDao;
import com.visdom.med_expert.dao.PatientsServicesDao;
import com.visdom.med_expert.dao.UserDao;
import com.visdom.med_expert.dto.PatientDto;
import com.visdom.med_expert.model.Patient;
import com.visdom.med_expert.model.patients_ervices.PatientsServices;
import org.apache.commons.collections4.IterableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private UserDao userDao;
    private PatientDao patientDao;
    private PatientsServicesDao patientsServicesDao;

    @Autowired
    public UserService(UserDao userDao, PatientDao patientDao, PatientsServicesDao patientsServicesDao) {
        this.userDao = userDao;
        this.patientDao = patientDao;
        this.patientsServicesDao = patientsServicesDao;
    }

    public PatientDto addPatient(String snils, String mkb){
        Patient patient = new Patient(snils, mkb);
        return new PatientDto(patientDao.save(patient));
    }

    public List<PatientsServices> findServices(String snils) {
        return patientsServicesDao.findByKey_Snils(snils);
    }

    public List<PatientsServices> findAll() {
        return IterableUtils.toList(patientsServicesDao.findAll());
    }
}
