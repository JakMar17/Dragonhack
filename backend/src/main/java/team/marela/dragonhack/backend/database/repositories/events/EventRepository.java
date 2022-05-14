package team.marela.dragonhack.backend.database.repositories.events;

import org.springframework.data.jpa.repository.JpaRepository;
import team.marela.dragonhack.backend.database.entities.events.EventEntity;

public interface EventRepository extends JpaRepository<EventEntity, Integer> {
}
