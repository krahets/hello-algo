---
comments: true
---

# 14.1 &nbsp; Первое знакомство с динамическим программированием

<u>Динамическое программирование (dynamic programming)</u> - это важная алгоритмическая парадигма, которая разбивает задачу на последовательность более мелких подзадач и за счет хранения их решений избегает повторных вычислений, тем самым резко повышая эффективность по времени.

В этом разделе мы начнем с классического примера: сначала запишем его грубое решение через backtracking, увидим в нем перекрывающиеся подзадачи, а затем постепенно выведем более эффективное решение на основе динамического программирования.

!!! question "Подъем по лестнице"

    Дана лестница из $n$ ступеней. За один шаг можно подняться на $1$ или на $2$ ступени. Сколькими способами можно добраться до вершины?

Как показано на рисунке 14-1, для лестницы из $3$ ступеней существует $3$ способа добраться до вершины.

![Число способов подняться на 3-ю ступень](intro_to_dynamic_programming.assets/climbing_stairs_example.png){ class="animation-figure" }

<p align="center"> Рисунок 14-1 &nbsp; Число способов подняться на 3-ю ступень </p>

Цель этой задачи - вычислить количество способов. **Поэтому можно попробовать грубо перебрать все варианты с помощью backtracking**. Если представить подъем по лестнице как последовательность решений, то мы начинаем от земли и на каждом раунде выбираем прыжок на $1$ или на $2$ ступени; всякий раз, когда достигаем вершины, увеличиваем число способов на $1$ , а если перескакиваем вершину, обрезаем эту ветвь. Код выглядит так:

=== "Python"

    ```python title="climbing_stairs_backtrack.py"
    def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
        """Бэктрекинг"""
        # Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if state == n:
            res[0] += 1
        # Перебор всех вариантов выбора
        for choice in choices:
            # Отсечение: нельзя выходить за n-ю ступень
            if state + choice > n:
                continue
            # Попытка: сделать выбор и обновить состояние
            backtrack(choices, state + choice, n, res)
            # Откат

    def climbing_stairs_backtrack(n: int) -> int:
        """Подъем по лестнице: бэктрекинг"""
        choices = [1, 2]  # Можно подняться на 1 или 2 ступени
        state = 0  # Начать подъем с 0-й ступени
        res = [0]  # Использовать res[0] для хранения числа решений
        backtrack(choices, state, n, res)
        return res[0]
    ```

=== "C++"

    ```cpp title="climbing_stairs_backtrack.cpp"
    /* Бэктрекинг */
    void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if (state == n)
            res[0]++;
        // Перебор всех вариантов выбора
        for (auto &choice : choices) {
            // Отсечение: нельзя выходить за n-ю ступень
            if (state + choice > n)
                continue;
            // Попытка: сделать выбор и обновить состояние
            backtrack(choices, state + choice, n, res);
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    int climbingStairsBacktrack(int n) {
        vector<int> choices = {1, 2}; // Можно подняться на 1 или 2 ступени
        int state = 0;                // Начать подъем с 0-й ступени
        vector<int> res = {0};        // Использовать res[0] для хранения числа решений
        backtrack(choices, state, n, res);
        return res[0];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_backtrack.java"
    /* Бэктрекинг */
    void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if (state == n)
            res.set(0, res.get(0) + 1);
        // Перебор всех вариантов выбора
        for (Integer choice : choices) {
            // Отсечение: нельзя выходить за n-ю ступень
            if (state + choice > n)
                continue;
            // Попытка: сделать выбор и обновить состояние
            backtrack(choices, state + choice, n, res);
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // Можно подняться на 1 или 2 ступени
        int state = 0; // Начать подъем с 0-й ступени
        List<Integer> res = new ArrayList<>();
        res.add(0); // Использовать res[0] для хранения числа решений
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_backtrack.cs"
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
    ```

