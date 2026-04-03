---
comments: true
---

# 12.4 &nbsp; Задача о Ханойской башне

В задачах сортировки слиянием и построения двоичного дерева мы делили исходную задачу на две подзадачи, каждая из которых имела размер, равный примерно половине исходной задачи. Однако для задачи о Ханойской башне используется другая стратегия разбиения.

!!! question

    Даны три стержня, обозначенные как `A` , `B` и `C` . В начальном состоянии на стержне `A` находятся $n$ дисков, расположенных сверху вниз в порядке от меньшего к большему. Нужно переместить эти $n$ дисков на стержень `C` , сохранив их исходный порядок (как показано на рисунке 12-10). Во время перемещения дисков необходимо соблюдать следующие правила.
    
    1. Диск можно снять только с вершины одного стержня и положить только на вершину другого стержня.
    2. За один раз можно перемещать только один диск.
    3. Меньший диск всегда должен лежать на большем.

![Пример задачи о Ханойской башне](hanota_problem.assets/hanota_example.png){ class="animation-figure" }

<p align="center"> Рисунок 12-10 &nbsp; Пример задачи о Ханойской башне </p>

**Обозначим задачу о Ханойской башне размера $i$ как $f(i)$** . Например, $f(3)$ означает задачу перемещения 3 дисков со стержня `A` на стержень `C` .

### 1. &nbsp; Рассмотрим базовые случаи

Как показано на рисунке 12-11, для задачи $f(1)$ , то есть когда имеется только один диск, достаточно просто переместить его напрямую со стержня `A` на стержень `C` .

=== "<1>"
    ![Решение задачи размера 1](hanota_problem.assets/hanota_f1_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f1_step2](hanota_problem.assets/hanota_f1_step2.png){ class="animation-figure" }

<p align="center"> Рисунок 12-11 &nbsp; Решение задачи размера 1 </p>

Как показано на рисунке 12-12, для задачи $f(2)$ , то есть когда есть два диска, **поскольку меньший диск все время должен лежать на большем, приходится использовать `B` как вспомогательный стержень**.

1. Сначала переместить верхний маленький диск с `A` на `B` .
2. Затем переместить большой диск с `A` на `C` .
3. Наконец, переместить маленький диск с `B` на `C` .

=== "<1>"
    ![Решение задачи размера 2](hanota_problem.assets/hanota_f2_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f2_step2](hanota_problem.assets/hanota_f2_step2.png){ class="animation-figure" }

=== "<3>"
    ![hanota_f2_step3](hanota_problem.assets/hanota_f2_step3.png){ class="animation-figure" }

=== "<4>"
    ![hanota_f2_step4](hanota_problem.assets/hanota_f2_step4.png){ class="animation-figure" }

<p align="center"> Рисунок 12-12 &nbsp; Решение задачи размера 2 </p>

Процесс решения задачи $f(2)$ можно кратко описать так: **переместить два диска с `A` на `C` с помощью `B`** . Здесь `C` называется целевым стержнем, а `B` - буферным стержнем.

### 2. &nbsp; Разбиение на подзадачи

Для задачи $f(3)$ , то есть когда имеется три диска, ситуация становится сложнее.

Поскольку решения $f(1)$ и $f(2)$ уже известны, можно подойти к задаче с точки зрения стратегии "разделяй и властвуй" и **рассматривать два верхних диска на `A` как единое целое**, выполняя шаги, показанные на рисунке 12-13. Так три диска успешно перемещаются с `A` на `C` .

1. Сделать `B` целевым стержнем, а `C` буферным, и переместить два диска с `A` на `B` .
2. Переместить оставшийся один диск с `A` напрямую на `C` .
3. Сделать `C` целевым стержнем, а `A` буферным, и переместить два диска с `B` на `C` .

=== "<1>"
    ![Решение задачи размера 3](hanota_problem.assets/hanota_f3_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f3_step2](hanota_problem.assets/hanota_f3_step2.png){ class="animation-figure" }

=== "<3>"
    ![hanota_f3_step3](hanota_problem.assets/hanota_f3_step3.png){ class="animation-figure" }

