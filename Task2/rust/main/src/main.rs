use std::io;

fn main() {
    // Чтение количества колец
    let mut input = String::new();
    println!("Количество колец: ");
    io::stdin().read_line(&mut input).unwrap();
    let n: usize = input.trim().parse().unwrap();

    // Чтение строки с кольцами
    println!("Строка с кольцами: ");
    input.clear();
    io::stdin().read_line(&mut input).unwrap();
    let rings = input.trim();

    // Массив для хранения цветов на 10 стержнях
    let mut colors = [0u8; 10];

    // Обработка каждого кольца
    for i in 0..n {
        let color = rings.chars().nth(i * 2).unwrap();
        let index = rings.chars().nth(i * 2 + 1).unwrap().to_digit(10).unwrap() as usize;

        if color == 'r' { colors[index] = colors[index] | 1 }
        else if color == 'g' { colors[index] = colors[index] | 2 }
        else if color == 'b' { colors[index] = colors[index] | 4 }
    }

    // Подсчёт стержней с кольцами всех цветов
    let mut result = Vec::new();
    let mut count = 0;
    for i in 0..10 {
        if colors[i] == 7 {
            result.push(i);
            count = count + 1
        }
    }

    println!("Количество стержней с кольцами всех трёх цветов: {}", count);

    if count == 0 {
        println!("Нет стержней с тремя цветами");
    } else {
        print!("Номера этих стержней: ");
        for x in &result { print!("{} ", x) }
        println!()
    }
}