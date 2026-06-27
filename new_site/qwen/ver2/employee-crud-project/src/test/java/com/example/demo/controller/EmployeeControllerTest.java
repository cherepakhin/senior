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