=== "<4>"
    ![hanota_f3_step4](hanota_problem.assets/hanota_f3_step4.png){ class="animation-figure" }

<p align="center"> Рисунок 12-13 &nbsp; Решение задачи размера 3 </p>

Иначе говоря, **мы разбиваем задачу $f(3)$ на две подзадачи $f(2)$ и одну подзадачу $f(1)$** . Если последовательно решить эти три подзадачи, исходная задача тоже будет решена. Это показывает, что подзадачи независимы и что их решения можно объединить.

Таким образом, можно сформулировать показанную на рисунке 12-14 стратегию "разделяй и властвуй" для задачи о Ханойской башне: исходная задача $f(n)$ разбивается на две подзадачи $f(n-1)$ и одну подзадачу $f(1)$ , которые затем решаются в следующем порядке.

1. Переместить $n-1$ дисков с `A` на `B` с помощью `C` .
2. Переместить оставшийся $1$ диск напрямую с `A` на `C` .
3. Переместить $n-1$ дисков с `B` на `C` с помощью `A` .

Для двух подзадач $f(n-1)$ **можно применять тот же способ рекурсивного разбиения**, пока не будет достигнута наименьшая подзадача $f(1)$ . А решение для $f(1)$ уже известно и требует всего одного перемещения.

![Стратегия разделяй и властвуй для решения задачи о Ханойской башне](hanota_problem.assets/hanota_divide_and_conquer.png){ class="animation-figure" }

<p align="center"> Рисунок 12-14 &nbsp; Стратегия разделяй и властвуй для решения задачи о Ханойской башне </p>

### 3. &nbsp; Реализация кода

В коде мы объявляем рекурсивную функцию `dfs(i, src, buf, tar)` , которая перемещает $i$ верхних дисков со стержня `src` на целевой стержень `tar` с помощью буферного стержня `buf` :

=== "Python"

    ```python title="hanota.py"
    def move(src: list[int], tar: list[int]):
        """Переместить один диск"""
        # Снять диск с вершины src
        pan = src.pop()
        # Положить диск на вершину tar
        tar.append(pan)

    def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
        """Решить задачу Ханойской башни f(i)"""
        # Если в src остался только один диск, сразу переместить его в tar
        if i == 1:
            move(src, tar)
            return
        # Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfs(i - 1, src, tar, buf)
        # Подзадача f(1): переместить оставшийся один диск из src в tar
        move(src, tar)
        # Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfs(i - 1, buf, src, tar)

    def solve_hanota(A: list[int], B: list[int], C: list[int]):
        """Решить задачу Ханойской башни"""
        n = len(A)
        # Переместить верхние n дисков из A в C с помощью B
        dfs(n, A, B, C)
    ```

=== "C++"

    ```cpp title="hanota.cpp"
    /* Переместить один диск */
    void move(vector<int> &src, vector<int> &tar) {
        // Снять диск с вершины src
        int pan = src.back();
        src.pop_back();
        // Положить диск на вершину tar
        tar.push_back(pan);
    }

    /* Решить задачу Ханойской башни f(i) */
    void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
        // Если в src остался только один диск, сразу переместить его в tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfs(i - 1, src, tar, buf);
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        move(src, tar);
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfs(i - 1, buf, src, tar);
    }

    /* Решить задачу Ханойской башни */
    void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
        int n = A.size();
        // Переместить верхние n дисков из A в C с помощью B
        dfs(n, A, B, C);
    }
    ```

=== "Java"

    ```java title="hanota.java"
    /* Переместить один диск */
    void move(List<Integer> src, List<Integer> tar) {
        // Снять диск с вершины src
        Integer pan = src.remove(src.size() - 1);
        // Положить диск на вершину tar
        tar.add(pan);
    }

    /* Решить задачу Ханойской башни f(i) */
    void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // Если в src остался только один диск, сразу переместить его в tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfs(i - 1, src, tar, buf);
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        move(src, tar);
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfs(i - 1, buf, src, tar);
    }

    /* Решить задачу Ханойской башни */
    void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // Переместить верхние n дисков из A в C с помощью B
        dfs(n, A, B, C);
    }
    ```

