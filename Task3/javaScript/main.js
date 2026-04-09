// Функция для суммы цифр числа
function sumOfDigits(number) {
    return number
        .toString()
        .split('')
        .reduce((sum, digit) => sum + Number(digit), 0);
}

// Функция для произведения цифр числа
function productOfDigits(number) {
    return number
        .toString()
        .split('')
        .reduce((prod, digit) => prod * Number(digit), 1);
}

// Чтение N и массива чисел
const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

readline.question('Введите количество чисел N: ', nInput => {
    const N = parseInt(nInput);

    readline.question(`Введите ${N} чисел: `, line => {
        const numbers = line.split(' ').map(Number);

        if (numbers.length !== N) {
            console.log('Количество введённых чисел не соответствует N');
            readline.close();
            return;
        }

        // Фильтруем числа по условию
        const result = numbers.filter(num => sumOfDigits(num) < productOfDigits(num));

        // Вывод результата
        console.log('Результат: ');
        if (result.length === 0) {
            console.log('не найдено');
        } else {
            console.log(result.join(' '));
        }

        readline.close();
    });
});
