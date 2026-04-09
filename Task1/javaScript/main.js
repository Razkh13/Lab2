const readline = require('readline');

// Функция проверки, простое ли число
function prostChis(n) {
    if (n < 2) return false;
    if (n === 2) return true;
    for (let i = 2; i <= Math.sqrt(n); i++) {
        if (n % i === 0) return false;
    }
    return true;
}

// Сумма простых делителей через разложение на множители
function sumPrimeDivisors(n) {
    if (prostChis(n)) return n;

    let num = n;
    const primeDivisors = new Set();

    // Делим на 2
    if (num % 2 === 0) {
        primeDivisors.add(2);
        while (num % 2 === 0) num /= 2;
    }

    // Делим на нечетные простые числа
    let i = 3;
    while (i * i <= num) {
        if (num % i === 0) {
            primeDivisors.add(i);
            while (num % i === 0) num /= i;
        }
        i += 2;
    }

    // Если осталось простое число > 2
    if (num > 2) primeDivisors.add(num);

    let sum = 0;
    primeDivisors.forEach(x => sum += x);
    return sum;
}

// Настройка ввода через терминал
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function readNaturalNumber(prompt) {
    return new Promise((resolve) => {
        rl.question(prompt, (input) => {
            const n = Number(input);
            if (!Number.isInteger(n) || n <= 0) {
                console.log("Ошибка: введите натуральное число (целое > 0).");
                resolve(readNaturalNumber(prompt)); // рекурсия для повторного ввода
            } else {
                resolve(n);
            }
        });
    });
}

// Основная программа
(async function main() {
    const n = await readNaturalNumber("Введите число N: ");
    const result = sumPrimeDivisors(n);
    console.log(`Результат ${result}`);
    rl.close();
})();