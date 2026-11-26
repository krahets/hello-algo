/**
 * File: coin_change_greedy.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Размен монет: жадный алгоритм */
int coinChangeGreedy(vector<int> &coins, int amt) {
    // Список coins предполагается отсортированным
    int i = coins.size() - 1;
    int count = 0;
    // Повторяем жадный выбор, пока остаток суммы не обнулится
    while (amt > 0) {
        // Ищем наибольший номинал, не превышающий остаток
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // Берём coins[i]
        amt -= coins[i];
        count++;
    }
    // Если решения не нашлось, возвращаем -1
    return amt == 0 ? count : -1;
}

/* Пример запуска */
int main() {
    // Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
    vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Для суммы " << amt << " минимальное число монет: " << res << endl;

    // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Для суммы " << amt << " минимальное число монет: " << res << endl;
    cout << "На самом деле минимум — 3 монеты: 20 + 20 + 20" << endl;

    // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Для суммы " << amt << " минимальное число монет: " << res << endl;
    cout << "На самом деле минимум — 2 монеты: 49 + 49" << endl;

    return 0;
}
