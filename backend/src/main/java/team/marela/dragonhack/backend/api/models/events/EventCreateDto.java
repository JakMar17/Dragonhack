package team.marela.dragonhack.backend.api.models.events;

import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EventCreateDto {
    String eventName;
    String description;
    String location;
    String trr;
    String image;
    String cardImage;
    String workerUsername;
    List<EventDatesDto> dates;
}
