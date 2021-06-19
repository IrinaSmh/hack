package com.visdom.med_expert.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Data
@NoArgsConstructor
@Table(name = "MKB", uniqueConstraints = @UniqueConstraint(columnNames = "CODE"))
public class MKB {
    @Id
    private String code;

    public MKB(String code){
        this.code = code;
    }
}
