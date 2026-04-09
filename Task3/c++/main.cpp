#include <iostream>
#include <sstream>
using namespace std;

// сумма цифр
int sumChis(int n) {
    int sum = 0;
    while (n > 0) {
        sum += n % 10;
        n /= 10;
    }
    return sum;
}

// произведение цифр
int ymnChis(int n) {
    int product = 1;
    while (n > 0) {
        product *= n % 10;
        n /= 10;
    }
    return product;
}

int main() {
    int N;
    cout << "Введите количество чисел: ";
    cin >> N;

    if (N <= 0) {
        cout << "Ошибка: N должно быть > 0\n";
        return 1;
    }

    cin.ignore(); // очистка \n после ввода N
    cout << "Введите ваши числа: ";

    string line;
    getline(cin, line); // читаем всю строку

    stringstream ss(line);
    int x, count = 0;
    bool found = false;
    while (ss >> x) {
        count++;

        int sum = sumChis(x);
        int product = ymnChis(x);

        if (sum < product) {
            cout << x << " ";
            found = true;
        }
    }

    // проверка количества
    if (count < N) {
        cout << "\nОшибка: введено меньше чисел, чем " << N << "\n";
        return 1;
    }
    if (count > N) {
        cout << "\nОшибка: введено больше чисел, чем " << N << "\n";
        return 1;
    }

    if (!found) {
        cout << "не найдено";
    }

    return 0;
}
