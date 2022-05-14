package team.marela.dragonhack.backend.database.entities.transactions;

import lombok.*;
import team.marela.dragonhack.backend.database.entities.organization.WorkerEntity;
import team.marela.dragonhack.backend.database.entities.users.UserEntity;

import javax.persistence.*;

@Entity(name = "transaction_order")
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderId;

    @OneToOne
    @JoinColumn(name = "transaction_id")
    private TransactionEntity transaction;

    @ManyToOne
    @JoinColumn(name = "worker_id")
    private WorkerEntity worker;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private UserEntity user;
}
