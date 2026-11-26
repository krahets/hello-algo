---
comments: true
---

# 13.2 &nbsp; Задача о перестановках

Генерация перестановок — типичная задача поиска с возвратом. Дан набор элементов, например массив или строка. Нужно найти все возможные способы расположить его элементы по порядку.

В таблице приведены примеры исходных массивов и всех их перестановок.

<p align="center"> Таблица 13-2 &nbsp; Примеры перестановок </p>

<div class="center-table" markdown>

| Исходный массив    | Все перестановки                                                           |
| :---------- | :----------------------------------------------------------------- |
| $[1]$       | $[1]$                                                              |
| $[1, 2]$    | $[1, 2], [2, 1]$                                                   |
| $[1, 2, 3]$ | $[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]$ |

</div>

## 13.2.1 &nbsp; Случай различных элементов

!!! question

    Дан массив целых чисел без повторений. Верните все возможные перестановки.

При поиске с возвратом **построение перестановки удобно представить как последовательность выборов**. Пусть дан массив $[1, 2, 3]$. Выбрав сначала $1$, затем $3$ и наконец $2$, получим перестановку $[1, 3, 2]$. При возврате мы отменяем последний выбор и пробуем другие варианты.

В коде поиска с возвратом набор кандидатов `choices` включает все элементы исходного массива, а состояние `state` содержит уже выбранные элементы. Каждый элемент разрешено выбирать лишь раз, **поэтому все элементы в `state` должны быть различны**.

Поиск можно развернуть в дерево рекурсии, как на рисунке. Каждый узел представляет текущее состояние `state`. От корня за три шага мы доходим до листа, и каждому листу соответствует одна перестановка.

![Дерево рекурсии для перестановок](permutations_problem.assets/permutations_i.svg){ class="animation-figure" }

<p align="center"> Рисунок 13-5 &nbsp; Дерево рекурсии для перестановок </p>

### 1. &nbsp; Отсечение повторного выбора

Чтобы не выбирать один элемент дважды, введём булев массив `selected`. Значение `selected[i]` показывает, выбран ли элемент `choices[i]`. С помощью этого массива выполним отсечение.

- Выбрав `choices[i]`, присваиваем `selected[i]` значение $\text{True}$, то есть отмечаем элемент как выбранный.
- При переборе вариантов `choices` пропускаем все уже выбранные узлы, тем самым отсекая их ветви.

Допустим, как на рисунке, на первом шаге мы выбираем 1, на втором — 3, а на третьем — 2. Тогда на втором шаге нужно отсечь ветвь элемента 1, а на третьем — ветви элементов 1 и 3.

![Пример отсечения при построении перестановок](permutations_problem.assets/permutations_i_pruning.svg){ class="animation-figure" }

<p align="center"> Рисунок 13-6 &nbsp; Пример отсечения при построении перестановок </p>

Как видно из рисунка, такое отсечение сокращает пространство поиска с $O(n^n)$ до $O(n!)$.

### 2. &nbsp; Реализация

Теперь можно заполнить общую схему алгоритма. Для краткости мы не будем выделять каждую операцию в отдельную функцию, а запишем их прямо в `backtrack()`:

=== "Python"

    ```python title="permutations_i.py"
    def backtrack(
        state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
    ):
        """Поиск с возвратом: перестановки I"""
        # Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if len(state) == len(choices):
            res.append(list(state))
            return
        # Перебираем все варианты
        for i, choice in enumerate(choices):
            # Отсечение: нельзя выбирать один элемент дважды
            if not selected[i]:
                # Пробуем вариант и обновляем состояние
                selected[i] = True
                state.append(choice)
                # Переходим к следующему выбору
                backtrack(state, choices, selected, res)
                # Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = False
                state.pop()

    def permutations_i(nums: list[int]) -> list[list[int]]:
        """Перестановки I"""
        res = []
        backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
        return res
    ```

