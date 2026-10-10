/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* Бэктрекинг */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if (state == n)
            res[0]++;
        // Перебор всех вариантов выбора
        foreach (int choice in choices) {
            // Отсечение: нельзя выходить за n-ю ступень
            if (state + choice > n)
                continue;
            // Попытка: сделать выбор и обновить состояние
            Backtrack(choices, state + choice, n, res);
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // Можно подняться на 1 или 2 ступени
        int state = 0; // Начать подъем с 0-й ступени
        List<int> res = [0]; // Использовать res[0] для хранения числа решений
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"Количество способов подняться по лестнице из {n} ступеней = {res}");
    }
}
