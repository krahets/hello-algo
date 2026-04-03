---
comments: true
---

# 13.3 &nbsp; Задача о сумме подмножеств

## 13.3.1 &nbsp; Случай без повторяющихся элементов

!!! question

    Дан массив положительных целых чисел `nums` и целое положительное значение `target` . Найдите все возможные комбинации, сумма элементов которых равна `target` . Во входном массиве нет повторяющихся элементов, и каждый элемент можно выбирать неограниченное число раз. Верните эти комбинации в виде списка; в результате не должно быть повторяющихся комбинаций.

Например, для входного множества $\{3, 4, 5\}$ и целевого значения $9$ решениями будут $\{3, 3, 3\}$ и $\{4, 5\}$ . При этом важно учитывать два обстоятельства.

- Элементы входного множества можно выбирать повторно неограниченное число раз.
- Подмножество не различает порядок элементов, поэтому $\{4, 5\}$ и $\{5, 4\}$ считаются одним и тем же подмножеством.

### 1. &nbsp; Отталкиваемся от решения задачи о перестановках

Как и в задаче о перестановках, можно представлять построение подмножеств как результат последовательности выборов и во время выбора динамически обновлять "сумму элементов"; когда эта сумма становится равной `target` , соответствующее подмножество записывается в список результатов.

Однако в отличие от задачи о перестановках **в этой задаче элементы множества можно выбирать неограниченное число раз**, поэтому нам не нужен булев список `selected` для записи того, был ли выбран элемент. Можно слегка изменить код для перестановок и получить первоначальную версию решения:

