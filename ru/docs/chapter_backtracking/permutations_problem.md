---
comments: true
---

# 13.2 &nbsp; Задача о перестановках

Задача о перестановках является типичным применением алгоритма поиска с возвратом. Ее определение состоит в том, чтобы для данного множества элементов (например, массива или строки) найти все возможные перестановки этих элементов.

В таблице 13-2 приведено несколько примеров входных массивов и соответствующих им перестановок.

<p align="center"> Таблица 13-2 &nbsp; Примеры перестановок </p>

<div class="center-table" markdown>

| Входной массив | Все перестановки                                                   |
| :------------- | :----------------------------------------------------------------- |
| $[1]$          | $[1]$                                                              |
| $[1, 2]$       | $[1, 2], [2, 1]$                                                   |
| $[1, 2, 3]$    | $[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]$ |

</div>

## 13.2.1 &nbsp; Случай без равных элементов

!!! question

    Дан массив целых чисел, в котором нет повторяющихся элементов. Верните все возможные перестановки.

С точки зрения backtracking **процесс построения перестановок можно представить как результат последовательности выборов**. Пусть входной массив равен $[1, 2, 3]$ ; если мы сначала выберем $1$ , затем $3$ , а потом $2$ , то получим перестановку $[1, 3, 2]$ . Откат означает отмену одного из выборов с последующей попыткой других вариантов.

С точки зрения кода backtracking множество кандидатов `choices` состоит из всех элементов входного массива, а состояние `state` - из элементов, уже выбранных к текущему моменту. Обратите внимание, что каждый элемент разрешено выбирать только один раз, **поэтому все элементы в `state` должны быть уникальны**.

Как показано на рисунке 13-5, процесс поиска можно развернуть в дерево рекурсии, где каждый узел представляет текущее состояние `state` . Начиная от корня, после трех раундов выбора мы попадаем в листья, и каждый лист соответствует одной перестановке.

![Дерево рекурсии для перестановок](permutations_problem.assets/permutations_i.png){ class="animation-figure" }

<p align="center"> Рисунок 13-5 &nbsp; Дерево рекурсии для перестановок </p>

### 1. &nbsp; Обрезка повторного выбора

Чтобы гарантировать, что каждый элемент выбирается только один раз, введем булев массив `selected` , где `selected[i]` обозначает, был ли уже выбран `choices[i]` , и на его основе выполним следующую обрезку.

- После того как сделан выбор `choice[i]` , мы присваиваем `selected[i]` значение $\text{True}$ , тем самым отмечая, что этот элемент уже выбран.
- При обходе списка вариантов `choices` пропускаем все уже выбранные элементы, то есть выполняем обрезку.

Как показано на рисунке 13-6, если в первом раунде мы выберем 1 , во втором - 3 , а в третьем - 2 , то во втором раунде нужно отсечь ветвь элемента 1 , а в третьем - ветви элементов 1 и 3 .

![Пример обрезки в задаче о перестановках](permutations_problem.assets/permutations_i_pruning.png){ class="animation-figure" }

<p align="center"> Рисунок 13-6 &nbsp; Пример обрезки в задаче о перестановках </p>

Из рисунка видно, что такая обрезка уменьшает размер пространства поиска с $O(n^n)$ до $O(n!)$ .

### 2. &nbsp; Реализация кода

После прояснения всей логики можно просто "заполнить пропуски" в шаблоне backtracking. Чтобы сократить общий объем кода, мы не будем отдельно реализовывать каждую функцию из каркаса, а раскроем их прямо внутри `backtrack()` :

=== "Python"

    ```python title="permutations_i.py"
    def backtrack(
        state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
    ):
        """Алгоритм бэктрекинга: все перестановки I"""
        # Когда длина состояния равна числу элементов, записать решение
        if len(state) == len(choices):
            res.append(list(state))
            return
        # Перебор всех вариантов выбора
        for i, choice in enumerate(choices):
            # Отсечение: нельзя выбирать один и тот же элемент повторно
            if not selected[i]:
                # Попытка: сделать выбор и обновить состояние
                selected[i] = True
                state.append(choice)
                # Перейти к следующему выбору
                backtrack(state, choices, selected, res)
                # Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = False
                state.pop()

    def permutations_i(nums: list[int]) -> list[list[int]]:
        """Все перестановки I"""
        res = []
        backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
        return res
    ```

