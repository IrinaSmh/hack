package com.visdom.med_expert.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Data
@NoArgsConstructor
@Table(name = "SERVICES")
public class Service {
    @Id
    @Column(name = "id_Services")
    private String id;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "count")
    private Integer count;

    @Column(name = "primary_analisys")
    private Boolean isPrimary;

    @Column(name = "period")
    private Double period;
}
