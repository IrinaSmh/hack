package com.visdom.med_expert.model.patients_ervices;

import com.visdom.med_expert.model.Service;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Embeddable
@Getter
@Setter
@NoArgsConstructor
public class PatientsServicesKey implements Serializable {

    @Column(name = "Patients_SNILS")
    private String snils;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name="Services_id_Services")
    private Service service;

}