=== "Python"

    ```python title="subset_sum_i_naive.py"
    def backtrack(
        state: list[int],
        target: int,
        total: int,
        choices: list[int],
        res: list[list[int]],
    ):
        """Алгоритм бэктрекинга: сумма подмножеств I"""
        # Если сумма подмножества равна target, записать решение
        if total == target:
            res.append(list(state))
            return
        # Перебор всех вариантов выбора
        for i in range(len(choices)):
            # Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if total + choices[i] > target:
                continue
            # Попытка: сделать выбор и обновить элемент и total
            state.append(choices[i])
            # Перейти к следующему выбору
            backtrack(state, target, total + choices[i], choices, res)
            # Откат: отменить выбор и восстановить предыдущее состояние
            state.pop()

    def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
        """Решить задачу суммы подмножеств I (с повторяющимися подмножествами)"""
        state = []  # Состояние (подмножество)
        total = 0  # Сумма подмножеств
        res = []  # Список результатов (список подмножеств)
        backtrack(state, target, total, nums, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i_naive.cpp"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
        // Если сумма подмножества равна target, записать решение
        if (total == target) {
            res.push_back(state);
            return;
        }
        // Перебор всех вариантов выбора
        for (size_t i = 0; i < choices.size(); i++) {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if (total + choices[i] > target) {
                continue;
            }
            // Попытка: сделать выбор и обновить элемент и total
            state.push_back(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target, total + choices[i], choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop_back();
        }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
        vector<int> state;       // Состояние (подмножество)
        int total = 0;           // Сумма подмножеств
        vector<vector<int>> res; // Список результатов (список подмножеств)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i_naive.java"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // Если сумма подмножества равна target, записать решение
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Перебор всех вариантов выбора
        for (int i = 0; i < choices.length; i++) {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if (total + choices[i] > target) {
                continue;
            }
            // Попытка: сделать выбор и обновить элемент и total
            state.add(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target, total + choices[i], choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.remove(state.size() - 1);
        }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Состояние (подмножество)
        int total = 0; // Сумма подмножеств
        List<List<Integer>> res = new ArrayList<>(); // Список результатов (список подмножеств)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i_naive.cs"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // Если сумма подмножества равна target, записать решение
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебор всех вариантов выбора
        for (int i = 0; i < choices.Length; i++) {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if (total + choices[i] > target) {
                continue;
            }
            // Попытка: сделать выбор и обновить элемент и total
            state.Add(choices[i]);
            // Перейти к следующему выбору
            Backtrack(state, target, total + choices[i], choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // Состояние (подмножество)
        int total = 0; // Сумма подмножеств
        List<List<int>> res = []; // Список результатов (список подмножеств)
        Backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i_naive.go"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
        // Если сумма подмножества равна target, записать решение
        if target == total {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // Перебор всех вариантов выбора
        for i := 0; i < len(*choices); i++ {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if total+(*choices)[i] > target {
                continue
            }
            // Попытка: сделать выбор и обновить элемент и total
            *state = append(*state, (*choices)[i])
            // Перейти к следующему выбору
            backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            *state = (*state)[:len(*state)-1]
        }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    func subsetSumINaive(nums []int, target int) [][]int {
        state := make([]int, 0) // Состояние (подмножество)
        total := 0              // Сумма подмножеств
        res := make([][]int, 0) // Список результатов (список подмножеств)
        backtrackSubsetSumINaive(total, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i_naive.swift"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
        // Если сумма подмножества равна target, записать решение
        if total == target {
            res.append(state)
            return
        }
        // Перебор всех вариантов выбора
        for i in choices.indices {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if total + choices[i] > target {
                continue
            }
            // Попытка: сделать выбор и обновить элемент и total
            state.append(choices[i])
            // Перейти к следующему выбору
            backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.removeLast()
        }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // Состояние (подмножество)
        let total = 0 // Сумма подмножеств
        var res: [[Int]] = [] // Список результатов (список подмножеств)
        backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i_naive.js"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    function backtrack(state, target, total, choices, res) {
        // Если сумма подмножества равна target, записать решение
        if (total === target) {
            res.push([...state]);
            return;
        }
        // Перебор всех вариантов выбора
        for (let i = 0; i < choices.length; i++) {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if (total + choices[i] > target) {
                continue;
            }
            // Попытка: сделать выбор и обновить элемент и total
            state.push(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target, total + choices[i], choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop();
        }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    function subsetSumINaive(nums, target) {
        const state = []; // Состояние (подмножество)
        const total = 0; // Сумма подмножеств
        const res = []; // Список результатов (список подмножеств)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i_naive.ts"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    function backtrack(
        state: number[],
        target: number,
        total: number,
        choices: number[],
        res: number[][]
    ): void {
        // Если сумма подмножества равна target, записать решение
        if (total === target) {
            res.push([...state]);
            return;
        }
        // Перебор всех вариантов выбора
        for (let i = 0; i < choices.length; i++) {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if (total + choices[i] > target) {
                continue;
            }
            // Попытка: сделать выбор и обновить элемент и total
            state.push(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target, total + choices[i], choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop();
        }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    function subsetSumINaive(nums: number[], target: number): number[][] {
        const state = []; // Состояние (подмножество)
        const total = 0; // Сумма подмножеств
        const res = []; // Список результатов (список подмножеств)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i_naive.dart"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void backtrack(
      List<int> state,
      int target,
      int total,
      List<int> choices,
      List<List<int>> res,
    ) {
      // Если сумма подмножества равна target, записать решение
      if (total == target) {
        res.add(List.from(state));
        return;
      }
      // Перебор всех вариантов выбора
      for (int i = 0; i < choices.length; i++) {
        // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
        if (total + choices[i] > target) {
          continue;
        }
        // Попытка: сделать выбор и обновить элемент и total
        state.add(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target, total + choices[i], choices, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.removeLast();
      }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    List<List<int>> subsetSumINaive(List<int> nums, int target) {
      List<int> state = []; // Состояние (подмножество)
      int total = 0; // Сумма элементов
      List<List<int>> res = []; // Список результатов (список подмножеств)
      backtrack(state, target, total, nums, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i_naive.rs"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        total: i32,
        choices: &[i32],
        res: &mut Vec<Vec<i32>>,
    ) {
        // Если сумма подмножества равна target, записать решение
        if total == target {
            res.push(state.clone());
            return;
        }
        // Перебор всех вариантов выбора
        for i in 0..choices.len() {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if total + choices[i] > target {
                continue;
            }
            // Попытка: сделать выбор и обновить элемент и total
            state.push(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target, total + choices[i], choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop();
        }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // Состояние (подмножество)
        let total = 0; // Сумма подмножеств
        let mut res = Vec::new(); // Список результатов (список подмножеств)
        backtrack(&mut state, target, total, nums, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i_naive.c"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void backtrack(int target, int total, int *choices, int choicesSize) {
        // Если сумма подмножества равна target, записать решение
        if (total == target) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // Перебор всех вариантов выбора
        for (int i = 0; i < choicesSize; i++) {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if (total + choices[i] > target) {
                continue;
            }
            // Попытка: сделать выбор и обновить элемент и total
            state[stateSize++] = choices[i];
            // Перейти к следующему выбору
            backtrack(target, total + choices[i], choices, choicesSize);
            // Откат: отменить выбор и восстановить предыдущее состояние
            stateSize--;
        }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    void subsetSumINaive(int *nums, int numsSize, int target) {
        resSize = 0; // Инициализировать число решений нулем
        backtrack(target, 0, nums, numsSize);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i_naive.kt"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        total: Int,
        choices: IntArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // Если сумма подмножества равна target, записать решение
        if (total == target) {
            res.add(state.toMutableList())
            return
        }
        // Перебор всех вариантов выбора
        for (i in choices.indices) {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if (total + choices[i] > target) {
                continue
            }
            // Попытка: сделать выбор и обновить элемент и total
            state.add(choices[i])
            // Перейти к следующему выбору
            backtrack(state, target, total + choices[i], choices, res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.removeAt(state.size - 1)
        }
    }

    /* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
    fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // Состояние (подмножество)
        val total = 0 // Сумма подмножеств
        val res = mutableListOf<MutableList<Int>?>() // Список результатов (список подмножеств)
        backtrack(state, target, total, nums, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_i_naive.rb"
    ### Алгоритм бэктрекинга: сумма подмножеств I ###
    def backtrack(state, target, total, choices, res)
      # Если сумма подмножества равна target, записать решение
      if total == target
        res << state.dup
        return
      end

      # Перебор всех вариантов выбора
      for i in 0...choices.length
        # Отсечение: если сумма подмножества превышает target, пропустить этот выбор
        next if total + choices[i] > target
        # Попытка: сделать выбор и обновить элемент и total
        state << choices[i]
        # Перейти к следующему выбору
        backtrack(state, target, total + choices[i], choices, res)
        # Откат: отменить выбор и восстановить предыдущее состояние
        state.pop
      end
    end

    ### Алгоритм бэктрекинга: сумма подмножеств I ###
    def backtrack(state, target, total, choices, res)
      # Если сумма подмножества равна target, записать решение
      if total == target
        res << state.dup
        return
      end

      # Перебор всех вариантов выбора
      for i in 0...choices.length
        # Отсечение: если сумма подмножества превышает target, пропустить этот выбор
        next if total + choices[i] > target
        # Попытка: сделать выбор и обновить элемент и total
        state << choices[i]
        # Перейти к следующему выбору
        backtrack(state, target, total + choices[i], choices, res)
        # Откат: отменить выбор и восстановить предыдущее состояние
        state.pop
      end
    end

    # ## Решить задачу суммы подмножеств I (с повторяющимися подмножествами) ###
    def subset_sum_i_naive(nums, target)
      state = [] # Состояние (подмножество)
      total = 0 # Сумма подмножеств
      res = [] # Список результатов (список подмножеств)
      backtrack(state, target, total, nums, res)
      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%0A%20%20%20%20target%3A%20int%2C%0A%20%20%20%20total%3A%20int%2C%0A%20%20%20%20choices%3A%20list%5Bint%5D%2C%0A%20%20%20%20res%3A%20list%5Blist%5Bint%5D%5D%2C%0A%29%3A%0A%20%20%20%20%22%22%22%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%20%D0%B1%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%D0%B0%3A%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%20I%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20target%2C%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20total%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D1%81%D0%B5%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0%0A%20%20%20%20for%20i%20in%20range%28len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%B5%D1%81%D0%BB%D0%B8%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B0%D0%B5%D1%82%20target%2C%20%D0%BF%D1%80%D0%BE%D0%BF%D1%83%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D1%82%D0%BE%D1%82%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%0A%20%20%20%20%20%20%20%20if%20total%20%2B%20choices%5Bi%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%3A%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%20total%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B9%D1%82%D0%B8%20%D0%BA%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B5%D0%BC%D1%83%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D1%83%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%2C%20total%20%2B%20choices%5Bi%5D%2C%20choices%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%3A%20%D0%BE%D1%82%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D1%8B%D0%B4%D1%83%D1%89%D0%B5%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i_naive%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B5%D1%88%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%20I%20%28%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%D0%BC%D0%B8%29%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%D0%A1%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%20%28%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%BE%29%0A%20%20%20%20total%20%3D%200%20%20%23%20%D0%A1%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D0%BE%D0%B2%20%28%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%29%0A%20%20%20%20backtrack%28state%2C%20target%2C%20total%2C%20nums%2C%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i_naive%28nums%2C%20target%29%0A%0A%20%20%20%20print%28f%22%D0%92%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%81%20%D1%81%D1%83%D0%BC%D0%BC%D0%BE%D0%B9%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%B8%D1%82%D0%B5%20%D0%B2%D0%BD%D0%B8%D0%BC%D0%B0%D0%BD%D0%B8%D0%B5%3A%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%8D%D1%82%D0%BE%D0%B3%D0%BE%20%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D0%B0%20%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B8%D1%82%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%D1%81%D1%8F%20%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%0A%20%20%20%20target%3A%20int%2C%0A%20%20%20%20total%3A%20int%2C%0A%20%20%20%20choices%3A%20list%5Bint%5D%2C%0A%20%20%20%20res%3A%20list%5Blist%5Bint%5D%5D%2C%0A%29%3A%0A%20%20%20%20%22%22%22%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%20%D0%B1%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%D0%B0%3A%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%20I%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20target%2C%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20total%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D1%81%D0%B5%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0%0A%20%20%20%20for%20i%20in%20range%28len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%B5%D1%81%D0%BB%D0%B8%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B0%D0%B5%D1%82%20target%2C%20%D0%BF%D1%80%D0%BE%D0%BF%D1%83%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D1%82%D0%BE%D1%82%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%0A%20%20%20%20%20%20%20%20if%20total%20%2B%20choices%5Bi%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%3A%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%20total%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B9%D1%82%D0%B8%20%D0%BA%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B5%D0%BC%D1%83%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D1%83%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%2C%20total%20%2B%20choices%5Bi%5D%2C%20choices%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%3A%20%D0%BE%D1%82%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D1%8B%D0%B4%D1%83%D1%89%D0%B5%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i_naive%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B5%D1%88%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%20I%20%28%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%D0%BC%D0%B8%29%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%D0%A1%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%20%28%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%BE%29%0A%20%20%20%20total%20%3D%200%20%20%23%20%D0%A1%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D0%BE%D0%B2%20%28%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%29%0A%20%20%20%20backtrack%28state%2C%20target%2C%20total%2C%20nums%2C%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i_naive%28nums%2C%20target%29%0A%0A%20%20%20%20print%28f%22%D0%92%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%81%20%D1%81%D1%83%D0%BC%D0%BC%D0%BE%D0%B9%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%B8%D1%82%D0%B5%20%D0%B2%D0%BD%D0%B8%D0%BC%D0%B0%D0%BD%D0%B8%D0%B5%3A%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%8D%D1%82%D0%BE%D0%B3%D0%BE%20%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D0%B0%20%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B8%D1%82%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%D1%81%D1%8F%20%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Если подать на этот код массив $[3, 4, 5]$ и целевое значение $9$ , то на выходе мы получим $[3, 3, 3], [4, 5], [5, 4]$ . **Хотя все подмножества с суммой $9$ успешно найдены, среди них все же присутствуют дубликаты: $[4, 5]$ и $[5, 4]$** .

Причина в том, что процесс поиска различает порядок выбора, тогда как для подмножеств порядок не важен. Как показано на рисунке 13-10, сначала выбрать $4$ , а затем $5$ , и сначала выбрать $5$ , а затем $4$ - это разные ветви поиска, но им соответствует одно и то же подмножество.

![Поиск подмножеств и обрезка по выходу за границу](subset_sum_problem.assets/subset_sum_i_naive.png){ class="animation-figure" }

<p align="center"> Рисунок 13-10 &nbsp; Поиск подмножеств и обрезка по выходу за границу </p>

Чтобы убрать повторяющиеся подмножества, **одна из прямых идей - удалить дубликаты уже из итогового списка результатов**. Но это решение малоэффективно по двум причинам.

- Когда массив содержит много элементов, а особенно когда `target` велик, процесс поиска порождает огромное число повторяющихся подмножеств.
- Сравнение подмножеств (то есть массивов) само по себе довольно затратно: сначала приходится сортировать массивы, а затем поэлементно сравнивать их.

### 2. &nbsp; Обрезка повторяющихся подмножеств

**Поэтому стоит выполнять устранение дубликатов прямо во время поиска, с помощью обрезки**. Посмотрите на рисунок 13-11: повторяющиеся подмножества возникают тогда, когда элементы массива выбираются в разном порядке, например так.

1. Если в первом и втором раундах выбрать соответственно $3$ и $4$ , то будут сгенерированы все подмножества, содержащие эти два элемента, и их можно обозначить как $[3, 4, \dots]$ .
2. После этого, если в первом раунде выбрать $4$ , **то во втором раунде нужно пропустить $3$** , потому что подмножества $[4, 3, \dots]$ полностью дублируют подмножества, уже построенные на шаге `1.` .

Во время поиска варианты на каждом уровне пробуются по одному слева направо, поэтому чем правее ветвь, тем больше ветвей оказывается отсечено.

1. В первых двух раундах выбираются $3$ и $5$ , что дает подмножества $[3, 5, \dots]$ .
2. В первых двух раундах выбираются $4$ и $5$ , что дает подмножества $[4, 5, \dots]$ .
3. Если же в первом раунде выбрать $5$ , **то во втором раунде нужно пропустить $3$ и $4$** , потому что подмножества $[5, 3, \dots]$ и $[5, 4, \dots]$ полностью дублируют случаи, описанные в шагах `1.` и `2.` .

![Повторяющиеся подмножества из-за разного порядка выбора](subset_sum_problem.assets/subset_sum_i_pruning.png){ class="animation-figure" }

<p align="center"> Рисунок 13-11 &nbsp; Повторяющиеся подмножества из-за разного порядка выбора </p>

В общем виде, если входной массив имеет вид $[x_1, x_2, \dots, x_n]$ , а последовательность выборов в ходе поиска равна $[x_{i_1}, x_{i_2}, \dots, x_{i_m}]$ , то она должна удовлетворять условию $i_1 \leq i_2 \leq \dots \leq i_m$ ; **все последовательности выборов, не удовлетворяющие этому условию, приводят к дубликатам и должны отсекаться**.

### 3. &nbsp; Реализация кода

Чтобы реализовать такую обрезку, инициализируем переменную `start` , которая будет указывать начальную точку обхода. **После выбора элемента $x_i$ следующий раунд начинается с индекса $i$**. Благодаря этому последовательность выборов всегда удовлетворяет условию $i_1 \leq i_2 \leq \dots \leq i_m$ , а значит, каждое подмножество создается только один раз.

Помимо этого, мы внесем в код еще два улучшения.

- Перед началом поиска отсортируем массив `nums` . Тогда при обходе всех вариантов **можно сразу прервать цикл, как только сумма подмножества превысит `target`** , потому что все последующие элементы будут еще больше и их сумма тоже превысит `target` .
- Откажемся от отдельной переменной суммы `total` и **будем учитывать сумму через вычитание из `target`** ; когда `target` станет равным $0$ , решение фиксируется.

=== "Python"

    ```python title="subset_sum_i.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """Алгоритм бэктрекинга: сумма подмножеств I"""
        # Если сумма подмножества равна target, записать решение
        if target == 0:
            res.append(list(state))
            return
        # Обойти все варианты выбора
        # Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for i in range(start, len(choices)):
            # Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            # Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if target - choices[i] < 0:
                break
            # Попытка: сделать выбор и обновить target и start
            state.append(choices[i])
            # Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i, res)
            # Откат: отменить выбор и восстановить предыдущее состояние
            state.pop()

    def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
        """Решить задачу суммы подмножеств I"""
        state = []  # Состояние (подмножество)
        nums.sort()  # Отсортировать nums
        start = 0  # Стартовая вершина обхода
        res = []  # Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i.cpp"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for (int i = start; i < choices.size(); i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Попытка: сделать выбор и обновить target и start
            state.push_back(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop_back();
        }
    }

    /* Решить задачу суммы подмножеств I */
    vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
        vector<int> state;              // Состояние (подмножество)
        sort(nums.begin(), nums.end()); // Отсортировать nums
        int start = 0;                  // Стартовая вершина обхода
        vector<vector<int>> res;        // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i.java"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for (int i = start; i < choices.length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Попытка: сделать выбор и обновить target и start
            state.add(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.remove(state.size() - 1);
        }
    }

    /* Решить задачу суммы подмножеств I */
    List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Состояние (подмножество)
        Arrays.sort(nums); // Отсортировать nums
        int start = 0; // Стартовая вершина обхода
        List<List<Integer>> res = new ArrayList<>(); // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i.cs"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for (int i = start; i < choices.Length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Попытка: сделать выбор и обновить target и start
            state.Add(choices[i]);
            // Перейти к следующему выбору
            Backtrack(state, target - choices[i], choices, i, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Решить задачу суммы подмножеств I */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // Состояние (подмножество)
        Array.Sort(nums); // Отсортировать nums
        int start = 0; // Стартовая вершина обхода
        List<List<int>> res = []; // Список результатов (список подмножеств)
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i.go"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    func backtrackSubsetSumI(start, target int, state, choices *[]int, res *[][]int) {
        // Если сумма подмножества равна target, записать решение
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for i := start; i < len(*choices); i++ {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if target-(*choices)[i] < 0 {
                break
            }
            // Попытка: сделать выбор и обновить target и start
            *state = append(*state, (*choices)[i])
            // Перейти к следующему выбору
            backtrackSubsetSumI(i, target-(*choices)[i], state, choices, res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            *state = (*state)[:len(*state)-1]
        }
    }

    /* Решить задачу суммы подмножеств I */
    func subsetSumI(nums []int, target int) [][]int {
        state := make([]int, 0) // Состояние (подмножество)
        sort.Ints(nums)         // Отсортировать nums
        start := 0              // Стартовая вершина обхода
        res := make([][]int, 0) // Список результатов (список подмножеств)
        backtrackSubsetSumI(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i.swift"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // Если сумма подмножества равна target, записать решение
        if target == 0 {
            res.append(state)
            return
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for i in choices.indices.dropFirst(start) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if target - choices[i] < 0 {
                break
            }
            // Попытка: сделать выбор и обновить target и start
            state.append(choices[i])
            // Перейти к следующему выбору
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.removeLast()
        }
    }

    /* Решить задачу суммы подмножеств I */
    func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // Состояние (подмножество)
        let nums = nums.sorted() // Отсортировать nums
        let start = 0 // Стартовая вершина обхода
        var res: [[Int]] = [] // Список результатов (список подмножеств)
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i.js"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    function backtrack(state, target, choices, start, res) {
        // Если сумма подмножества равна target, записать решение
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for (let i = start; i < choices.length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Попытка: сделать выбор и обновить target и start
            state.push(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop();
        }
    }

    /* Решить задачу суммы подмножеств I */
    function subsetSumI(nums, target) {
        const state = []; // Состояние (подмножество)
        nums.sort((a, b) => a - b); // Отсортировать nums
        const start = 0; // Стартовая вершина обхода
        const res = []; // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i.ts"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // Если сумма подмножества равна target, записать решение
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for (let i = start; i < choices.length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Попытка: сделать выбор и обновить target и start
            state.push(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop();
        }
    }

    /* Решить задачу суммы подмножеств I */
    function subsetSumI(nums: number[], target: number): number[][] {
        const state = []; // Состояние (подмножество)
        nums.sort((a, b) => a - b); // Отсортировать nums
        const start = 0; // Стартовая вершина обхода
        const res = []; // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i.dart"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // Если сумма подмножества равна target, записать решение
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // Обойти все варианты выбора
      // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
      for (int i = start; i < choices.length; i++) {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if (target - choices[i] < 0) {
          break;
        }
        // Попытка: сделать выбор и обновить target и start
        state.add(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.removeLast();
      }
    }

    /* Решить задачу суммы подмножеств I */
    List<List<int>> subsetSumI(List<int> nums, int target) {
      List<int> state = []; // Состояние (подмножество)
      nums.sort(); // Отсортировать nums
      int start = 0; // Стартовая вершина обхода
      List<List<int>> res = []; // Список результатов (список подмножеств)
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i.rs"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // Если сумма подмножества равна target, записать решение
        if target == 0 {
            res.push(state.clone());
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for i in start..choices.len() {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if target - choices[i] < 0 {
                break;
            }
            // Попытка: сделать выбор и обновить target и start
            state.push(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop();
        }
    }

    /* Решить задачу суммы подмножеств I */
    fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // Состояние (подмножество)
        nums.sort(); // Отсортировать nums
        let start = 0; // Стартовая вершина обхода
        let mut res = Vec::new(); // Список результатов (список подмножеств)
        backtrack(&mut state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i.c"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            for (int i = 0; i < stateSize; ++i) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for (int i = start; i < choicesSize; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Попытка: сделать выбор и обновить target и start
            state[stateSize] = choices[i];
            stateSize++;
            // Перейти к следующему выбору
            backtrack(target - choices[i], choices, choicesSize, i);
            // Откат: отменить выбор и восстановить предыдущее состояние
            stateSize--;
        }
    }

    /* Решить задачу суммы подмножеств I */
    void subsetSumI(int *nums, int numsSize, int target) {
        qsort(nums, numsSize, sizeof(int), cmp); // Отсортировать nums
        int start = 0;                           // Стартовая вершина обхода
        backtrack(target, nums, numsSize, start);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i.kt"
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for (i in start..<choices.size) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break
            }
            // Попытка: сделать выбор и обновить target и start
            state.add(choices[i])
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i, res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.removeAt(state.size - 1)
        }
    }

    /* Решить задачу суммы подмножеств I */
    fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // Состояние (подмножество)
        nums.sort() // Отсортировать nums
        val start = 0 // Стартовая вершина обхода
        val res = mutableListOf<MutableList<Int>?>() // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_i.rb"
    ### Алгоритм бэктрекинга: сумма подмножеств I ###
    def backtrack(state, target, choices, start, res)
      # Если сумма подмножества равна target, записать решение
      if target.zero?
        res << state.dup
        return
      end
      # Обойти все варианты выбора
      # Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
      for i in start...choices.length
        # Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        # Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        break if target - choices[i] < 0
        # Попытка: сделать выбор и обновить target и start
        state << choices[i]
        # Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i, res)
        # Откат: отменить выбор и восстановить предыдущее состояние
        state.pop
      end
    end

    ### Решить задачу суммы подмножеств I ###
    def subset_sum_i(nums, target)
      state = [] # Состояние (подмножество)
      nums.sort! # Отсортировать nums
      start = 0 # Стартовая вершина обхода
      res = [] # Список результатов (список подмножеств)
      backtrack(state, target, nums, start, res)
      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%20target%3A%20int%2C%20choices%3A%20list%5Bint%5D%2C%20start%3A%20int%2C%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%20%D0%B1%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%D0%B0%3A%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%20I%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20target%2C%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D1%8B%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0%0A%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%202%3A%20%D0%BD%D0%B0%D1%87%D0%B8%D0%BD%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%20%D1%81%20start%2C%20%D1%87%D1%82%D0%BE%D0%B1%D1%8B%20%D0%B8%D0%B7%D0%B1%D0%B5%D0%B6%D0%B0%D1%82%D1%8C%20%D0%B3%D0%B5%D0%BD%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D1%85%D1%81%D1%8F%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%0A%20%20%20%20for%20i%20in%20range%28start%2C%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%201%3A%20%D0%B5%D1%81%D0%BB%D0%B8%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B0%D0%B5%D1%82%20target%2C%20%D0%BD%D0%B5%D0%BC%D0%B5%D0%B4%D0%BB%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D1%82%D1%8C%20%D1%86%D0%B8%D0%BA%D0%BB%0A%20%20%20%20%20%20%20%20%23%20%D0%AD%D1%82%D0%BE%20%D1%81%D0%B2%D1%8F%D0%B7%D0%B0%D0%BD%D0%BE%20%D1%81%20%D1%82%D0%B5%D0%BC%2C%20%D1%87%D1%82%D0%BE%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%83%D0%B6%D0%B5%20%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%2C%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%2C%20%D0%B8%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%82%D0%BE%D1%87%D0%BD%D0%BE%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%81%D0%B8%D1%82%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%3A%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20target%20%D0%B8%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B9%D1%82%D0%B8%20%D0%BA%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B5%D0%BC%D1%83%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D1%83%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%20-%20choices%5Bi%5D%2C%20choices%2C%20i%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%3A%20%D0%BE%D1%82%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D1%8B%D0%B4%D1%83%D1%89%D0%B5%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B5%D1%88%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%20I%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%D0%A1%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%20%28%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%BE%29%0A%20%20%20%20nums.sort%28%29%20%20%23%20%D0%9E%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20nums%0A%20%20%20%20start%20%3D%200%20%20%23%20%D0%A1%D1%82%D0%B0%D1%80%D1%82%D0%BE%D0%B2%D0%B0%D1%8F%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D0%B0%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B0%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D0%BE%D0%B2%20%28%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%29%0A%20%20%20%20backtrack%28state%2C%20target%2C%20nums%2C%20start%2C%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i%28nums%2C%20target%29%0A%0A%20%20%20%20print%28f%22%D0%92%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%81%20%D1%81%D1%83%D0%BC%D0%BC%D0%BE%D0%B9%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%20target%3A%20int%2C%20choices%3A%20list%5Bint%5D%2C%20start%3A%20int%2C%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%20%D0%B1%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%D0%B0%3A%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%20I%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20target%2C%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D1%8B%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0%0A%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%202%3A%20%D0%BD%D0%B0%D1%87%D0%B8%D0%BD%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%20%D1%81%20start%2C%20%D1%87%D1%82%D0%BE%D0%B1%D1%8B%20%D0%B8%D0%B7%D0%B1%D0%B5%D0%B6%D0%B0%D1%82%D1%8C%20%D0%B3%D0%B5%D0%BD%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D1%85%D1%81%D1%8F%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%0A%20%20%20%20for%20i%20in%20range%28start%2C%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%201%3A%20%D0%B5%D1%81%D0%BB%D0%B8%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B0%D0%B5%D1%82%20target%2C%20%D0%BD%D0%B5%D0%BC%D0%B5%D0%B4%D0%BB%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D1%82%D1%8C%20%D1%86%D0%B8%D0%BA%D0%BB%0A%20%20%20%20%20%20%20%20%23%20%D0%AD%D1%82%D0%BE%20%D1%81%D0%B2%D1%8F%D0%B7%D0%B0%D0%BD%D0%BE%20%D1%81%20%D1%82%D0%B5%D0%BC%2C%20%D1%87%D1%82%D0%BE%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%83%D0%B6%D0%B5%20%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%2C%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%2C%20%D0%B8%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%82%D0%BE%D1%87%D0%BD%D0%BE%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%81%D0%B8%D1%82%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%3A%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20target%20%D0%B8%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B9%D1%82%D0%B8%20%D0%BA%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B5%D0%BC%D1%83%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D1%83%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%20-%20choices%5Bi%5D%2C%20choices%2C%20i%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%3A%20%D0%BE%D1%82%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D1%8B%D0%B4%D1%83%D1%89%D0%B5%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B5%D1%88%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%20I%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%D0%A1%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%20%28%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%BE%29%0A%20%20%20%20nums.sort%28%29%20%20%23%20%D0%9E%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20nums%0A%20%20%20%20start%20%3D%200%20%20%23%20%D0%A1%D1%82%D0%B0%D1%80%D1%82%D0%BE%D0%B2%D0%B0%D1%8F%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D0%B0%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B0%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D0%BE%D0%B2%20%28%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%29%0A%20%20%20%20backtrack%28state%2C%20target%2C%20nums%2C%20start%2C%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i%28nums%2C%20target%29%0A%0A%20%20%20%20print%28f%22%D0%92%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%81%20%D1%81%D1%83%D0%BC%D0%BC%D0%BE%D0%B9%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

На рисунке 13-12 показан полный процесс поиска с возвратом для массива $[3, 4, 5]$ и целевого значения $9$ .

![Процесс поиска с возвратом для задачи о сумме подмножеств I](subset_sum_problem.assets/subset_sum_i.png){ class="animation-figure" }

<p align="center"> Рисунок 13-12 &nbsp; Процесс поиска с возвратом для задачи о сумме подмножеств I </p>

## 13.3.2 &nbsp; Учет повторяющихся элементов

!!! question

    Дан массив положительных целых чисел `nums` и целое положительное значение `target` . Найдите все возможные комбинации, сумма элементов которых равна `target` . **Во входном массиве могут присутствовать повторяющиеся элементы, и каждый элемент разрешено выбирать только один раз**. Верните эти комбинации в виде списка; в результате не должно быть повторяющихся комбинаций.

По сравнению с предыдущей задачей **во входном массиве теперь могут присутствовать повторяющиеся элементы**, и это создает новую проблему. Например, если дан массив $[4, \hat{4}, 5]$ и целевое значение $9$ , то существующий код вернет результат $[4, 5], [\hat{4}, 5]$ , то есть с повторяющимся подмножеством.

**Причина появления дублей в том, что равные элементы выбираются несколько раз в одном и том же раунде**. На рисунке 13-13 в первом раунде существует три варианта выбора, и два из них равны $4$ ; из-за этого появляются две дублирующиеся ветви поиска и, соответственно, повторяющиеся подмножества. Точно так же два элемента $4$ во втором раунде тоже порождают дубликаты.

![Повторяющиеся подмножества из-за равных элементов](subset_sum_problem.assets/subset_sum_ii_repeat.png){ class="animation-figure" }

<p align="center"> Рисунок 13-13 &nbsp; Повторяющиеся подмножества из-за равных элементов </p>

### 1. &nbsp; Обрезка равных элементов

Чтобы решить эту проблему, **нужно ограничить выбор равных элементов так, чтобы в каждом раунде каждый из них выбирался только один раз**. Реализуется это довольно естественно: поскольку массив отсортирован, равные элементы стоят рядом. Значит, если в текущем раунде текущий элемент равен соседнему слева, то этот вариант уже был рассмотрен, и текущий элемент нужно пропустить.

Одновременно **по условию этой задачи каждый элемент массива можно выбрать только один раз**. К счастью, это ограничение тоже можно реализовать через переменную `start` : после выбора элемента $x_i$ следующий раунд начинается с индекса $i + 1$ . Так мы одновременно убираем повторяющиеся подмножества и исключаем повторный выбор одного и того же элемента.

### 2. &nbsp; Реализация кода

=== "Python"

    ```python title="subset_sum_ii.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """Алгоритм бэктрекинга: сумма подмножеств II"""
        # Если сумма подмножества равна target, записать решение
        if target == 0:
            res.append(list(state))
            return
        # Обойти все варианты выбора
        # Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        # Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for i in range(start, len(choices)):
            # Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            # Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if target - choices[i] < 0:
                break
            # Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if i > start and choices[i] == choices[i - 1]:
                continue
            # Попытка: сделать выбор и обновить target и start
            state.append(choices[i])
            # Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i + 1, res)
            # Откат: отменить выбор и восстановить предыдущее состояние
            state.pop()

    def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
        """Решить задачу суммы подмножеств II"""
        state = []  # Состояние (подмножество)
        nums.sort()  # Отсортировать nums
        start = 0  # Стартовая вершина обхода
        res = []  # Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_ii.cpp"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for (int i = start; i < choices.size(); i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Попытка: сделать выбор и обновить target и start
            state.push_back(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop_back();
        }
    }

    /* Решить задачу суммы подмножеств II */
    vector<vector<int>> subsetSumII(vector<int> &nums, int target) {
        vector<int> state;              // Состояние (подмножество)
        sort(nums.begin(), nums.end()); // Отсортировать nums
        int start = 0;                  // Стартовая вершина обхода
        vector<vector<int>> res;        // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_ii.java"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for (int i = start; i < choices.length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Попытка: сделать выбор и обновить target и start
            state.add(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.remove(state.size() - 1);
        }
    }

    /* Решить задачу суммы подмножеств II */
    List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Состояние (подмножество)
        Arrays.sort(nums); // Отсортировать nums
        int start = 0; // Стартовая вершина обхода
        List<List<Integer>> res = new ArrayList<>(); // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_ii.cs"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for (int i = start; i < choices.Length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Попытка: сделать выбор и обновить target и start
            state.Add(choices[i]);
            // Перейти к следующему выбору
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Решить задачу суммы подмножеств II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // Состояние (подмножество)
        Array.Sort(nums); // Отсортировать nums
        int start = 0; // Стартовая вершина обхода
        List<List<int>> res = []; // Список результатов (список подмножеств)
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_ii.go"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
        // Если сумма подмножества равна target, записать решение
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for i := start; i < len(*choices); i++ {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if target-(*choices)[i] < 0 {
                break
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if i > start && (*choices)[i] == (*choices)[i-1] {
                continue
            }
            // Попытка: сделать выбор и обновить target и start
            *state = append(*state, (*choices)[i])
            // Перейти к следующему выбору
            backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            *state = (*state)[:len(*state)-1]
        }
    }

    /* Решить задачу суммы подмножеств II */
    func subsetSumII(nums []int, target int) [][]int {
        state := make([]int, 0) // Состояние (подмножество)
        sort.Ints(nums)         // Отсортировать nums
        start := 0              // Стартовая вершина обхода
        res := make([][]int, 0) // Список результатов (список подмножеств)
        backtrackSubsetSumII(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_ii.swift"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // Если сумма подмножества равна target, записать решение
        if target == 0 {
            res.append(state)
            return
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for i in choices.indices.dropFirst(start) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if target - choices[i] < 0 {
                break
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if i > start, choices[i] == choices[i - 1] {
                continue
            }
            // Попытка: сделать выбор и обновить target и start
            state.append(choices[i])
            // Перейти к следующему выбору
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.removeLast()
        }
    }

    /* Решить задачу суммы подмножеств II */
    func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // Состояние (подмножество)
        let nums = nums.sorted() // Отсортировать nums
        let start = 0 // Стартовая вершина обхода
        var res: [[Int]] = [] // Список результатов (список подмножеств)
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_ii.js"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    function backtrack(state, target, choices, start, res) {
        // Если сумма подмножества равна target, записать решение
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for (let i = start; i < choices.length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // Попытка: сделать выбор и обновить target и start
            state.push(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop();
        }
    }

    /* Решить задачу суммы подмножеств II */
    function subsetSumII(nums, target) {
        const state = []; // Состояние (подмножество)
        nums.sort((a, b) => a - b); // Отсортировать nums
        const start = 0; // Стартовая вершина обхода
        const res = []; // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_ii.ts"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // Если сумма подмножества равна target, записать решение
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for (let i = start; i < choices.length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // Попытка: сделать выбор и обновить target и start
            state.push(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop();
        }
    }

    /* Решить задачу суммы подмножеств II */
    function subsetSumII(nums: number[], target: number): number[][] {
        const state = []; // Состояние (подмножество)
        nums.sort((a, b) => a - b); // Отсортировать nums
        const start = 0; // Стартовая вершина обхода
        const res = []; // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_ii.dart"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // Если сумма подмножества равна target, записать решение
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // Обойти все варианты выбора
      // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
      // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
      for (int i = start; i < choices.length; i++) {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if (target - choices[i] < 0) {
          break;
        }
        // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
        if (i > start && choices[i] == choices[i - 1]) {
          continue;
        }
        // Попытка: сделать выбор и обновить target и start
        state.add(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.removeLast();
      }
    }

    /* Решить задачу суммы подмножеств II */
    List<List<int>> subsetSumII(List<int> nums, int target) {
      List<int> state = []; // Состояние (подмножество)
      nums.sort(); // Отсортировать nums
      int start = 0; // Стартовая вершина обхода
      List<List<int>> res = []; // Список результатов (список подмножеств)
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_ii.rs"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // Если сумма подмножества равна target, записать решение
        if target == 0 {
            res.push(state.clone());
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for i in start..choices.len() {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if target - choices[i] < 0 {
                break;
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if i > start && choices[i] == choices[i - 1] {
                continue;
            }
            // Попытка: сделать выбор и обновить target и start
            state.push(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.pop();
        }
    }

    /* Решить задачу суммы подмножеств II */
    fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // Состояние (подмножество)
        nums.sort(); // Отсортировать nums
        let start = 0; // Стартовая вершина обхода
        let mut res = Vec::new(); // Список результатов (список подмножеств)
        backtrack(&mut state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_ii.c"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for (int i = start; i < choicesSize; i++) {
            // Отсечение 1: если сумма подмножества превышает target, сразу пропустить
            if (target - choices[i] < 0) {
                continue;
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Попытка: сделать выбор и обновить target и start
            state[stateSize] = choices[i];
            stateSize++;
            // Перейти к следующему выбору
            backtrack(target - choices[i], choices, choicesSize, i + 1);
            // Откат: отменить выбор и восстановить предыдущее состояние
            stateSize--;
        }
    }

    /* Решить задачу суммы подмножеств II */
    void subsetSumII(int *nums, int numsSize, int target) {
        // Отсортировать nums
        qsort(nums, numsSize, sizeof(int), cmp);
        // Начать бэктрекинг
        backtrack(target, nums, numsSize, 0);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_ii.kt"
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for (i in start..<choices.size) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
            if (i > start && choices[i] == choices[i - 1]) {
                continue
            }
            // Попытка: сделать выбор и обновить target и start
            state.add(choices[i])
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i + 1, res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.removeAt(state.size - 1)
        }
    }

    /* Решить задачу суммы подмножеств II */
    fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // Состояние (подмножество)
        nums.sort() // Отсортировать nums
        val start = 0 // Стартовая вершина обхода
        val res = mutableListOf<MutableList<Int>?>() // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_ii.rb"
    ### Алгоритм бэктрекинга: сумма подмножеств II ###
    def backtrack(state, target, choices, start, res)
      # Если сумма подмножества равна target, записать решение
      if target.zero?
        res << state.dup
        return
      end

      # Обойти все варианты выбора
      # Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
      # Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
      for i in start...choices.length
        # Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        # Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        break if target - choices[i] < 0
        # Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
        next if i > start && choices[i] == choices[i - 1]
        # Попытка: сделать выбор и обновить target и start
        state << choices[i]
        # Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res)
        # Откат: отменить выбор и восстановить предыдущее состояние
        state.pop
      end
    end

    ### Решить задачу суммы подмножеств II ###
    def subset_sum_ii(nums, target)
      state = [] # Состояние (подмножество)
      nums.sort! # Отсортировать nums
      start = 0 # Стартовая вершина обхода
      res = [] # Список результатов (список подмножеств)
      backtrack(state, target, nums, start, res)
      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28state%3A%20list%5Bint%5D%2C%20target%3A%20int%2C%20choices%3A%20list%5Bint%5D%2C%20start%3A%20int%2C%20res%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20for%20i%20in%20range%28start%2C%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20if%20i%20%3E%20start%20and%20choices%5Bi%5D%20%3D%3D%20choices%5Bi%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%20-%20choices%5Bi%5D%2C%20choices%2C%20i%20%2B%201%2C%20res%29%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0Adef%20subset_sum_ii%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20state%20%3D%20%5B%5D%0A%20%20%20%20nums.sort%28%29%0A%20%20%20%20start%20%3D%200%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%2C%20target%2C%20nums%2C%20start%2C%20res%29%0A%20%20%20%20return%20res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_ii%28nums%2C%20target%29%0A%20%20%20%20print%28f%27%D0%92%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%27%29%0A%20%20%20%20print%28f%27%D0%92%D1%81%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%81%20%D1%81%D1%83%D0%BC%D0%BC%D0%BE%D0%B9%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%27%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28state%3A%20list%5Bint%5D%2C%20target%3A%20int%2C%20choices%3A%20list%5Bint%5D%2C%20start%3A%20int%2C%20res%3A%20list%5Blist%5Bint%5D%5D%29%3A%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20for%20i%20in%20range%28start%2C%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20if%20i%20%3E%20start%20and%20choices%5Bi%5D%20%3D%3D%20choices%5Bi%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%20-%20choices%5Bi%5D%2C%20choices%2C%20i%20%2B%201%2C%20res%29%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0Adef%20subset_sum_ii%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20state%20%3D%20%5B%5D%0A%20%20%20%20nums.sort%28%29%0A%20%20%20%20start%20%3D%200%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%2C%20target%2C%20nums%2C%20start%2C%20res%29%0A%20%20%20%20return%20res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_ii%28nums%2C%20target%29%0A%20%20%20%20print%28f%27%D0%92%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%27%29%0A%20%20%20%20print%28f%27%D0%92%D1%81%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%BD%D0%BE%D0%B6%D0%B5%D1%81%D1%82%D0%B2%D0%B0%20%D1%81%20%D1%81%D1%83%D0%BC%D0%BC%D0%BE%D0%B9%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%27%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

На рисунке 13-14 показан процесс поиска с возвратом для массива $[4, 4, 5]$ и целевого значения $9$ . В нем используются четыре вида обрезки. Попробуйте сопоставить рисунок с комментариями в коде, чтобы понять полный процесс поиска и то, как работает каждый тип обрезки.

![Процесс поиска с возвратом для задачи о сумме подмножеств II](subset_sum_problem.assets/subset_sum_ii.png){ class="animation-figure" }

<p align="center"> Рисунок 13-14 &nbsp; Процесс поиска с возвратом для задачи о сумме подмножеств II </p>
