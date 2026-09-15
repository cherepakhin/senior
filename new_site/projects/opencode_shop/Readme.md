# Пример небольшого магазина на Java, SpringBoot сгенерированного OpenCode

Сделано с помощью [OpenCode](https://opencode.ai/) (ниже см. промпты).

Аккуратный css UI.

Развернуто [https://v.perm.ru/shop/](https://v.perm.ru/shop/)

# Shop Application with AI OpenCode

A Spring Boot shop application with products and product categories.

## Technologies

- **Java 11**
- **Spring Boot 2.7.18**
- **Spring Data JPA** persistence
- **H2** file-based database (data persists across restarts)
- **Thymeleaf** view technology
- **Maven** build tool

## Start

Install opencode [https://opencode.ai/docs/ru](https://opencode.ai/docs/ru).

Start:

````shell
opencode
````

## Features

- Shop home page with inventory summary
- **Product** CRUD operations:
    - List all products (with category name)
    - View product details
    - Create, edit, delete products
    - Assign products to categories
- **Category** CRUD operations:
    - List all categories
    - View category details with its products
    - Create, edit, delete categories
- Persistent storage in an H2 database file (`./data/shopdb.mv.db`)
- Sample data seeded automatically on first run
- Runs at context path `/shop` (ready for reverse proxy)

## Prompts OpenCode

- generate project spring mvc with maven
- use themleaf
- use java 11
- convert to spring boot
- create run script
- commit
- change theme gmail
- примени стиль material design
- возьми цветовую схему с сайта v.perm.ru
- write unit tests for classes in package service
- commit
- write unit tests for classes in package controller
- прогони тесты

## Project Structure

```
src/main/java/com/example/
├── Application.java          # Spring Boot main class
├── config/
│   └── DataSeeder.java       # Seeds sample data on first start
├── controller/
│   ├── HomeController.java
│   ├── ProductController.java
│   └── CategoryController.java
├── model/
│   ├── Product.java          # JPA entity
│   └── Category.java         # JPA entity
├── repository/
│   ├── ProductRepository.java
│   └── CategoryRepository.java
└── service/
    ├── ProductService.java
    └── CategoryService.java

src/main/resources/
├── application.properties
├── static/css/gmail.css      # Material Design theme
└── templates/
    ├── fragments.html        # shared top navigation
    ├── home.html
    ├── productList.html
    ├── productForm.html
    ├── productDetail.html
    ├── categoryList.html
    ├── categoryForm.html
    └── categoryDetail.html
```

## Prerequisites

- Java 11 or higher
- Maven 3.8+

## Build & Run

```bash
# Build the project
mvn clean package

# Run the application (or ./run.sh)
mvn spring-boot:run
```

Access the application at: `http://localhost:8089/shop`

The application is configured with context path `/shop`, so all URLs are
prefixed with `/shop`. The H2 console is available at `/shop/h2-console`
(user `sa`, empty password).

## Endpoints

All endpoints are prefixed with the context path `/shop` (e.g. `/shop/products`).

### Products

| Method | Path                    | Description         |
|--------|-------------------------|---------------------|
| GET    | `/products`             | List all products   |
| GET    | `/products/new`         | Create product form |
| POST   | `/products`             | Save new product    |
| GET    | `/products/{id}`        | Product details     |
| GET    | `/products/{id}/edit`   | Edit product form   |
| POST   | `/products/{id}`        | Update product      |
| POST   | `/products/{id}/delete` | Delete product      |

### Categories

| Method | Path                      | Description          |
|--------|---------------------------|----------------------|
| GET    | `/categories`             | List all categories  |
| GET    | `/categories/new`         | Create category form |
| POST   | `/categories`             | Save new category    |
| GET    | `/categories/{id}`        | Category details     |
| GET    | `/categories/{id}/edit`   | Edit category form   |
| POST   | `/categories/{id}`        | Update category      |
| POST   | `/categories/{id}/delete` | Delete category      |

### Deployment

See [`DEPLOY.md`](DEPLOY.md) for instructions on deploying to
`https://v.perm.ru/shop` (systemd service + Apache reverse proxy).

or

````shell
scp target/shop-1.0-SNAPSHOT.jar vasi@v:/home/vasi/temp/shop.jar
````
### Config for Apache2

Add to `/etc/apache2/sites-enabled/000-default.conf`:

````text
<VirtualHost>
....
	ProxyPass        /shop http://localhost:8092/shop
	ProxyPassReverse /shop http://localhost:8092/shop
....
</VirtualHost>	
````

Open [https://v.perm.ru/shop](https://v.perm.ru/shop).

### Linux service

[/etc/systemd/system/shop.service](doc/shop.service):

````text
[Unit]
Description=ShopHub Spring Boot Application
Documentation=https://v.perm.ru/shop
After=network.target

[Service]
Type=simple
User=shop
WorkingDirectory=/home/vasi/temp/shop
ExecStart=/usr/bin/java -jar -Xms256m -Xmx512m /home/vasi/temp/shop/shop.jar
SuccessExitStatus=143
Restart=always
RestartSec=10
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
````

### Результат

![main_screen.png](doc/main_screen.png)

![categories.png](doc/categories.png)

![category_view.png](doc/category_view.png)

![edit_category.png](doc/edit_category.png)

![products.png](doc/products.png)

![product_view.png](doc/product_view.png)

![product_edit.png](doc/product_edit.png)




