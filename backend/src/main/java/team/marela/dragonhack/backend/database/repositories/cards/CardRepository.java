package team.marela.dragonhack.backend.database.repositories.cards;

import org.springframework.data.jpa.repository.JpaRepository;
import team.marela.dragonhack.backend.database.entities.cards.CardEntity;

import java.util.Optional;

public interface CardRepository extends JpaRepository<CardEntity, Integer> {
    Optional<CardEntity> findByCardNumber(String cardNumber);
}