=== "C++"

    ```cpp title="permutations_i.cpp"
    /* Алгоритм бэктрекинга: все перестановки I */
    void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.size() == choices.size()) {
            res.push_back(state);
            return;
        }
        // Перебор всех вариантов выбора
        for (int i = 0; i < choices.size(); i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if (!selected[i]) {
                // Попытка: сделать выбор и обновить состояние
                selected[i] = true;
                state.push_back(choice);
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.pop_back();
            }
        }
    }

    /* Все перестановки I */
    vector<vector<int>> permutationsI(vector<int> nums) {
        vector<int> state;
        vector<bool> selected(nums.size(), false);
        vector<vector<int>> res;
        backtrack(state, nums, selected, res);
        return res;
    }
    ```

=== "Java"

    ```java title="permutations_i.java"
    /* Алгоритм бэктрекинга: все перестановки I */
    void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Перебор всех вариантов выбора
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if (!selected[i]) {
                // Попытка: сделать выбор и обновить состояние
                selected[i] = true;
                state.add(choice);
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Все перестановки I */
    List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="permutations_i.cs"
    /* Алгоритм бэктрекинга: все перестановки I */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебор всех вариантов выбора
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if (!selected[i]) {
                // Попытка: сделать выбор и обновить состояние
                selected[i] = true;
                state.Add(choice);
                // Перейти к следующему выбору
                Backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Все перестановки I */
    List<List<int>> PermutationsI(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }
    ```

=== "Go"

    ```go title="permutations_i.go"
    /* Алгоритм бэктрекинга: все перестановки I */
    func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
        // Когда длина состояния равна числу элементов, записать решение
        if len(*state) == len(*choices) {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
        }
        // Перебор всех вариантов выбора
        for i := 0; i < len(*choices); i++ {
            choice := (*choices)[i]
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if !(*selected)[i] {
                // Попытка: сделать выбор и обновить состояние
                (*selected)[i] = true
                *state = append(*state, choice)
                // Перейти к следующему выбору
                backtrackI(state, choices, selected, res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                (*selected)[i] = false
                *state = (*state)[:len(*state)-1]
            }
        }
    }

    /* Все перестановки I */
    func permutationsI(nums []int) [][]int {
        res := make([][]int, 0)
        state := make([]int, 0)
        selected := make([]bool, len(nums))
        backtrackI(&state, &nums, &selected, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="permutations_i.swift"
    /* Алгоритм бэктрекинга: все перестановки I */
    func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
        // Когда длина состояния равна числу элементов, записать решение
        if state.count == choices.count {
            res.append(state)
            return
        }
        // Перебор всех вариантов выбора
        for (i, choice) in choices.enumerated() {
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if !selected[i] {
                // Попытка: сделать выбор и обновить состояние
                selected[i] = true
                state.append(choice)
                // Перейти к следующему выбору
                backtrack(state: &state, choices: choices, selected: &selected, res: &res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false
                state.removeLast()
            }
        }
    }

    /* Все перестановки I */
    func permutationsI(nums: [Int]) -> [[Int]] {
        var state: [Int] = []
        var selected = Array(repeating: false, count: nums.count)
        var res: [[Int]] = []
        backtrack(state: &state, choices: nums, selected: &selected, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="permutations_i.js"
    /* Алгоритм бэктрекинга: все перестановки I */
    function backtrack(state, choices, selected, res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Перебор всех вариантов выбора
        choices.forEach((choice, i) => {
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if (!selected[i]) {
                // Попытка: сделать выбор и обновить состояние
                selected[i] = true;
                state.push(choice);
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Все перестановки I */
    function permutationsI(nums) {
        const res = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="permutations_i.ts"
    /* Алгоритм бэктрекинга: все перестановки I */
    function backtrack(
        state: number[],
        choices: number[],
        selected: boolean[],
        res: number[][]
    ): void {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Перебор всех вариантов выбора
        choices.forEach((choice, i) => {
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if (!selected[i]) {
                // Попытка: сделать выбор и обновить состояние
                selected[i] = true;
                state.push(choice);
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Все перестановки I */
    function permutationsI(nums: number[]): number[][] {
        const res: number[][] = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="permutations_i.dart"
    /* Алгоритм бэктрекинга: все перестановки I */
    void backtrack(
      List<int> state,
      List<int> choices,
      List<bool> selected,
      List<List<int>> res,
    ) {
      // Когда длина состояния равна числу элементов, записать решение
      if (state.length == choices.length) {
        res.add(List.from(state));
        return;
      }
      // Перебор всех вариантов выбора
      for (int i = 0; i < choices.length; i++) {
        int choice = choices[i];
        // Отсечение: нельзя выбирать один и тот же элемент повторно
        if (!selected[i]) {
          // Попытка: сделать выбор и обновить состояние
          selected[i] = true;
          state.add(choice);
          // Перейти к следующему выбору
          backtrack(state, choices, selected, res);
          // Откат: отменить выбор и восстановить предыдущее состояние
          selected[i] = false;
          state.removeLast();
        }
      }
    }

    /* Все перестановки I */
    List<List<int>> permutationsI(List<int> nums) {
      List<List<int>> res = [];
      backtrack([], nums, List.filled(nums.length, false), res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="permutations_i.rs"
    /* Алгоритм бэктрекинга: все перестановки I */
    fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
        // Когда длина состояния равна числу элементов, записать решение
        if state.len() == choices.len() {
            res.push(state);
            return;
        }
        // Перебор всех вариантов выбора
        for i in 0..choices.len() {
            let choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if !selected[i] {
                // Попытка: сделать выбор и обновить состояние
                selected[i] = true;
                state.push(choice);
                // Перейти к следующему выбору
                backtrack(state.clone(), choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.pop();
            }
        }
    }

    /* Все перестановки I */
    fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
        let mut res = Vec::new(); // Состояние (подмножество)
        backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
        res
    }
    ```