=== "Go"

    ```go title="climbing_stairs_backtrack.go"
    /* Бэктрекинг */
    func backtrack(choices []int, state, n int, res []int) {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if state == n {
            res[0] = res[0] + 1
        }
        // Перебор всех вариантов выбора
        for _, choice := range choices {
            // Отсечение: нельзя выходить за n-ю ступень
            if state+choice > n {
                continue
            }
            // Попытка: сделать выбор и обновить состояние
            backtrack(choices, state+choice, n, res)
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    func climbingStairsBacktrack(n int) int {
        // Можно подняться на 1 или 2 ступени
        choices := []int{1, 2}
        // Начать подъем с 0-й ступени
        state := 0
        res := make([]int, 1)
        // Использовать res[0] для хранения числа решений
        res[0] = 0
        backtrack(choices, state, n, res)
        return res[0]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_backtrack.swift"
    /* Бэктрекинг */
    func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if state == n {
            res[0] += 1
        }
        // Перебор всех вариантов выбора
        for choice in choices {
            // Отсечение: нельзя выходить за n-ю ступень
            if state + choice > n {
                continue
            }
            // Попытка: сделать выбор и обновить состояние
            backtrack(choices: choices, state: state + choice, n: n, res: &res)
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    func climbingStairsBacktrack(n: Int) -> Int {
        let choices = [1, 2] // Можно подняться на 1 или 2 ступени
        let state = 0 // Начать подъем с 0-й ступени
        var res: [Int] = []
        res.append(0) // Использовать res[0] для хранения числа решений
        backtrack(choices: choices, state: state, n: n, res: &res)
        return res[0]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_backtrack.js"
    /* Бэктрекинг */
    function backtrack(choices, state, n, res) {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if (state === n) res.set(0, res.get(0) + 1);
        // Перебор всех вариантов выбора
        for (const choice of choices) {
            // Отсечение: нельзя выходить за n-ю ступень
            if (state + choice > n) continue;
            // Попытка: сделать выбор и обновить состояние
            backtrack(choices, state + choice, n, res);
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    function climbingStairsBacktrack(n) {
        const choices = [1, 2]; // Можно подняться на 1 или 2 ступени
        const state = 0; // Начать подъем с 0-й ступени
        const res = new Map();
        res.set(0, 0); // Использовать res[0] для хранения числа решений
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_backtrack.ts"
    /* Бэктрекинг */
    function backtrack(
        choices: number[],
        state: number,
        n: number,
        res: Map<0, any>
    ): void {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if (state === n) res.set(0, res.get(0) + 1);
        // Перебор всех вариантов выбора
        for (const choice of choices) {
            // Отсечение: нельзя выходить за n-ю ступень
            if (state + choice > n) continue;
            // Попытка: сделать выбор и обновить состояние
            backtrack(choices, state + choice, n, res);
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    function climbingStairsBacktrack(n: number): number {
        const choices = [1, 2]; // Можно подняться на 1 или 2 ступени
        const state = 0; // Начать подъем с 0-й ступени
        const res = new Map();
        res.set(0, 0); // Использовать res[0] для хранения числа решений
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_backtrack.dart"
    /* Бэктрекинг */
    void backtrack(List<int> choices, int state, int n, List<int> res) {
      // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
      if (state == n) {
        res[0]++;
      }
      // Перебор всех вариантов выбора
      for (int choice in choices) {
        // Отсечение: нельзя выходить за n-ю ступень
        if (state + choice > n) continue;
        // Попытка: сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res);
        // Откат
      }
    }

    /* Подъем по лестнице: бэктрекинг */
    int climbingStairsBacktrack(int n) {
      List<int> choices = [1, 2]; // Можно подняться на 1 или 2 ступени
      int state = 0; // Начать подъем с 0-й ступени
      List<int> res = [];
      res.add(0); // Использовать res[0] для хранения числа решений
      backtrack(choices, state, n, res);
      return res[0];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_backtrack.rs"
    /* Бэктрекинг */
    fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if state == n {
            res[0] = res[0] + 1;
        }
        // Перебор всех вариантов выбора
        for &choice in choices {
            // Отсечение: нельзя выходить за n-ю ступень
            if state + choice > n {
                continue;
            }
            // Попытка: сделать выбор и обновить состояние
            backtrack(choices, state + choice, n, res);
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    fn climbing_stairs_backtrack(n: usize) -> i32 {
        let choices = vec![1, 2]; // Можно подняться на 1 или 2 ступени
        let state = 0; // Начать подъем с 0-й ступени
        let mut res = Vec::new();
        res.push(0); // Использовать res[0] для хранения числа решений
        backtrack(&choices, state, n as i32, &mut res);
        res[0]
    }
    ```

