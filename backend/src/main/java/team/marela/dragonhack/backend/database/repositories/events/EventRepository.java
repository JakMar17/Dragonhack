package team.marela.dragonhack.backend.database.repositories.events;

import org.springframework.data.jpa.repository.JpaRepository;
import team.marela.dragonhack.backend.database.entities.cards.CardTemplateEntity;
import team.marela.dragonhack.backend.database.entities.events.EventEntity;

import java.util.Optional;

public interface EventRepository extends JpaRepository<EventEntity, Integer> {
    Optional<EventEntity> findByCardTemplate(CardTemplateEntity cardTemplate);
}
