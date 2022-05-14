package team.marela.dragonhack.backend.services.events;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import team.marela.dragonhack.backend.api.models.events.EventCreateDto;
import team.marela.dragonhack.backend.api.models.events.EventDto;
import team.marela.dragonhack.backend.database.entities.events.EventDayEntity;
import team.marela.dragonhack.backend.database.entities.events.EventEntity;
import team.marela.dragonhack.backend.database.repositories.events.EventDayRepository;
import team.marela.dragonhack.backend.database.repositories.events.EventRepository;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;

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
                                        .eventStart(e.getEventStart())
                                        .eventEnd(e.getEventEnd())
                                        .event(savedEvent)
                                        .build()
                                )
                                .toList()
                ))
        );

        return event;
    }

    public List<EventDto> getAllEvents() {
        return eventRepository.findAll().stream()
                .map(e ->
                        EventDto.builder()
                                .eventName(e.getEventName())
                                .image(e.getImage())
                                .location(e.getLocation())
                                .startDate(
                                        e.getEventDays().stream()
                                                .map(EventDayEntity::getEventStart)
                                                .min(LocalDateTime::compareTo)
                                                .get()
                                )
                                .endDate(
                                        e.getEventDays().stream()
                                                .map(EventDayEntity::getEventEnd)
                                                .max(LocalDateTime::compareTo)
                                                .get()
                                )
                                .build()
                )
                .filter(e -> LocalDateTime.now().isAfter(e.getEndDate()))
                .sorted(Comparator.comparing(EventDto::getStartDate))
                .toList();

    }
}