=== "C++"

    ```cpp title="permutations_i.cpp"
    /* Поиск с возвратом: перестановки I */
    void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.size() == choices.size()) {
            res.push_back(state);
            return;
        }
        // Перебираем все варианты
        for (int i = 0; i < choices.size(); i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один элемент дважды
            if (!selected[i]) {
                // Пробуем вариант и обновляем состояние
                selected[i] = true;
                state.push_back(choice);
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.pop_back();
            }
        }
    }

    /* Перестановки I */
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
    /* Поиск с возвратом: перестановки I */
    void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Перебираем все варианты
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один элемент дважды
            if (!selected[i]) {
                // Пробуем вариант и обновляем состояние
                selected[i] = true;
                state.add(choice);
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Перестановки I */
    List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="permutations_i.cs"
    /* Поиск с возвратом: перестановки I */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебираем все варианты
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один элемент дважды
            if (!selected[i]) {
                // Пробуем вариант и обновляем состояние
                selected[i] = true;
                state.Add(choice);
                // Переходим к следующему выбору
                Backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Перестановки I */
    List<List<int>> PermutationsI(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }
    ```

=== "Go"

    ```go title="permutations_i.go"
    /* Поиск с возвратом: перестановки I */
    func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if len(*state) == len(*choices) {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
        }
        // Перебираем все варианты
        for i := 0; i < len(*choices); i++ {
            choice := (*choices)[i]
            // Отсечение: нельзя выбирать один элемент дважды
            if !(*selected)[i] {
                // Пробуем вариант и обновляем состояние
                (*selected)[i] = true
                *state = append(*state, choice)
                // Переходим к следующему выбору
                backtrackI(state, choices, selected, res)
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                (*selected)[i] = false
                *state = (*state)[:len(*state)-1]
            }
        }
    }

    /* Перестановки I */
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
    /* Поиск с возвратом: перестановки I */
    func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if state.count == choices.count {
            res.append(state)
            return
        }
        // Перебираем все варианты
        for (i, choice) in choices.enumerated() {
            // Отсечение: нельзя выбирать один элемент дважды
            if !selected[i] {
                // Пробуем вариант и обновляем состояние
                selected[i] = true
                state.append(choice)
                // Переходим к следующему выбору
                backtrack(state: &state, choices: choices, selected: &selected, res: &res)
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false
                state.removeLast()
            }
        }
    }

    /* Перестановки I */
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
    /* Поиск с возвратом: перестановки I */
    function backtrack(state, choices, selected, res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Перебираем все варианты
        choices.forEach((choice, i) => {
            // Отсечение: нельзя выбирать один элемент дважды
            if (!selected[i]) {
                // Пробуем вариант и обновляем состояние
                selected[i] = true;
                state.push(choice);
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Перестановки I */
    function permutationsI(nums) {
        const res = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="permutations_i.ts"
    /* Поиск с возвратом: перестановки I */
    function backtrack(
        state: number[],
        choices: number[],
        selected: boolean[],
        res: number[][]
    ): void {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Перебираем все варианты
        choices.forEach((choice, i) => {
            // Отсечение: нельзя выбирать один элемент дважды
            if (!selected[i]) {
                // Пробуем вариант и обновляем состояние
                selected[i] = true;
                state.push(choice);
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Перестановки I */
    function permutationsI(nums: number[]): number[][] {
        const res: number[][] = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="permutations_i.dart"
    /* Поиск с возвратом: перестановки I */
    void backtrack(
      List<int> state,
      List<int> choices,
      List<bool> selected,
      List<List<int>> res,
    ) {
      // Когда длина текущей перестановки равна числу элементов, сохраняем решение
      if (state.length == choices.length) {
        res.add(List.from(state));
        return;
      }
      // Перебираем все варианты
      for (int i = 0; i < choices.length; i++) {
        int choice = choices[i];
        // Отсечение: нельзя выбирать один элемент дважды
        if (!selected[i]) {
          // Пробуем вариант и обновляем состояние
          selected[i] = true;
          state.add(choice);
          // Переходим к следующему выбору
          backtrack(state, choices, selected, res);
          // Возврат: отменяем выбор и восстанавливаем прежнее состояние
          selected[i] = false;
          state.removeLast();
        }
      }
    }

    /* Перестановки I */
    List<List<int>> permutationsI(List<int> nums) {
      List<List<int>> res = [];
      backtrack([], nums, List.filled(nums.length, false), res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="permutations_i.rs"
    /* Поиск с возвратом: перестановки I */
    fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if state.len() == choices.len() {
            res.push(state);
            return;
        }
        // Перебираем все варианты
        for i in 0..choices.len() {
            let choice = choices[i];
            // Отсечение: нельзя выбирать один элемент дважды
            if !selected[i] {
                // Пробуем вариант и обновляем состояние
                selected[i] = true;
                state.push(choice);
                // Переходим к следующему выбору
                backtrack(state.clone(), choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.pop();
            }
        }
    }

    /* Перестановки I */
    fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
        let mut res = Vec::new(); // Состояние (подмножество)
        backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
        res
    }
    ```

