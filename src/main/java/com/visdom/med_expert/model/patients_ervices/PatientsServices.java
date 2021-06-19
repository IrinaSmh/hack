package com.visdom.med_expert.model.patients_ervices;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Data
@NoArgsConstructor
@Table(name = "PATIENTS_HAS_SERVICES")
public class PatientsServices {

    @EmbeddedId
    private PatientsServicesKey key;

    @Column(name = "is_done")
    private boolean isDone;
}
