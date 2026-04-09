import Foundation

// Функция для вычисления суммы цифр числа
func sumOfDigits(_ number: Int) -> Int {
    return String(number).compactMap { $0.wholeNumberValue }.reduce(0, +)
}

// Функция для вычисления произведения цифр числа
func productOfDigits(_ number: Int) -> Int {
    return String(number).compactMap { $0.wholeNumberValue }.reduce(1, *)
}

// Чтение числа N
print("Введите количество чисел N:")
guard let inputN = readLine(), let N = Int(inputN) else {
    fatalError("Некорректный ввод N")
}

// Чтение последовательности чисел
print("Введите \(N) чисел:")
guard let line = readLine() else {
    fatalError("Ошибка ввода чисел")
}

let numbers = line.split(separator: " ").compactMap { Int($0) }

if numbers.count != N {
    fatalError("Количество введённых чисел не соответствует N")
}

// Фильтруем числа, у которых сумма цифр < произведение цифр
let result = numbers.filter { sumOfDigits($0) < productOfDigits($0) }

// Вывод результата
print("Результат: ")
if result.isEmpty {
    print("не найдено")
} else {
    print(result.map { String($0) }.joined(separator: " "))
}