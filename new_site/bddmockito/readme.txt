https://www.baeldung.com/bdd-mockito
------------------------------------
Дан класс для теста:

public class PhoneBookService {
    private PhoneBookRepository phoneBookRepository;

    public void register(String name, String phone) {
        if(!name.isEmpty() && !phone.isEmpty()
          && !phoneBookRepository.contains(name)) {
            phoneBookRepository.insert(name, phone);
        }
    }

    public String search(String name) {
        if(!name.isEmpty() && phoneBookRepository.contains(name)) {
            return phoneBookRepository.getPhoneNumberByContactName(name);
        }
        return null;
    }
}

BDDMockito - возможности в форме, более подходящей для BDD
Обычное тестирование с Mockito:

````java
// given
when(phoneBookRepository.contains(momContactName))
  .thenReturn(false);
// when. phoneBookService.register(...) - тестируемый метод
phoneBookService.register(momContactName, momPhoneNumber);
//then
verify(phoneBookRepository)
  .insert(momContactName, momPhoneNumber);
````

В BDDMockito выглядит так:

````java
given(phoneBookRepository.contains(momContactName)) // 'given' замена 'when'
  .willReturn(false);

phoneBookService.register(momContactName, momPhoneNumber); // phoneBookService.register(...) - тестируемый метод

Проверка что метод phoneBookRepository.insert был вызван с аргументами momContactName, momPhoneNumber
then(phoneBookRepository) // 'then' замена 'verify'
  .should() // метод из BDD Mockito
  .insert(momContactName, momPhoneNumber); // метод 'phoneBookRepository.insert'
````

Возврат динамического значения:

````java
given(phoneBookRepository.contains(momContactName))
  .willReturn(true);
given(phoneBookRepository.getPhoneNumberByContactName(momContactName))
  .will((InvocationOnMock invocation) ->
    invocation.getArgument(0).equals(momContactName)
      ? momPhoneNumber
      : null);
phoneBookService.search(momContactName);
then(phoneBookRepository)
  .should()
  .getPhoneNumberByContactName(momContactName);
````

