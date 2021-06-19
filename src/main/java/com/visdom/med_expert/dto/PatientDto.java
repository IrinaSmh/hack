package com.visdom.med_expert.dto;

import com.sun.istack.NotNull;
import com.visdom.med_expert.model.Patient;
import com.visdom.med_expert.model.User;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Data
public class PatientDto {
    @NotNull
    private String snils;

    public PatientDto(Patient patient) {
        this.snils = patient.getSnils();
    }
}
