package team.marela.dragonhack.backend.api.app.cards;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team.marela.dragonhack.backend.api.models.cards.CardDto;
import team.marela.dragonhack.backend.exceptions.DataNotFoundException;
import team.marela.dragonhack.backend.services.cards.CardTransactionServices;

import java.util.List;

@RestController
@RequestMapping("/cards")
@RequiredArgsConstructor
public class CardsApi {

    private final CardTransactionServices cardTransactionServices;

    @GetMapping
    public List<CardDto> getUsersCards(@RequestHeader("Username") String username) throws DataNotFoundException {
        return cardTransactionServices.getAllUsersCards(username);
    }
}
