/**
* File: coin_change_greedy.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class coin_change_greedy {
    /* Размен монет: жадный алгоритм */
    int CoinChangeGreedy(int[] coins, int amt) {
        // Предположить, что список coins упорядочен
        int i = coins.Length - 1;
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

    [Test]
    public void Test() {
        // Жадный подход: гарантирует нахождение глобально оптимального решения
        int[] coins = [1, 5, 10, 20, 50, 100];
        int amt = 186;
        int res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("Минимальное число монет для набора суммы " + amt + " = " + res);

        // Жадный подход: не гарантирует нахождение глобально оптимального решения
        coins = [1, 20, 50];
        amt = 60;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("Минимальное число монет для набора суммы " + amt + " = " + res);
        Console.WriteLine("На самом деле минимум равен 3: 20 + 20 + 20");

        // Жадный подход: не гарантирует нахождение глобально оптимального решения
        coins = [1, 49, 50];
        amt = 98;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("Минимальное число монет для набора суммы " + amt + " = " + res);
        Console.WriteLine("На самом деле минимум равен 2: 49 + 49");
    }
}