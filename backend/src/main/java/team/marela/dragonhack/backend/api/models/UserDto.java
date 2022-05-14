package team.marela.dragonhack.backend.api.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
public class UserDto {
    String username;
    String firstname;
    String lastname;
    String email;
    String sessionId;
}