=== "C#"

    ```csharp title="hanota.cs"
    /* Переместить один диск */
    void Move(List<int> src, List<int> tar) {
        // Снять диск с вершины src
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // Положить диск на вершину tar
        tar.Add(pan);
    }

    /* Решить задачу Ханойской башни f(i) */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // Если в src остался только один диск, сразу переместить его в tar
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        DFS(i - 1, src, tar, buf);
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        Move(src, tar);
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        DFS(i - 1, buf, src, tar);
    }

    /* Решить задачу Ханойской башни */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // Переместить верхние n дисков из A в C с помощью B
        DFS(n, A, B, C);
    }
    ```

=== "Go"

    ```go title="hanota.go"
    /* Переместить один диск */
    func move(src, tar *list.List) {
        // Снять диск с вершины src
        pan := src.Back()
        // Положить диск на вершину tar
        tar.PushBack(pan.Value)
        // Убрать верхний диск из src
        src.Remove(pan)
    }

    /* Решить задачу Ханойской башни f(i) */
    func dfsHanota(i int, src, buf, tar *list.List) {
        // Если в src остался только один диск, сразу переместить его в tar
        if i == 1 {
            move(src, tar)
            return
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfsHanota(i-1, src, tar, buf)
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        move(src, tar)
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfsHanota(i-1, buf, src, tar)
    }

    /* Решить задачу Ханойской башни */
    func solveHanota(A, B, C *list.List) {
        n := A.Len()
        // Переместить верхние n дисков из A в C с помощью B
        dfsHanota(n, A, B, C)
    }
    ```

=== "Swift"

    ```swift title="hanota.swift"
    /* Переместить один диск */
    func move(src: inout [Int], tar: inout [Int]) {
        // Снять диск с вершины src
        let pan = src.popLast()!
        // Положить диск на вершину tar
        tar.append(pan)
    }

    /* Решить задачу Ханойской башни f(i) */
    func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
        // Если в src остался только один диск, сразу переместить его в tar
        if i == 1 {
            move(src: &src, tar: &tar)
            return
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        move(src: &src, tar: &tar)
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
    }

    /* Решить задачу Ханойской башни */
    func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
        let n = A.count
        // Хвост списка соответствует вершине столбца
        // Переместить верхние n дисков из src в C с помощью B
        dfs(i: n, src: &A, buf: &B, tar: &C)
    }
    ```

=== "JS"

    ```javascript title="hanota.js"
    /* Переместить один диск */
    function move(src, tar) {
        // Снять диск с вершины src
        const pan = src.pop();
        // Положить диск на вершину tar
        tar.push(pan);
    }

    /* Решить задачу Ханойской башни f(i) */
    function dfs(i, src, buf, tar) {
        // Если в src остался только один диск, сразу переместить его в tar
        if (i === 1) {
            move(src, tar);
            return;
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfs(i - 1, src, tar, buf);
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        move(src, tar);
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfs(i - 1, buf, src, tar);
    }

    /* Решить задачу Ханойской башни */
    function solveHanota(A, B, C) {
        const n = A.length;
        // Переместить верхние n дисков из A в C с помощью B
        dfs(n, A, B, C);
    }
    ```

=== "TS"

    ```typescript title="hanota.ts"
    /* Переместить один диск */
    function move(src: number[], tar: number[]): void {
        // Снять диск с вершины src
        const pan = src.pop();
        // Положить диск на вершину tar
        tar.push(pan);
    }

    /* Решить задачу Ханойской башни f(i) */
    function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
        // Если в src остался только один диск, сразу переместить его в tar
        if (i === 1) {
            move(src, tar);
            return;
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfs(i - 1, src, tar, buf);
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        move(src, tar);
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfs(i - 1, buf, src, tar);
    }

    /* Решить задачу Ханойской башни */
    function solveHanota(A: number[], B: number[], C: number[]): void {
        const n = A.length;
        // Переместить верхние n дисков из A в C с помощью B
        dfs(n, A, B, C);
    }
    ```

