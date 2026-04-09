const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Запрашиваем количество колец
rl.question("Введите количество колец: ", (nInput) => {
    const n = parseInt(nInput);

    // Проверка корректности числа
    if (isNaN(n) || n <= 0) {
        console.log("Ошибка: введите корректное положительное число.");
        rl.close();
        return;
    }

    // Запрашиваем строку с кольцами
    rl.question("Введите строку с кольцами: ", (ringsStr) => {

        // Проверка длины строки
        if (ringsStr.length !== n * 2) {
            console.log("Ошибка в длине строки");
            rl.close();
            return;
        }

        // Массив множеств цветов для 10 стержней
        const colors = Array.from({ length: 10 }, () => new Set());

        // Обработка колец
        for (let i = 0; i < n; i++) {
            const color = ringsStr[i * 2];
            const rodChar = ringsStr[i * 2 + 1];

            // Проверка цвета
            if (!['r', 'g', 'b'].includes(color)) {
                console.log(`Ошибка в воде строки`);
                rl.close();
                return;
            }

            // Проверка стержня
            const rod = parseInt(rodChar);
            if (isNaN(rod) || rod < 0 || rod > 9) {
                console.log(`Ошибка в воде строки`);
                rl.close();
                return;
            }

            colors[rod].add(color);
        }

        // Поиск стержней с тремя цветами
        const result = [];
        for (let i = 0; i < 10; i++) {
            if (colors[i].has('r') && colors[i].has('g') && colors[i].has('b')) {
                result.push(i);
            }
        }

        // Вывод результата
        console.log("Количество стержней с кольцами всех трёх цветов:", result.length);

        if (result.length === 0) {
            console.log("Нет стержней с тремя цветами");
        } else {
            console.log("Номера этих стержней:", result.join(' '));
        }

        rl.close();
    });
});
