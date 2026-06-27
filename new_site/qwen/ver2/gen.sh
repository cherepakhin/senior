#!/bin/bash

# Название проекта
PROJECT_NAME="employee-crud-project"
PACKAGE_PATH="com/example/demo"
SRC_DIR="src/main/java/$PACKAGE_PATH"
RES_DIR="src/main/resources"
TEST_DIR="src/test/java/$PACKAGE_PATH"

echo "🚀 Создание Spring Boot CRUD проекта (Java 11) с поиском и сортировкой..."

# 1. Создание структуры директорий
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

mkdir -p $SRC_DIR/{controller,model,repository,service}
mkdir -p $RES_DIR/templates
mkdir -p $TEST_DIR/{controller,service}

echo "📁 Структура директорий создана."

# 2. Создание pom.xml (Java 11)
cat > pom.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.7.18</version>
        <relativePath/>
    </parent>
    
    <groupId>com.example</groupId>
    <artifactId>employee-crud</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>employee-crud</name>
    <description>Employee CRUD with Material Design</description>
    
    <properties>
        <java.version>11</java.version>
    </properties>
    
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-thymeleaf</artifactId>
        </dependency>
        <dependency>
            <groupId>com.h2database</groupId>
            <artifactId>h2</artifactId>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>
    
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <configuration>
                    <excludes>
                        <exclude>
                            <groupId>org.projectlombok</groupId>
                            <artifactId>lombok</artifactId>
                        </exclude>
                    </excludes>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
EOF

echo "📄 pom.xml создан (Java 11 + Spring Boot 2.7)."

# 3. Создание application.properties
cat > $RES_DIR/application.properties << 'EOF'
spring.datasource.url=jdbc:h2:mem:testdb
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=password
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
spring.h2.console.enabled=true
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
EOF

echo "⚙️ application.properties создан."

# 4. Создание Main Application класса
cat > $SRC_DIR/DemoApplication.java << 'EOF'
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}
EOF

# 5. Создание Model (Employee)
cat > $SRC_DIR/model/Employee.java << 'EOF'
package com.example.demo.model;

import javax.persistence.*;

@Entity
@Table(name = "employees")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String firstName;

    @Column(nullable = false)
    private String lastName;

    @Column(nullable = false, unique = true)
    private String email;

    public Employee() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
EOF

echo "📦 Model создан."

# 6. Создание Repository (с поиском)
cat > $SRC_DIR/repository/EmployeeRepository.java << 'EOF'
package com.example.demo.repository;

import com.example.demo.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    
    @Query("SELECT e FROM Employee e WHERE " +
           "LOWER(e.firstName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           "LOWER(e.lastName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           "LOWER(e.email) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Employee> searchEmployees(@Param("keyword") String keyword);
}
EOF

# 7. Создание Service Interface
cat > $SRC_DIR/service/EmployeeService.java << 'EOF'
package com.example.demo.service;

import com.example.demo.model.Employee;
import java.util.List;

public interface EmployeeService {
    List<Employee> getAllEmployees();
    List<Employee> searchEmployees(String keyword);
    Employee saveEmployee(Employee employee);
    Employee getEmployeeById(Long id);
    void deleteEmployee(Long id);
}
EOF

# 8. Создание Service Implementation
cat > $SRC_DIR/service/EmployeeServiceImpl.java << 'EOF'
package com.example.demo.service;

import com.example.demo.model.Employee;
import com.example.demo.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    @Override
    public List<Employee> searchEmployees(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return employeeRepository.findAll();
        }
        return employeeRepository.searchEmployees(keyword.trim());
    }

    @Override
    public Employee saveEmployee(Employee employee) {
        return employeeRepository.save(employee);
    }

    @Override
    public Employee getEmployeeById(Long id) {
        return employeeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Employee not found with id: " + id));
    }

    @Override
    public void deleteEmployee(Long id) {
        employeeRepository.deleteById(id);
    }
}
EOF

