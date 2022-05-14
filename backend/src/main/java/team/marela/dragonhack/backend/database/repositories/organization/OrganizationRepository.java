package team.marela.dragonhack.backend.database.repositories.organization;

import org.springframework.data.jpa.repository.JpaRepository;
import team.marela.dragonhack.backend.database.entities.organization.OrganizationEntity;

public interface OrganizationRepository extends JpaRepository<OrganizationEntity, Integer> {
}
