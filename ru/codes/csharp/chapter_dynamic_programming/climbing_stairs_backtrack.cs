/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* Поиск с возвратом */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // На ступени n увеличить число способов на 1
        if (state == n)
            res[0]++;
        // Перебрать все варианты
        foreach (int choice in choices) {
            // Отсечь шаги за ступень n
            if (state + choice > n)
                continue;
            // Сделать выбор и обновить состояние
            Backtrack(choices, state + choice, n, res);
            // Отменить выбор
        }
    }

    /* Подъём по лестнице: поиск с возвратом */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // Можно подняться на 1 или 2 ступени
        int state = 0; // Начать со ступени 0
        List<int> res = [0]; // Хранить число способов в res[0]
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"Число способов подняться на лестницу из {n} ступеней: {res}.");
    }
}
