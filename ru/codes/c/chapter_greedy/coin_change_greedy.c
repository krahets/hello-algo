/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* Размен монет: жадный алгоритм */
int coinChangeGreedy(int *coins, int size, int amt) {
    // Список coins предполагается отсортированным
    int i = size - 1;
    int count = 0;
    // Повторяем жадный выбор, пока остаток суммы не обнулится
    while (amt > 0) {
        // Ищем ближайший к остатку номинал среди меньших, чем остаток
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
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("Для суммы %d минимальное число монет: %d\n", amt, res);

    // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("Для суммы %d минимальное число монет: %d\n", amt, res);
    printf("На самом деле минимум — 3 монеты: 20 + 20 + 20\n");

    // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("Для суммы %d минимальное число монет: %d\n", amt, res);
    printf("На самом деле минимум — 2 монеты: 49 + 49\n");

    return 0;
}