echo "🔧 Service создан."

# 9. Создание Controller (с поиском и сортировкой)
cat > $SRC_DIR/controller/EmployeeController.java << 'EOF'
package com.example.demo.controller;

import com.example.demo.model.Employee;
import com.example.demo.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/")
    public String listEmployees(@RequestParam(required = false) String keyword,
                                @RequestParam(defaultValue = "firstName") String sortBy,
                                @RequestParam(defaultValue = "asc") String sortDir,
                                Model model) {
        
        List<Employee> employees;
        
        // Поиск
        if (keyword != null && !keyword.trim().isEmpty()) {
            employees = employeeService.searchEmployees(keyword);
        } else {
            employees = employeeService.getAllEmployees();
        }
        
        // Сортировка
        employees = sortEmployees(employees, sortBy, sortDir);
        
        model.addAttribute("employees", employees);
        model.addAttribute("keyword", keyword);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
        
        return "index";
    }

    private List<Employee> sortEmployees(List<Employee> employees, String sortBy, String sortDir) {
        Comparator<Employee> comparator = getComparator(sortBy);
        
        if (sortDir.equals("desc")) {
            comparator = comparator.reversed();
        }
        
        return employees.stream().sorted(comparator).collect(Collectors.toList());
    }

    private Comparator<Employee> getComparator(String sortBy) {
        switch (sortBy) {
            case "lastName":
                return Comparator.comparing(Employee::getLastName, Comparator.nullsLast(String.CASE_INSENSITIVE_ORDER));
            case "email":
                return Comparator.comparing(Employee::getEmail, Comparator.nullsLast(String.CASE_INSENSITIVE_ORDER));
            case "id":
                return Comparator.comparing(Employee::getId);
            default:
                return Comparator.comparing(Employee::getFirstName, Comparator.nullsLast(String.CASE_INSENSITIVE_ORDER));
        }
    }

    @GetMapping("/showNewEmployeeForm")
    public String showNewEmployeeForm(Model model) {
        Employee employee = new Employee();
        model.addAttribute("employee", employee);
        return "employee_form";
    }

    @GetMapping("/showUpdateForm/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Employee employee = employeeService.getEmployeeById(id);
        model.addAttribute("employee", employee);
        return "employee_form";
    }

    @PostMapping("/saveEmployee")
    public String saveEmployee(@ModelAttribute Employee employee) {
        employeeService.saveEmployee(employee);
        return "redirect:/";
    }

    @GetMapping("/deleteEmployee/{id}")
    public String deleteEmployee(@PathVariable Long id) {
        employeeService.deleteEmployee(id);
        return "redirect:/";
    }
}
EOF

echo "🎮 Controller создан с поиском и сортировкой."