=== "Dart"

    ```dart title="hanota.dart"
    /* Переместить один диск */
    void move(List<int> src, List<int> tar) {
      // Снять диск с вершины src
      int pan = src.removeLast();
      // Положить диск на вершину tar
      tar.add(pan);
    }

    /* Решить задачу Ханойской башни f(i) */
    void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
      // Если в src остался только один диск, сразу переместить его в tar
      if (i == 1) {
        move(src, tar);
        return;
      }
      // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
      dfs(i - 1, src, tar, buf);
      // Подзадача f(1): переместить оставшийся один диск из src в tar
      move(src, tar);
      // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
      dfs(i - 1, buf, src, tar);
    }

    /* Решить задачу Ханойской башни */
    void solveHanota(List<int> A, List<int> B, List<int> C) {
      int n = A.length;
      // Переместить верхние n дисков из A в C с помощью B
      dfs(n, A, B, C);
    }
    ```

=== "Rust"

    ```rust title="hanota.rs"
    /* Переместить один диск */
    fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
        // Снять диск с вершины src
        let pan = src.pop().unwrap();
        // Положить диск на вершину tar
        tar.push(pan);
    }

    /* Решить задачу Ханойской башни f(i) */
    fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
        // Если в src остался только один диск, сразу переместить его в tar
        if i == 1 {
            move_pan(src, tar);
            return;
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfs(i - 1, src, tar, buf);
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        move_pan(src, tar);
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfs(i - 1, buf, src, tar);
    }

    /* Решить задачу Ханойской башни */
    fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
        let n = A.len() as i32;
        // Переместить верхние n дисков из A в C с помощью B
        dfs(n, A, B, C);
    }
    ```

=== "C"

    ```c title="hanota.c"
    /* Переместить один диск */
    void move(int *src, int *srcSize, int *tar, int *tarSize) {
        // Снять диск с вершины src
        int pan = src[*srcSize - 1];
        src[*srcSize - 1] = 0;
        (*srcSize)--;
        // Положить диск на вершину tar
        tar[*tarSize] = pan;
        (*tarSize)++;
    }

    /* Решить задачу Ханойской башни f(i) */
    void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
        // Если в src остался только один диск, сразу переместить его в tar
        if (i == 1) {
            move(src, srcSize, tar, tarSize);
            return;
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        move(src, srcSize, tar, tarSize);
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
    }

    /* Решить задачу Ханойской башни */
    void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
        // Переместить верхние n дисков из A в C с помощью B
        dfs(*ASize, A, ASize, B, BSize, C, CSize);
    }
    ```

=== "Kotlin"

    ```kotlin title="hanota.kt"
    /* Переместить один диск */
    fun move(src: MutableList<Int>, tar: MutableList<Int>) {
        // Снять диск с вершины src
        val pan = src.removeAt(src.size - 1)
        // Положить диск на вершину tar
        tar.add(pan)
    }

    /* Решить задачу Ханойской башни f(i) */
    fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
        // Если в src остался только один диск, сразу переместить его в tar
        if (i == 1) {
            move(src, tar)
            return
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfs(i - 1, src, tar, buf)
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        move(src, tar)
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfs(i - 1, buf, src, tar)
    }

    /* Решить задачу Ханойской башни */
    fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
        val n = A.size
        // Переместить верхние n дисков из A в C с помощью B
        dfs(n, A, B, C)
    }
    ```

