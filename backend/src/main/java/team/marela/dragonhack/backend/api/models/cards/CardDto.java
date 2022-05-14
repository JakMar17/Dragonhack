package team.marela.dragonhack.backend.api.models.cards;

import lombok.*;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CardDto {
    String cardNumber;
    String image;
    BigDecimal amount;
    List<TransactionsDto> transactions;
}
