---
comments: true
---

# 14.2 &nbsp; Свойства задач динамического программирования

В предыдущем разделе мы увидели, как динамическое программирование решает исходную задачу через разложение на подзадачи. На самом деле разложение на подзадачи - это общий алгоритмический подход, но в методе "разделяй и властвуй", динамическом программировании и поиске с возвратом акценты расставлены по-разному.

- Алгоритмы "разделяй и властвуй" рекурсивно раскладывают исходную задачу на несколько независимых подзадач, пока не будет достигнута наименьшая подзадача, а затем в процессе возврата объединяют решения подзадач в решение исходной задачи.
- Динамическое программирование тоже раскладывает задачу рекурсивно, но его главное отличие от метода "разделяй и властвуй" в том, что подзадачи здесь зависят друг от друга и в процессе разложения возникает много перекрывающихся подзадач.
- Алгоритм поиска с возвратом перебирает все возможные решения через попытки и откат и с помощью обрезки избегает ненужных ветвей поиска. Решение исходной задачи состоит из последовательности решений, и подзадачей можно считать префикс этой последовательности решений.

На практике динамическое программирование часто применяется для задач оптимизации. Такие задачи не только содержат перекрывающиеся подзадачи, но и обладают еще двумя важными свойствами: оптимальной подструктурой и отсутствием последствий.

## 14.2.1 &nbsp; Оптимальная подструктура

Немного изменим задачу о подъеме по лестнице, чтобы нагляднее показать понятие оптимальной подструктуры.

!!! question "Минимальная стоимость подъема по лестнице"

    Дана лестница, по которой можно подниматься на $1$ или на $2$ ступени за раз. На каждой ступени указано неотрицательное целое число, обозначающее цену попадания на эту ступень. Дан массив неотрицательных целых чисел $cost$ , где $cost[i]$ - это цена для ступени $i$ , а $cost[0]$ соответствует земле (начальной позиции). Найдите минимальную суммарную стоимость, необходимую для достижения вершины.

Как показано на рисунке 14-6, если цены для ступеней $1$ , $2$ и $3$ равны соответственно $1$ , $10$ и $1$ , то минимальная стоимость подъема с земли на третью ступень равна $2$ .

![Минимальная стоимость подъема на 3-ю ступень](dp_problem_features.assets/min_cost_cs_example.png){ class="animation-figure" }

<p align="center"> Рисунок 14-6 &nbsp; Минимальная стоимость подъема на 3-ю ступень </p>

Пусть $dp[i]$ обозначает накопленную стоимость подъема на ступень $i$ . Поскольку на ступень $i$ можно прийти только со ступени $i - 1$ или со ступени $i - 2$ , значение $dp[i]$ может быть либо $dp[i - 1] + cost[i]$ , либо $dp[i - 2] + cost[i]$ . Чтобы минимизировать стоимость, нужно выбрать меньший из этих двух вариантов:

$$
dp[i] = \min(dp[i-1], dp[i-2]) + cost[i]
$$

Отсюда и возникает смысл оптимальной подструктуры: **оптимальное решение исходной задачи строится из оптимальных решений подзадач**.

Очевидно, что эта задача обладает оптимальной подструктурой: мы берем лучшее из двух оптимальных решений подзадач $dp[i-1]$ и $dp[i-2]$ и на его основе строим оптимальное решение исходной задачи $dp[i]$ .

А обладает ли оптимальной подструктурой исходная задача о числе способов подъема по лестнице из прошлого раздела? Формально она не про оптимум, а про подсчет количества. Но если переформулировать ее как "найдите максимальное количество способов", мы неожиданно увидим, что **хотя исходная задача осталась по сути той же, оптимальная подструктура стала явной**: максимальное число способов добраться до ступени $n$ равно сумме максимальных чисел способов добраться до ступеней $n-1$ и $n-2$ . То есть объяснение оптимальной подструктуры в разных задачах может быть довольно гибким.

Зная уравнение перехода состояния, а также начальные состояния $dp[1] = cost[1]$ и $dp[2] = cost[2]$ , мы можем сразу написать код динамического программирования:

