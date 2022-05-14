package team.marela.dragonhack.backend.database.entities.transactions;

import lombok.*;
import team.marela.dragonhack.backend.database.entities.users.UserEntity;

import javax.persistence.*;

@Entity(name = "transaction_fillup")
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FillUpEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer fillUpId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private UserEntity user;

    @OneToOne
    @JoinColumn(name = "transaction_id")
    private TransactionEntity transaction;
}
