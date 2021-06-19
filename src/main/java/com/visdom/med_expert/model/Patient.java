package com.visdom.med_expert.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@Table(name = "PATIENTS", uniqueConstraints = @UniqueConstraint(columnNames = "SNILS"))
public class Patient {
    @Id
    private String snils;

    @ManyToOne
    private User user;

    @ManyToOne
    private MKB mkb;

    public Patient(String snils, String mkb) {
        this.snils = snils;
        this.mkb = new MKB(mkb);
    }
}
