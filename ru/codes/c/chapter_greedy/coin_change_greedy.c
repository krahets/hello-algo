/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* Размен монет: жадный алгоритм */
int coinChangeGreedy(int *coins, int size, int amt) {
    // Предположить, что список coins упорядочен
    int i = size - 1;
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
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("Минимальное количество монет для набора суммы %d = %d\n", amt, res);

    // Жадный подход: не гарантирует нахождение глобально оптимального решения
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("Минимальное количество монет для набора суммы %d = %d\n", amt, res);
    printf("На самом деле минимальное количество равно 3, а именно 20 + 20 + 20\n");

    // Жадный подход: не гарантирует нахождение глобально оптимального решения
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("Минимальное количество монет для набора суммы %d = %d\n", amt, res);
    printf("На самом деле минимальное количество равно 2, а именно 49 + 49\n");

    return 0;
}
