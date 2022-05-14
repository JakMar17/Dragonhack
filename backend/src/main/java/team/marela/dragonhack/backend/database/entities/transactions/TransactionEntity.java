package team.marela.dragonhack.backend.database.entities.transactions;

import lombok.*;
import team.marela.dragonhack.backend.database.entities.cards.CardEntity;

import javax.persistence.*;

@Entity(name = "transaction")
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TransactionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer transactionId;

    @ManyToOne
    @JoinColumn(name = "card_id")
    private CardEntity card;

    @OneToOne(mappedBy = "transaction")
    private OrderEntity order;

    @OneToOne(mappedBy = "transaction")
    private FillUpEntity fillUp;
}
