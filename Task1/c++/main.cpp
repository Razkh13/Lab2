#include <iostream>
#include <cmath>

bool prostChis(int x) {
    if (x < 2) {
        return false;
    }
    for (int i = 2; i <= sqrt(x); i++) {
        if (x % i == 0) return false;
    }
    return true;
}

int sumProstDel(int N) {
    int sum = 0;
    for (int i = 2; i <= sqrt(N); i++) {
        if (N % i == 0) {

    
            if (prostChis(i)) {
                std::cout << "Найден простой делитель: " << i << std::endl;
                sum += i;
            }

            if (i != N / i && prostChis(N / i)) {
                std::cout << "Найден простой делитель: " << N / i << std::endl;
                sum += N / i;
            }
        }
    }


    if (sum == 0) {
        std::cout << "Число простое, вывод самого числа: ";
        return N;
    }

    std::cout << "Сумма простых делителей: ";
    return sum;
}

int main() {
    int N;
    std::cout << "Введите число: ";
    std::cin >> N;
    int result = sumProstDel(N);
    std::cout << result << std::endl;

    return 0;
}