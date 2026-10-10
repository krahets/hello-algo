/**
 * File: coin_change_greedy.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Размен монет: жадный алгоритм */
int coinChangeGreedy(vector<int> &coins, int amt) {
    // Предположить, что список coins упорядочен
    int i = coins.size() - 1;
    int count = 0;
    // Циклически выполнять жадный выбор, пока не останется суммы
    while (amt > 0) {
        // Найти монету, которая меньше остатка суммы и наиболее к нему близка
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // Выбрать coins[i]
        amt -= coins[i];
        count++;
    }
    // Если допустимое решение не найдено, вернуть -1
    return amt == 0 ? count : -1;
}

/* Driver Code */
int main() {
    // Жадный подход: гарантирует нахождение глобально оптимального решения
    vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Минимальное количество монет для набора суммы " << amt << " = " << res << endl;

    // Жадный подход: не гарантирует нахождение глобально оптимального решения
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Минимальное количество монет для набора суммы " << amt << " = " << res << endl;
    cout << "На самом деле минимальное количество равно 3, а именно 20 + 20 + 20" << endl;

    // Жадный подход: не гарантирует нахождение глобально оптимального решения
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Минимальное количество монет для набора суммы " << amt << " = " << res << endl;
    cout << "На самом деле минимальное количество равно 2, а именно 49 + 49" << endl;

    return 0;
}
