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
