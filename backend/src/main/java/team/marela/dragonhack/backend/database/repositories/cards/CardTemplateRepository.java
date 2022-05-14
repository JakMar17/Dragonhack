package team.marela.dragonhack.backend.database.repositories.cards;

import org.springframework.data.jpa.repository.JpaRepository;
import team.marela.dragonhack.backend.database.entities.cards.CardTemplateEntity;

public interface CardTemplateRepository extends JpaRepository<CardTemplateEntity, Integer> {
}