=== "Ruby"

    ```ruby title="hanota.rb"
    ### Переместить один диск ###
    def move(src, tar)
      # Снять диск с вершины src
      pan = src.pop
      # Положить диск на вершину tar
      tar << pan
    end

    ### Решить задачу Ханойской башни f(i) ###
    def dfs(i, src, buf, tar)
      # Если в src остался только один диск, сразу переместить его в tar
      if i == 1
        move(src, tar)
        return
      end

      # Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
      dfs(i - 1, src, tar, buf)
      # Подзадача f(1): переместить оставшийся один диск из src в tar
      move(src, tar)
      # Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
      dfs(i - 1, buf, src, tar)
    end

    ### Решить задачу Ханойской башни ###
    def solve_hanota(_A, _B, _C)
      n = _A.length
      # Переместить верхние n дисков из A в C с помощью B
      dfs(n, _A, _B, _C)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20move%28src%3A%20list%5Bint%5D%2C%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%B4%D0%B8%D1%81%D0%BA%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%BD%D1%8F%D1%82%D1%8C%20%D0%B4%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%20src%0A%20%20%20%20pan%20%3D%20src.pop%28%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D0%BE%D0%B6%D0%B8%D1%82%D1%8C%20%D0%B4%D0%B8%D1%81%D0%BA%20%D0%BD%D0%B0%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%20tar%0A%20%20%20%20tar.append%28pan%29%0A%0A%0Adef%20dfs%28i%3A%20int%2C%20src%3A%20list%5Bint%5D%2C%20buf%3A%20list%5Bint%5D%2C%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B5%D1%88%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20%D0%A5%D0%B0%D0%BD%D0%BE%D0%B9%D1%81%D0%BA%D0%BE%D0%B9%20%D0%B1%D0%B0%D1%88%D0%BD%D0%B8%20f%28i%29%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%20src%20%D0%BE%D1%81%D1%82%D0%B0%D0%BB%D1%81%D1%8F%20%D1%82%D0%BE%D0%BB%D1%8C%D0%BA%D0%BE%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%B4%D0%B8%D1%81%D0%BA%2C%20%D1%81%D1%80%D0%B0%D0%B7%D1%83%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%B5%D0%B3%D0%BE%20%D0%B2%20tar%0A%20%20%20%20if%20i%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20move%28src%2C%20tar%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%28i-1%29%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B5%20i-1%20%D0%B4%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%20%D0%B8%D0%B7%20src%20%D0%B2%20buf%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20tar%0A%20%20%20%20dfs%28i%20-%201%2C%20src%2C%20tar%2C%20buf%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%281%29%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D1%81%D1%82%D0%B0%D0%B2%D1%88%D0%B8%D0%B9%D1%81%D1%8F%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%B4%D0%B8%D1%81%D0%BA%20%D0%B8%D0%B7%20src%20%D0%B2%20tar%0A%20%20%20%20move%28src%2C%20tar%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%28i-1%29%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B5%20i-1%20%D0%B4%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%20%D0%B8%D0%B7%20buf%20%D0%B2%20tar%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20src%0A%20%20%20%20dfs%28i%20-%201%2C%20buf%2C%20src%2C%20tar%29%0A%0A%0Adef%20solve_hanota%28A%3A%20list%5Bint%5D%2C%20B%3A%20list%5Bint%5D%2C%20C%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B5%D1%88%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20%D0%A5%D0%B0%D0%BD%D0%BE%D0%B9%D1%81%D0%BA%D0%BE%D0%B9%20%D0%B1%D0%B0%D1%88%D0%BD%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28A%29%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B5%20n%20%D0%B4%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%20%D0%B8%D0%B7%20A%20%D0%B2%20C%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20B%0A%20%20%20%20dfs%28n%2C%20A%2C%20B%2C%20C%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A5%D0%B2%D0%BE%D1%81%D1%82%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D0%B5%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D1%86%D0%B0%0A%20%20%20%20A%20%3D%20%5B5%2C%204%2C%203%2C%202%2C%201%5D%0A%20%20%20%20B%20%3D%20%5B%5D%0A%20%20%20%20C%20%3D%20%5B%5D%0A%20%20%20%20print%28%22%D0%98%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29%0A%0A%20%20%20%20solve_hanota%28A%2C%20B%2C%20C%29%0A%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B4%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20move%28src%3A%20list%5Bint%5D%2C%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%B4%D0%B8%D1%81%D0%BA%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%BD%D1%8F%D1%82%D1%8C%20%D0%B4%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%8B%20src%0A%20%20%20%20pan%20%3D%20src.pop%28%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D0%BE%D0%B6%D0%B8%D1%82%D1%8C%20%D0%B4%D0%B8%D1%81%D0%BA%20%D0%BD%D0%B0%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%20tar%0A%20%20%20%20tar.append%28pan%29%0A%0A%0Adef%20dfs%28i%3A%20int%2C%20src%3A%20list%5Bint%5D%2C%20buf%3A%20list%5Bint%5D%2C%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B5%D1%88%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20%D0%A5%D0%B0%D0%BD%D0%BE%D0%B9%D1%81%D0%BA%D0%BE%D0%B9%20%D0%B1%D0%B0%D1%88%D0%BD%D0%B8%20f%28i%29%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%20src%20%D0%BE%D1%81%D1%82%D0%B0%D0%BB%D1%81%D1%8F%20%D1%82%D0%BE%D0%BB%D1%8C%D0%BA%D0%BE%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%B4%D0%B8%D1%81%D0%BA%2C%20%D1%81%D1%80%D0%B0%D0%B7%D1%83%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%B5%D0%B3%D0%BE%20%D0%B2%20tar%0A%20%20%20%20if%20i%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20move%28src%2C%20tar%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%28i-1%29%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B5%20i-1%20%D0%B4%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%20%D0%B8%D0%B7%20src%20%D0%B2%20buf%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20tar%0A%20%20%20%20dfs%28i%20-%201%2C%20src%2C%20tar%2C%20buf%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%281%29%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D1%81%D1%82%D0%B0%D0%B2%D1%88%D0%B8%D0%B9%D1%81%D1%8F%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%B4%D0%B8%D1%81%D0%BA%20%D0%B8%D0%B7%20src%20%D0%B2%20tar%0A%20%20%20%20move%28src%2C%20tar%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%28i-1%29%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B5%20i-1%20%D0%B4%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%20%D0%B8%D0%B7%20buf%20%D0%B2%20tar%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20src%0A%20%20%20%20dfs%28i%20-%201%2C%20buf%2C%20src%2C%20tar%29%0A%0A%0Adef%20solve_hanota%28A%3A%20list%5Bint%5D%2C%20B%3A%20list%5Bint%5D%2C%20C%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B5%D1%88%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20%D0%A5%D0%B0%D0%BD%D0%BE%D0%B9%D1%81%D0%BA%D0%BE%D0%B9%20%D0%B1%D0%B0%D1%88%D0%BD%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28A%29%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B5%20n%20%D0%B4%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%20%D0%B8%D0%B7%20A%20%D0%B2%20C%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20B%0A%20%20%20%20dfs%28n%2C%20A%2C%20B%2C%20C%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A5%D0%B2%D0%BE%D1%81%D1%82%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D0%B5%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D1%86%D0%B0%0A%20%20%20%20A%20%3D%20%5B5%2C%204%2C%203%2C%202%2C%201%5D%0A%20%20%20%20B%20%3D%20%5B%5D%0A%20%20%20%20C%20%3D%20%5B%5D%0A%20%20%20%20print%28%22%D0%98%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B5%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29%0A%0A%20%20%20%20solve_hanota%28A%2C%20B%2C%20C%29%0A%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B4%D0%B8%D1%81%D0%BA%D0%BE%D0%B2%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Как показано на рисунке 12-15, задача о Ханойской башне формирует дерево рекурсии высоты $n$ , в котором каждый узел представляет подзадачу и соответствует одному открытому вызову `dfs()` ; **поэтому временная сложность равна $O(2^n)$ , а пространственная сложность равна $O(n)$** .

![Дерево рекурсии задачи о Ханойской башне](hanota_problem.assets/hanota_recursive_tree.png){ class="animation-figure" }

<p align="center"> Рисунок 12-15 &nbsp; Дерево рекурсии задачи о Ханойской башне </p>

!!! quote

    Задача о Ханойской башне происходит из древней легенды. В одном из храмов древней Индии монахи имели три высоких алмазных стержня и $64$ золотых диска разного размера. Монахи непрерывно перекладывали диски и верили, что в тот момент, когда последний диск будет правильно перенесен, мир подойдет к концу.

    Однако даже если бы монахи перемещали по одному диску в секунду, им понадобилось бы примерно $2^{64} \approx 1.84×10^{19}$ секунд, то есть около $585$ миллиардов лет, что намного превышает текущую оценку возраста Вселенной. Поэтому, если легенда и верна, нам, вероятно, пока не о чем беспокоиться.
