import Foundation

// Чтение количества колец
print("Количество колец: ")
guard let nStr = readLine(), let n = Int(nStr) else {
    print("Ошибка ввода количества колец")
    exit(1)
}
print("Строка с кольцами: ")
guard let ringsStr = readLine() else {
    print("Ошибка ввода строки колец")
    exit(1)
}

let rings = Array(ringsStr)

if rings.count < n * 2 {
    print("Строка с кольцами слишком короткая")
    exit(1)
}

// Массив для хранения множеств цветов на 10 стержнях
var colors = Array(repeating: Set<Character>(), count: 10)

// Обработка каждого кольца
for i in 0..<n {
    let color = rings[i*2]
    let rodChar = rings[i*2 + 1]

    guard let rod = Int(String(rodChar)), rod >= 0, rod <= 9 else {
        print("Ошибка: неверный номер стержня")
        continue
    }

    colors[rod].insert(color)
}

// Подсчёт стержней с кольцами всех цветов
var result = [Int]()
for i in 0..<10 {
    if colors[i].contains("r") && colors[i].contains("g") && colors[i].contains("b") {
        result.append(i)
    }
}

print("Количество стержней с кольцами всех трёх цветов: \(result.count)")
if result.isEmpty {
    print("Нет стержней с тремя цветами")
} else {
    print("Номера этих стержней: ", terminator:"")
    for r in result {
        print("\(r) ", terminator:"")
    }
    print()
}