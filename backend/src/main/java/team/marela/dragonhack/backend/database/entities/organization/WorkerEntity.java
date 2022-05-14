package team.marela.dragonhack.backend.database.entities.organization;

import lombok.*;
import team.marela.dragonhack.backend.database.entities.events.EventEntity;
import team.marela.dragonhack.backend.database.entities.transactions.OrderEntity;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "worker")
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WorkerEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer workerId;

    @Builder.Default
    @Column(nullable = false)
    private Boolean isOrganizationAdmin = false;

    @ManyToOne
    @JoinColumn(name = "organization_id")
    private OrganizationEntity organization;

    @ManyToMany(mappedBy = "workers")
    private Set<EventEntity> events;

    @OneToMany(mappedBy = "worker")
    private Set<OrderEntity> orders;
}
