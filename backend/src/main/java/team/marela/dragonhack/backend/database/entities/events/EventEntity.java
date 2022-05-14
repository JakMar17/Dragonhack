package team.marela.dragonhack.backend.database.entities.events;

import lombok.*;
import team.marela.dragonhack.backend.database.entities.cards.CardEntity;
import team.marela.dragonhack.backend.database.entities.cards.CardTemplateEntity;
import team.marela.dragonhack.backend.database.entities.organization.OrganizationEntity;
import team.marela.dragonhack.backend.database.entities.organization.WorkerEntity;
import team.marela.dragonhack.backend.database.entities.events.price_menu.PriceItemEntity;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "event")
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EventEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer eventId;

    @OneToMany(mappedBy = "event")
    private Set<EventDayEntity> eventDays;

    @ManyToOne
    @JoinColumn(name = "organization_id")
    private OrganizationEntity organization;

    @ManyToMany
    @JoinTable(
            name = "event_workers",
            joinColumns = {@JoinColumn(name = "worker_id")},
            inverseJoinColumns = {@JoinColumn(name = "event_id")}
    )
    private Set<WorkerEntity> workers;

    @OneToMany(mappedBy = "event")
    private Set<PriceItemEntity> priceMenu;

    @OneToMany(mappedBy = "event")
    private Set<CardTemplateEntity> cardTemplates;

    @OneToMany(mappedBy = "event")
    private Set<CardEntity> cards;
}
