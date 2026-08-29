// Проверяем наличие Web Speech API
const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

if (SpeechRecognition) {
    const recognition = new SpeechRecognition();
    recognition.lang = 'ru-RU'; // Устанавливаем язык
    recognition.continuous = false; // Остановка после первой паузы
    recognition.interimResults = false; // Не показываем промежуточные результаты

    const voiceBtn = document.getElementById('voiceBtn');
    const searchInput = document.getElementById('searchInput');

    voiceBtn.addEventListener('click', () => {
        recognition.start();
    });

    // Событие при получении результата распознавания
    recognition.addEventListener('result', (event) => {
        const transcript = event.results[0][0].transcript;
        searchInput.value = transcript;
        console.log('Распознанный текст:', transcript);

        // Здесь вы можете, например, автоматически отправлять текст на сервер,
        // осуществлять поиск по сайту и т.д.
        // Пример: отправить форму:
        // document.getElementById('searchForm').submit();
    });

    // Событие после окончания прослушивания
    recognition.addEventListener('end', () => {
        console.log('Распознавание завершено');
    });
} else {
    alert('К сожалению, ваш браузер не поддерживает Web Speech API');
}