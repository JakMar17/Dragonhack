package team.marela.dragonhack.backend.database.repositories.transactions;

import org.springframework.data.jpa.repository.JpaRepository;
import team.marela.dragonhack.backend.database.entities.transactions.TransactionEntity;

public interface TransactionRepository extends JpaRepository<TransactionEntity, Integer> {
}
