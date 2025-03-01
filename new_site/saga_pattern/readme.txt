Паттерн Saga в микросервисной архитектуре
https://habr.com/ru/companies/otus/articles/751134/

Описание и ОГРОМНЫЕ примеры на Spring 3/Java 17:
https://microservices.io/patterns/data/saga.html

https://github.com/eventuate-tram/eventuate-tram-examples-customers-and-orders
https://github.com/eventuate-tram/eventuate-tram-sagas-examples-customers-and-orders
https://github.com/eventuate-examples/eventuate-examples-java-customers-and-orders

Паттерн актуален для BPM.
Коротко:

saga_coordinator = SagaCoordinator()
order_data = {"customer_id": 123, "products": [1, 2, 3]}
payment_data = {"amount": 100.0, "payment_method": "credit_card"}
notification_data = {"message": "Ваш заказ успешно оформлен!"}
saga_coordinator.execute_saga(order_data, payment_data, notification_data)

-----------------------------------------------------------------
class SagaCoordinator:
    def execute_saga(self, order_data, payment_data, notification_data):
        order_service = OrderService()
        payment_service = PaymentService()
        notification_service = NotificationService()

        try:
            # Шаг 1: Создание заказа
            order_id = order_service.create_order(order_data)

            # Шаг 2: Выполнение платежа
            payment_service.process_payment(order_id, payment_data)

            # Шаг 3: Отправка уведомления
            notification_service.send_notification(order_id, notification_data)

            # Все успешно выполнено, завершаем сагу
            print("Сага успешно завершена!")
        except Exception as e:
            # Обработка ошибки и выполнение компенсирующих действий
            print(f"Произошла ошибка: {e}")
            self.rollback_saga(order_id)

    def rollback_saga(self, order_id):
        # Вызываем компенсирующие действия для отмены всех предыдущих операций
        order_service = OrderService()
        payment_service = PaymentService()
        notification_service = NotificationService()

        try:
            # Шаг 1: Отмена платежа
            payment_service.rollback_payment(order_id)

            # Шаг 2: Отмена уведомления
            notification_service.rollback_notification(order_id)

            # Шаг 3: Отмена создания заказа
            order_service.cancel_order(order_id)

            print("Сага успешно отменена!")
        except Exception as e:
            # Обработка ошибки во время отката
            print(f"Ошибка при откате саги: {e}")

class OrderService:
    def create_order(self, order_data):
        # Здесь реализация создания заказа
        pass

    def cancel_order(self, order_id):
        # Здесь реализация отмены заказа и компенсирующих действий
        pass


class PaymentService:
    def process_payment(self, order_id, payment_data):
        # Здесь реализация обработки платежа
        pass

    def rollback_payment(self, order_id):
        # Здесь реализация отмены платежа и компенсирующих действий
        pass

class NotificationService:
    def send_notification(self, order_id, notification_data):
        # Здесь реализация отправки уведомления
        pass

    def rollback_notification(self, order_id):
        # Здесь реализация отмены уведомления и компенсирующих действий
        pass


