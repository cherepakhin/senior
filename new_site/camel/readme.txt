Форматирование для заметки:

Генератор html кода из java/kotlin/... кода:
http://hilite.me/

Line numbers: v
style: borland
css: border:solid #092A8F;border-width:.1em .1em .1em .8em;padding:.2em .6em;

-------------------------------
https://camel.apache.org/manual/camel-jbang.html
A JBang-based Camel app for easily running Camel routes.

Пример 1:
-----------
		// Для теста выполнить http :8080/ecommapp/order/process/
		rest("/order/process").get("/") // /order/process/ - path for GET request
		.description("Process order")
		.route().routeId("orders-api") // просто обозначение id route
		.bean(OrderService.class, "generateOrder") // // direct:fetchProducts определен в FetchProductsRoute (это @Component расширяющий RouteBuilder)
		.to("direct:fetchProcess") // Переход на другой route "direct:fetchProducts" определен в OrderProcessingRoute (это @Component расширяющий RouteBuilder)
		.endRest();
-----------
		from("direct:fetchProcess")
		.split(body(), priceAggregationStrategy).parallelProcessing() // см.ниже
		.to("bean:pricingService?method=calculatePrice")
		.end();
-----------
где:
public class PriceAggregationStrategy implements AggregationStrategy {

    // Генерируется шапка для потока позиций заказа (newExchange)
    // и строки собираются в заказ (oldExchange)
    // делается с помощью AggregationStrategy!!!!
    // 1. Получает на вход два экземпляра класса Exchange: старый и новый.
    // 2. Если oldExchange равен null (на первой строке), то создается шапка заказа,
    //      которая потом будет доступна в следующих oldExchange
    //    Если oldExchange НЕ равен null (на следующих строках, где шапка уже есть),
    //    то объект типа Exchange с обновленным телом сообщения (заказ с новой строки)

    // в newExchange будет новая строка заказа
    // в oldExchange - аккумулятор, заказ со строками
	@Override
	public Exchange aggregate(Exchange oldExchange, Exchange newExchange) {
		OrderLine newBody = newExchange.getIn().getBody(OrderLine.class);
        if (oldExchange == null) {
            Order order = new Order();
            order.setOrderNo(UUID.randomUUID().toString());
            order.setOrderDate(Instant.now().toString());
            order.setOrderPrice(newBody.getPrice());
            order.addOrderLine(newBody);

            newExchange.getIn().setBody(order, Order.class);
            return newExchange;
        } else {
            OrderLine newOrderLine = newExchange.getIn().getBody(OrderLine.class);
            Order order = oldExchange.getIn().getBody(Order.class);
            order.setOrderPrice(order.getOrderPrice() + newOrderLine.getPrice());
            order.addOrderLine(newOrderLine);
            oldExchange.getIn().setBody(order);

            return oldExchange;
        }
	}

}
