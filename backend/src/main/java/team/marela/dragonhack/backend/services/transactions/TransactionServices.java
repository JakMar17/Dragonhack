package team.marela.dragonhack.backend.services.transactions;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import team.marela.dragonhack.backend.api.models.cards.CardDto;
import team.marela.dragonhack.backend.api.models.cards.TransactionsDto;
import team.marela.dragonhack.backend.database.entities.transactions.FillUpEntity;
import team.marela.dragonhack.backend.database.entities.transactions.OrderEntity;
import team.marela.dragonhack.backend.database.entities.transactions.TransactionEntity;
import team.marela.dragonhack.backend.database.repositories.organization.OrganizationRepository;
import team.marela.dragonhack.backend.database.repositories.organization.WorkerRepository;
import team.marela.dragonhack.backend.database.repositories.transactions.FillUpRepository;
import team.marela.dragonhack.backend.database.repositories.transactions.OrderRepository;
import team.marela.dragonhack.backend.database.repositories.transactions.TransactionRepository;
import team.marela.dragonhack.backend.exceptions.DataNotFoundException;
import team.marela.dragonhack.backend.services.cards.CardServices;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.stream.Stream;

@Service
@RequiredArgsConstructor
public class TransactionServices {

    private final CardServices cardServices;

    private final TransactionRepository transactionRepository;
    private final FillUpRepository fillUpRepository;
    private final OrderRepository orderRepository;

    private final WorkerRepository workerRepository;
    private final OrganizationRepository organizationRepository;

    public FillUpEntity fillUpCard(String cardNumber, BigDecimal amount) throws DataNotFoundException {
        var card = cardServices.getCard(cardNumber);
        var user = card.getUser();
        assert user != null;

        var transaction = transactionRepository.save(
                TransactionEntity.builder()
                        .card(card)
                        .build()
        );

        var fillUp = FillUpEntity.builder()
                .amount(amount)
                .user(user)
                .transaction(transaction)
                .build();

        return fillUpRepository.save(fillUp);
    }

    public OrderEntity createOrderOnCard(String cardNumber, BigDecimal amount, String workerUsername) throws DataNotFoundException {
        var card = cardServices.getCard(cardNumber);
        var user = card.getUser();
        var event = cardServices.findCardsEvent(card);

        var worker = workerRepository.findByUsernameAndOrganization(
                workerUsername,
                event.getOrganization()
        ).orElseThrow(() -> new DataNotFoundException("Worker not found"));

        var transaction = transactionRepository.save(
                TransactionEntity.builder()
                        .card(card)
                        .build()
        );

        var order = orderRepository.save(
            OrderEntity.builder()
                    .amount(amount)
                    .transaction(transaction)
                    .worker(worker)
                    .user(user)
                    .build()
        );

        return order;
    }

    public CardDto getCardInfo(String cardNumber) throws DataNotFoundException {
        var card = cardServices.getCard(cardNumber);

        var transactions = transactionRepository.findByCard(card);
        var orders = transactions.stream()
                .filter(e -> e.getOrder() != null)
                .map(e -> TransactionsDto.builder()
                        .amount(e.getOrder().getAmount().multiply(BigDecimal.valueOf(-1.0)))
                        .created(e.getCreated())
                        .build()
                )
                .toList();

        var fillUps = transactions.stream()
                .filter(e -> e.getFillUp() != null)
                .map(e -> TransactionsDto.builder()
                        .amount(e.getFillUp().getAmount())
                        .created(e.getCreated())
                        .build()
                ).toList();


        var transactionDtos = Stream.concat(
                orders.stream(),
                fillUps.stream()
        )
                .sorted(Comparator.comparing(TransactionsDto::getCreated))
                .toList();

        return CardDto.builder()
                .transactions(transactionDtos)
                .cardNumber(cardNumber)
                .build();
    }
}
