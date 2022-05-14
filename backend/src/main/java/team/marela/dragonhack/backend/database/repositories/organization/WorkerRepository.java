package team.marela.dragonhack.backend.database.repositories.organization;

import org.springframework.data.jpa.repository.JpaRepository;
import team.marela.dragonhack.backend.database.entities.organization.WorkerEntity;

public interface WorkerRepository extends JpaRepository<WorkerEntity, Integer> {
}
