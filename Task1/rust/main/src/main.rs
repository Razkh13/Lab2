use std::io;

fn prost_chis(x: i32) -> bool {
    if x < 2 {
        return false;
    }

    let mut i = 2;
    while i * i <= x {
        if x % i == 0 {
            return false;
        }
        i += 1;
    }

    true
}

fn sum_prost_del(n: i32) -> i32 {
    let mut sum = 0;
    let mut i = 2;

    while i * i <= n {
        if n % i == 0 {
            if prost_chis(i) {
                println!("Найден простой делитель: {}", i);
                sum += i;
            }

            let other = n / i;
            if i != other && prost_chis(other) {
                println!("Найден простой делитель: {}", other);
                sum += other;
            }
        }
        i += 1;
    }

    if sum == 0 {
        println!("Число простое, вывод самого числа:");
        return n;
    }

    println!("Сумма простых делителей:");
    sum
}

fn main() {
    let mut input = String::new();

    println!("Введите число:");
    io::stdin()
        .read_line(&mut input)
        .expect("Ошибка ввода");

    let n: i32 = input.trim().parse().expect("Введите число");

    let result = sum_prost_del(n);
    println!("{}", result);
}
