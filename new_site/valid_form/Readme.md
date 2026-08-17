# Валидация данных формы в Spring Boot MVC

Пример в [net.guides.springboot2.freemarker.controller.PositionController](https://github.com/cherepakhin/hr_admin/blob/v0.0.6/src/main/java/net/guides/springboot2/freemarker/controller/PositionController.java).

````java
	// POST /positions/update/{id} - обработка обновления
@PostMapping("/update/{id}")
public String updatePosition(@PathVariable Long id,
                             @Valid @ModelAttribute Position position,
                             BindingResult bindingResult,
                             Model model) {
    // Первый УРОВЕНЬ проверки -обработка ошибок @Valid.
    // Ошибки @Valid АВТОМАТИЧЕСКИ сохраняются в объекте bindingResult.
    String errors = "";
    log.info("Update position: {}", position);

    if (bindingResult.hasErrors()) {
        // Обработка ошибок @Valid. Ошибки @Valid сохраняются в bindingResult.
        log.info("Binding result: {}", bindingResult);
        for (ObjectError error : bindingResult.getAllErrors()) {
            errors += error.getDefaultMessage() + "\n";
            log.error(error.getDefaultMessage());
        }
        model.addAttribute("name", position.getName());
        model.addAttribute("error_for_name", errors);
        position.setId(id); // Восстановление id для формы
        return NamesView.EDIT_POSITION;
    }
    // Второй УРОВЕНЬ проверки. Backend проверка. 
    if (positionRepository.existsByName(position.getName())) {
        // Обработка backend ошибки
        log.error("Position with name {} already exists", position.getName());
        model.addAttribute("name", position.getName());
        model.addAttribute("error_for_name", "Должность с таким названием УЖЕ существует.");
        //bindingResult.rejectValue("name", "error_for_name", "Должность с таким названием УЖЕ существует.");
        position.setId(id); // Восстановление id для формы
        return NamesView.EDIT_POSITION;
    }
    position.setId(id);
    positionRepository.save(position);
    return "redirect:/" + NamesView.POSITIONS + "/";
}
````

Размещение сообщения об ошибки в форме:

````html
            <form action="${springMacroRequestContext.contextPath}/positions/update/${position.id}" method="post" class="p-6 space-y-4">
                <div>
                    <label class="block text-base font-medium text-gray-700">Название</label>
                    <input type="text"
                           name="name"
                           value="${position.name}"
                           required
                           class="mt-1 block w-full border border-gray-300 shadow-sm py-2 px-3 focus:outline-none focus:ring-sky-500 focus:border-sky-500">
                    <#if error_for_name??>
                        <p class="text-red-600 text-xs mt-1">${error_for_name}</p>
                    </#if>
                </div>
````