=== "Python"

    ```python title="min_cost_climbing_stairs_dp.py"
    def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
        """Минимальная стоимость подъема по лестнице: динамическое программирование"""
        n = len(cost) - 1
        if n == 1 or n == 2:
            return cost[n]
        # Инициализация таблицы dp для хранения решений подзадач
        dp = [0] * (n + 1)
        # Начальное состояние: заранее задать решения наименьших подзадач
        dp[1], dp[2] = cost[1], cost[2]
        # Переход состояний: постепенное решение больших подзадач через меньшие
        for i in range(3, n + 1):
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        return dp[n]
    ```

=== "C++"

    ```cpp title="min_cost_climbing_stairs_dp.cpp"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    int minCostClimbingStairsDP(vector<int> &cost) {
        int n = cost.size() - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // Инициализация таблицы dp для хранения решений подзадач
        vector<int> dp(n + 1);
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Java"

    ```java title="min_cost_climbing_stairs_dp.java"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    int minCostClimbingStairsDP(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // Инициализация таблицы dp для хранения решений подзадач
        int[] dp = new int[n + 1];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "C#"

    ```csharp title="min_cost_climbing_stairs_dp.cs"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    int MinCostClimbingStairsDP(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // Инициализация таблицы dp для хранения решений подзадач
        int[] dp = new int[n + 1];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.Min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Go"

    ```go title="min_cost_climbing_stairs_dp.go"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    func minCostClimbingStairsDP(cost []int) int {
        n := len(cost) - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        min := func(a, b int) int {
            if a < b {
                return a
            }
            return b
        }
        // Инициализация таблицы dp для хранения решений подзадач
        dp := make([]int, n+1)
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1]
        dp[2] = cost[2]
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i := 3; i <= n; i++ {
            dp[i] = min(dp[i-1], dp[i-2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "Swift"

    ```swift title="min_cost_climbing_stairs_dp.swift"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    func minCostClimbingStairsDP(cost: [Int]) -> Int {
        let n = cost.count - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        // Инициализация таблицы dp для хранения решений подзадач
        var dp = Array(repeating: 0, count: n + 1)
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1]
        dp[2] = cost[2]
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i in 3 ... n {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "JS"

    ```javascript title="min_cost_climbing_stairs_dp.js"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    function minCostClimbingStairsDP(cost) {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        // Инициализация таблицы dp для хранения решений подзадач
        const dp = new Array(n + 1);
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (let i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "TS"

    ```typescript title="min_cost_climbing_stairs_dp.ts"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    function minCostClimbingStairsDP(cost: Array<number>): number {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        // Инициализация таблицы dp для хранения решений подзадач
        const dp = new Array(n + 1);
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (let i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Dart"

    ```dart title="min_cost_climbing_stairs_dp.dart"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    int minCostClimbingStairsDP(List<int> cost) {
      int n = cost.length - 1;
      if (n == 1 || n == 2) return cost[n];
      // Инициализация таблицы dp для хранения решений подзадач
      List<int> dp = List.filled(n + 1, 0);
      // Начальное состояние: заранее задать решения наименьших подзадач
      dp[1] = cost[1];
      dp[2] = cost[2];
      // Переход состояний: постепенное решение больших подзадач через меньшие
      for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
      }
      return dp[n];
    }
    ```

=== "Rust"

    ```rust title="min_cost_climbing_stairs_dp.rs"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    fn min_cost_climbing_stairs_dp(cost: &[i32]) -> i32 {
        let n = cost.len() - 1;
        if n == 1 || n == 2 {
            return cost[n];
        }
        // Инициализация таблицы dp для хранения решений подзадач
        let mut dp = vec![-1; n + 1];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i in 3..=n {
            dp[i] = cmp::min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        dp[n]
    }
    ```

=== "C"

    ```c title="min_cost_climbing_stairs_dp.c"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    int minCostClimbingStairsDP(int cost[], int costSize) {
        int n = costSize - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // Инициализация таблицы dp для хранения решений подзадач
        int *dp = calloc(n + 1, sizeof(int));
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = myMin(dp[i - 1], dp[i - 2]) + cost[i];
        }
        int res = dp[n];
        // Освободить память
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_cost_climbing_stairs_dp.kt"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    fun minCostClimbingStairsDP(cost: IntArray): Int {
        val n = cost.size - 1
        if (n == 1 || n == 2) return cost[n]
        // Инициализация таблицы dp для хранения решений подзадач
        val dp = IntArray(n + 1)
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1]
        dp[2] = cost[2]
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (i in 3..n) {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "Ruby"

    ```ruby title="min_cost_climbing_stairs_dp.rb"
    ### Минимальная стоимость подъема по лестнице: динамическое программирование ###
    def min_cost_climbing_stairs_dp(cost)
      n = cost.length - 1
      return cost[n] if n == 1 || n == 2
      # Инициализация таблицы dp для хранения решений подзадач
      dp = Array.new(n + 1, 0)
      # Начальное состояние: заранее задать решения наименьших подзадач
      dp[1], dp[2] = cost[1], cost[2]
      # Переход состояний: постепенное решение больших подзадач через меньшие
      (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
      dp[n]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%D0%B0%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%D0%9D%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%3A%20%D0%B7%D0%B0%D1%80%D0%B0%D0%BD%D0%B5%D0%B5%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BD%D0%B0%D0%B8%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%5B1%5D%2C%20dp%5B2%5D%20%3D%20cost%5B1%5D%2C%20cost%5B2%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%3A%20%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D0%BF%D0%B5%D0%BD%D0%BD%D0%BE%D0%B5%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%20%D1%87%D0%B5%D1%80%D0%B5%D0%B7%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D0%B5%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20min%28dp%5Bi%20-%201%5D%2C%20dp%5Bi%20-%202%5D%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0%2C%201%2C%2010%2C%201%2C%201%2C%201%2C%2010%2C%201%2C%201%2C%2010%2C%201%5D%0A%20%20%20%20print%28f%22%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B5%D0%B9%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp%28cost%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%D0%B0%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%D0%B0%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%D0%9D%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%3A%20%D0%B7%D0%B0%D1%80%D0%B0%D0%BD%D0%B5%D0%B5%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BD%D0%B0%D0%B8%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%5B1%5D%2C%20dp%5B2%5D%20%3D%20cost%5B1%5D%2C%20cost%5B2%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%3A%20%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D0%BF%D0%B5%D0%BD%D0%BD%D0%BE%D0%B5%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%20%D1%87%D0%B5%D1%80%D0%B5%D0%B7%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D0%B5%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20min%28dp%5Bi%20-%201%5D%2C%20dp%5Bi%20-%202%5D%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0%2C%201%2C%2010%2C%201%2C%201%2C%201%2C%2010%2C%201%2C%201%2C%2010%2C%201%5D%0A%20%20%20%20print%28f%22%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B5%D0%B9%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp%28cost%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%D0%B0%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

На рисунке 14-7 показан процесс динамического программирования для этой задачи.

![Процесс динамического программирования для минимальной стоимости подъема](dp_problem_features.assets/min_cost_cs_dp.png){ class="animation-figure" }

<p align="center"> Рисунок 14-7 &nbsp; Процесс динамического программирования для минимальной стоимости подъема </p>

В этой задаче тоже можно оптимизировать пространство, сжав одномерное состояние в нулевое измерение и тем самым уменьшив пространственную сложность с $O(n)$ до $O(1)$ :

=== "Python"

    ```python title="min_cost_climbing_stairs_dp.py"
    def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
        """Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти"""
        n = len(cost) - 1
        if n == 1 or n == 2:
            return cost[n]
        a, b = cost[1], cost[2]
        for i in range(3, n + 1):
            a, b = b, min(a, b) + cost[i]
        return b
    ```

=== "C++"

    ```cpp title="min_cost_climbing_stairs_dp.cpp"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    int minCostClimbingStairsDPComp(vector<int> &cost) {
        int n = cost.size() - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Java"

    ```java title="min_cost_climbing_stairs_dp.java"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    int minCostClimbingStairsDPComp(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "C#"

    ```csharp title="min_cost_climbing_stairs_dp.cs"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    int MinCostClimbingStairsDPComp(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.Min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Go"

    ```go title="min_cost_climbing_stairs_dp.go"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    func minCostClimbingStairsDPComp(cost []int) int {
        n := len(cost) - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        min := func(a, b int) int {
            if a < b {
                return a
            }
            return b
        }
        // Начальное состояние: заранее задать решения наименьших подзадач
        a, b := cost[1], cost[2]
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i := 3; i <= n; i++ {
            tmp := b
            b = min(a, tmp) + cost[i]
            a = tmp
        }
        return b
    }
    ```

=== "Swift"

    ```swift title="min_cost_climbing_stairs_dp.swift"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    func minCostClimbingStairsDPComp(cost: [Int]) -> Int {
        let n = cost.count - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        var (a, b) = (cost[1], cost[2])
        for i in 3 ... n {
            (a, b) = (b, min(a, b) + cost[i])
        }
        return b
    }
    ```

=== "JS"

    ```javascript title="min_cost_climbing_stairs_dp.js"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    function minCostClimbingStairsDPComp(cost) {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        let a = cost[1],
            b = cost[2];
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "TS"

    ```typescript title="min_cost_climbing_stairs_dp.ts"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    function minCostClimbingStairsDPComp(cost: Array<number>): number {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        let a = cost[1],
            b = cost[2];
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Dart"

    ```dart title="min_cost_climbing_stairs_dp.dart"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    int minCostClimbingStairsDPComp(List<int> cost) {
      int n = cost.length - 1;
      if (n == 1 || n == 2) return cost[n];
      int a = cost[1], b = cost[2];
      for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = min(a, tmp) + cost[i];
        a = tmp;
      }
      return b;
    }
    ```

=== "Rust"

    ```rust title="min_cost_climbing_stairs_dp.rs"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    fn min_cost_climbing_stairs_dp_comp(cost: &[i32]) -> i32 {
        let n = cost.len() - 1;
        if n == 1 || n == 2 {
            return cost[n];
        };
        let (mut a, mut b) = (cost[1], cost[2]);
        for i in 3..=n {
            let tmp = b;
            b = cmp::min(a, tmp) + cost[i];
            a = tmp;
        }
        b
    }
    ```

=== "C"

    ```c title="min_cost_climbing_stairs_dp.c"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    int minCostClimbingStairsDPComp(int cost[], int costSize) {
        int n = costSize - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = myMin(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_cost_climbing_stairs_dp.kt"
    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    fun minCostClimbingStairsDPComp(cost: IntArray): Int {
        val n = cost.size - 1
        if (n == 1 || n == 2) return cost[n]
        var a = cost[1]
        var b = cost[2]
        for (i in 3..n) {
            val tmp = b
            b = min(a, tmp) + cost[i]
            a = tmp
        }
        return b
    }
    ```

=== "Ruby"

    ```ruby title="min_cost_climbing_stairs_dp.rb"
    ### Минимальная стоимость подъема по лестнице: динамическое программирование ###
    def min_cost_climbing_stairs_dp(cost)
      n = cost.length - 1
      return cost[n] if n == 1 || n == 2
      # Инициализация таблицы dp для хранения решений подзадач
      dp = Array.new(n + 1, 0)
      # Начальное состояние: заранее задать решения наименьших подзадач
      dp[1], dp[2] = cost[1], cost[2]
      # Переход состояний: постепенное решение больших подзадач через меньшие
      (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
      dp[n]
    end

    # Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти
    def min_cost_climbing_stairs_dp_comp(cost)
      n = cost.length - 1
      return cost[n] if n == 1 || n == 2
      a, b = cost[1], cost[2]
      (3...(n + 1)).each { |i| a, b = b, [a, b].min + cost[i] }
      b
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 513px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp_comp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%D0%B0%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20a%2C%20b%20%3D%20cost%5B1%5D%2C%20cost%5B2%5D%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a%2C%20b%20%3D%20b%2C%20min%28a%2C%20b%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0%2C%201%2C%2010%2C%201%2C%201%2C%201%2C%2010%2C%201%2C%201%2C%2010%2C%201%5D%0A%20%20%20%20print%28f%22%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B5%D0%B9%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp_comp%28cost%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%D0%B0%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp_comp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%D0%B0%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20a%2C%20b%20%3D%20cost%5B1%5D%2C%20cost%5B2%5D%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a%2C%20b%20%3D%20b%2C%20min%28a%2C%20b%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0%2C%201%2C%2010%2C%201%2C%201%2C%201%2C%2010%2C%201%2C%201%2C%2010%2C%201%5D%0A%20%20%20%20print%28f%22%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B5%D0%B9%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp_comp%28cost%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%D0%B0%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 14.2.2 &nbsp; Отсутствие последствий

Отсутствие последствий - одно из ключевых свойств, благодаря которому динамическое программирование вообще может эффективно работать. Его определение таково: **если текущее состояние задано однозначно, то его дальнейшее развитие зависит только от него самого и не зависит от всей истории предыдущих состояний**.

Для примера снова рассмотрим задачу о лестнице. Если дано состояние $i$ , то из него можно перейти в состояния $i+1$ и $i+2$ , соответствующие прыжкам на $1$ и на $2$ ступени. Чтобы сделать один из этих выборов, не нужно знать, какими были состояния до $i$ ; на будущее влияет только текущее состояние $i$ .

Однако если добавить в задачу дополнительное ограничение, ситуация изменится.

!!! question "Подъем по лестнице с ограничением"

    Дана лестница из $n$ ступеней. За один шаг можно подняться на $1$ или на $2$ ступени, **но нельзя два раунда подряд прыгать на $1$ ступень**. Сколькими способами можно добраться до вершины?

Как показано на рисунке 14-8, на третью ступень теперь существует только $2$ допустимых способа добраться: вариант с тремя последовательными прыжками на $1$ не удовлетворяет ограничению и потому отбрасывается.

![Число способов подняться на 3-ю ступень при наличии ограничения](dp_problem_features.assets/climbing_stairs_constraint_example.png){ class="animation-figure" }

<p align="center"> Рисунок 14-8 &nbsp; Число способов подняться на 3-ю ступень при наличии ограничения </p>

В этой задаче, если в предыдущем раунде был сделан прыжок на $1$ ступень, то в следующем раунде уже обязательно нужно прыгнуть на $2$ ступени. Иными словами, **следующий выбор уже нельзя определить только по текущему состоянию (текущему номеру ступени) - он зависит еще и от предыдущего состояния (с какой ступени мы пришли в прошлый раз)**.

Нетрудно заметить, что в таком виде задача больше не удовлетворяет свойству отсутствия последствий, а уравнение перехода состояния $dp[i] = dp[i-1] + dp[i-2]$ перестает работать, потому что $dp[i-1]$ соответствует прыжку на $1$ ступень, но при этом включает множество вариантов, где предыдущий раунд тоже был прыжком на $1$ ступень. Такие варианты уже нельзя напрямую учитывать в $dp[i]$ , если мы хотим соблюдать ограничение.

Поэтому нам нужно расширить определение состояния: **состояние $[i, j]$ означает, что мы находимся на ступени $i$ и в предыдущем раунде прыгнули на $j$ ступеней**, где $j \in \{1, 2\}$ . Такое определение состояния эффективно различает, был ли в прошлом раунде прыжок на $1$ или на $2$ ступени, и позволяет корректно определить, откуда произошло текущее состояние.

- Если в предыдущем раунде был прыжок на $1$ ступень, то в раунде перед ним мог быть только прыжок на $2$ ступени, то есть $dp[i, 1]$ может перейти только из $dp[i-1, 2]$ .
- Если в предыдущем раунде был прыжок на $2$ ступени, то еще шагом раньше можно было прыгнуть либо на $1$ , либо на $2$ ступени, то есть $dp[i, 2]$ может переходить из $dp[i-2, 1]$ или из $dp[i-2, 2]$ .

Как показано на рисунке 14-9, при таком определении $dp[i, j]$ обозначает число способов для состояния $[i, j]$ . Тогда уравнение перехода состояния имеет вид:

$$
\begin{cases}
dp[i, 1] = dp[i-1, 2] \\
dp[i, 2] = dp[i-2, 1] + dp[i-2, 2]
\end{cases}
$$

![Рекуррентная связь с учетом ограничения](dp_problem_features.assets/climbing_stairs_constraint_state_transfer.png){ class="animation-figure" }

<p align="center"> Рисунок 14-9 &nbsp; Рекуррентная связь с учетом ограничения </p>

В конце достаточно вернуть $dp[n, 1] + dp[n, 2]$ ; эта сумма и представляет общее число способов добраться до ступени $n$ :

=== "Python"

    ```python title="climbing_stairs_constraint_dp.py"
    def climbing_stairs_constraint_dp(n: int) -> int:
        """Подъем по лестнице с ограничениями: динамическое программирование"""
        if n == 1 or n == 2:
            return 1
        # Инициализация таблицы dp для хранения решений подзадач
        dp = [[0] * 3 for _ in range(n + 1)]
        # Начальное состояние: заранее задать решения наименьших подзадач
        dp[1][1], dp[1][2] = 1, 0
        dp[2][1], dp[2][2] = 0, 1
        # Переход состояний: постепенное решение больших подзадач через меньшие
        for i in range(3, n + 1):
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        return dp[n][1] + dp[n][2]
    ```

=== "C++"

    ```cpp title="climbing_stairs_constraint_dp.cpp"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // Инициализация таблицы dp для хранения решений подзадач
        vector<vector<int>> dp(n + 1, vector<int>(3, 0));
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_constraint_dp.java"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // Инициализация таблицы dp для хранения решений подзадач
        int[][] dp = new int[n + 1][3];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_constraint_dp.cs"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    int ClimbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // Инициализация таблицы dp для хранения решений подзадач
        int[,] dp = new int[n + 1, 3];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1, 1] = 1;
        dp[1, 2] = 0;
        dp[2, 1] = 0;
        dp[2, 2] = 1;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i, 1] = dp[i - 1, 2];
            dp[i, 2] = dp[i - 2, 1] + dp[i - 2, 2];
        }
        return dp[n, 1] + dp[n, 2];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_constraint_dp.go"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    func climbingStairsConstraintDP(n int) int {
        if n == 1 || n == 2 {
            return 1
        }
        // Инициализация таблицы dp для хранения решений подзадач
        dp := make([][3]int, n+1)
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i := 3; i <= n; i++ {
            dp[i][1] = dp[i-1][2]
            dp[i][2] = dp[i-2][1] + dp[i-2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_constraint_dp.swift"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    func climbingStairsConstraintDP(n: Int) -> Int {
        if n == 1 || n == 2 {
            return 1
        }
        // Инициализация таблицы dp для хранения решений подзадач
        var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i in 3 ... n {
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_constraint_dp.js"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    function climbingStairsConstraintDP(n) {
        if (n === 1 || n === 2) {
            return 1;
        }
        // Инициализация таблицы dp для хранения решений подзадач
        const dp = Array.from(new Array(n + 1), () => new Array(3));
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (let i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_constraint_dp.ts"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    function climbingStairsConstraintDP(n: number): number {
        if (n === 1 || n === 2) {
            return 1;
        }
        // Инициализация таблицы dp для хранения решений подзадач
        const dp = Array.from({ length: n + 1 }, () => new Array(3));
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (let i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_constraint_dp.dart"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    int climbingStairsConstraintDP(int n) {
      if (n == 1 || n == 2) {
        return 1;
      }
      // Инициализация таблицы dp для хранения решений подзадач
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
      // Начальное состояние: заранее задать решения наименьших подзадач
      dp[1][1] = 1;
      dp[1][2] = 0;
      dp[2][1] = 0;
      dp[2][2] = 1;
      // Переход состояний: постепенное решение больших подзадач через меньшие
      for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
      }
      return dp[n][1] + dp[n][2];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_constraint_dp.rs"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    fn climbing_stairs_constraint_dp(n: usize) -> i32 {
        if n == 1 || n == 2 {
            return 1;
        };
        // Инициализация таблицы dp для хранения решений подзадач
        let mut dp = vec![vec![-1; 3]; n + 1];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i in 3..=n {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        dp[n][1] + dp[n][2]
    }
    ```

=== "C"

    ```c title="climbing_stairs_constraint_dp.c"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // Инициализация таблицы dp для хранения решений подзадач
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(3, sizeof(int));
        }
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        int res = dp[n][1] + dp[n][2];
        // Освободить память
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_constraint_dp.kt"
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    fun climbingStairsConstraintDP(n: Int): Int {
        if (n == 1 || n == 2) {
            return 1
        }
        // Инициализация таблицы dp для хранения решений подзадач
        val dp = Array(n + 1) { IntArray(3) }
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (i in 3..n) {
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_constraint_dp.rb"
    ### Подъем по лестнице с ограничениями: динамическое программирование ###
    def climbing_stairs_constraint_dp(n)
      return 1 if n == 1 || n == 2

      # Инициализация таблицы dp для хранения решений подзадач
      dp = Array.new(n + 1) { Array.new(3, 0) }
      # Начальное состояние: заранее задать решения наименьших подзадач
      dp[1][1], dp[1][2] = 1, 0
      dp[2][1], dp[2][2] = 0, 1
      # Переход состояний: постепенное решение больших подзадач через меньшие
      for i in 3...(n + 1)
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
      end

      dp[n][1] + dp[n][2]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_constraint_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D1%81%20%D0%BE%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%203%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%9D%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%3A%20%D0%B7%D0%B0%D1%80%D0%B0%D0%BD%D0%B5%D0%B5%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BD%D0%B0%D0%B8%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%5B1%5D%5B1%5D%2C%20dp%5B1%5D%5B2%5D%20%3D%201%2C%200%0A%20%20%20%20dp%5B2%5D%5B1%5D%2C%20dp%5B2%5D%5B2%5D%20%3D%200%2C%201%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%3A%20%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D0%BF%D0%B5%D0%BD%D0%BD%D0%BE%D0%B5%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%20%D1%87%D0%B5%D1%80%D0%B5%D0%B7%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D0%B5%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B1%5D%20%3D%20dp%5Bi%20-%201%5D%5B2%5D%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B2%5D%20%3D%20dp%5Bi%20-%202%5D%5B1%5D%20%2B%20dp%5Bi%20-%202%5D%5B2%5D%0A%20%20%20%20return%20dp%5Bn%5D%5B1%5D%20%2B%20dp%5Bn%5D%5B2%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_constraint_dp%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_constraint_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D1%81%20%D0%BE%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%203%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%9D%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%3A%20%D0%B7%D0%B0%D1%80%D0%B0%D0%BD%D0%B5%D0%B5%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BD%D0%B0%D0%B8%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%5B1%5D%5B1%5D%2C%20dp%5B1%5D%5B2%5D%20%3D%201%2C%200%0A%20%20%20%20dp%5B2%5D%5B1%5D%2C%20dp%5B2%5D%5B2%5D%20%3D%200%2C%201%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%3A%20%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D0%BF%D0%B5%D0%BD%D0%BD%D0%BE%D0%B5%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%20%D1%87%D0%B5%D1%80%D0%B5%D0%B7%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D0%B5%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B1%5D%20%3D%20dp%5Bi%20-%201%5D%5B2%5D%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B2%5D%20%3D%20dp%5Bi%20-%202%5D%5B1%5D%20%2B%20dp%5Bi%20-%202%5D%5B2%5D%0A%20%20%20%20return%20dp%5Bn%5D%5B1%5D%20%2B%20dp%5Bn%5D%5B2%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_constraint_dp%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

В этом примере достаточно дополнительно учитывать только одно предыдущее состояние, поэтому после расширения определения состояния задача снова начинает удовлетворять свойству отсутствия последствий. Однако в некоторых задачах "зависимость от прошлого" бывает гораздо серьезнее.

!!! question "Подъем по лестнице с порождением препятствий"

    Дана лестница из $n$ ступеней. За один шаг можно подняться на $1$ или на $2$ ступени. **При этом, если вы попали на ступень $i$ , система автоматически создает препятствие на ступени $2i$ , и на всех последующих шагах становиться на ступень $2i$ уже нельзя**. Например, если в первых двух раундах вы попали на ступени $2$ и $3$ , то после этого нельзя будет попадать на ступени $4$ и $6$ . Сколько существует способов добраться до вершины?

В этой задаче следующий прыжок зависит от всех предыдущих состояний, потому что каждый прыжок порождает новое препятствие на более высокой ступени и тем самым влияет на все будущие прыжки. Для задач такого типа динамическое программирование обычно оказывается непригодным.

Вообще, многие сложные задачи комбинаторной оптимизации (например, задача коммивояжера) не обладают свойством отсутствия последствий. Для таких задач обычно выбирают другие методы - например, эвристический поиск, генетические алгоритмы, обучение с подкреплением и т.д., - чтобы за ограниченное время получить пригодное локально оптимальное решение.
