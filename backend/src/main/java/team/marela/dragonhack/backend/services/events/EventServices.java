package team.marela.dragonhack.backend.services.events;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Service;
import team.marela.dragonhack.backend.api.models.events.EventCreateDto;
import team.marela.dragonhack.backend.database.entities.events.EventDayEntity;
import team.marela.dragonhack.backend.database.entities.events.EventEntity;
import team.marela.dragonhack.backend.database.repositories.events.EventDayRepository;
import team.marela.dragonhack.backend.database.repositories.events.EventRepository;

import java.util.HashSet;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class EventServices {

    private final EventRepository eventRepository;
    private final EventDayRepository eventDayRepository;

    public EventEntity createEvent(EventCreateDto dto) {
        var event = EventEntity.builder()
                .eventName(dto.getEventName())
                .location(dto.getLocation())
                .trr(dto.getTrr())
                .image(dto.getImage())
                .build();

        var savedEvent = eventRepository.save(event);

        event.setEventDays(
                new HashSet<>(eventDayRepository.saveAll(
                        dto.getDates().stream()
                                .map(e -> EventDayEntity.builder()
                                        .eventStart(e.getStartTime())
                                        .eventEnd(e.getEndTime())
                                        .event(savedEvent)
                                        .build()
                                )
                                .toList()
                ))
        );

        return event;
    }
}
