[Изучаем ResponseEntity<?> и избавляемся от него в контроллерах Spring Boot](https://habr.com/ru/articles/675716/)

1. Метод с возвратом объекта

````java
@ResponseBody
@GetMapping("/products")
public Product getProduct(@RequestParam Long id){
    return productsService.findById(id);
}
````

Возврат ошибок через advice.
Создать exception (1):
````java
public class ResourceNotFoundException extends RuntimeException {
    public ResourceNotFoundException(String message) { // ResourceNotFoundException
        super(message);
    }
}
````

и обработка ResourceNotFoundException через Advice и Handler (2):

````java
@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
    @ExceptionHandler
    public ResponseEntity<AppError> catchResourceNotFoundException(ResourceNotFoundException e) {
        log.error(e.getMessage(), e);
        return new ResponseEntity<>(new AppError(HttpStatus.NOT_FOUND.value(), e.getMessage()), HttpStatus.NOT_FOUND);
    }
 }
````

где AppError:

````java
public class AppError {
    private int statusCode;
    private String message;

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public AppError() {
    }

    public AppError(int statusCode, String message) {
        this.statusCode = statusCode;
        this.message = message;
    }
}
````


Просто тестировать.

2. ResponseEntity

Возвращает ResponseEntity<?>.

````java
@GetMapping("/products")
public ResponseEntity<?> getProduct(Long id) {
    try {
        Product product = productsService.findById(id).orElseThrow();
        return new ResponseEntity<>(product, HttpStatus.OK);
    } catch (Exception e){
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}
````

Возврат ошибки делается так:

````java
 @GetMapping("/products")
    public ResponseEntity<?> getProduct(Long id){
        try {
            Product product = productsService.findById(id).orElseThrow();
            return
                new ResponseEntity<>(
                    product,
                    HttpStatus.OK
                );
        } catch (Exception e){
            return
                new ResponseEntity<>(
                    new AppError(
                        HttpStatus.NOT_FOUND.value(),
                        "Product with id " + id + " nor found"
                    ),
                    HttpStatus.NOT_FOUND
                );
        }
    }
````

где AppError:

````java
public class AppError {
    private int statusCode;
    private String message;

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public AppError() {
    }

    public AppError(int statusCode, String message) {
        this.statusCode = statusCode;
        this.message = message;
    }
}
````

Тестировать с помощью этого объекта.

