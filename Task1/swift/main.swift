import Foundation

// Проверка, простое ли число
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    if n == 2 { return true }
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 { return false }
    }
    return true
}

// Сумма простых делителей через разложение на множители
func sumPrimeDivisors(of n: Int) -> Int {
    if isPrime(n) { return n } // если число простое, возвращаем его
    
    var num = n
    var sum = 0
    var primeDivisors = Set<Int>()
    
    // Разделяем на делители 2
    if num % 2 == 0 {
        primeDivisors.insert(2)
        while num % 2 == 0 { num /= 2 }
    }
    
    // Разделяем на нечетные простые делители
    var i = 3
    while i * i <= num {
        if num % i == 0 {
            primeDivisors.insert(i)
            while num % i == 0 { num /= i }
        }
        i += 2
    }
    
    // Если после деления осталось простое число > 2
    if num > 2 {
        primeDivisors.insert(num)
    }
    
    sum = primeDivisors.reduce(0, +)
    return sum
}

// Безопасный ввод числа
func readNaturalNumber(prompt: String) -> Int {
    while true {
        print(prompt, terminator: " ")
        guard let input = readLine(), !input.isEmpty else {
            print("Ошибка: ввод пустой. Попробуйте снова.")
            continue
        }
        if let n = Int(input), n > 0 {
            return n
        } else {
            print("Ошибка: введите натуральное число (целое > 0).")
        }
    }
}

// Основная программа
let n = readNaturalNumber(prompt: "Введите число N:")
let result = sumPrimeDivisors(of: n)
print("Результат: \(result)")