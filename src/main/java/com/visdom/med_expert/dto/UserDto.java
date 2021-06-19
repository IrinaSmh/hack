package com.visdom.med_expert.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.sun.istack.NotNull;
import com.visdom.med_expert.model.User;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Data
public class UserDto {
    @NotNull
    private Long id;

    @NotNull
    private String login;

    @NotNull
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;

    public UserDto(User user) {
        this.id = user.getId();
        this.login = user.getLogin();
    }
}