=== "C"

    ```c title="permutations_i.c"
    /* Поиск с возвратом: перестановки I */
    void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (stateSize == choicesSize) {
            res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
            for (int i = 0; i < choicesSize; i++) {
                res[*resSize][i] = state[i];
            }
            (*resSize)++;
            return;
        }
        // Перебираем все варианты
        for (int i = 0; i < choicesSize; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один элемент дважды
            if (!selected[i]) {
                // Пробуем вариант и обновляем состояние
                selected[i] = true;
                state[stateSize] = choice;
                // Переходим к следующему выбору
                backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
            }
        }
    }

    /* Перестановки I */
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
    /* Поиск с возвратом: перестановки I */
    fun backtrack(
        state: MutableList<Int>,
        choices: IntArray,
        selected: BooleanArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.size == choices.size) {
            res.add(state.toMutableList())
            return
        }
        // Перебираем все варианты
        for (i in choices.indices) {
            val choice = choices[i]
            // Отсечение: нельзя выбирать один элемент дважды
            if (!selected[i]) {
                // Пробуем вариант и обновляем состояние
                selected[i] = true
                state.add(choice)
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res)
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false
                state.removeAt(state.size - 1)
            }
        }
    }

    /* Перестановки I */
    fun permutationsI(nums: IntArray): MutableList<MutableList<Int>?> {
        val res = mutableListOf<MutableList<Int>?>()
        backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="permutations_i.rb"
    ### Поиск с возвратом: перестановки I ###
    def backtrack(state, choices, selected, res)
      # Когда длина текущей перестановки равна числу элементов, сохраняем решение
      if state.length == choices.length
        res << state.dup
        return
      end

      # Перебираем все варианты
      choices.each_with_index do |choice, i|
        # Отсечение: нельзя выбирать один элемент дважды
        unless selected[i]
          # Пробуем вариант и обновляем состояние
          selected[i] = true
          state << choice
          # Переходим к следующему выбору
          backtrack(state, choices, selected, res)
          # Возврат: отменяем выбор и восстанавливаем прежнее состояние
          selected[i] = false
          state.pop
        end
      end
    end

    ### Перестановки I ###
    def permutations_i(nums)
      res = []
      backtrack([], nums, Array.new(nums.length, false), res)
      res
    end
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20choices%3A%20list%5Bint%5D,%20selected%3A%20list%5Bbool%5D,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%D0%BE%D0%BC%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20I%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B5%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20%D1%87%D0%B8%D1%81%D0%BB%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2,%20%D1%81%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D1%8F%D0%B5%D0%BC%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20for%20i,%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B4%D0%B2%D0%B0%D0%B6%D0%B4%D1%8B%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%94%D0%B5%D0%BB%D0%B0%D0%B5%D0%BC%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80,%20%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%A1%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state,%20choices,%20selected,%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BC%D0%B5%D0%BD%D0%B0%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0,%20%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_i%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20I%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D,%20choices%3Dnums,%20selected%3D%5BFalse%5D%20%2A%20len%28nums%29,%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%202,%203%5D%0A%0A%20%20%20%20res%20%3D%20permutations_i%28nums%29%0A%0A%20%20%20%20print%28f%22%D0%98%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20choices%3A%20list%5Bint%5D,%20selected%3A%20list%5Bbool%5D,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%D0%BE%D0%BC%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20I%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B5%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20%D1%87%D0%B8%D1%81%D0%BB%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2,%20%D1%81%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D1%8F%D0%B5%D0%BC%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20for%20i,%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B4%D0%B2%D0%B0%D0%B6%D0%B4%D1%8B%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%94%D0%B5%D0%BB%D0%B0%D0%B5%D0%BC%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80,%20%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%A1%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state,%20choices,%20selected,%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BC%D0%B5%D0%BD%D0%B0%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0,%20%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_i%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20I%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D,%20choices%3Dnums,%20selected%3D%5BFalse%5D%20%2A%20len%28nums%29,%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%202,%203%5D%0A%0A%20%20%20%20res%20%3D%20permutations_i%28nums%29%0A%0A%20%20%20%20print%28f%22%D0%98%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 13.2.2 &nbsp; Случай равных элементов

!!! question

    Дан массив целых чисел. **В массиве могут встречаться одинаковые элементы**. Верните все различные перестановки.

Пусть дан массив $[1, 1, 2]$. Чтобы различать две одинаковые $1$, вторую $1$ обозначим через $\hat{1}$.

На рисунке видно, что половина перестановок, построенных прежним методом, повторяется.

![Повторяющиеся перестановки](permutations_problem.assets/permutations_ii.svg){ class="animation-figure" }

<p align="center"> Рисунок 13-7 &nbsp; Повторяющиеся перестановки </p>

Как избавиться от повторов? Можно собрать готовые перестановки в хеш-множество, оставив только различные. Однако **ветви, порождающие повторы, вообще не нужны: лучше распознать и отсечь их заранее**. Тогда алгоритм будет работать быстрее.

### 1. &nbsp; Отсечение равных элементов

На рисунке выбор $1$ и выбор $\hat{1}$ на первом шаге равнозначны. Обе ветви дают одни и те же перестановки, поэтому ветвь $\hat{1}$ следует отсечь.

Аналогично, если сначала выбрать $2$, то варианты $1$ и $\hat{1}$ на втором шаге дадут одинаковые ветви. Ветвь $\hat{1}$ на втором шаге тоже следует отсечь.

Итак, **на каждом отдельном шаге перебора из нескольких равных элементов достаточно попробовать один**.

![Отсечение повторяющихся перестановок](permutations_problem.assets/permutations_ii_pruning.svg){ class="animation-figure" }

<p align="center"> Рисунок 13-8 &nbsp; Отсечение повторяющихся перестановок </p>

### 2. &nbsp; Реализация

Дополним предыдущий код: на каждом шаге перебора будем создавать хеш-множество `duplicated`, записывать туда уже испробованные на этом шаге значения и отсекать повторы:

=== "Python"

    ```python title="permutations_ii.py"
    def backtrack(
        state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
    ):
        """Поиск с возвратом: перестановки II"""
        # Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if len(state) == len(choices):
            res.append(list(state))
            return
        # Перебираем все варианты
        duplicated = set[int]()
        for i, choice in enumerate(choices):
            # Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if not selected[i] and choice not in duplicated:
                # Пробуем вариант и обновляем состояние
                duplicated.add(choice)  # Отмечаем уже выбранные значения
                selected[i] = True
                state.append(choice)
                # Переходим к следующему выбору
                backtrack(state, choices, selected, res)
                # Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = False
                state.pop()

    def permutations_ii(nums: list[int]) -> list[list[int]]:
        """Перестановки II"""
        res = []
        backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
        return res
    ```

=== "C++"

    ```cpp title="permutations_ii.cpp"
    /* Поиск с возвратом: перестановки II */
    void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.size() == choices.size()) {
            res.push_back(state);
            return;
        }
        // Перебираем все варианты
        unordered_set<int> duplicated;
        for (int i = 0; i < choices.size(); i++) {
            int choice = choices[i];
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
                // Пробуем вариант и обновляем состояние
                duplicated.emplace(choice); // Отмечаем уже выбранные значения
                selected[i] = true;
                state.push_back(choice);
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.pop_back();
            }
        }
    }

    /* Перестановки II */
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
    /* Поиск с возвратом: перестановки II */
    void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Перебираем все варианты
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if (!selected[i] && !duplicated.contains(choice)) {
                // Пробуем вариант и обновляем состояние
                duplicated.add(choice); // Отмечаем уже выбранные значения
                selected[i] = true;
                state.add(choice);
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Перестановки II */
    List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="permutations_ii.cs"
    /* Поиск с возвратом: перестановки II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебираем все варианты
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if (!selected[i] && !duplicated.Contains(choice)) {
                // Пробуем вариант и обновляем состояние
                duplicated.Add(choice); // Отмечаем уже выбранные значения
                selected[i] = true;
                state.Add(choice);
                // Переходим к следующему выбору
                Backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Перестановки II */
    List<List<int>> PermutationsII(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }
    ```

=== "Go"

    ```go title="permutations_ii.go"
    /* Поиск с возвратом: перестановки II */
    func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if len(*state) == len(*choices) {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
        }
        // Перебираем все варианты
        duplicated := make(map[int]struct{}, 0)
        for i := 0; i < len(*choices); i++ {
            choice := (*choices)[i]
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
                // Пробуем вариант и обновляем состояние
                // Отмечаем уже выбранные значения
                duplicated[choice] = struct{}{}
                (*selected)[i] = true
                *state = append(*state, choice)
                // Переходим к следующему выбору
                backtrackII(state, choices, selected, res)
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                (*selected)[i] = false
                *state = (*state)[:len(*state)-1]
            }
        }
    }

    /* Перестановки II */
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
    /* Поиск с возвратом: перестановки II */
    func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if state.count == choices.count {
            res.append(state)
            return
        }
        // Перебираем все варианты
        var duplicated: Set<Int> = []
        for (i, choice) in choices.enumerated() {
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if !selected[i], !duplicated.contains(choice) {
                // Пробуем вариант и обновляем состояние
                duplicated.insert(choice) // Отмечаем уже выбранные значения
                selected[i] = true
                state.append(choice)
                // Переходим к следующему выбору
                backtrack(state: &state, choices: choices, selected: &selected, res: &res)
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false
                state.removeLast()
            }
        }
    }

    /* Перестановки II */
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
    /* Поиск с возвратом: перестановки II */
    function backtrack(state, choices, selected, res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Перебираем все варианты
        const duplicated = new Set();
        choices.forEach((choice, i) => {
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if (!selected[i] && !duplicated.has(choice)) {
                // Пробуем вариант и обновляем состояние
                duplicated.add(choice); // Отмечаем уже выбранные значения
                selected[i] = true;
                state.push(choice);
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Перестановки II */
    function permutationsII(nums) {
        const res = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="permutations_ii.ts"
    /* Поиск с возвратом: перестановки II */
    function backtrack(
        state: number[],
        choices: number[],
        selected: boolean[],
        res: number[][]
    ): void {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Перебираем все варианты
        const duplicated = new Set();
        choices.forEach((choice, i) => {
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if (!selected[i] && !duplicated.has(choice)) {
                // Пробуем вариант и обновляем состояние
                duplicated.add(choice); // Отмечаем уже выбранные значения
                selected[i] = true;
                state.push(choice);
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Перестановки II */
    function permutationsII(nums: number[]): number[][] {
        const res: number[][] = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="permutations_ii.dart"
    /* Поиск с возвратом: перестановки II */
    void backtrack(
      List<int> state,
      List<int> choices,
      List<bool> selected,
      List<List<int>> res,
    ) {
      // Когда длина текущей перестановки равна числу элементов, сохраняем решение
      if (state.length == choices.length) {
        res.add(List.from(state));
        return;
      }
      // Перебираем все варианты
      Set<int> duplicated = {};
      for (int i = 0; i < choices.length; i++) {
        int choice = choices[i];
        // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
        if (!selected[i] && !duplicated.contains(choice)) {
          // Пробуем вариант и обновляем состояние
          duplicated.add(choice); // Отмечаем уже выбранные значения
          selected[i] = true;
          state.add(choice);
          // Переходим к следующему выбору
          backtrack(state, choices, selected, res);
          // Возврат: отменяем выбор и восстанавливаем прежнее состояние
          selected[i] = false;
          state.removeLast();
        }
      }
    }

    /* Перестановки II */
    List<List<int>> permutationsII(List<int> nums) {
      List<List<int>> res = [];
      backtrack([], nums, List.filled(nums.length, false), res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="permutations_ii.rs"
    /* Поиск с возвратом: перестановки II */
    fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if state.len() == choices.len() {
            res.push(state);
            return;
        }
        // Перебираем все варианты
        let mut duplicated = HashSet::<i32>::new();
        for i in 0..choices.len() {
            let choice = choices[i];
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if !selected[i] && !duplicated.contains(&choice) {
                // Пробуем вариант и обновляем состояние
                duplicated.insert(choice); // Отмечаем уже выбранные значения
                selected[i] = true;
                state.push(choice);
                // Переходим к следующему выбору
                backtrack(state.clone(), choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.pop();
            }
        }
    }

    /* Перестановки II */
    fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
        let mut res = Vec::new();
        backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
        res
    }
    ```

=== "C"

    ```c title="permutations_ii.c"
    /* Поиск с возвратом: перестановки II */
    void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (stateSize == choicesSize) {
            res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
            for (int i = 0; i < choicesSize; i++) {
                res[*resSize][i] = state[i];
            }
            (*resSize)++;
            return;
        }
        // Перебираем все варианты
        bool duplicated[MAX_SIZE] = {false};
        for (int i = 0; i < choicesSize; i++) {
            int choice = choices[i];
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if (!selected[i] && !duplicated[choice]) {
                // Пробуем вариант и обновляем состояние
                duplicated[choice] = true; // Отмечаем уже выбранные значения
                selected[i] = true;
                state[stateSize] = choice;
                // Переходим к следующему выбору
                backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
            }
        }
    }

    /* Перестановки II */
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
    /* Поиск с возвратом: перестановки II */
    fun backtrack(
        state: MutableList<Int>,
        choices: IntArray,
        selected: BooleanArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.size == choices.size) {
            res.add(state.toMutableList())
            return
        }
        // Перебираем все варианты
        val duplicated = HashSet<Int>()
        for (i in choices.indices) {
            val choice = choices[i]
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if (!selected[i] && !duplicated.contains(choice)) {
                // Пробуем вариант и обновляем состояние
                duplicated.add(choice) // Отмечаем уже выбранные значения
                selected[i] = true
                state.add(choice)
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res)
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false
                state.removeAt(state.size - 1)
            }
        }
    }

    /* Перестановки II */
    fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
        val res = mutableListOf<MutableList<Int>?>()
        backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="permutations_ii.rb"
    ### Поиск с возвратом: перестановки II ###
    def backtrack(state, choices, selected, res)
      # Когда длина текущей перестановки равна числу элементов, сохраняем решение
      if state.length == choices.length
        res << state.dup
        return
      end

      # Перебираем все варианты
      duplicated = Set.new
      choices.each_with_index do |choice, i|
        # Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
        if !selected[i] && !duplicated.include?(choice)
          # Пробуем вариант и обновляем состояние
          duplicated.add(choice)
          selected[i] = true
          state << choice
          # Переходим к следующему выбору
          backtrack(state, choices, selected, res)
          # Возврат: отменяем выбор и восстанавливаем прежнее состояние
          selected[i] = false
          state.pop
        end
      end
    end

    ### Перестановки II ###
    def permutations_ii(nums)
      res = []
      backtrack([], nums, Array.new(nums.length, false), res)
      res
    end
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20choices%3A%20list%5Bint%5D,%20selected%3A%20list%5Bbool%5D,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%D0%BE%D0%BC%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20II%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B5%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20%D1%87%D0%B8%D1%81%D0%BB%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2,%20%D1%81%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D1%8F%D0%B5%D0%BC%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20duplicated%20%3D%20set%5Bint%5D%28%29%0A%20%20%20%20for%20i,%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D0%BD%D0%BE%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D1%82%D0%BE%D1%82%20%D0%B6%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%BB%D0%B8%20%D0%BF%D1%80%D0%BE%D0%B1%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BD%D0%B0%20%D1%8D%D1%82%D0%BE%D0%BC%20%D1%83%D1%80%D0%BE%D0%B2%D0%BD%D0%B5%20%D1%82%D0%BE%20%D0%B6%D0%B5%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%20and%20choice%20not%20in%20duplicated%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%94%D0%B5%D0%BB%D0%B0%D0%B5%D0%BC%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80,%20%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20duplicated.add%28choice%29%20%20%23%20%D0%9E%D1%82%D0%BC%D0%B5%D1%87%D0%B0%D0%B5%D0%BC%20%D1%83%D0%B6%D0%B5%20%D0%B2%D1%8B%D0%B1%D1%80%D0%B0%D0%BD%D0%BD%D1%8B%D0%B5%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%A1%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state,%20choices,%20selected,%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BC%D0%B5%D0%BD%D0%B0%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0,%20%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_ii%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20II%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D,%20choices%3Dnums,%20selected%3D%5BFalse%5D%20%2A%20len%28nums%29,%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%202,%202%5D%0A%0A%20%20%20%20res%20%3D%20permutations_ii%28nums%29%0A%0A%20%20%20%20print%28f%22%D0%98%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20choices%3A%20list%5Bint%5D,%20selected%3A%20list%5Bbool%5D,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%D0%BE%D0%BC%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20II%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B5%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20%D1%87%D0%B8%D1%81%D0%BB%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2,%20%D1%81%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D1%8F%D0%B5%D0%BC%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20duplicated%20%3D%20set%5Bint%5D%28%29%0A%20%20%20%20for%20i,%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%3A%20%D0%BD%D0%B5%D0%BB%D1%8C%D0%B7%D1%8F%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D0%BD%D0%BE%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D1%82%D0%BE%D1%82%20%D0%B6%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%BB%D0%B8%20%D0%BF%D1%80%D0%BE%D0%B1%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BD%D0%B0%20%D1%8D%D1%82%D0%BE%D0%BC%20%D1%83%D1%80%D0%BE%D0%B2%D0%BD%D0%B5%20%D1%82%D0%BE%20%D0%B6%D0%B5%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%20and%20choice%20not%20in%20duplicated%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%94%D0%B5%D0%BB%D0%B0%D0%B5%D0%BC%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80,%20%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%0A%20%20%20%20%20%20%20%20%20%20%20%20duplicated.add%28choice%29%20%20%23%20%D0%9E%D1%82%D0%BC%D0%B5%D1%87%D0%B0%D0%B5%D0%BC%20%D1%83%D0%B6%D0%B5%20%D0%B2%D1%8B%D0%B1%D1%80%D0%B0%D0%BD%D0%BD%D1%8B%D0%B5%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%A1%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state,%20choices,%20selected,%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9E%D1%82%D0%BC%D0%B5%D0%BD%D0%B0%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%B0,%20%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_ii%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20II%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D,%20choices%3Dnums,%20selected%3D%5BFalse%5D%20%2A%20len%28nums%29,%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%202,%202%5D%0A%0A%20%20%20%20res%20%3D%20permutations_ii%28nums%29%0A%0A%20%20%20%20print%28f%22%D0%98%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%D0%92%D1%81%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Если все элементы различны, то для $n$ элементов существует $n!$ перестановок (факториал). При записи каждой перестановки нужно скопировать список длины $n$, что занимает $O(n)$ времени. **Следовательно, временная сложность равна $O(n!n)$**.

Максимальная глубина рекурсии равна $n$, поэтому кадры стека занимают $O(n)$ памяти. Для `selected` требуется $O(n)$ памяти. Одновременно существует не более $n$ множеств `duplicated`, которые в сумме занимают $O(n^2)$ памяти. **Следовательно, пространственная сложность равна $O(n^2)$**.

### 3. &nbsp; Сравнение двух способов отсечения

И `selected`, и `duplicated` используются для отсечения, но решают разные задачи.

- **Отсечение повторного выбора**. Массив `selected` один на весь поиск. Он отмечает элементы, вошедшие в текущее состояние, и не даёт одному элементу дважды попасть в `state`.
- **Отсечение равных элементов**. На каждом шаге перебора (в каждом вызове `backtrack`) есть своё множество `duplicated`. Оно хранит значения, уже испробованные в текущем цикле `for`, и позволяет выбирать равные элементы лишь один раз за цикл.

На рисунке показано, где действует каждое условие отсечения. Каждый узел дерева обозначает один выбор, а последовательность узлов на пути от корня до листа задаёт перестановку.

![Области действия двух условий отсечения](permutations_problem.assets/permutations_ii_pruning_summary.svg){ class="animation-figure" }

<p align="center"> Рисунок 13-9 &nbsp; Области действия двух условий отсечения </p>
