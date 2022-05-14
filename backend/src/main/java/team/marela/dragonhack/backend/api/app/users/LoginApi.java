package team.marela.dragonhack.backend.api.app.users;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team.marela.dragonhack.backend.api.models.LoginDto;
import team.marela.dragonhack.backend.api.models.UserDto;
import team.marela.dragonhack.backend.exceptions.CredentialsInvalidException;
import team.marela.dragonhack.backend.exceptions.DataNotFoundException;
import team.marela.dragonhack.backend.services.users.LoginRegisterServices;
import team.marela.dragonhack.backend.services.users.SessionServices;

import javax.validation.Valid;

@RestController
@RequestMapping("/login")
@RequiredArgsConstructor
public class LoginApi {

    private final LoginRegisterServices loginRegisterServices;
    private final SessionServices sessionServices;

    @PostMapping
    public UserDto loginUser (@Valid @RequestBody LoginDto login) throws DataNotFoundException, CredentialsInvalidException {
        var user = loginRegisterServices.loginUser(login.getUsername(), login.getPassword());
        return new UserDto(
                user.getUsername(),
                user.getFirstname(),
                user.getLastname(),
                user.getEmail(),
                sessionServices.generateSessionId(user)
        );
    }
}