=== "C"

    ```c title="permutations_i.c"
    /* Алгоритм бэктрекинга: все перестановки I */
    void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
        // Когда длина состояния равна числу элементов, записать решение
        if (stateSize == choicesSize) {
            res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
            for (int i = 0; i < choicesSize; i++) {
                res[*resSize][i] = state[i];
            }
            (*resSize)++;
            return;
        }
        // Перебор всех вариантов выбора
        for (int i = 0; i < choicesSize; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if (!selected[i]) {
                // Попытка: сделать выбор и обновить состояние
                selected[i] = true;
                state[stateSize] = choice;
                // Перейти к следующему выбору
                backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
            }
        }
    }

    /* Все перестановки I */
    int **permutationsI(int *nums, int numsSize, int *returnSize) {
        int *state = (int *)malloc(numsSize * sizeof(int));
        bool *selected = (bool *)malloc(numsSize * sizeof(bool));
        for (int i = 0; i < numsSize; i++) {
            selected[i] = false;
        }
        int **res = (int **)malloc(MAX_SIZE * sizeof(int *));
        *returnSize = 0;

        backtrack(state, 0, nums, numsSize, selected, res, returnSize);

        free(state);
        free(selected);

        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="permutations_i.kt"
    /* Алгоритм бэктрекинга: все перестановки I */
    fun backtrack(
        state: MutableList<Int>,
        choices: IntArray,
        selected: BooleanArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.size == choices.size) {
            res.add(state.toMutableList())
            return
        }
        // Перебор всех вариантов выбора
        for (i in choices.indices) {
            val choice = choices[i]
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if (!selected[i]) {
                // Попытка: сделать выбор и обновить состояние
                selected[i] = true
                state.add(choice)
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false
                state.removeAt(state.size - 1)
            }
        }
    }

    /* Все перестановки I */
    fun permutationsI(nums: IntArray): MutableList<MutableList<Int>?> {
        val res = mutableListOf<MutableList<Int>?>()
        backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="permutations_i.rb"
    =begin
    File: permutations_i.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    # ## Алгоритм бэктрекинга: все перестановки I ###
    def backtrack(state, choices, selected, res)
      # Когда длина состояния равна числу элементов, записать решение
      if state.length == choices.length
        res << state.dup
        return
      end

      # Перебор всех вариантов выбора
      choices.each_with_index do |choice, i|
        # Отсечение: нельзя выбирать один и тот же элемент повторно
        unless selected[i]
          # Попытка: сделать выбор и обновить состояние
          selected[i] = true
          state << choice
          # Перейти к следующему выбору
          backtrack(state, choices, selected, res)
          # Откат: отменить выбор и восстановить предыдущее состояние
          selected[i] = false
          state.pop
        end
      end
    end

    =begin
    File: permutations_i.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    # ## Алгоритм бэктрекинга: все перестановки I ###
    def backtrack(state, choices, selected, res)
      # Когда длина состояния равна числу элементов, записать решение
      if state.length == choices.length
        res << state.dup
        return
      end

      # Перебор всех вариантов выбора
      choices.each_with_index do |choice, i|
        # Отсечение: нельзя выбирать один и тот же элемент повторно
        unless selected[i]
          # Попытка: сделать выбор и обновить состояние
          selected[i] = true
          state << choice
          # Перейти к следующему выбору
          backtrack(state, choices, selected, res)
          # Откат: отменить выбор и восстановить предыдущее состояние
          selected[i] = false
          state.pop
        end
      end
    end

    # ## Все перестановки I ###
    def permutations_i(nums)
      res = []
      backtrack([], nums, Array.new(nums.length, false), res)
      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%20choices%3A%20list%5Bint%5D%2C%20selected%3A%20list%5Bbool%5D%2C%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%20%D0%B1%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%D0%B0%3A%20%D0%B2%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20I%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20%D1%87%D0%B8%D1%81%D0%BB%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%2C%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D1%81%D0%B5%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0%0A%20%20%20%20for%20i%2C%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%B8%20%D1%82%D0%BE%D1%82%20%D0%B6%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D0%BD%D0%BE%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%3A%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B9%D1%82%D0%B8%20%D0%BA%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B5%D0%BC%D1%83%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D1%83%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state%2C%20choices%2C%20selected%2C%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%3A%20%D0%BE%D1%82%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D1%8B%D0%B4%D1%83%D1%89%D0%B5%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_i%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20I%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D%2C%20choices%3Dnums%2C%20selected%3D%5BFalse%5D%20%2A%20len%28nums%29%2C%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1%2C%202%2C%203%5D%0A%0A%20%20%20%20res%20%3D%20permutations_i%28nums%29%0A%0A%20%20%20%20print%28f%22%D0%92%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%20choices%3A%20list%5Bint%5D%2C%20selected%3A%20list%5Bbool%5D%2C%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%20%D0%B1%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%D0%B0%3A%20%D0%B2%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20I%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20%D1%87%D0%B8%D1%81%D0%BB%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%2C%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D1%81%D0%B5%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0%0A%20%20%20%20for%20i%2C%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%B8%20%D1%82%D0%BE%D1%82%20%D0%B6%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D0%BD%D0%BE%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%3A%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B9%D1%82%D0%B8%20%D0%BA%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B5%D0%BC%D1%83%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D1%83%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state%2C%20choices%2C%20selected%2C%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%3A%20%D0%BE%D1%82%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D1%8B%D0%B4%D1%83%D1%89%D0%B5%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_i%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20I%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D%2C%20choices%3Dnums%2C%20selected%3D%5BFalse%5D%20%2A%20len%28nums%29%2C%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1%2C%202%2C%203%5D%0A%0A%20%20%20%20res%20%3D%20permutations_i%28nums%29%0A%0A%20%20%20%20print%28f%22%D0%92%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 13.2.2 &nbsp; Учет равных элементов

!!! question

    Дан массив целых чисел, **который может содержать повторяющиеся элементы**. Верните все неповторяющиеся перестановки.

Пусть входной массив равен $[1, 1, 2]$ . Чтобы различать два одинаковых элемента $1$ , будем обозначать второй из них как $\hat{1}$ .

Как показано на рисунке 13-7, описанный выше метод создаст результат, половина которого окажется дублирующейся.

![Повторяющиеся перестановки](permutations_problem.assets/permutations_ii.png){ class="animation-figure" }

<p align="center"> Рисунок 13-7 &nbsp; Повторяющиеся перестановки </p>

Как же убрать повторяющиеся перестановки? Самый прямолинейный способ - воспользоваться хеш-множеством и удалить дубликаты уже после генерации результата. Но это не слишком изящно, **потому что ветви поиска, порождающие дубликаты, вообще не нужно посещать: их следует распознавать заранее и отсекать**, что дополнительно повышает эффективность алгоритма.

### 1. &nbsp; Обрезка равных элементов

Посмотрите на рисунок 13-8: в первом раунде выбрать $1$ или выбрать $\hat{1}$ - это одно и то же, а значит, все перестановки, полученные из этих двух выборов, будут дублироваться. Поэтому ветвь $\hat{1}$ нужно отсечь.

Точно так же, если в первом раунде выбрать $2$ , то во втором раунде выборы $1$ и $\hat{1}$ снова создадут дублирующиеся ветви, поэтому и в этом случае ветвь $\hat{1}$ нужно отсечь.

По своей сути **наша цель заключается в том, чтобы на каждом раунде выбора каждый из нескольких равных элементов выбирался только один раз**.

![Обрезка повторяющихся перестановок](permutations_problem.assets/permutations_ii_pruning.png){ class="animation-figure" }

<p align="center"> Рисунок 13-8 &nbsp; Обрезка повторяющихся перестановок </p>

### 2. &nbsp; Реализация кода

На основе решения из предыдущей задачи можно на каждом раунде выбора заводить хеш-множество `duplicated` , которое будет записывать элементы, уже встречавшиеся в этом раунде, и отсекать повторы:

=== "Python"

    ```python title="permutations_ii.py"
    def backtrack(
        state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
    ):
        """Алгоритм бэктрекинга: все перестановки II"""
        # Когда длина состояния равна числу элементов, записать решение
        if len(state) == len(choices):
            res.append(list(state))
            return
        # Перебор всех вариантов выбора
        duplicated = set[int]()
        for i, choice in enumerate(choices):
            # Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if not selected[i] and choice not in duplicated:
                # Попытка: сделать выбор и обновить состояние
                duplicated.add(choice)  # Записать значения уже выбранных элементов
                selected[i] = True
                state.append(choice)
                # Перейти к следующему выбору
                backtrack(state, choices, selected, res)
                # Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = False
                state.pop()

    def permutations_ii(nums: list[int]) -> list[list[int]]:
        """Все перестановки II"""
        res = []
        backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
        return res
    ```

=== "C++"

    ```cpp title="permutations_ii.cpp"
    /* Алгоритм бэктрекинга: все перестановки II */
    void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.size() == choices.size()) {
            res.push_back(state);
            return;
        }
        // Перебор всех вариантов выбора
        unordered_set<int> duplicated;
        for (int i = 0; i < choices.size(); i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
                // Попытка: сделать выбор и обновить состояние
                duplicated.emplace(choice); // Записать значения уже выбранных элементов
                selected[i] = true;
                state.push_back(choice);
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.pop_back();
            }
        }
    }

    /* Все перестановки II */
    vector<vector<int>> permutationsII(vector<int> nums) {
        vector<int> state;
        vector<bool> selected(nums.size(), false);
        vector<vector<int>> res;
        backtrack(state, nums, selected, res);
        return res;
    }
    ```

=== "Java"

    ```java title="permutations_ii.java"
    /* Алгоритм бэктрекинга: все перестановки II */
    void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Перебор всех вариантов выбора
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if (!selected[i] && !duplicated.contains(choice)) {
                // Попытка: сделать выбор и обновить состояние
                duplicated.add(choice); // Записать значения уже выбранных элементов
                selected[i] = true;
                state.add(choice);
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Все перестановки II */
    List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="permutations_ii.cs"
    /* Алгоритм бэктрекинга: все перестановки II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебор всех вариантов выбора
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if (!selected[i] && !duplicated.Contains(choice)) {
                // Попытка: сделать выбор и обновить состояние
                duplicated.Add(choice); // Записать значения уже выбранных элементов
                selected[i] = true;
                state.Add(choice);
                // Перейти к следующему выбору
                Backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Все перестановки II */
    List<List<int>> PermutationsII(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }
    ```

=== "Go"

    ```go title="permutations_ii.go"
    /* Алгоритм бэктрекинга: все перестановки II */
    func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
        // Когда длина состояния равна числу элементов, записать решение
        if len(*state) == len(*choices) {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
        }
        // Перебор всех вариантов выбора
        duplicated := make(map[int]struct{}, 0)
        for i := 0; i < len(*choices); i++ {
            choice := (*choices)[i]
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
                // Попробовать: сделать выбор, обновить состояние
                // Записать значение уже выбранного элемента
                duplicated[choice] = struct{}{}
                (*selected)[i] = true
                *state = append(*state, choice)
                // Перейти к следующему выбору
                backtrackII(state, choices, selected, res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                (*selected)[i] = false
                *state = (*state)[:len(*state)-1]
            }
        }
    }

    /* Все перестановки II */
    func permutationsII(nums []int) [][]int {
        res := make([][]int, 0)
        state := make([]int, 0)
        selected := make([]bool, len(nums))
        backtrackII(&state, &nums, &selected, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="permutations_ii.swift"
    /* Алгоритм бэктрекинга: все перестановки II */
    func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
        // Когда длина состояния равна числу элементов, записать решение
        if state.count == choices.count {
            res.append(state)
            return
        }
        // Перебор всех вариантов выбора
        var duplicated: Set<Int> = []
        for (i, choice) in choices.enumerated() {
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if !selected[i], !duplicated.contains(choice) {
                // Попытка: сделать выбор и обновить состояние
                duplicated.insert(choice) // Записать значения уже выбранных элементов
                selected[i] = true
                state.append(choice)
                // Перейти к следующему выбору
                backtrack(state: &state, choices: choices, selected: &selected, res: &res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false
                state.removeLast()
            }
        }
    }

    /* Все перестановки II */
    func permutationsII(nums: [Int]) -> [[Int]] {
        var state: [Int] = []
        var selected = Array(repeating: false, count: nums.count)
        var res: [[Int]] = []
        backtrack(state: &state, choices: nums, selected: &selected, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="permutations_ii.js"
    /* Алгоритм бэктрекинга: все перестановки II */
    function backtrack(state, choices, selected, res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Перебор всех вариантов выбора
        const duplicated = new Set();
        choices.forEach((choice, i) => {
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if (!selected[i] && !duplicated.has(choice)) {
                // Попытка: сделать выбор и обновить состояние
                duplicated.add(choice); // Записать значения уже выбранных элементов
                selected[i] = true;
                state.push(choice);
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Все перестановки II */
    function permutationsII(nums) {
        const res = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="permutations_ii.ts"
    /* Алгоритм бэктрекинга: все перестановки II */
    function backtrack(
        state: number[],
        choices: number[],
        selected: boolean[],
        res: number[][]
    ): void {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Перебор всех вариантов выбора
        const duplicated = new Set();
        choices.forEach((choice, i) => {
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if (!selected[i] && !duplicated.has(choice)) {
                // Попытка: сделать выбор и обновить состояние
                duplicated.add(choice); // Записать значения уже выбранных элементов
                selected[i] = true;
                state.push(choice);
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Все перестановки II */
    function permutationsII(nums: number[]): number[][] {
        const res: number[][] = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="permutations_ii.dart"
    /* Алгоритм бэктрекинга: все перестановки II */
    void backtrack(
      List<int> state,
      List<int> choices,
      List<bool> selected,
      List<List<int>> res,
    ) {
      // Когда длина состояния равна числу элементов, записать решение
      if (state.length == choices.length) {
        res.add(List.from(state));
        return;
      }
      // Перебор всех вариантов выбора
      Set<int> duplicated = {};
      for (int i = 0; i < choices.length; i++) {
        int choice = choices[i];
        // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
        if (!selected[i] && !duplicated.contains(choice)) {
          // Попытка: сделать выбор и обновить состояние
          duplicated.add(choice); // Записать значения уже выбранных элементов
          selected[i] = true;
          state.add(choice);
          // Перейти к следующему выбору
          backtrack(state, choices, selected, res);
          // Откат: отменить выбор и восстановить предыдущее состояние
          selected[i] = false;
          state.removeLast();
        }
      }
    }

    /* Все перестановки II */
    List<List<int>> permutationsII(List<int> nums) {
      List<List<int>> res = [];
      backtrack([], nums, List.filled(nums.length, false), res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="permutations_ii.rs"
    /* Алгоритм бэктрекинга: все перестановки II */
    fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
        // Когда длина состояния равна числу элементов, записать решение
        if state.len() == choices.len() {
            res.push(state);
            return;
        }
        // Перебор всех вариантов выбора
        let mut duplicated = HashSet::<i32>::new();
        for i in 0..choices.len() {
            let choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if !selected[i] && !duplicated.contains(&choice) {
                // Попытка: сделать выбор и обновить состояние
                duplicated.insert(choice); // Записать значения уже выбранных элементов
                selected[i] = true;
                state.push(choice);
                // Перейти к следующему выбору
                backtrack(state.clone(), choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.pop();
            }
        }
    }

    /* Все перестановки II */
    fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
        let mut res = Vec::new();
        backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
        res
    }
    ```

=== "C"

    ```c title="permutations_ii.c"
    /* Алгоритм бэктрекинга: все перестановки II */
    void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
        // Когда длина состояния равна числу элементов, записать решение
        if (stateSize == choicesSize) {
            res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
            for (int i = 0; i < choicesSize; i++) {
                res[*resSize][i] = state[i];
            }
            (*resSize)++;
            return;
        }
        // Перебор всех вариантов выбора
        bool duplicated[MAX_SIZE] = {false};
        for (int i = 0; i < choicesSize; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if (!selected[i] && !duplicated[choice]) {
                // Попытка: сделать выбор и обновить состояние
                duplicated[choice] = true; // Записать значения уже выбранных элементов
                selected[i] = true;
                state[stateSize] = choice;
                // Перейти к следующему выбору
                backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
            }
        }
    }

    /* Все перестановки II */
    int **permutationsII(int *nums, int numsSize, int *returnSize) {
        int *state = (int *)malloc(numsSize * sizeof(int));
        bool *selected = (bool *)malloc(numsSize * sizeof(bool));
        for (int i = 0; i < numsSize; i++) {
            selected[i] = false;
        }
        int **res = (int **)malloc(MAX_SIZE * sizeof(int *));
        *returnSize = 0;

        backtrack(state, 0, nums, numsSize, selected, res, returnSize);

        free(state);
        free(selected);

        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="permutations_ii.kt"
    /* Алгоритм бэктрекинга: все перестановки II */
    fun backtrack(
        state: MutableList<Int>,
        choices: IntArray,
        selected: BooleanArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.size == choices.size) {
            res.add(state.toMutableList())
            return
        }
        // Перебор всех вариантов выбора
        val duplicated = HashSet<Int>()
        for (i in choices.indices) {
            val choice = choices[i]
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if (!selected[i] && !duplicated.contains(choice)) {
                // Попытка: сделать выбор и обновить состояние
                duplicated.add(choice) // Записать значения уже выбранных элементов
                selected[i] = true
                state.add(choice)
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res)
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false
                state.removeAt(state.size - 1)
            }
        }
    }

    /* Все перестановки II */
    fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
        val res = mutableListOf<MutableList<Int>?>()
        backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="permutations_ii.rb"
    =begin
    File: permutations_ii.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    # ## Алгоритм бэктрекинга: все перестановки II ###
    def backtrack(state, choices, selected, res)
      # Когда длина состояния равна числу элементов, записать решение
      if state.length == choices.length
        res << state.dup
        return
      end

      # Перебор всех вариантов выбора
      duplicated = Set.new
      choices.each_with_index do |choice, i|
        # Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
        if !selected[i] && !duplicated.include?(choice)
          # Попытка: сделать выбор и обновить состояние
          duplicated.add(choice)
          selected[i] = true
          state << choice
          # Перейти к следующему выбору
          backtrack(state, choices, selected, res)
          # Откат: отменить выбор и восстановить предыдущее состояние
          selected[i] = false
          state.pop
        end
      end
    end

    =begin
    File: permutations_ii.rb
    Created Time: 2024-05-22
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    # ## Алгоритм бэктрекинга: все перестановки II ###
    def backtrack(state, choices, selected, res)
      # Когда длина состояния равна числу элементов, записать решение
      if state.length == choices.length
        res << state.dup
        return
      end

      # Перебор всех вариантов выбора
      duplicated = Set.new
      choices.each_with_index do |choice, i|
        # Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
        if !selected[i] && !duplicated.include?(choice)
          # Попытка: сделать выбор и обновить состояние
          duplicated.add(choice)
          selected[i] = true
          state << choice
          # Перейти к следующему выбору
          backtrack(state, choices, selected, res)
          # Откат: отменить выбор и восстановить предыдущее состояние
          selected[i] = false
          state.pop
        end
      end
    end

    # ## Все перестановки II ###
    def permutations_ii(nums)
      res = []
      backtrack([], nums, Array.new(nums.length, false), res)
      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%20choices%3A%20list%5Bint%5D%2C%20selected%3A%20list%5Bbool%5D%2C%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%20%D0%B1%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%D0%B0%3A%20%D0%B2%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20II%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20%D1%87%D0%B8%D1%81%D0%BB%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%2C%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D1%81%D0%B5%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0%0A%20%20%20%20duplicated%20%3D%20set%5Bint%5D%28%29%0A%20%20%20%20for%20i%2C%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%B8%20%D1%82%D0%BE%D1%82%20%D0%B6%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D0%BD%D0%BE%20%D0%B8%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D0%BD%D0%BE%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%20%D1%80%D0%B0%D0%B2%D0%BD%D1%8B%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%20and%20choice%20not%20in%20duplicated%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%3A%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20duplicated.add%28choice%29%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%83%D0%B6%D0%B5%20%D0%B2%D1%8B%D0%B1%D1%80%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B9%D1%82%D0%B8%20%D0%BA%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B5%D0%BC%D1%83%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D1%83%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state%2C%20choices%2C%20selected%2C%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%3A%20%D0%BE%D1%82%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D1%8B%D0%B4%D1%83%D1%89%D0%B5%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_ii%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20II%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D%2C%20choices%3Dnums%2C%20selected%3D%5BFalse%5D%20%2A%20len%28nums%29%2C%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1%2C%202%2C%202%5D%0A%0A%20%20%20%20res%20%3D%20permutations_ii%28nums%29%0A%0A%20%20%20%20print%28f%22%D0%92%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%20choices%3A%20list%5Bint%5D%2C%20selected%3A%20list%5Bbool%5D%2C%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC%20%D0%B1%D1%8D%D0%BA%D1%82%D1%80%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3%D0%B0%3A%20%D0%B2%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20II%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20%D1%87%D0%B8%D1%81%D0%BB%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%2C%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D1%81%D0%B5%D1%85%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0%0A%20%20%20%20duplicated%20%3D%20set%5Bint%5D%28%29%0A%20%20%20%20for%20i%2C%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%B8%20%D1%82%D0%BE%D1%82%20%D0%B6%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D0%BD%D0%BE%20%D0%B8%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D0%BD%D0%BE%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%20%D1%80%D0%B0%D0%B2%D0%BD%D1%8B%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%20and%20choice%20not%20in%20duplicated%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BF%D1%8B%D1%82%D0%BA%D0%B0%3A%20%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20duplicated.add%28choice%29%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%83%D0%B6%D0%B5%20%D0%B2%D1%8B%D0%B1%D1%80%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B9%D1%82%D0%B8%20%D0%BA%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B5%D0%BC%D1%83%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D1%83%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state%2C%20choices%2C%20selected%2C%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BA%D0%B0%D1%82%3A%20%D0%BE%D1%82%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D0%B8%20%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D1%8B%D0%B4%D1%83%D1%89%D0%B5%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_ii%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20II%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D%2C%20choices%3Dnums%2C%20selected%3D%5BFalse%5D%20%2A%20len%28nums%29%2C%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1%2C%202%2C%202%5D%0A%0A%20%20%20%20res%20%3D%20permutations_ii%28nums%29%0A%0A%20%20%20%20print%28f%22%D0%92%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Если предположить, что все элементы попарно различны, то из $n$ элементов можно получить $n!$ перестановок; при записи результата требуется копировать список длины $n$ , что занимает $O(n)$ времени. **Следовательно, временная сложность равна $O(n!n)$** .

Максимальная глубина рекурсии равна $n$ , что требует $O(n)$ стековой памяти. Массив `selected` занимает $O(n)$ пространства. Одновременно может существовать до $n$ хеш-множеств `duplicated` , что дает $O(n^2)$ памяти. **Следовательно, пространственная сложность равна $O(n^2)$** .

### 3. &nbsp; Сравнение двух видов обрезки

Обратите внимание: хотя и `selected` , и `duplicated` используются для обрезки, их цели различаются.

- **Обрезка повторного выбора**: во всем процессе поиска существует только один `selected` . Он записывает, какие элементы уже входят в текущее состояние, и нужен для того, чтобы один и тот же элемент не появлялся в `state` дважды.
- **Обрезка равных элементов**: каждый раунд выбора (каждый вызов `backtrack`) содержит собственный `duplicated` . Он записывает, какие элементы уже выбирались в текущем раунде (`for` цикле), и нужен для того, чтобы равные элементы выбирались только один раз.

На рисунке 13-9 показана область действия двух условий обрезки. Помните, что каждый узел дерева соответствует одному выбору, а путь от корня до листа образует одну перестановку.

![Область действия двух условий обрезки](permutations_problem.assets/permutations_ii_pruning_summary.png){ class="animation-figure" }

<p align="center"> Рисунок 13-9 &nbsp; Область действия двух условий обрезки </p>
