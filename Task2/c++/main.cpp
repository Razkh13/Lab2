#include <iostream>
#include <string>
#include <vector>
using namespace std;

int main() {
    cout << "Количество колец: ";
    int N;
    cin >> N;

    string rings;
    cout << "Введите строку с кольцами: " << endl;
    cin >> rings;

    // Проверка длины строки
    if (rings.length() != 2 * N) {
        cout << "Ошибка в воде строки" << endl;
        return 1;
    }

    // Массив для хранения цветов
    int colors[10] = {0};

    // Обработка каждого кольца
    for (int i = 0; i < N; i++) {
        char color = rings[2 * i];
        char rodChar = rings[2 * i + 1];

        // Проверка цвета
        if (color != 'r' && color != 'g' && color != 'b') {
            cout << "Ошибка в воде строки " << endl;
            return 1;
        }

        // Проверка номера стержня
        if (rodChar < '0' || rodChar > '9') {
            cout << "Ошибка в воде строки" << endl;
            return 1;
        }

        int index = rodChar - '0';

        // Сложение битов
        if (color == 'r') colors[index] += 1;
        else if (color == 'g') colors[index] += 2;
        else if (color == 'b') colors[index] += 4;
    }

    vector<int> result;
    for (int i = 0; i < 10; i++) {
        if (colors[i] == 7) {
            result.push_back(i);
        }
    }

    cout << "Количество стержней с кольцами всех трёх цветов: " 
         << result.size() << endl;

    if (result.empty()) {
        cout << "Нет стержней с тремя цветами" << endl;
    } else {
        cout << "Номера этих стержней: ";
        for (int i = 0; i < result.size(); i++) {
            cout << result[i] << " ";
        }
        cout << endl;
    }

    return 0;
}
