package team.marela.dragonhack.backend.api.admin.events;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import org.modelmapper.ModelMapper;
import org.springframework.web.bind.annotation.*;
import team.marela.dragonhack.backend.api.models.events.EventCreateDto;
import team.marela.dragonhack.backend.services.events.EventServices;

import javax.validation.Valid;

@Log
@RestController
@RequestMapping("/admin/events")
@RequiredArgsConstructor
@CrossOrigin("*")
public class AdminEventsApi {

    private final EventServices eventServices;
    private final ModelMapper modelMapper;

    @PostMapping
    public EventCreateDto createEvent(@Valid @RequestBody EventCreateDto dto) {
        log.info(dto.toString());
        var event = eventServices.createEvent(dto);
        return modelMapper.map(event, EventCreateDto.class);
    }
}
