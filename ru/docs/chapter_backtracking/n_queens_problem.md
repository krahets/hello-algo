---
comments: true
---

# 13.4 &nbsp; Задача о n ферзях

!!! question

    Согласно правилам шахмат ферзь может атаковать фигуры, находящиеся с ним на одной строке, в одном столбце или на одной диагонали. Даны $n$ ферзей и шахматная доска размера $n \times n$ ; требуется найти такие расстановки, при которых ни одна пара ферзей не может атаковать друг друга.

Как показано на рисунке 13-15, при $n = 4$ существует два решения. С точки зрения поиска с возвратом доска размера $n \times n$ содержит $n^2$ клеток, которые образуют все возможные выборы `choices` . По мере поочередного размещения ферзей состояние доски непрерывно меняется, и текущее содержимое доски образует состояние `state` .

![Решения задачи о 4 ферзях](n_queens_problem.assets/solution_4_queens.png){ class="animation-figure" }

<p align="center"> Рисунок 13-15 &nbsp; Решения задачи о 4 ферзях </p>

На рисунке 13-16 показаны три ограничения этой задачи: **несколько ферзей не могут находиться на одной строке, в одном столбце или на одной диагонали**. При этом нужно помнить, что диагонали бывают двух типов: главная `\` и побочная `/` .

![Ограничения задачи о n ферзях](n_queens_problem.assets/n_queens_constraints.png){ class="animation-figure" }

<p align="center"> Рисунок 13-16 &nbsp; Ограничения задачи о n ферзях </p>

### 1. &nbsp; Построчная стратегия размещения

Число ферзей и число строк доски одинаково и равно $n$ , поэтому легко получить следующий вывод: **в каждой строке доски разрешено и нужно разместить ровно одного ферзя**.

Иначе говоря, можно использовать построчную стратегию: начиная с первой строки, размещать по одному ферзю в каждой строке, пока не будет достигнута последняя.

На рисунке 13-17 показан процесс построчного размещения для задачи о 4 ферзях. Из-за ограничений размера изображения на нем раскрыта только одна ветвь поиска для первой строки, а все варианты, не удовлетворяющие ограничениям по столбцам и диагоналям, были отсечены.

![Построчная стратегия размещения](n_queens_problem.assets/n_queens_placing.png){ class="animation-figure" }

<p align="center"> Рисунок 13-17 &nbsp; Построчная стратегия размещения </p>

По своей сути **построчная стратегия сама по себе выполняет роль обрезки** , потому что заранее исключает все ветви поиска, в которых в одной строке оказалось бы несколько ферзей.

### 2. &nbsp; Обрезка по столбцам и диагоналям

Чтобы удовлетворить ограничению по столбцам, можно использовать булев массив `cols` длины $n$ , который записывает, есть ли ферзь в каждом столбце. Перед каждым размещением мы используем `cols` для отсечения столбцов, уже занятых ферзями, а затем динамически обновляем состояние `cols` во время отката.

!!! tip

    Обратите внимание: начало координат матрицы находится в левом верхнем углу, при этом индексы строк растут сверху вниз, а индексы столбцов - слева направо.

Как теперь обработать ограничения по диагоналям? Пусть клетка на доске имеет координаты $(row, col)$ . Выбрав некоторую главную диагональ в матрице, можно заметить, что разность индексов строки и столбца одинакова для всех клеток этой диагонали, **то есть для всех клеток главной диагонали значение $row - col$ постоянно**.

Это означает, что если для двух клеток выполняется равенство $row_1 - col_1 = row_2 - col_2$ , то они обязательно лежат на одной и той же главной диагонали. Используя это правило, можно с помощью массива `diags1` , показанного на рисунке 13-18, отмечать наличие ферзя на каждой главной диагонали.

Аналогично **для всех клеток побочной диагонали значение $row + col$ является постоянным**. Поэтому для обработки ограничений по побочным диагоналям можно использовать еще один массив `diags2` .

![Обработка ограничений по столбцам и диагоналям](n_queens_problem.assets/n_queens_cols_diagonals.png){ class="animation-figure" }

<p align="center"> Рисунок 13-18 &nbsp; Обработка ограничений по столбцам и диагоналям </p>

### 3. &nbsp; Реализация кода

Заметим, что в квадратной матрице размера $n$ диапазон значений $row - col$ равен $[-n + 1, n - 1]$ , а диапазон значений $row + col$ равен $[0, 2n - 2]$ . Следовательно, число главных и побочных диагоналей равно $2n - 1$ , а значит, длины массивов `diags1` и `diags2` тоже равны $2n - 1$ .

=== "Python"

    ```python title="n_queens.py"
    def backtrack(
        row: int,
        n: int,
        state: list[list[str]],
        res: list[list[list[str]]],
        cols: list[bool],
        diags1: list[bool],
        diags2: list[bool],
    ):
        """Алгоритм бэктрекинга: n ферзей"""
        # Когда все строки уже обработаны, записать решение
        if row == n:
            res.append([list(row) for row in state])
            return
        # Обойти все столбцы
        for col in range(n):
            # Вычислить главную и побочную диагонали, соответствующие этой клетке
            diag1 = row - col + n - 1
            diag2 = row + col
            # Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if not cols[col] and not diags1[diag1] and not diags2[diag2]:
                # Попытка: поставить ферзя в эту клетку
                state[row][col] = "Q"
                cols[col] = diags1[diag1] = diags2[diag2] = True
                # Перейти к размещению следующей строки
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                # Откат: восстановить эту клетку как пустую
                state[row][col] = "#"
                cols[col] = diags1[diag1] = diags2[diag2] = False

    def n_queens(n: int) -> list[list[list[str]]]:
        """Решить задачу о n ферзях"""
        # Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        state = [["#" for _ in range(n)] for _ in range(n)]
        cols = [False] * n  # Отмечать, есть ли ферзь в столбце
        diags1 = [False] * (2 * n - 1)  # Отмечать наличие ферзя на главной диагонали
        diags2 = [False] * (2 * n - 1)  # Отмечать наличие ферзя на побочной диагонали
        res = []
        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    ```

=== "C++"

    ```cpp title="n_queens.cpp"
    /* Алгоритм бэктрекинга: n ферзей */
    void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
                   vector<bool> &diags1, vector<bool> &diags2) {
        // Когда все строки уже обработаны, записать решение
        if (row == n) {
            res.push_back(state);
            return;
        }
        // Обойти все столбцы
        for (int col = 0; col < n; col++) {
            // Вычислить главную и побочную диагонали, соответствующие этой клетке
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Попытка: поставить ферзя в эту клетку
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Перейти к размещению следующей строки
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Откат: восстановить эту клетку как пустую
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решить задачу о n ферзях */
    vector<vector<vector<string>>> nQueens(int n) {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        vector<vector<string>> state(n, vector<string>(n, "#"));
        vector<bool> cols(n, false);           // Отмечать, есть ли ферзь в столбце
        vector<bool> diags1(2 * n - 1, false); // Отмечать наличие ферзя на главной диагонали
        vector<bool> diags2(2 * n - 1, false); // Отмечать наличие ферзя на побочной диагонали
        vector<vector<vector<string>>> res;

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Java"

    ```java title="n_queens.java"
    /* Алгоритм бэктрекинга: n ферзей */
    void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // Когда все строки уже обработаны, записать решение
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // Обойти все столбцы
        for (int col = 0; col < n; col++) {
            // Вычислить главную и побочную диагонали, соответствующие этой клетке
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Попытка: поставить ферзя в эту клетку
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Перейти к размещению следующей строки
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Откат: восстановить эту клетку как пустую
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решить задачу о n ферзях */
    List<List<List<String>>> nQueens(int n) {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // Отмечать, есть ли ферзь в столбце
        boolean[] diags1 = new boolean[2 * n - 1]; // Отмечать наличие ферзя на главной диагонали
        boolean[] diags2 = new boolean[2 * n - 1]; // Отмечать наличие ферзя на побочной диагонали
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "C#"

    ```csharp title="n_queens.cs"
    /* Алгоритм бэктрекинга: n ферзей */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // Когда все строки уже обработаны, записать решение
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
            return;
        }
        // Обойти все столбцы
        for (int col = 0; col < n; col++) {
            // Вычислить главную и побочную диагонали, соответствующие этой клетке
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Попытка: поставить ферзя в эту клетку
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Перейти к размещению следующей строки
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Откат: восстановить эту клетку как пустую
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решить задачу о n ферзях */
    List<List<List<string>>> NQueens(int n) {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // Отмечать, есть ли ферзь в столбце
        bool[] diags1 = new bool[2 * n - 1]; // Отмечать наличие ферзя на главной диагонали
        bool[] diags2 = new bool[2 * n - 1]; // Отмечать наличие ферзя на побочной диагонали
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Go"

    ```go title="n_queens.go"
    /* Алгоритм бэктрекинга: n ферзей */
    func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
        // Когда все строки уже обработаны, записать решение
        if row == n {
            newState := make([][]string, len(*state))
            for i, _ := range newState {
                newState[i] = make([]string, len((*state)[0]))
                copy(newState[i], (*state)[i])

            }
            *res = append(*res, newState)
            return
        }
        // Обойти все столбцы
        for col := 0; col < n; col++ {
            // Вычислить главную и побочную диагонали, соответствующие этой клетке
            diag1 := row - col + n - 1
            diag2 := row + col
            // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
                // Попытка: поставить ферзя в эту клетку
                (*state)[row][col] = "Q"
                (*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
                // Перейти к размещению следующей строки
                backtrack(row+1, n, state, res, cols, diags1, diags2)
                // Откат: восстановить эту клетку как пустую
                (*state)[row][col] = "#"
                (*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
            }
        }
    }

    /* Решить задачу о n ферзях */
    func nQueens(n int) [][][]string {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        state := make([][]string, n)
        for i := 0; i < n; i++ {
            row := make([]string, n)
            for i := 0; i < n; i++ {
                row[i] = "#"
            }
            state[i] = row
        }
        // Отмечать, есть ли ферзь в столбце
        cols := make([]bool, n)
        diags1 := make([]bool, 2*n-1)
        diags2 := make([]bool, 2*n-1)
        res := make([][][]string, 0)
        backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
        return res
    }
    ```

=== "Swift"

    ```swift title="n_queens.swift"
    /* Алгоритм бэктрекинга: n ферзей */
    func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
        // Когда все строки уже обработаны, записать решение
        if row == n {
            res.append(state)
            return
        }
        // Обойти все столбцы
        for col in 0 ..< n {
            // Вычислить главную и побочную диагонали, соответствующие этой клетке
            let diag1 = row - col + n - 1
            let diag2 = row + col
            // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if !cols[col] && !diags1[diag1] && !diags2[diag2] {
                // Попытка: поставить ферзя в эту клетку
                state[row][col] = "Q"
                cols[col] = true
                diags1[diag1] = true
                diags2[diag2] = true
                // Перейти к размещению следующей строки
                backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
                // Откат: восстановить эту клетку как пустую
                state[row][col] = "#"
                cols[col] = false
                diags1[diag1] = false
                diags2[diag2] = false
            }
        }
    }

    /* Решить задачу о n ферзях */
    func nQueens(n: Int) -> [[[String]]] {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        var state = Array(repeating: Array(repeating: "#", count: n), count: n)
        var cols = Array(repeating: false, count: n) // Отмечать, есть ли ферзь в столбце
        var diags1 = Array(repeating: false, count: 2 * n - 1) // Отмечать наличие ферзя на главной диагонали
        var diags2 = Array(repeating: false, count: 2 * n - 1) // Отмечать наличие ферзя на побочной диагонали
        var res: [[[String]]] = []

        backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

        return res
    }
    ```

=== "JS"

    ```javascript title="n_queens.js"
    /* Алгоритм бэктрекинга: n ферзей */
    function backtrack(row, n, state, res, cols, diags1, diags2) {
        // Когда все строки уже обработаны, записать решение
        if (row === n) {
            res.push(state.map((row) => row.slice()));
            return;
        }
        // Обойти все столбцы
        for (let col = 0; col < n; col++) {
            // Вычислить главную и побочную диагонали, соответствующие этой клетке
            const diag1 = row - col + n - 1;
            const diag2 = row + col;
            // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Попытка: поставить ферзя в эту клетку
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Перейти к размещению следующей строки
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Откат: восстановить эту клетку как пустую
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решить задачу о n ферзях */
    function nQueens(n) {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        const state = Array.from({ length: n }, () => Array(n).fill('#'));
        const cols = Array(n).fill(false); // Отмечать, есть ли ферзь в столбце
        const diags1 = Array(2 * n - 1).fill(false); // Отмечать наличие ферзя на главной диагонали
        const diags2 = Array(2 * n - 1).fill(false); // Отмечать наличие ферзя на побочной диагонали
        const res = [];

        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }
    ```

=== "TS"

    ```typescript title="n_queens.ts"
    /* Алгоритм бэктрекинга: n ферзей */
    function backtrack(
        row: number,
        n: number,
        state: string[][],
        res: string[][][],
        cols: boolean[],
        diags1: boolean[],
        diags2: boolean[]
    ): void {
        // Когда все строки уже обработаны, записать решение
        if (row === n) {
            res.push(state.map((row) => row.slice()));
            return;
        }
        // Обойти все столбцы
        for (let col = 0; col < n; col++) {
            // Вычислить главную и побочную диагонали, соответствующие этой клетке
            const diag1 = row - col + n - 1;
            const diag2 = row + col;
            // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Попытка: поставить ферзя в эту клетку
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Перейти к размещению следующей строки
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Откат: восстановить эту клетку как пустую
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решить задачу о n ферзях */
    function nQueens(n: number): string[][][] {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        const state = Array.from({ length: n }, () => Array(n).fill('#'));
        const cols = Array(n).fill(false); // Отмечать, есть ли ферзь в столбце
        const diags1 = Array(2 * n - 1).fill(false); // Отмечать наличие ферзя на главной диагонали
        const diags2 = Array(2 * n - 1).fill(false); // Отмечать наличие ферзя на побочной диагонали
        const res: string[][][] = [];

        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }
    ```

=== "Dart"

    ```dart title="n_queens.dart"
    /* Алгоритм бэктрекинга: n ферзей */
    void backtrack(
      int row,
      int n,
      List<List<String>> state,
      List<List<List<String>>> res,
      List<bool> cols,
      List<bool> diags1,
      List<bool> diags2,
    ) {
      // Когда все строки уже обработаны, записать решение
      if (row == n) {
        List<List<String>> copyState = [];
        for (List<String> sRow in state) {
          copyState.add(List.from(sRow));
        }
        res.add(copyState);
        return;
      }
      // Обойти все столбцы
      for (int col = 0; col < n; col++) {
        // Вычислить главную и побочную диагонали, соответствующие этой клетке
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
          // Попытка: поставить ферзя в эту клетку
          state[row][col] = "Q";
          cols[col] = true;
          diags1[diag1] = true;
          diags2[diag2] = true;
          // Перейти к размещению следующей строки
          backtrack(row + 1, n, state, res, cols, diags1, diags2);
          // Откат: восстановить эту клетку как пустую
          state[row][col] = "#";
          cols[col] = false;
          diags1[diag1] = false;
          diags2[diag2] = false;
        }
      }
    }

    /* Решить задачу о n ферзях */
    List<List<List<String>>> nQueens(int n) {
      // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
      List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
      List<bool> cols = List.filled(n, false); // Отмечать, есть ли ферзь в столбце
      List<bool> diags1 = List.filled(2 * n - 1, false); // Отмечать наличие ферзя на главной диагонали
      List<bool> diags2 = List.filled(2 * n - 1, false); // Отмечать наличие ферзя на побочной диагонали
      List<List<List<String>>> res = [];

      backtrack(0, n, state, res, cols, diags1, diags2);

      return res;
    }
    ```

=== "Rust"

    ```rust title="n_queens.rs"
    /* Алгоритм бэктрекинга: n ферзей */
    fn backtrack(
        row: usize,
        n: usize,
        state: &mut Vec<Vec<String>>,
        res: &mut Vec<Vec<Vec<String>>>,
        cols: &mut [bool],
        diags1: &mut [bool],
        diags2: &mut [bool],
    ) {
        // Когда все строки уже обработаны, записать решение
        if row == n {
            res.push(state.clone());
            return;
        }
        // Обойти все столбцы
        for col in 0..n {
            // Вычислить главную и побочную диагонали, соответствующие этой клетке
            let diag1 = row + n - 1 - col;
            let diag2 = row + col;
            // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if !cols[col] && !diags1[diag1] && !diags2[diag2] {
                // Попытка: поставить ферзя в эту клетку
                state[row][col] = "Q".into();
                (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
                // Перейти к размещению следующей строки
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Откат: восстановить эту клетку как пустую
                state[row][col] = "#".into();
                (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
            }
        }
    }

    /* Решить задачу о n ферзях */
    fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
        let mut cols = vec![false; n]; // Отмечать, есть ли ферзь в столбце
        let mut diags1 = vec![false; 2 * n - 1]; // Отмечать наличие ферзя на главной диагонали
        let mut diags2 = vec![false; 2 * n - 1]; // Отмечать наличие ферзя на побочной диагонали
        let mut res: Vec<Vec<Vec<String>>> = Vec::new();

        backtrack(
            0,
            n,
            &mut state,
            &mut res,
            &mut cols,
            &mut diags1,
            &mut diags2,
        );

        res
    }
    ```

=== "C"

    ```c title="n_queens.c"
    /* Алгоритм бэктрекинга: n ферзей */
    void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
                   bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
        // Когда все строки уже обработаны, записать решение
        if (row == n) {
            res[*resSize] = (char **)malloc(sizeof(char *) * n);
            for (int i = 0; i < n; ++i) {
                res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
                strcpy(res[*resSize][i], state[i]);
            }
            (*resSize)++;
            return;
        }
        // Обойти все столбцы
        for (int col = 0; col < n; col++) {
            // Вычислить главную и побочную диагонали, соответствующие этой клетке
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Попытка: поставить ферзя в эту клетку
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Перейти к размещению следующей строки
                backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
                // Откат: восстановить эту клетку как пустую
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решить задачу о n ферзях */
    char ***nQueens(int n, int *returnSize) {
        char state[MAX_SIZE][MAX_SIZE];
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                state[i][j] = '#';
            }
            state[i][n] = '\0';
        }
        bool cols[MAX_SIZE] = {false};           // Отмечать, есть ли ферзь в столбце
        bool diags1[2 * MAX_SIZE - 1] = {false}; // Отмечать наличие ферзя на главной диагонали
        bool diags2[2 * MAX_SIZE - 1] = {false}; // Отмечать наличие ферзя на побочной диагонали

        char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
        *returnSize = 0;
        backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="n_queens.kt"
    /* Алгоритм бэктрекинга: n ферзей */
    fun backtrack(
        row: Int,
        n: Int,
        state: MutableList<MutableList<String>>,
        res: MutableList<MutableList<MutableList<String>>?>,
        cols: BooleanArray,
        diags1: BooleanArray,
        diags2: BooleanArray
    ) {
        // Когда все строки уже обработаны, записать решение
        if (row == n) {
            val copyState = mutableListOf<MutableList<String>>()
            for (sRow in state) {
                copyState.add(sRow.toMutableList())
            }
            res.add(copyState)
            return
        }
        // Обойти все столбцы
        for (col in 0..<n) {
            // Вычислить главную и побочную диагонали, соответствующие этой клетке
            val diag1 = row - col + n - 1
            val diag2 = row + col
            // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Попытка: поставить ферзя в эту клетку
                state[row][col] = "Q"
                diags2[diag2] = true
                diags1[diag1] = diags2[diag2]
                cols[col] = diags1[diag1]
                // Перейти к размещению следующей строки
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                // Откат: восстановить эту клетку как пустую
                state[row][col] = "#"
                diags2[diag2] = false
                diags1[diag1] = diags2[diag2]
                cols[col] = diags1[diag1]
            }
        }
    }

    /* Решить задачу о n ферзях */
    fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        val state = mutableListOf<MutableList<String>>()
        for (i in 0..<n) {
            val row = mutableListOf<String>()
            for (j in 0..<n) {
                row.add("#")
            }
            state.add(row)
        }
        val cols = BooleanArray(n) // Отмечать, есть ли ферзь в столбце
        val diags1 = BooleanArray(2 * n - 1) // Отмечать наличие ферзя на главной диагонали
        val diags2 = BooleanArray(2 * n - 1) // Отмечать наличие ферзя на побочной диагонали
        val res = mutableListOf<MutableList<MutableList<String>>?>()

        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    }
    ```

=== "Ruby"

    ```ruby title="n_queens.rb"
    ### Алгоритм бэктрекинга: n ферзей ###
    def backtrack(row, n, state, res, cols, diags1, diags2)
      # Когда все строки уже обработаны, записать решение
      if row == n
        res << state.map { |row| row.dup }
        return
      end

      # Обойти все столбцы
      for col in 0...n
        # Вычислить главную и побочную диагонали, соответствующие этой клетке
        diag1 = row - col + n - 1
        diag2 = row + col
        # Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
        if !cols[col] && !diags1[diag1] && !diags2[diag2]
          # Попытка: поставить ферзя в эту клетку
          state[row][col] = "Q"
          cols[col] = diags1[diag1] = diags2[diag2] = true
          # Перейти к размещению следующей строки
          backtrack(row + 1, n, state, res, cols, diags1, diags2)
          # Откат: восстановить эту клетку как пустую
          state[row][col] = "#"
          cols[col] = diags1[diag1] = diags2[diag2] = false
        end
      end
    end

    ### Решить задачу о n ферзях ###
    def n_queens(n)
      # Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
      state = Array.new(n) { Array.new(n, "#") }
      cols = Array.new(n, false) # Отмечать, есть ли ферзь в столбце
      diags1 = Array.new(2 * n - 1, false) # Отмечать наличие ферзя на главной диагонали
      diags2 = Array.new(2 * n - 1, false) # Отмечать наличие ферзя на побочной диагонали
      res = []
      backtrack(0, n, state, res, cols, diags1, diags2)

      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28row%3A%20int%2C%20n%3A%20int%2C%20state%3A%20list%5Blist%5Bstr%5D%5D%2C%20res%3A%20list%5Blist%5Blist%5Bstr%5D%5D%5D%2C%20cols%3A%20list%5Bbool%5D%2C%20diags1%3A%20list%5Bbool%5D%2C%20diags2%3A%20list%5Bbool%5D%29%3A%0A%20%20%20%20if%20row%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res.append%28%5Blist%28row%29%20for%20row%20in%20state%5D%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20for%20col%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20diag1%20%3D%20row%20-%20col%20%2B%20n%20-%201%0A%20%20%20%20%20%20%20%20diag2%20%3D%20row%20%2B%20col%0A%20%20%20%20%20%20%20%20if%20not%20cols%5Bcol%5D%20and%20%28not%20diags1%5Bdiag1%5D%29%20and%20%28not%20diags2%5Bdiag2%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%27Q%27%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28row%20%2B%201%2C%20n%2C%20state%2C%20res%2C%20cols%2C%20diags1%2C%20diags2%29%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%27%23%27%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20False%0A%0Adef%20n_queens%28n%3A%20int%29%20-%3E%20list%5Blist%5Blist%5Bstr%5D%5D%5D%3A%0A%20%20%20%20state%20%3D%20%5B%5B%27%23%27%20for%20_%20in%20range%28n%29%5D%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20cols%20%3D%20%5BFalse%5D%20%2A%20n%0A%20%20%20%20diags1%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%0A%20%20%20%20diags2%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%280%2C%20n%2C%20state%2C%20res%2C%20cols%2C%20diags1%2C%20diags2%29%0A%20%20%20%20return%20res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20res%20%3D%20n_queens%28n%29%0A%20%20%20%20print%28f%27%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%B4%D0%BE%D1%81%D0%BA%D0%B8%20%3D%20%7Bn%7D%27%29%0A%20%20%20%20print%28f%27%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D1%80%D0%B0%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%84%D0%B5%D1%80%D0%B7%D0%B5%D0%B9%3A%20%7Blen%28res%29%7D%27%29%0A%20%20%20%20for%20state%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%27--------------------%27%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20state%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28row%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=61&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28row%3A%20int%2C%20n%3A%20int%2C%20state%3A%20list%5Blist%5Bstr%5D%5D%2C%20res%3A%20list%5Blist%5Blist%5Bstr%5D%5D%5D%2C%20cols%3A%20list%5Bbool%5D%2C%20diags1%3A%20list%5Bbool%5D%2C%20diags2%3A%20list%5Bbool%5D%29%3A%0A%20%20%20%20if%20row%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res.append%28%5Blist%28row%29%20for%20row%20in%20state%5D%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20for%20col%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20diag1%20%3D%20row%20-%20col%20%2B%20n%20-%201%0A%20%20%20%20%20%20%20%20diag2%20%3D%20row%20%2B%20col%0A%20%20%20%20%20%20%20%20if%20not%20cols%5Bcol%5D%20and%20%28not%20diags1%5Bdiag1%5D%29%20and%20%28not%20diags2%5Bdiag2%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%27Q%27%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28row%20%2B%201%2C%20n%2C%20state%2C%20res%2C%20cols%2C%20diags1%2C%20diags2%29%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%27%23%27%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20False%0A%0Adef%20n_queens%28n%3A%20int%29%20-%3E%20list%5Blist%5Blist%5Bstr%5D%5D%5D%3A%0A%20%20%20%20state%20%3D%20%5B%5B%27%23%27%20for%20_%20in%20range%28n%29%5D%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20cols%20%3D%20%5BFalse%5D%20%2A%20n%0A%20%20%20%20diags1%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%0A%20%20%20%20diags2%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%280%2C%20n%2C%20state%2C%20res%2C%20cols%2C%20diags1%2C%20diags2%29%0A%20%20%20%20return%20res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20res%20%3D%20n_queens%28n%29%0A%20%20%20%20print%28f%27%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9%20%D0%B4%D0%BE%D1%81%D0%BA%D0%B8%20%3D%20%7Bn%7D%27%29%0A%20%20%20%20print%28f%27%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D0%BE%D0%B2%20%D1%80%D0%B0%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%84%D0%B5%D1%80%D0%B7%D0%B5%D0%B9%3A%20%7Blen%28res%29%7D%27%29%0A%20%20%20%20for%20state%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%27--------------------%27%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20state%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28row%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=61&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Если размещать ферзей построчно $n$ раз, учитывая ограничение по столбцам, то начиная с первой строки и заканчивая последней мы получаем соответственно $n$, $n-1$, $\dots$, $2$, $1$ вариантов выбора, что дает $O(n!)$ времени. При записи решения нужно скопировать матрицу `state` и добавить ее в `res` , а копирование требует $O(n^2)$ времени. Следовательно, **общая временная сложность равна $O(n! \cdot n^2)$** . На практике обрезка по диагональным ограничениям дополнительно сильно уменьшает пространство поиска, поэтому фактическая эффективность часто лучше этой оценки.

Массив `state` использует $O(n^2)$ пространства, а массивы `cols` , `diags1` и `diags2` используют по $O(n)$ пространства. Максимальная глубина рекурсии равна $n$ , что требует $O(n)$ памяти стека. Следовательно, **пространственная сложность равна $O(n^2)$** .
