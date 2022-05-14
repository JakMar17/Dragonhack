package team.marela.dragonhack.backend.api.models.events;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EventDto {
    String eventName;
    String location;
    String image;
    LocalDateTime startDate;
    LocalDateTime endDate;
}
