package team.marela.dragonhack.backend.services.cards;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import team.marela.dragonhack.backend.api.models.cards.CardDto;
import team.marela.dragonhack.backend.database.entities.cards.CardEntity;
import team.marela.dragonhack.backend.database.entities.events.EventEntity;
import team.marela.dragonhack.backend.database.entities.users.UserEntity;
import team.marela.dragonhack.backend.database.repositories.cards.CardRepository;
import team.marela.dragonhack.backend.database.repositories.cards.CardTemplateRepository;
import team.marela.dragonhack.backend.database.repositories.events.EventRepository;
import team.marela.dragonhack.backend.database.repositories.users.UserRepository;
import team.marela.dragonhack.backend.exceptions.DataNotFoundException;
import team.marela.dragonhack.backend.functions.StringGenerator;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CardServices {

    private static final int CARD_NUMBER_LENGTH = 64;

    private final CardRepository cardRepository;
    private final EventRepository eventRepository;
    private final CardTemplateRepository cardTemplateRepository;
    private final UserRepository userRepository;

    public CardEntity generateNewCard(EventEntity event, UserEntity user) throws DataNotFoundException {
        var cardTemplate = cardTemplateRepository.findByEvent(event)
                .orElseThrow(() -> new DataNotFoundException("Event does not have card template"));

        var card = CardEntity.builder()
                .cardNumber(generateCardNumber(
                    cardRepository.findAll().stream()
                            .map(CardEntity::getCardNumber)
                            .toList()
                ))
                .cardTemplate(cardTemplate)
                .event(event)
                .user(user)
                .build();

        return cardRepository.save(card);
    }

    public CardEntity getCard(String cardNumber) throws DataNotFoundException {
        return cardRepository.findByCardNumber(cardNumber)
                .orElseThrow(() -> new DataNotFoundException("Card not found"));
    }

    private String generateCardNumber(List<String> notEquals) {
        var generatedString = StringGenerator.generateString(CARD_NUMBER_LENGTH);

        return notEquals.stream()
                .anyMatch(e -> e.equals(generatedString))
                ? generateCardNumber(notEquals)
                : generatedString;
    }

    public EventEntity findCardsEvent(CardEntity card) throws DataNotFoundException {
        var cardTemplate = card.getCardTemplate();
        return eventRepository.findByCardTemplate(cardTemplate)
                .orElseThrow(() -> new DataNotFoundException("Event not found"));
    }
}