=== "C"

    ```c title="climbing_stairs_backtrack.c"
    /* Бэктрекинг */
    void backtrack(int *choices, int state, int n, int *res, int len) {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if (state == n)
            res[0]++;
        // Перебор всех вариантов выбора
        for (int i = 0; i < len; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выходить за n-ю ступень
            if (state + choice > n)
                continue;
            // Попытка: сделать выбор и обновить состояние
            backtrack(choices, state + choice, n, res, len);
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    int climbingStairsBacktrack(int n) {
        int choices[2] = {1, 2}; // Можно подняться на 1 или 2 ступени
        int state = 0;           // Начать подъем с 0-й ступени
        int *res = (int *)malloc(sizeof(int));
        *res = 0; // Использовать res[0] для хранения числа решений
        int len = sizeof(choices) / sizeof(int);
        backtrack(choices, state, n, res, len);
        int result = *res;
        free(res);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_backtrack.kt"
    /* Бэктрекинг */
    fun backtrack(
        choices: MutableList<Int>,
        state: Int,
        n: Int,
        res: MutableList<Int>
    ) {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if (state == n)
            res[0] = res[0] + 1
        // Перебор всех вариантов выбора
        for (choice in choices) {
            // Отсечение: нельзя выходить за n-ю ступень
            if (state + choice > n) continue
            // Попытка: сделать выбор и обновить состояние
            backtrack(choices, state + choice, n, res)
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    fun climbingStairsBacktrack(n: Int): Int {
        val choices = mutableListOf(1, 2) // Можно подняться на 1 или 2 ступени
        val state = 0 // Начать подъем с 0-й ступени
        val res = mutableListOf<Int>()
        res.add(0) // Использовать res[0] для хранения числа решений
        backtrack(choices, state, n, res)
        return res[0]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_backtrack.rb"
    ### Бэктрекинг ###
    def backtrack(choices, state, n, res)
      # Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
      res[0] += 1 if state == n
      # Перебор всех вариантов выбора
      for choice in choices
        # Отсечение: нельзя выходить за n-ю ступень
        next if state + choice > n

        # Попытка: сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res)
      end
      # Откат
    end

    ### Подъем по лестнице: бэктрекинг ###
    def climbing_stairs_backtrack(n)
      choices = [1, 2] # Можно подняться на 1 или 2 ступени
      state = 0 # Начать подъем с 0-й ступени
      res = [0] # Использовать res[0] для хранения числа решений
      backtrack(choices, state, n, res)
      res.first
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28choices%3A%20list%5Bint%5D%2C%20state%3A%20int%2C%20n%3A%20int%2C%20res%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%B4%D0%BE%D1%81%D1%82%D0%B8%D0%B3%D0%B0%D0%B5%D1%82%20n-%D0%B9%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B8%2C%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D1%83%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B8%D0%B2%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D0%BD%D0%B0%201%0A%20%20%20%20if%20state%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%5B0%5D%20%2B%3D%201%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D1%81%D0%B5%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0%0A%20%20%20%20for%20choice%20in%20choices%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%20n-%D1%8E%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D1%8C%0A%20%20%20%20%20%20%20%20if%20state%20%2B%20choice%20%3E%20n%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%3A%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20backtrack%28choices%2C%20state%20%2B%20choice%2C%20n%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%0A%0A%0Adef%20climbing_stairs_backtrack%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%B1%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%22%22%22%0A%20%20%20%20choices%20%3D%20%5B1%2C%202%5D%20%20%23%20%D0%9C%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BD%D0%B0%201%20%D0%B8%D0%BB%D0%B8%202%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B8%0A%20%20%20%20state%20%3D%200%20%20%23%20%D0%9D%D0%B0%D1%87%D0%B0%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D1%81%200-%D0%B9%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B8%0A%20%20%20%20res%20%3D%20%5B0%5D%20%20%23%20%D0%98%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20res%5B0%5D%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%0A%20%20%20%20backtrack%28choices%2C%20state%2C%20n%2C%20res%29%0A%20%20%20%20return%20res%5B0%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_backtrack%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28choices%3A%20list%5Bint%5D%2C%20state%3A%20int%2C%20n%3A%20int%2C%20res%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%B4%D0%BE%D1%81%D1%82%D0%B8%D0%B3%D0%B0%D0%B5%D1%82%20n-%D0%B9%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B8%2C%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D1%83%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B8%D0%B2%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D0%BD%D0%B0%201%0A%20%20%20%20if%20state%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%5B0%5D%20%2B%3D%201%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D1%81%D0%B5%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0%0A%20%20%20%20for%20choice%20in%20choices%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%20n-%D1%8E%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D1%8C%0A%20%20%20%20%20%20%20%20if%20state%20%2B%20choice%20%3E%20n%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%3A%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20backtrack%28choices%2C%20state%20%2B%20choice%2C%20n%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%0A%0A%0Adef%20climbing_stairs_backtrack%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%B1%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%22%22%22%0A%20%20%20%20choices%20%3D%20%5B1%2C%202%5D%20%20%23%20%D0%9C%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BD%D0%B0%201%20%D0%B8%D0%BB%D0%B8%202%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B8%0A%20%20%20%20state%20%3D%200%20%20%23%20%D0%9D%D0%B0%D1%87%D0%B0%D1%82%D1%8C%20%D0%BF%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D1%81%200-%D0%B9%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B8%0A%20%20%20%20res%20%3D%20%5B0%5D%20%20%23%20%D0%98%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20res%5B0%5D%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%0A%20%20%20%20backtrack%28choices%2C%20state%2C%20n%2C%20res%29%0A%20%20%20%20return%20res%5B0%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_backtrack%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 14.1.1 &nbsp; Метод 1: полный перебор

Backtracking обычно не раскладывает задачу явно на подзадачи; вместо этого он рассматривает решение как последовательность решений, используя попытки и обрезку для поиска всех возможных ответов.

Попробуем посмотреть на задачу именно как на разложение подзадач. Пусть число способов добраться до ступени $i$ равно $dp[i]$ ; тогда $dp[i]$ - это исходная задача, а ее подзадачи включают:

$$
dp[i-1], dp[i-2], \dots, dp[2], dp[1]
$$

Поскольку за один раунд можно подняться только на $1$ или на $2$ ступени, стоя на ступени $i$ , в предыдущий раунд мы могли находиться только на ступени $i - 1$ или на ступени $i - 2$ . Иначе говоря, на ступень $i$ можно попасть только со ступени $i -1$ или со ступени $i - 2$ .

Отсюда получается важный вывод: **число способов добраться до ступени $i - 1$ плюс число способов добраться до ступени $i - 2$ равно числу способов добраться до ступени $i$**. Формула имеет вид:

$$
dp[i] = dp[i-1] + dp[i-2]
$$

Это означает, что в задаче о подъеме по лестнице между подзадачами существует рекуррентная зависимость, и **решение исходной задачи может быть построено на основе решений подзадач**. Эта связь показана на рисунке 14-2.

![Рекуррентная связь числа способов](intro_to_dynamic_programming.assets/climbing_stairs_state_transfer.png){ class="animation-figure" }

<p align="center"> Рисунок 14-2 &nbsp; Рекуррентная связь числа способов </p>

По рекуррентной формуле можно получить решение полного перебора. Начиная с $dp[n]$ , **мы рекурсивно разлагаем большую задачу в сумму двух меньших задач** , пока не дойдем до наименьших подзадач $dp[1]$ и $dp[2]$ . Их решения уже известны: $dp[1] = 1$ и $dp[2] = 2$ , что означает $1$ и $2$ способа подняться соответственно на $1$-ю и $2$-ю ступени.

Посмотрите на следующий код: как и стандартный backtracking, он относится к поиску в глубину, но выглядит более компактно:

=== "Python"

    ```python title="climbing_stairs_dfs.py"
    def dfs(i: int) -> int:
        """Поиск"""
        # dp[1] и dp[2] уже известны, вернуть их
        if i == 1 or i == 2:
            return i
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1) + dfs(i - 2)
        return count

    def climbing_stairs_dfs(n: int) -> int:
        """Подъем по лестнице: поиск"""
        return dfs(n)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs.cpp"
    /* Поиск */
    int dfs(int i) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* Подъем по лестнице: поиск */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs.java"
    /* Поиск */
    int dfs(int i) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* Подъем по лестнице: поиск */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs.cs"
    /* Поиск */
    int DFS(int i) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1) + DFS(i - 2);
        return count;
    }

    /* Подъем по лестнице: поиск */
    int ClimbingStairsDFS(int n) {
        return DFS(n);
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dfs.go"
    /* Поиск */
    func dfs(i int) int {
        // dp[1] и dp[2] уже известны, вернуть их
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] = dp[i-1] + dp[i-2]
        count := dfs(i-1) + dfs(i-2)
        return count
    }

    /* Подъем по лестнице: поиск */
    func climbingStairsDFS(n int) int {
        return dfs(n)
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs.swift"
    /* Поиск */
    func dfs(i: Int) -> Int {
        // dp[1] и dp[2] уже известны, вернуть их
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i: i - 1) + dfs(i: i - 2)
        return count
    }

    /* Подъем по лестнице: поиск */
    func climbingStairsDFS(n: Int) -> Int {
        dfs(i: n)
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs.js"
    /* Поиск */
    function dfs(i) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i === 1 || i === 2) return i;
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* Подъем по лестнице: поиск */
    function climbingStairsDFS(n) {
        return dfs(n);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs.ts"
    /* Поиск */
    function dfs(i: number): number {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i === 1 || i === 2) return i;
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* Подъем по лестнице: поиск */
    function climbingStairsDFS(n: number): number {
        return dfs(n);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs.dart"
    /* Поиск */
    int dfs(int i) {
      // dp[1] и dp[2] уже известны, вернуть их
      if (i == 1 || i == 2) return i;
      // dp[i] = dp[i-1] + dp[i-2]
      int count = dfs(i - 1) + dfs(i - 2);
      return count;
    }

    /* Подъем по лестнице: поиск */
    int climbingStairsDFS(int n) {
      return dfs(n);
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs.rs"
    /* Поиск */
    fn dfs(i: usize) -> i32 {
        // dp[1] и dp[2] уже известны, вернуть их
        if i == 1 || i == 2 {
            return i as i32;
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i - 1) + dfs(i - 2);
        count
    }

    /* Подъем по лестнице: поиск */
    fn climbing_stairs_dfs(n: usize) -> i32 {
        dfs(n)
    }
    ```

=== "C"

    ```c title="climbing_stairs_dfs.c"
    /* Поиск */
    int dfs(int i) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* Подъем по лестнице: поиск */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs.kt"
    /* Поиск */
    fun dfs(i: Int): Int {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2) return i
        // dp[i] = dp[i-1] + dp[i-2]
        val count = dfs(i - 1) + dfs(i - 2)
        return count
    }

    /* Подъем по лестнице: поиск */
    fun climbingStairsDFS(n: Int): Int {
        return dfs(n)
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs.rb"
    ### Поиск ###
    def dfs(i)
      # dp[1] и dp[2] уже известны, вернуть их
      return i if i == 1 || i == 2
      # dp[i] = dp[i-1] + dp[i-2]
      dfs(i - 1) + dfs(i - 2)
    end

    ### Подъем по лестнице: поиск ###
    def climbing_stairs_dfs(n)
      dfs(n)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%22%22%22%0A%20%20%20%20%23%20dp%5B1%5D%20%D0%B8%20dp%5B2%5D%20%D1%83%D0%B6%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%B5%D1%81%D1%82%D0%BD%D1%8B%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D1%85%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%29%20%2B%20dfs%28i%20-%202%29%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%22%22%22%0A%20%20%20%20return%20dfs%28n%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%22%22%22%0A%20%20%20%20%23%20dp%5B1%5D%20%D0%B8%20dp%5B2%5D%20%D1%83%D0%B6%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%B5%D1%81%D1%82%D0%BD%D1%8B%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D1%85%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%29%20%2B%20dfs%28i%20-%202%29%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%22%22%22%0A%20%20%20%20return%20dfs%28n%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

На рисунке 14-3 показано дерево рекурсии, возникающее при полном переборе. Для задачи $dp[n]$ глубина дерева рекурсии равна $n$ , а временная сложность равна $O(2^n)$ . Экспоненциальный рост взрывообразен: если подать на вход достаточно большое значение $n$ , ожидание станет очень долгим.

![Дерево рекурсии для подъема по лестнице](intro_to_dynamic_programming.assets/climbing_stairs_dfs_tree.png){ class="animation-figure" }

<p align="center"> Рисунок 14-3 &nbsp; Дерево рекурсии для подъема по лестнице </p>

Если посмотреть на рисунок 14-3, то видно, что **экспоненциальная временная сложность порождается "перекрывающимися подзадачами"**. Например, $dp[9]$ раскладывается в $dp[8]$ и $dp[7]$ , а $dp[8]$ - в $dp[7]$ и $dp[6]$ ; обе ветви содержат подзадачу $dp[7]$ .

Продолжая это рассуждение, мы видим, что подзадачи порождают все более мелкие перекрывающиеся подзадачи без конца. Подавляющая часть вычислительных ресурсов уходит именно на них.

## 14.1.2 &nbsp; Метод 2: поиск с мемоизацией

Чтобы ускорить алгоритм, **мы хотим, чтобы каждая перекрывающаяся подзадача вычислялась только один раз**. Для этого объявим массив `mem` для хранения решения каждой подзадачи и будем обрезать повторные вычисления в процессе поиска.

1. Когда $dp[i]$ вычисляется впервые, мы сохраняем его в `mem[i]` для последующего использования.
2. Когда значение $dp[i]$ требуется снова, мы просто берем его напрямую из `mem[i]` и тем самым избегаем повторного вычисления подзадачи.

Код приведен ниже:

=== "Python"

    ```python title="climbing_stairs_dfs_mem.py"
    def dfs(i: int, mem: list[int]) -> int:
        """Поиск с мемоизацией"""
        # dp[1] и dp[2] уже известны, вернуть их
        if i == 1 or i == 2:
            return i
        # Если запись dp[i] существует, сразу вернуть ее
        if mem[i] != -1:
            return mem[i]
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1, mem) + dfs(i - 2, mem)
        # Сохранить dp[i]
        mem[i] = count
        return count

    def climbing_stairs_dfs_mem(n: int) -> int:
        """Подъем по лестнице: поиск с мемоизацией"""
        # mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        mem = [-1] * (n + 1)
        return dfs(n, mem)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs_mem.cpp"
    /* Поиск с мемоизацией */
    int dfs(int i, vector<int> &mem) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2)
            return i;
        // Если запись dp[i] существует, сразу вернуть ее
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Сохранить dp[i]
        mem[i] = count;
        return count;
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    int climbingStairsDFSMem(int n) {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        vector<int> mem(n + 1, -1);
        return dfs(n, mem);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs_mem.java"
    /* Поиск с мемоизацией */
    int dfs(int i, int[] mem) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2)
            return i;
        // Если запись dp[i] существует, сразу вернуть ее
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Сохранить dp[i]
        mem[i] = count;
        return count;
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    int climbingStairsDFSMem(int n) {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs_mem.cs"
    /* Поиск с мемоизацией */
    int DFS(int i, int[] mem) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2)
            return i;
        // Если запись dp[i] существует, сразу вернуть ее
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // Сохранить dp[i]
        mem[i] = count;
        return count;
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dfs_mem.go"
    /* Поиск с мемоизацией */
    func dfsMem(i int, mem []int) int {
        // dp[1] и dp[2] уже известны, вернуть их
        if i == 1 || i == 2 {
            return i
        }
        // Если запись dp[i] существует, сразу вернуть ее
        if mem[i] != -1 {
            return mem[i]
        }
        // dp[i] = dp[i-1] + dp[i-2]
        count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
        // Сохранить dp[i]
        mem[i] = count
        return count
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    func climbingStairsDFSMem(n int) int {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        mem := make([]int, n+1)
        for i := range mem {
            mem[i] = -1
        }
        return dfsMem(n, mem)
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs_mem.swift"
    /* Поиск с мемоизацией */
    func dfs(i: Int, mem: inout [Int]) -> Int {
        // dp[1] и dp[2] уже известны, вернуть их
        if i == 1 || i == 2 {
            return i
        }
        // Если запись dp[i] существует, сразу вернуть ее
        if mem[i] != -1 {
            return mem[i]
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
        // Сохранить dp[i]
        mem[i] = count
        return count
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    func climbingStairsDFSMem(n: Int) -> Int {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        var mem = Array(repeating: -1, count: n + 1)
        return dfs(i: n, mem: &mem)
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs_mem.js"
    /* Поиск с мемоизацией */
    function dfs(i, mem) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i === 1 || i === 2) return i;
        // Если запись dp[i] существует, сразу вернуть ее
        if (mem[i] != -1) return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Сохранить dp[i]
        mem[i] = count;
        return count;
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    function climbingStairsDFSMem(n) {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        const mem = new Array(n + 1).fill(-1);
        return dfs(n, mem);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs_mem.ts"
    /* Поиск с мемоизацией */
    function dfs(i: number, mem: number[]): number {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i === 1 || i === 2) return i;
        // Если запись dp[i] существует, сразу вернуть ее
        if (mem[i] != -1) return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Сохранить dp[i]
        mem[i] = count;
        return count;
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    function climbingStairsDFSMem(n: number): number {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        const mem = new Array(n + 1).fill(-1);
        return dfs(n, mem);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs_mem.dart"
    /* Поиск с мемоизацией */
    int dfs(int i, List<int> mem) {
      // dp[1] и dp[2] уже известны, вернуть их
      if (i == 1 || i == 2) return i;
      // Если запись dp[i] существует, сразу вернуть ее
      if (mem[i] != -1) return mem[i];
      // dp[i] = dp[i-1] + dp[i-2]
      int count = dfs(i - 1, mem) + dfs(i - 2, mem);
      // Сохранить dp[i]
      mem[i] = count;
      return count;
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    int climbingStairsDFSMem(int n) {
      // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
      List<int> mem = List.filled(n + 1, -1);
      return dfs(n, mem);
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs_mem.rs"
    /* Поиск с мемоизацией */
    fn dfs(i: usize, mem: &mut [i32]) -> i32 {
        // dp[1] и dp[2] уже известны, вернуть их
        if i == 1 || i == 2 {
            return i as i32;
        }
        // Если запись dp[i] существует, сразу вернуть ее
        if mem[i] != -1 {
            return mem[i];
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Сохранить dp[i]
        mem[i] = count;
        count
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    fn climbing_stairs_dfs_mem(n: usize) -> i32 {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        let mut mem = vec![-1; n + 1];
        dfs(n, &mut mem)
    }
    ```

=== "C"

    ```c title="climbing_stairs_dfs_mem.c"
    /* Поиск с мемоизацией */
    int dfs(int i, int *mem) {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2)
            return i;
        // Если запись dp[i] существует, сразу вернуть ее
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Сохранить dp[i]
        mem[i] = count;
        return count;
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    int climbingStairsDFSMem(int n) {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        int *mem = (int *)malloc((n + 1) * sizeof(int));
        for (int i = 0; i <= n; i++) {
            mem[i] = -1;
        }
        int result = dfs(n, mem);
        free(mem);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs_mem.kt"
    /* Поиск с мемоизацией */
    fun dfs(i: Int, mem: IntArray): Int {
        // dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2) return i
        // Если запись dp[i] существует, сразу вернуть ее
        if (mem[i] != -1) return mem[i]
        // dp[i] = dp[i-1] + dp[i-2]
        val count = dfs(i - 1, mem) + dfs(i - 2, mem)
        // Сохранить dp[i]
        mem[i] = count
        return count
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    fun climbingStairsDFSMem(n: Int): Int {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        val mem = IntArray(n + 1)
        mem.fill(-1)
        return dfs(n, mem)
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs_mem.rb"
    ### Поиск с мемоизацией ###
    def dfs(i, mem)
      # dp[1] и dp[2] уже известны, вернуть их
      return i if i == 1 || i == 2
      # Если запись dp[i] существует, сразу вернуть ее
      return mem[i] if mem[i] != -1

      # dp[i] = dp[i-1] + dp[i-2]
      count = dfs(i - 1, mem) + dfs(i - 2, mem)
      # Сохранить dp[i]
      mem[i] = count
    end

    ### Подъем по лестнице: поиск с мемоизацией ###
    def climbing_stairs_dfs_mem(n)
      # mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
      mem = Array.new(n + 1, -1)
      dfs(n, mem)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%2C%20mem%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%BC%D0%B5%D0%BC%D0%BE%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%22%22%22%0A%20%20%20%20%23%20dp%5B1%5D%20%D0%B8%20dp%5B2%5D%20%D1%83%D0%B6%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%B5%D1%81%D1%82%D0%BD%D1%8B%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D1%85%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D1%8C%20dp%5Bi%5D%20%D1%81%D1%83%D1%89%D0%B5%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%2C%20%D1%81%D1%80%D0%B0%D0%B7%D1%83%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B5%D0%B5%0A%20%20%20%20if%20mem%5Bi%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%2C%20mem%29%20%2B%20dfs%28i%20-%202%2C%20mem%29%0A%20%20%20%20%23%20%D0%A1%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D0%B8%D1%82%D1%8C%20dp%5Bi%5D%0A%20%20%20%20mem%5Bi%5D%20%3D%20count%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs_mem%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%BC%D0%B5%D0%BC%D0%BE%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%22%22%22%0A%20%20%20%20%23%20mem%5Bi%5D%20%D1%85%D1%80%D0%B0%D0%BD%D0%B8%D1%82%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BD%D0%B0%20i-%D1%8E%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D1%8C%2C%20-1%20%D0%BE%D0%B7%D0%BD%D0%B0%D1%87%D0%B0%D0%B5%D1%82%20%D0%BE%D1%82%D1%81%D1%83%D1%82%D1%81%D1%82%D0%B2%D0%B8%D0%B5%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B8%0A%20%20%20%20mem%20%3D%20%5B-1%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20return%20dfs%28n%2C%20mem%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs_mem%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%2C%20mem%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%BC%D0%B5%D0%BC%D0%BE%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%22%22%22%0A%20%20%20%20%23%20dp%5B1%5D%20%D0%B8%20dp%5B2%5D%20%D1%83%D0%B6%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%B5%D1%81%D1%82%D0%BD%D1%8B%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D1%85%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D1%8C%20dp%5Bi%5D%20%D1%81%D1%83%D1%89%D0%B5%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%2C%20%D1%81%D1%80%D0%B0%D0%B7%D1%83%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B5%D0%B5%0A%20%20%20%20if%20mem%5Bi%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%2C%20mem%29%20%2B%20dfs%28i%20-%202%2C%20mem%29%0A%20%20%20%20%23%20%D0%A1%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D0%B8%D1%82%D1%8C%20dp%5Bi%5D%0A%20%20%20%20mem%5Bi%5D%20%3D%20count%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs_mem%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%BC%D0%B5%D0%BC%D0%BE%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%22%22%22%0A%20%20%20%20%23%20mem%5Bi%5D%20%D1%85%D1%80%D0%B0%D0%BD%D0%B8%D1%82%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BD%D0%B0%20i-%D1%8E%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D1%8C%2C%20-1%20%D0%BE%D0%B7%D0%BD%D0%B0%D1%87%D0%B0%D0%B5%D1%82%20%D0%BE%D1%82%D1%81%D1%83%D1%82%D1%81%D1%82%D0%B2%D0%B8%D0%B5%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B8%0A%20%20%20%20mem%20%3D%20%5B-1%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20return%20dfs%28n%2C%20mem%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs_mem%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Как показано на рисунке 14-4, **после введения мемоизации каждая перекрывающаяся подзадача вычисляется только один раз, и временная сложность оптимизируется до $O(n)$** . Это огромный скачок в эффективности.

![Дерево рекурсии для поиска с мемоизацией](intro_to_dynamic_programming.assets/climbing_stairs_dfs_memo_tree.png){ class="animation-figure" }

<p align="center"> Рисунок 14-4 &nbsp; Дерево рекурсии для поиска с мемоизацией </p>

## 14.1.3 &nbsp; Метод 3: динамическое программирование

**Поиск с мемоизацией - это метод "сверху вниз"** : мы начинаем с исходной задачи (корня), рекурсивно раскладываем более крупные подзадачи на меньшие, пока не достигнем наименьших подзадач с уже известным ответом (листьев). Затем в процессе возврата постепенно собираем решения подзадач и тем самым получаем решение исходной задачи.

Напротив, **динамическое программирование - это метод "снизу вверх"** : начиная с решений наименьших подзадач, мы итеративно строим решения для более крупных подзадач, пока не получим ответ на исходную задачу.

Поскольку в динамическом программировании нет этапа возврата, для его реализации достаточно обычных циклов, без рекурсии. В приведенном ниже коде мы инициализируем массив `dp` для хранения решений подзадач; он выполняет ту же роль, что и массив `mem` в мемоизированном поиске:

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp(n: int) -> int:
        """Подъем по лестнице: динамическое программирование"""
        if n == 1 or n == 2:
            return n
        # Инициализация таблицы dp для хранения решений подзадач
        dp = [0] * (n + 1)
        # Начальное состояние: заранее задать решения наименьших подзадач
        dp[1], dp[2] = 1, 2
        # Переход состояний: постепенное решение больших подзадач через меньшие
        for i in range(3, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2]
        return dp[n]
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* Подъем по лестнице: динамическое программирование */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Инициализация таблицы dp для хранения решений подзадач
        vector<int> dp(n + 1);
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1;
        dp[2] = 2;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* Подъем по лестнице: динамическое программирование */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Инициализация таблицы dp для хранения решений подзадач
        int[] dp = new int[n + 1];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1;
        dp[2] = 2;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    /* Подъем по лестнице: динамическое программирование */
    int ClimbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Инициализация таблицы dp для хранения решений подзадач
        int[] dp = new int[n + 1];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1;
        dp[2] = 2;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    /* Подъем по лестнице: динамическое программирование */
    func climbingStairsDP(n int) int {
        if n == 1 || n == 2 {
            return n
        }
        // Инициализация таблицы dp для хранения решений подзадач
        dp := make([]int, n+1)
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1
        dp[2] = 2
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i := 3; i <= n; i++ {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    /* Подъем по лестнице: динамическое программирование */
    func climbingStairsDP(n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        // Инициализация таблицы dp для хранения решений подзадач
        var dp = Array(repeating: 0, count: n + 1)
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1
        dp[2] = 2
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i in 3 ... n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    /* Подъем по лестнице: динамическое программирование */
    function climbingStairsDP(n) {
        if (n === 1 || n === 2) return n;
        // Инициализация таблицы dp для хранения решений подзадач
        const dp = new Array(n + 1).fill(-1);
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1;
        dp[2] = 2;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (let i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    /* Подъем по лестнице: динамическое программирование */
    function climbingStairsDP(n: number): number {
        if (n === 1 || n === 2) return n;
        // Инициализация таблицы dp для хранения решений подзадач
        const dp = new Array(n + 1).fill(-1);
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1;
        dp[2] = 2;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (let i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    /* Подъем по лестнице: динамическое программирование */
    int climbingStairsDP(int n) {
      if (n == 1 || n == 2) return n;
      // Инициализация таблицы dp для хранения решений подзадач
      List<int> dp = List.filled(n + 1, 0);
      // Начальное состояние: заранее задать решения наименьших подзадач
      dp[1] = 1;
      dp[2] = 2;
      // Переход состояний: постепенное решение больших подзадач через меньшие
      for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
      }
      return dp[n];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    /* Подъем по лестнице: динамическое программирование */
    fn climbing_stairs_dp(n: usize) -> i32 {
        // dp[1] и dp[2] уже известны, вернуть их
        if n == 1 || n == 2 {
            return n as i32;
        }
        // Инициализация таблицы dp для хранения решений подзадач
        let mut dp = vec![-1; n + 1];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1;
        dp[2] = 2;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i in 3..=n {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        dp[n]
    }
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    /* Подъем по лестнице: динамическое программирование */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Инициализация таблицы dp для хранения решений подзадач
        int *dp = (int *)malloc((n + 1) * sizeof(int));
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1;
        dp[2] = 2;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        int result = dp[n];
        free(dp);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    /* Подъем по лестнице: динамическое программирование */
    fun climbingStairsDP(n: Int): Int {
        if (n == 1 || n == 2) return n
        // Инициализация таблицы dp для хранения решений подзадач
        val dp = IntArray(n + 1)
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1
        dp[2] = 2
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (i in 3..n) {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    ### Подъем по лестнице: динамическое программирование ###
    def climbing_stairs_dp(n)
      return n  if n == 1 || n == 2

      # Инициализация таблицы dp для хранения решений подзадач
      dp = Array.new(n + 1, 0)
      # Начальное состояние: заранее задать решения наименьших подзадач
      dp[1], dp[2] = 1, 2
      # Переход состояний: постепенное решение больших подзадач через меньшие
      (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

      dp[n]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%D0%9D%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%3A%20%D0%B7%D0%B0%D1%80%D0%B0%D0%BD%D0%B5%D0%B5%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BD%D0%B0%D0%B8%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%5B1%5D%2C%20dp%5B2%5D%20%3D%201%2C%202%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%3A%20%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D0%BF%D0%B5%D0%BD%D0%BD%D0%BE%D0%B5%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%20%D1%87%D0%B5%D1%80%D0%B5%D0%B7%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D0%B5%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20dp%5Bi%20-%201%5D%20%2B%20dp%5Bi%20-%202%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%D0%9D%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%3A%20%D0%B7%D0%B0%D1%80%D0%B0%D0%BD%D0%B5%D0%B5%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BD%D0%B0%D0%B8%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%0A%20%20%20%20dp%5B1%5D%2C%20dp%5B2%5D%20%3D%201%2C%202%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%3A%20%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D0%BF%D0%B5%D0%BD%D0%BD%D0%BE%D0%B5%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B8%D1%85%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%20%D1%87%D0%B5%D1%80%D0%B5%D0%B7%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D0%B5%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20dp%5Bi%20-%201%5D%20%2B%20dp%5Bi%20-%202%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

На рисунке 14-5 смоделирован процесс выполнения этого кода.

![Процесс динамического программирования для подъема по лестнице](intro_to_dynamic_programming.assets/climbing_stairs_dp.png){ class="animation-figure" }

<p align="center"> Рисунок 14-5 &nbsp; Процесс динамического программирования для подъема по лестнице </p>

Как и в backtracking, в динамическом программировании используется понятие "состояние" для обозначения некоторого этапа решения задачи; каждое состояние соответствует одной подзадаче и ее локально оптимальному решению. Например, в задаче о лестнице состояние определяется текущим номером ступени $i$ .

На основе сказанного можно подвести несколько часто используемых терминов динамического программирования.

- Массив `dp` называют <u>таблицей dp</u>, а $dp[i]$ обозначает решение подзадачи, соответствующей состоянию $i$ .
- Состояния, соответствующие наименьшим подзадачам (первая и вторая ступени), называют <u>начальными состояниями</u>.
- Рекуррентную формулу $dp[i] = dp[i-1] + dp[i-2]$ называют <u>уравнением перехода состояния</u>.

## 14.1.4 &nbsp; Оптимизация пространства

Внимательный читатель мог заметить, что **поскольку $dp[i]$ зависит только от $dp[i-1]$ и $dp[i-2]$ , нам не нужен весь массив `dp` для хранения ответов всех подзадач** ; достаточно двух переменных, которые будут "перекатываться" вперед. Код имеет вид:

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp_comp(n: int) -> int:
        """Подъем по лестнице: динамическое программирование с оптимизацией памяти"""
        if n == 1 or n == 2:
            return n
        a, b = 1, 2
        for _ in range(3, n + 1):
            a, b = b, a + b
        return b
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    int ClimbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    func climbingStairsDPComp(n int) int {
        if n == 1 || n == 2 {
            return n
        }
        a, b := 1, 2
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for i := 3; i <= n; i++ {
            a, b = b, a+b
        }
        return b
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    func climbingStairsDPComp(n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        var a = 1
        var b = 2
        for _ in 3 ... n {
            (a, b) = (b, a + b)
        }
        return b
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    function climbingStairsDPComp(n) {
        if (n === 1 || n === 2) return n;
        let a = 1,
            b = 2;
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    function climbingStairsDPComp(n: number): number {
        if (n === 1 || n === 2) return n;
        let a = 1,
            b = 2;
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    int climbingStairsDPComp(int n) {
      if (n == 1 || n == 2) return n;
      int a = 1, b = 2;
      for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
      }
      return b;
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    fn climbing_stairs_dp_comp(n: usize) -> i32 {
        if n == 1 || n == 2 {
            return n as i32;
        }
        let (mut a, mut b) = (1, 2);
        for _ in 3..=n {
            let tmp = b;
            b = a + b;
            a = tmp;
        }
        b
    }
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    fun climbingStairsDPComp(n: Int): Int {
        if (n == 1 || n == 2) return n
        var a = 1
        var b = 2
        for (i in 3..n) {
            val temp = b
            b += a
            a = temp
        }
        return b
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    ### Подъем по лестнице: динамическое программирование с оптимизацией памяти ###
    def climbing_stairs_dp_comp(n)
      return n if n == 1 || n == 2

      a, b = 1, 2
      (3...(n + 1)).each { a, b = b, a + b }

      b
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp_comp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20a%2C%20b%20%3D%201%2C%202%0A%20%20%20%20for%20_%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a%2C%20b%20%3D%20b%2C%20a%20%2B%20b%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp_comp%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp_comp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B4%D1%8A%D0%B5%D0%BC%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20a%2C%20b%20%3D%201%2C%202%0A%20%20%20%20for%20_%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a%2C%20b%20%3D%20b%2C%20a%20%2B%20b%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp_comp%28n%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D1%8C%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%BB%D0%B5%D1%81%D1%82%D0%BD%D0%B8%D1%86%D0%B5%20%D0%B8%D0%B7%20%7Bn%7D%20%D1%81%D1%82%D1%83%D0%BF%D0%B5%D0%BD%D0%B5%D0%B9%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Из кода видно, что после отказа от массива `dp` пространственная сложность уменьшается с $O(n)$ до $O(1)$ .

Во многих задачах динамического программирования текущее состояние зависит лишь от ограниченного числа предыдущих состояний. Тогда можно сохранять только действительно нужные состояния и за счет "уменьшения размерности" экономить память. **Этот прием оптимизации памяти называют "скользящими переменными" или "скользящим массивом"**.
