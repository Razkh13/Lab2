use std::io;

fn sum_digits(mut n: i32) -> i32 {
    let mut sum = 0;
    while n > 0 {
        sum += n % 10;
        n /= 10;
    }
    sum
}

fn product_digits(mut n: i32) -> i32 {
    let mut product = 1;
    while n > 0 {
        product *= n % 10;
        n /= 10;
    }
    product
}

fn main() {
    let mut input = String::new();

    println!("Введите количество чисел:");
    io::stdin().read_line(&mut input).unwrap();
    let n: i32 = input.trim().parse().unwrap();
    println!("Введите ваши числа:");

    let mut found = false;
    let mut count = 0;

    while count < n {
        input.clear();
        io::stdin().read_line(&mut input).unwrap();

        println!("Результат: ");
        for num in input.split_whitespace() {
            if count >= n {
                break;
            }

            let x: i32 = num.parse().unwrap();
            let sum = sum_digits(x);
            let product = product_digits(x);

            if sum < product {
                print!("{} ", x);
                found = true;
            }

            count += 1;
        }
    }

    if !found {
        println!("не найдено");
    }
}