# 10. Создание HTML шаблонов (Material Design + Поиск + Сортировка)
cat > $RES_DIR/templates/index.html << 'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Employee CRUD</title>
    <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
    <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body { font-family: Roboto, sans-serif; background: #f5f5f5; padding: 20px; }
        .container { max-width: 900px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.2); }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .search-section { display: flex; gap: 10px; margin-bottom: 20px; align-items: center; }
        .search-field { flex-grow: 1; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { cursor: pointer; user-select: none; }
        th:hover { background-color: #f0f0f0; }
        .sort-icon { margin-left: 5px; font-size: 16px; vertical-align: middle; }
        .mdc-button { margin-right: 5px; }
        .active-sort { background-color: #e3f2fd; }
        .no-results { text-align: center; padding: 40px; color: #666; }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1 class="mdc-typography--headline4">Employee Directory</h1>
        <a href="/showNewEmployeeForm" class="mdc-button mdc-button--raised">
            <span class="mdc-button__label">Add Employee</span>
        </a>
    </div>

    <!-- Форма поиска -->
    <div class="search-section">
        <form action="/" method="GET" class="search-field" style="display: flex; gap: 10px;">
            <div class="mdc-text-field mdc-text-field--outlined" style="flex-grow: 1;">
                <input class="mdc-text-field__input" name="keyword" th:value="${keyword}" placeholder="Search by name or email...">
                <div class="mdc-notched-outline">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label class="mdc-floating-label">Search</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>
            <button type="submit" class="mdc-button mdc-button--outlined">
                <span class="material-icons mdc-button__icon">search</span>
                <span class="mdc-button__label">Search</span>
            </button>
            <a href="/" class="mdc-button mdc-button--outlined">
                <span class="material-icons mdc-button__icon">clear</span>
                <span class="mdc-button__label">Clear</span>
            </a>
        </form>
    </div>

    <!-- Таблица с сортировкой -->
    <table class="mdc-data-table">
        <thead>
        <tr class="mdc-data-table__header-row">
            <th class="mdc-data-table__header-cell" 
                th:classappend="${sortBy} == 'firstName' ? 'active-sort' : ''"
                th:onclick="'window.location.href=\'/?sortBy=firstName&sortDir=' + ${reverseSortDir} + ( ${keyword} ? '&keyword=' + ${keyword} : \'\' ) + '\''">
                First Name
                <span class="material-icons sort-icon" th:if="${sortBy} == 'firstName'">
                    <span th:text="${sortDir} == 'asc' ? 'arrow_upward' : 'arrow_downward'"></span>
                </span>
            </th>
            <th class="mdc-data-table__header-cell"
                th:classappend="${sortBy} == 'lastName' ? 'active-sort' : ''"
                th:onclick="'window.location.href=\'/?sortBy=lastName&sortDir=' + ${reverseSortDir} + ( ${keyword} ? '&keyword=' + ${keyword} : \'\' ) + '\''">
                Last Name
                <span class="material-icons sort-icon" th:if="${sortBy} == 'lastName'">
                    <span th:text="${sortDir} == 'asc' ? 'arrow_upward' : 'arrow_downward'"></span>
                </span>
            </th>
            <th class="mdc-data-table__header-cell"
                th:classappend="${sortBy} == 'email' ? 'active-sort' : ''"
                th:onclick="'window.location.href=\'/?sortBy=email&sortDir=' + ${reverseSortDir} + ( ${keyword} ? '&keyword=' + ${keyword} : \'\' ) + '\''">
                Email
                <span class="material-icons sort-icon" th:if="${sortBy} == 'email'">
                    <span th:text="${sortDir} == 'asc' ? 'arrow_upward' : 'arrow_downward'"></span>
                </span>
            </th>
            <th class="mdc-data-table__header-cell">Actions</th>
        </tr>
        </thead>
        <tbody class="mdc-data-table__content">
        <tr th:if="${#lists.isEmpty(employees)}" class="mdc-data-table__row">
            <td colspan="4" class="no-results">
                <span class="material-icons" style="font-size: 48px; color: #999;">search_off</span>
                <p>No employees found</p>
            </td>
        </tr>
        <tr th:each="emp : ${employees}" class="mdc-data-table__row">
            <td class="mdc-data-table__cell" th:text="${emp.firstName}"></td>
            <td class="mdc-data-table__cell" th:text="${emp.lastName}"></td>
            <td class="mdc-data-table__cell" th:text="${emp.email}"></td>
            <td class="mdc-data-table__cell">
                <a th:href="@{/showUpdateForm/{id}(id=${emp.id})}" class="mdc-button mdc-button--outlined">
                    <span class="material-icons mdc-button__icon">edit</span>
                    <span class="mdc-button__label">Update</span>
                </a>
                <a th:href="@{/deleteEmployee/{id}(id=${emp.id})}" class="mdc-button mdc-button--unelevated" 
                   style="background-color: #b00020; color: white;"
                   onclick="return confirm('Are you sure?')">
                    <span class="material-icons mdc-button__icon">delete</span>
                    <span class="mdc-button__label">Delete</span>
                </a>
            </td>
        </tr>
        </tbody>
    </table>
    
    <div style="margin-top: 15px; color: #666; font-size: 14px;">
        <span th:text="${#lists.size(employees)} + ' employee(s) found'"></span>
        <span th:if="${keyword} != null and ${keyword} != ''" th:text="' for &quot;' + ${keyword} + '&quot;'"></span>
    </div>
</div>
</body>
</html>
EOF

cat > $RES_DIR/templates/employee_form.html << 'EOF'
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Employee Form</title>
    <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body { font-family: Roboto, sans-serif; background: #f5f5f5; padding: 20px; }
        .container { max-width: 500px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.2); }
        .form-group { margin-bottom: 20px; }
        .full-width { width: 100%; }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mdc-typography--headline4" th:text="${employee.id} ? 'Update Employee' : 'Add Employee'"></h1>
    <form th:action="@{/saveEmployee}" th:object="${employee}" method="POST">
        <input type="hidden" th:field="*{id}" />
        <div class="form-group mdc-text-field mdc-text-field--outlined full-width">
            <input class="mdc-text-field__input" th:field="*{firstName}" required>
            <div class="mdc-notched-outline"><div class="mdc-notched-outline__leading"></div><div class="mdc-notched-outline__notch"><label class="mdc-floating-label">First Name</label></div><div class="mdc-notched-outline__trailing"></div></div>
        </div>
        <div class="form-group mdc-text-field mdc-text-field--outlined full-width">
            <input class="mdc-text-field__input" th:field="*{lastName}" required>
            <div class="mdc-notched-outline"><div class="mdc-notched-outline__leading"></div><div class="mdc-notched-outline__notch"><label class="mdc-floating-label">Last Name</label></div><div class="mdc-notched-outline__trailing"></div></div>
        </div>
        <div class="form-group mdc-text-field mdc-text-field--outlined full-width">
            <input class="mdc-text-field__input" th:field="*{email}" type="email" required>
            <div class="mdc-notched-outline"><div class="mdc-notched-outline__leading"></div><div class="mdc-notched-outline__notch"><label class="mdc-floating-label">Email</label></div><div class="mdc-notched-outline__trailing"></div></div>
        </div>
        <button type="submit" class="mdc-button mdc-button--raised"><span class="material-icons mdc-button__icon">save</span><span class="mdc-button__label">Save</span></button>
        <a href="/" class="mdc-button"><span class="material-icons mdc-button__icon">arrow_back</span><span class="mdc-button__label">Cancel</span></a>
    </form>
</div>
</body>
</html>
EOF

echo "🎨 HTML шаблоны созданы с поиском и сортировкой."

# 11. Создание Unit Тестов
cat > $TEST_DIR/service/EmployeeServiceImplTest.java << 'EOF'
package com.example.demo.service;

import com.example.demo.model.Employee;
import com.example.demo.repository.EmployeeRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class EmployeeServiceImplTest {

    @Mock
    private EmployeeRepository employeeRepository;

    @InjectMocks
    private EmployeeServiceImpl employeeService;

    private Employee employee;

    @BeforeEach
    void setUp() {
        employee = new Employee();
        employee.setId(1L);
        employee.setFirstName("John");
        employee.setLastName("Doe");
        employee.setEmail("john@example.com");
    }

    @Test
    void testSaveEmployee() {
        when(employeeRepository.save(employee)).thenReturn(employee);
        Employee saved = employeeService.saveEmployee(employee);
        assertNotNull(saved);
        assertEquals("John", saved.getFirstName());
        verify(employeeRepository, times(1)).save(employee);
    }

    @Test
    void testGetAllEmployees() {
        when(employeeRepository.findAll()).thenReturn(Arrays.asList(employee));
        List<Employee> list = employeeService.getAllEmployees();
        assertEquals(1, list.size());
        verify(employeeRepository, times(1)).findAll();
    }

    @Test
    void testSearchEmployees() {
        when(employeeRepository.searchEmployees("john")).thenReturn(Arrays.asList(employee));
        List<Employee> list = employeeService.searchEmployees("john");
        assertEquals(1, list.size());
        verify(employeeRepository, times(1)).searchEmployees("john");
    }

    @Test
    void testSearchEmployeesEmptyKeyword() {
        when(employeeRepository.findAll()).thenReturn(Arrays.asList(employee));
        List<Employee> list = employeeService.searchEmployees("");
        assertEquals(1, list.size());
        verify(employeeRepository, times(1)).findAll();
    }

    @Test
    void testGetEmployeeById() {
        when(employeeRepository.findById(1L)).thenReturn(Optional.of(employee));
        Employee found = employeeService.getEmployeeById(1L);
        assertEquals(1L, found.getId());
    }

    @Test
    void testDeleteEmployee() {
        doNothing().when(employeeRepository).deleteById(1L);
        employeeService.deleteEmployee(1L);
        verify(employeeRepository, times(1)).deleteById(1L);
    }
}
EOF

cat > $TEST_DIR/controller/EmployeeControllerTest.java << 'EOF'
package com.example.demo.controller;

import com.example.demo.model.Employee;
import com.example.demo.service.EmployeeService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Arrays;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(EmployeeController.class)
public class EmployeeControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private EmployeeService employeeService;

    @Test
    void testListEmployees() throws Exception {
        when(employeeService.getAllEmployees()).thenReturn(Arrays.asList(new Employee()));
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("index"))
                .andExpect(model().attributeExists("employees"));
    }

    @Test
    void testListEmployeesWithSearch() throws Exception {
        when(employeeService.searchEmployees("john")).thenReturn(Arrays.asList(new Employee()));
        mockMvc.perform(get("/").param("keyword", "john"))
                .andExpect(status().isOk())
                .andExpect(view().name("index"));
    }

    @Test
    void testListEmployeesWithSort() throws Exception {
        when(employeeService.getAllEmployees()).thenReturn(Arrays.asList(new Employee()));
        mockMvc.perform(get("/").param("sortBy", "lastName").param("sortDir", "desc"))
                .andExpect(status().isOk())
                .andExpect(view().name("index"));
    }

    @Test
    void testShowNewEmployeeForm() throws Exception {
        mockMvc.perform(get("/showNewEmployeeForm"))
                .andExpect(status().isOk())
                .andExpect(view().name("employee_form"))
                .andExpect(model().attributeExists("employee"));
    }

    @Test
    void testSaveEmployee() throws Exception {
        Employee emp = new Employee();
        emp.setFirstName("Jane");
        when(employeeService.saveEmployee(any(Employee.class))).thenReturn(emp);

        mockMvc.perform(post("/saveEmployee")
                        .param("firstName", "Jane")
                        .param("lastName", "Doe")
                        .param("email", "jane@test.com"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/"));
        
        verify(employeeService, times(1)).saveEmployee(any(Employee.class));
    }
}
EOF

echo "🧪 Тесты созданы."

# Завершение
echo ""
echo "✅ Проект успешно создан в папке: $PROJECT_NAME"
echo ""
echo "📋 Следующие шаги:"
echo "   cd $PROJECT_NAME"
echo "   mvn spring-boot:run"
echo ""
echo "🌐 Откройте в браузере: http://localhost:8080"
echo "🧪 Запуск тестов: mvn test"
echo "💾 H2 Консоль: http://localhost:8080/h2-console (JDBC URL: jdbc:h2:mem:testdb)"
echo ""
echo "🔍 Новые функции:"
echo "   - Поиск по имени, фамилии или email"
echo "   - Сортировка по клику на заголовки колонок"
echo "   - Индикатор направления сортировки (▲/▼)"
echo ""