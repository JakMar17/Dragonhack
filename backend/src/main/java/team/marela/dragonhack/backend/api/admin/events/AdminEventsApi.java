package team.marela.dragonhack.backend.api.admin.events;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team.marela.dragonhack.backend.api.models.events.EventCreateDto;

import javax.validation.Valid;

@Log
@RestController
@RequestMapping("/admin/events")
@RequiredArgsConstructor
public class AdminEventsApi {

    @PostMapping
    public EventCreateDto createEvent(@Valid @RequestBody EventCreateDto dto) {
        log.info(dto.toString());
        return null;
    }
}
