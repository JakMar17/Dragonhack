package team.marela.dragonhack.backend.api.app.users;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team.marela.dragonhack.backend.api.models.users.RegisterDto;
import team.marela.dragonhack.backend.api.models.users.UserDto;
import team.marela.dragonhack.backend.services.users.LoginRegisterServices;
import team.marela.dragonhack.backend.services.users.SessionServices;

import javax.validation.Valid;

@RestController
@RequestMapping("/register")
@RequiredArgsConstructor
public class RegisterApi {

    private final LoginRegisterServices loginRegisterServices;
    private final SessionServices sessionServices;
    private final ModelMapper modelMapper;

    @PostMapping
    public UserDto registerNewUser(@RequestBody @Valid RegisterDto user) {
        var entity = loginRegisterServices.registerNewUser(user);
        var dto = modelMapper.map(entity, UserDto.class);
        dto.setSessionId(sessionServices.generateSessionId(entity));
        return dto;
    }
}
