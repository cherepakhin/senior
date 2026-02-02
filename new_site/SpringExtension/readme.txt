https://habr.com/ru/companies/spring_aio/articles/886700/

Мой пример в shop_kotlin:

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest
import org.springframework.test.context.junit.jupiter.SpringExtension
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get
import org.springframework.test.web.servlet.result.MockMvcResultMatchers.status

@ExtendWith(SpringExtension::class)
@WebMvcTest(EchoCtrl::class)
class EchoCtrlMockMvcTest {
    @Autowired
    lateinit private var mockMvc: MockMvc

    @Test
    fun testProcessCreationFormSuccess() {
        val mes = mockMvc.perform(get("/echo/ECHO_MESSAGE"))
            .andExpect(status().isOk)
            .andReturn()

        assertEquals("ECHO_MESSAGE", mes.response.contentAsString)
    }
}



SpringExtension обеспечивает гладкую интеграцию тестов, написанных на
JUnit Jupiter (см. импорты import org.junit.jupiter.*),
с фреймворком TestContext от Spring (import org.springframework.test.context.junit.jupiter.SpringExtension).