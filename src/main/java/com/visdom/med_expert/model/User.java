package com.visdom.med_expert.model;

import com.visdom.med_expert.dto.UserDto;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@Table(name = "USERS", uniqueConstraints = @UniqueConstraint(columnNames = "LOGIN"))
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "LOGIN", nullable = false)
    private String login;

    @Column(name = "PASSWORD", nullable = false)
    private String password;

    public User(UserDto userDto){
        this.id = userDto.getId();
        this.login = userDto.getLogin();
        this.password = userDto.getPassword();
    }

}
