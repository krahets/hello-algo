---
comments: true
---

# 14.4 &nbsp; Задача о рюкзаке 0-1

Задача о рюкзаке - это очень хороший вводный пример для динамического программирования и одна из самых типичных форм задач этого класса. У нее существует множество вариантов, например задача о рюкзаке 0-1, задача о полном рюкзаке, задача о многократном рюкзаке и т.д.

В этом разделе сначала разберем самый распространенный вариант - задачу о рюкзаке 0-1.

!!! question

    Даны $n$ предметов. Вес $i$-го предмета равен $wgt[i-1]$ , стоимость равна $val[i-1]$ . Также дан рюкзак вместимости $cap$ . Каждый предмет можно выбрать только один раз. Найдите максимальную суммарную стоимость, которую можно поместить в рюкзак при заданной вместимости.

Как видно на рисунке 14-17, поскольку номер предмета $i$ начинается с $1$ , а индексы массива начинаются с $0$ , предмету $i$ соответствуют вес $wgt[i-1]$ и стоимость $val[i-1]$ .

![Пример данных для задачи о рюкзаке 0-1](knapsack_problem.assets/knapsack_example.png){ class="animation-figure" }

<p align="center"> Рисунок 14-17 &nbsp; Пример данных для задачи о рюкзаке 0-1 </p>

На задачу о рюкзаке 0-1 можно смотреть как на процесс из $n$ раундов решений: для каждого предмета есть два решения - не класть его в рюкзак или положить в рюкзак. Поэтому задача удовлетворяет модели дерева решений.

Цель задачи - найти "максимальную суммарную стоимость при ограниченной вместимости рюкзака", значит, с большой вероятностью это задача динамического программирования.

**Шаг 1: продумать решения на каждом раунде, определить состояние и тем самым получить таблицу $dp$**

Для каждого предмета возможны два случая: не класть его в рюкзак, тогда вместимость не меняется; или положить его в рюкзак, тогда оставшаяся вместимость уменьшается. Отсюда получается определение состояния: текущий номер предмета $i$ и текущая вместимость рюкзака $c$ , то есть состояние обозначается как $[i, c]$ .

Подзадача, соответствующая состоянию $[i, c]$ , такова: **максимальная стоимость, которую можно получить, используя первые $i$ предметов и рюкзак вместимости $c$**. Ее решение обозначается через $dp[i, c]$ .

Искомым значением является $dp[n, cap]$ , значит, нам нужна двумерная таблица $dp$ размера $(n+1) \times (cap+1)$ .

**Шаг 2: найти оптимальную подструктуру и на ее основе вывести уравнение перехода состояния**

После того как мы принимаем решение по предмету $i$ , остается подзадача, связанная с первыми $i-1$ предметами. Здесь возможны два случая.

- **Не класть предмет $i$** : вместимость рюкзака не меняется, и состояние переходит в $[i-1, c]$ .
- **Положить предмет $i$** : вместимость рюкзака уменьшается на $wgt[i-1]$ , а стоимость увеличивается на $val[i-1]$ , и состояние переходит в $[i-1, c-wgt[i-1]]$ .

Этот анализ и раскрывает оптимальную подструктуру задачи: **максимальная стоимость $dp[i, c]$ равна лучшему из двух вариантов - не брать предмет $i$ или взять предмет $i$**. Отсюда получается уравнение перехода состояния:

$$
dp[i, c] = \max(dp[i-1, c], dp[i-1, c - wgt[i-1]] + val[i-1])
$$

Нужно учитывать, что если вес текущего предмета $wgt[i - 1]$ превышает оставшуюся вместимость $c$ , то предмет можно только не брать.

**Шаг 3: определить граничные условия и порядок переходов**

Когда предметов нет или вместимость рюкзака равна $0$ , максимальная стоимость равна $0$ ; то есть весь первый столбец $dp[i, 0]$ и вся первая строка $dp[0, c]$ заполняются нулями.

Текущее состояние $[i, c]$ зависит от состояния сверху $[i-1, c]$ и состояния слева сверху $[i-1, c-wgt[i-1]]$ , поэтому достаточно двумя вложенными циклами пройти по всей таблице $dp$ в прямом порядке.

После этого анализа реализуем по порядку: полный перебор, поиск с мемоизацией и динамическое программирование.

### 1. &nbsp; Метод 1: полный перебор

Код поиска содержит следующие элементы.

- **Параметры рекурсии**: состояние $[i, c]$ .
- **Возвращаемое значение**: решение подзадачи $dp[i, c]$ .
- **Условие завершения**: когда номер предмета выходит за границу, то есть $i = 0$ , или оставшаяся вместимость равна $0$ , рекурсия завершается и возвращается стоимость $0$ .
- **Обрезка**: если вес текущего предмета превышает оставшуюся вместимость рюкзака, то можно только не класть этот предмет.

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
        """Рюкзак 0-1: полный перебор"""
        # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if i == 0 or c == 0:
            return 0
        # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if wgt[i - 1] > c:
            return knapsack_dfs(wgt, val, i - 1, c)
        # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        no = knapsack_dfs(wgt, val, i - 1, c)
        yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
        # Вернуть вариант с большей стоимостью из двух возможных
        return max(no, yes)
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* Рюкзак 0-1: полный перебор */
    int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Вернуть вариант с большей стоимостью из двух возможных
        return max(no, yes);
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* Рюкзак 0-1: полный перебор */
    int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Вернуть вариант с большей стоимостью из двух возможных
        return Math.max(no, yes);
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* Рюкзак 0-1: полный перебор */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // Вернуть вариант с большей стоимостью из двух возможных
        return Math.Max(no, yes);
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* Рюкзак 0-1: полный перебор */
    func knapsackDFS(wgt, val []int, i, c int) int {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if i == 0 || c == 0 {
            return 0
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if wgt[i-1] > c {
            return knapsackDFS(wgt, val, i-1, c)
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        no := knapsackDFS(wgt, val, i-1, c)
        yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
        // Вернуть вариант с большей стоимостью из двух возможных
        return int(math.Max(float64(no), float64(yes)))
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* Рюкзак 0-1: полный перебор */
    func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if i == 0 || c == 0 {
            return 0
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if wgt[i - 1] > c {
            return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
        let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
        // Вернуть вариант с большей стоимостью из двух возможных
        return max(no, yes)
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* Рюкзак 0-1: полный перебор */
    function knapsackDFS(wgt, val, i, c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        const no = knapsackDFS(wgt, val, i - 1, c);
        const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Вернуть вариант с большей стоимостью из двух возможных
        return Math.max(no, yes);
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* Рюкзак 0-1: полный перебор */
    function knapsackDFS(
        wgt: Array<number>,
        val: Array<number>,
        i: number,
        c: number
    ): number {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        const no = knapsackDFS(wgt, val, i - 1, c);
        const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Вернуть вариант с большей стоимостью из двух возможных
        return Math.max(no, yes);
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* Рюкзак 0-1: полный перебор */
    int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
      // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
      if (i == 0 || c == 0) {
        return 0;
      }
      // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
      if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
      }
      // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
      int no = knapsackDFS(wgt, val, i - 1, c);
      int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
      // Вернуть вариант с большей стоимостью из двух возможных
      return max(no, yes);
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* Рюкзак 0-1: полный перебор */
    fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if i == 0 || c == 0 {
            return 0;
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if wgt[i - 1] > c as i32 {
            return knapsack_dfs(wgt, val, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        let no = knapsack_dfs(wgt, val, i - 1, c);
        let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
        // Вернуть вариант с большей стоимостью из двух возможных
        std::cmp::max(no, yes)
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* Рюкзак 0-1: полный перебор */
    int knapsackDFS(int wgt[], int val[], int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Вернуть вариант с большей стоимостью из двух возможных
        return myMax(no, yes);
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* Рюкзак 0-1: полный перебор */
    fun knapsackDFS(
        wgt: IntArray,
        _val: IntArray,
        i: Int,
        c: Int
    ): Int {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, _val, i - 1, c)
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        val no = knapsackDFS(wgt, _val, i - 1, c)
        val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
        // Вернуть вариант с большей стоимостью из двух возможных
        return max(no, yes)
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    =begin
    File: knapsack.rb
    Created Time: 2024-05-29
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    # ## Рюкзак 0-1: полный перебор ###
    def knapsack_dfs(wgt, val, i, c)
      # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
      return 0 if i == 0 || c == 0
      # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
      return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
      # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
      no = knapsack_dfs(wgt, val, i - 1, c)
      yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
      # Вернуть вариант с большей стоимостью из двух возможных
      [no, yes].max
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20i%3A%20int%2C%20c%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%200-1%3A%20%D0%BF%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D1%8B%20%D1%83%D0%B6%D0%B5%20%D1%80%D0%B0%D1%81%D1%81%D0%BC%D0%BE%D1%82%D1%80%D0%B5%D0%BD%D1%8B%20%D0%B8%D0%BB%D0%B8%20%D0%B2%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B5%20%D0%BD%D0%B5%20%D0%BE%D1%81%D1%82%D0%B0%D0%BB%D0%BE%D1%81%D1%8C%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D1%82%D0%BE%D0%BB%D1%8C%D0%BA%D0%BE%20%D0%BD%D0%B5%20%D0%BA%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20%D0%B2%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%83%D1%8E%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%B4%D0%BB%D1%8F%20%D1%81%D0%BB%D1%83%D1%87%D0%B0%D0%B5%D0%B2%2C%20%D0%BA%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%BA%D0%BB%D0%B0%D0%B4%D1%83%D1%82%20%D0%B8%20%D0%BA%D0%BB%D0%B0%D0%B4%D1%83%D1%82%0A%20%20%20%20no%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%20%D1%81%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B9%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%D1%8E%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D0%B2%D0%BE%D0%B7%D0%BC%D0%BE%D0%B6%D0%BD%D1%8B%D1%85%0A%20%20%20%20return%20max%28no%2C%20yes%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%0A%20%20%20%20res%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20i%3A%20int%2C%20c%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%200-1%3A%20%D0%BF%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D1%8B%20%D1%83%D0%B6%D0%B5%20%D1%80%D0%B0%D1%81%D1%81%D0%BC%D0%BE%D1%82%D1%80%D0%B5%D0%BD%D1%8B%20%D0%B8%D0%BB%D0%B8%20%D0%B2%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B5%20%D0%BD%D0%B5%20%D0%BE%D1%81%D1%82%D0%B0%D0%BB%D0%BE%D1%81%D1%8C%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D1%82%D0%BE%D0%BB%D1%8C%D0%BA%D0%BE%20%D0%BD%D0%B5%20%D0%BA%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20%D0%B2%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%83%D1%8E%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%B4%D0%BB%D1%8F%20%D1%81%D0%BB%D1%83%D1%87%D0%B0%D0%B5%D0%B2%2C%20%D0%BA%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%BA%D0%BB%D0%B0%D0%B4%D1%83%D1%82%20%D0%B8%20%D0%BA%D0%BB%D0%B0%D0%B4%D1%83%D1%82%0A%20%20%20%20no%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%20%D1%81%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B9%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%D1%8E%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D0%B2%D0%BE%D0%B7%D0%BC%D0%BE%D0%B6%D0%BD%D1%8B%D1%85%0A%20%20%20%20return%20max%28no%2C%20yes%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80%0A%20%20%20%20res%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Как показано на рисунке 14-18, поскольку каждый предмет создает две ветви поиска - "не брать" и "брать", временная сложность равна $O(2^n)$ .

Посмотрев на дерево рекурсии, легко заметить наличие перекрывающихся подзадач, например $dp[1, 10]$ и подобных. Когда число предметов растет, вместимость рюкзака велика, а особенно когда много предметов с одинаковым весом, количество перекрывающихся подзадач быстро увеличивается.

![Дерево полного перебора для задачи о рюкзаке 0-1](knapsack_problem.assets/knapsack_dfs.png){ class="animation-figure" }

<p align="center"> Рисунок 14-18 &nbsp; Дерево полного перебора для задачи о рюкзаке 0-1 </p>

### 2. &nbsp; Метод 2: поиск с мемоизацией

Чтобы каждая перекрывающаяся подзадача вычислялась только один раз, используем таблицу памяти `mem` для хранения решений подзадач, где `mem[i][c]` соответствует $dp[i, c]$ .

После введения мемоизации **временная сложность определяется числом подзадач** , то есть равна $O(n \times cap)$ . Код выглядит так:

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dfs_mem(
        wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
    ) -> int:
        """Рюкзак 0-1: поиск с мемоизацией"""
        # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if i == 0 or c == 0:
            return 0
        # Если запись уже есть, вернуть сразу
        if mem[i][c] != -1:
            return mem[i][c]
        # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if wgt[i - 1] > c:
            return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
        # Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = max(no, yes)
        return mem[i][c]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* Рюкзак 0-1: поиск с мемоизацией */
    int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если запись уже есть, вернуть сразу
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = max(no, yes);
        return mem[i][c];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* Рюкзак 0-1: поиск с мемоизацией */
    int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если запись уже есть, вернуть сразу
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* Рюкзак 0-1: поиск с мемоизацией */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если запись уже есть, вернуть сразу
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* Рюкзак 0-1: поиск с мемоизацией */
    func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if i == 0 || c == 0 {
            return 0
        }
        // Если запись уже есть, вернуть сразу
        if mem[i][c] != -1 {
            return mem[i][c]
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if wgt[i-1] > c {
            return knapsackDFSMem(wgt, val, mem, i-1, c)
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        no := knapsackDFSMem(wgt, val, mem, i-1, c)
        yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
        // Вернуть вариант с большей стоимостью из двух возможных
        mem[i][c] = int(math.Max(float64(no), float64(yes)))
        return mem[i][c]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* Рюкзак 0-1: поиск с мемоизацией */
    func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if i == 0 || c == 0 {
            return 0
        }
        // Если запись уже есть, вернуть сразу
        if mem[i][c] != -1 {
            return mem[i][c]
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if wgt[i - 1] > c {
            return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
        let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = max(no, yes)
        return mem[i][c]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* Рюкзак 0-1: поиск с мемоизацией */
    function knapsackDFSMem(wgt, val, mem, i, c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // Если запись уже есть, вернуть сразу
        if (mem[i][c] !== -1) {
            return mem[i][c];
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        const yes =
            knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* Рюкзак 0-1: поиск с мемоизацией */
    function knapsackDFSMem(
        wgt: Array<number>,
        val: Array<number>,
        mem: Array<Array<number>>,
        i: number,
        c: number
    ): number {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // Если запись уже есть, вернуть сразу
        if (mem[i][c] !== -1) {
            return mem[i][c];
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        const yes =
            knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* Рюкзак 0-1: поиск с мемоизацией */
    int knapsackDFSMem(
      List<int> wgt,
      List<int> val,
      List<List<int>> mem,
      int i,
      int c,
    ) {
      // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
      if (i == 0 || c == 0) {
        return 0;
      }
      // Если запись уже есть, вернуть сразу
      if (mem[i][c] != -1) {
        return mem[i][c];
      }
      // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
      if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
      }
      // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
      int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
      int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
      // Сохранить и вернуть вариант с большей стоимостью из двух решений
      mem[i][c] = max(no, yes);
      return mem[i][c];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* Рюкзак 0-1: поиск с мемоизацией */
    fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if i == 0 || c == 0 {
            return 0;
        }
        // Если запись уже есть, вернуть сразу
        if mem[i][c] != -1 {
            return mem[i][c];
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if wgt[i - 1] > c as i32 {
            return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
        let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = std::cmp::max(no, yes);
        mem[i][c]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* Рюкзак 0-1: поиск с мемоизацией */
    int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если запись уже есть, вернуть сразу
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = myMax(no, yes);
        return mem[i][c];
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* Рюкзак 0-1: поиск с мемоизацией */
    fun knapsackDFSMem(
        wgt: IntArray,
        _val: IntArray,
        mem: Array<IntArray>,
        i: Int,
        c: Int
    ): Int {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0
        }
        // Если запись уже есть, вернуть сразу
        if (mem[i][c] != -1) {
            return mem[i][c]
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, _val, mem, i - 1, c)
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
        val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = max(no, yes)
        return mem[i][c]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    =begin
    File: knapsack.rb
    Created Time: 2024-05-29
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    # ## Рюкзак 0-1: полный перебор ###
    def knapsack_dfs(wgt, val, i, c)
      # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
      return 0 if i == 0 || c == 0
      # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
      return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
      # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
      no = knapsack_dfs(wgt, val, i - 1, c)
      yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
      # Вернуть вариант с большей стоимостью из двух возможных
      [no, yes].max
    end

    # ## Рюкзак 0-1: поиск с мемоизацией ###
    def knapsack_dfs_mem(wgt, val, mem, i, c)
      # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
      return 0 if i == 0 || c == 0
      # Если запись уже есть, вернуть сразу
      return mem[i][c] if mem[i][c] != -1
      # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
      return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
      # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
      no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
      yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
      # Сохранить и вернуть вариант с большей стоимостью из двух решений
      mem[i][c] = [no, yes].max
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs_mem%28%0A%20%20%20%20wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20mem%3A%20list%5Blist%5Bint%5D%5D%2C%20i%3A%20int%2C%20c%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%200-1%3A%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%BC%D0%B5%D0%BC%D0%BE%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D1%8B%20%D1%83%D0%B6%D0%B5%20%D1%80%D0%B0%D1%81%D1%81%D0%BC%D0%BE%D1%82%D1%80%D0%B5%D0%BD%D1%8B%20%D0%B8%D0%BB%D0%B8%20%D0%B2%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B5%20%D0%BD%D0%B5%20%D0%BE%D1%81%D1%82%D0%B0%D0%BB%D0%BE%D1%81%D1%8C%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D1%8C%20%D1%83%D0%B6%D0%B5%20%D0%B5%D1%81%D1%82%D1%8C%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D1%80%D0%B0%D0%B7%D1%83%0A%20%20%20%20if%20mem%5Bi%5D%5Bc%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D1%82%D0%BE%D0%BB%D1%8C%D0%BA%D0%BE%20%D0%BD%D0%B5%20%D0%BA%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20%D0%B2%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%83%D1%8E%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%B4%D0%BB%D1%8F%20%D1%81%D0%BB%D1%83%D1%87%D0%B0%D0%B5%D0%B2%2C%20%D0%BA%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%BA%D0%BB%D0%B0%D0%B4%D1%83%D1%82%20%D0%B8%20%D0%BA%D0%BB%D0%B0%D0%B4%D1%83%D1%82%0A%20%20%20%20no%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%D0%A1%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%20%D1%81%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B9%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%D1%8E%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%0A%20%20%20%20mem%5Bi%5D%5Bc%5D%20%3D%20max%28no%2C%20yes%29%0A%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%BC%D0%B5%D0%BC%D0%BE%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20res%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs_mem%28%0A%20%20%20%20wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20mem%3A%20list%5Blist%5Bint%5D%5D%2C%20i%3A%20int%2C%20c%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%200-1%3A%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%BC%D0%B5%D0%BC%D0%BE%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D1%8B%20%D1%83%D0%B6%D0%B5%20%D1%80%D0%B0%D1%81%D1%81%D0%BC%D0%BE%D1%82%D1%80%D0%B5%D0%BD%D1%8B%20%D0%B8%D0%BB%D0%B8%20%D0%B2%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B5%20%D0%BD%D0%B5%20%D0%BE%D1%81%D1%82%D0%B0%D0%BB%D0%BE%D1%81%D1%8C%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D1%8C%20%D1%83%D0%B6%D0%B5%20%D0%B5%D1%81%D1%82%D1%8C%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D1%80%D0%B0%D0%B7%D1%83%0A%20%20%20%20if%20mem%5Bi%5D%5Bc%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D1%82%D0%BE%D0%BB%D1%8C%D0%BA%D0%BE%20%D0%BD%D0%B5%20%D0%BA%D0%BB%D0%B0%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20%D0%B2%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%83%D1%8E%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%B4%D0%BB%D1%8F%20%D1%81%D0%BB%D1%83%D1%87%D0%B0%D0%B5%D0%B2%2C%20%D0%BA%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%BA%D0%BB%D0%B0%D0%B4%D1%83%D1%82%20%D0%B8%20%D0%BA%D0%BB%D0%B0%D0%B4%D1%83%D1%82%0A%20%20%20%20no%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%D0%A1%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B2%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82%20%D1%81%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B9%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%D1%8E%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%0A%20%20%20%20mem%5Bi%5D%5Bc%5D%20%3D%20max%28no%2C%20yes%29%0A%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%20%D0%BC%D0%B5%D0%BC%D0%BE%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20res%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

На рисунке 14-19 показаны ветви поиска, которые были отсечены благодаря мемоизации.

![Дерево поиска с мемоизацией для задачи о рюкзаке 0-1](knapsack_problem.assets/knapsack_dfs_mem.png){ class="animation-figure" }

<p align="center"> Рисунок 14-19 &nbsp; Дерево поиска с мемоизацией для задачи о рюкзаке 0-1 </p>

### 3. &nbsp; Метод 3: динамическое программирование

По своей сути динамическое программирование здесь - это процесс последовательного заполнения таблицы $dp$ в соответствии с переходами состояний. Код приведен ниже:

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """Рюкзак 0-1: динамическое программирование"""
        n = len(wgt)
        # Инициализация таблицы dp
        dp = [[0] * (cap + 1) for _ in range(n + 1)]
        # Переход состояний
        for i in range(1, n + 1):
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c]
                else:
                    # Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* Рюкзак 0-1: динамическое программирование */
    int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // Инициализация таблицы dp
        vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* Рюкзак 0-1: динамическое программирование */
    int knapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Инициализация таблицы dp
        int[][] dp = new int[n + 1][cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* Рюкзак 0-1: динамическое программирование */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Инициализация таблицы dp
        int[,] dp = new int[n + 1, cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* Рюкзак 0-1: динамическое программирование */
    func knapsackDP(wgt, val []int, cap int) int {
        n := len(wgt)
        // Инициализация таблицы dp
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, cap+1)
        }
        // Переход состояний
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i-1][c]
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* Рюкзак 0-1: динамическое программирование */
    func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // Инициализация таблицы dp
        var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
        // Переход состояний
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* Рюкзак 0-1: динамическое программирование */
    function knapsackDP(wgt, val, cap) {
        const n = wgt.length;
        // Инициализация таблицы dp
        const dp = Array(n + 1)
            .fill(0)
            .map(() => Array(cap + 1).fill(0));
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = Math.max(
                        dp[i - 1][c],
                        dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* Рюкзак 0-1: динамическое программирование */
    function knapsackDP(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // Инициализация таблицы dp
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = Math.max(
                        dp[i - 1][c],
                        dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* Рюкзак 0-1: динамическое программирование */
    int knapsackDP(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // Инициализация таблицы dp
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
      // Переход состояний
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // Если вместимость рюкзака превышена, предмет i не выбирать
            dp[i][c] = dp[i - 1][c];
          } else {
            // Большее из двух решений: не брать или взять предмет i
            dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[n][cap];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* Рюкзак 0-1: динамическое программирование */
    fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // Инициализация таблицы dp
        let mut dp = vec![vec![0; cap + 1]; n + 1];
        // Переход состояний
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = std::cmp::max(
                        dp[i - 1][c],
                        dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                    );
                }
            }
        }
        dp[n][cap]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* Рюкзак 0-1: динамическое программирование */
    int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // Инициализация таблицы dp
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(cap + 1, sizeof(int));
        }
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[n][cap];
        // Освободить память
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* Рюкзак 0-1: динамическое программирование */
    fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // Инициализация таблицы dp
        val dp = Array(n + 1) { IntArray(cap + 1) }
        // Переход состояний
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    =begin
    File: knapsack.rb
    Created Time: 2024-05-29
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    # ## Рюкзак 0-1: полный перебор ###
    def knapsack_dfs(wgt, val, i, c)
      # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
      return 0 if i == 0 || c == 0
      # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
      return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
      # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
      no = knapsack_dfs(wgt, val, i - 1, c)
      yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
      # Вернуть вариант с большей стоимостью из двух возможных
      [no, yes].max
    end

    # ## Рюкзак 0-1: поиск с мемоизацией ###
    def knapsack_dfs_mem(wgt, val, mem, i, c)
      # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
      return 0 if i == 0 || c == 0
      # Если запись уже есть, вернуть сразу
      return mem[i][c] if mem[i][c] != -1
      # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
      return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
      # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
      no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
      yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
      # Сохранить и вернуть вариант с большей стоимостью из двух решений
      mem[i][c] = [no, yes].max
    end

    # ## Рюкзак 0-1: динамическое программирование ###
    def knapsack_dp(wgt, val, cap)
      n = wgt.length
      # Инициализация таблицы dp
      dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
      # Переход состояний
      for i in 1...(n + 1)
        for c in 1...(cap + 1)
          if wgt[i - 1] > c
            # Если вместимость рюкзака превышена, предмет i не выбирать
            dp[i][c] = dp[i - 1][c]
          else
            # Большее из двух решений: не брать или взять предмет i
            dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%200-1%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281%2C%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%91%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D%2C%20dp%5Bi%20-%201%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%0A%20%20%20%20res%20%3D%20knapsack_dp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%200-1%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281%2C%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%91%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D%2C%20dp%5Bi%20-%201%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%0A%20%20%20%20res%20%3D%20knapsack_dp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Как показано на рисунке 14-20, и временная сложность, и пространственная сложность определяются размером массива `dp` , то есть равны $O(n \times cap)$ .

=== "<1>"
    ![Процесс динамического программирования для задачи о рюкзаке 0-1](knapsack_problem.assets/knapsack_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![knapsack_dp_step2](knapsack_problem.assets/knapsack_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![knapsack_dp_step3](knapsack_problem.assets/knapsack_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![knapsack_dp_step4](knapsack_problem.assets/knapsack_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![knapsack_dp_step5](knapsack_problem.assets/knapsack_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![knapsack_dp_step6](knapsack_problem.assets/knapsack_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![knapsack_dp_step7](knapsack_problem.assets/knapsack_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![knapsack_dp_step8](knapsack_problem.assets/knapsack_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![knapsack_dp_step9](knapsack_problem.assets/knapsack_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![knapsack_dp_step10](knapsack_problem.assets/knapsack_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![knapsack_dp_step11](knapsack_problem.assets/knapsack_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![knapsack_dp_step12](knapsack_problem.assets/knapsack_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![knapsack_dp_step13](knapsack_problem.assets/knapsack_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![knapsack_dp_step14](knapsack_problem.assets/knapsack_dp_step14.png){ class="animation-figure" }

<p align="center"> Рисунок 14-20 &nbsp; Процесс динамического программирования для задачи о рюкзаке 0-1 </p>

### 4. &nbsp; Оптимизация пространства

Поскольку каждое состояние зависит только от состояния в предыдущей строке, можно использовать два массива, которые будут "перекатываться" вперед, и тем самым уменьшить пространственную сложность с $O(n^2)$ до $O(n)$ .

Если пойти дальше, можно спросить: можно ли оптимизировать память так, чтобы использовать только один массив? Наблюдение показывает, что каждое состояние зависит от клетки прямо сверху и клетки слева сверху. Предположим, что у нас есть только один массив, и в момент начала обхода строки $i$ он еще хранит состояния строки $i-1$ .

- Если обходить массив слева направо, то к моменту вычисления $dp[i, j]$ значения слева сверху $dp[i-1, 1]$ ~ $dp[i-1, j-1]$ могут уже быть перезаписаны, и правильный результат перехода состояния получить не удастся.
- Если же обходить массив справа налево, проблема перезаписи не возникает, и переход состояния вычисляется корректно.

На рисунке 14-21 показан процесс перехода от строки $i = 1$ к строке $i = 2$ при использовании одного массива. Попробуйте сопоставить его с разницей между прямым и обратным обходом.

=== "<1>"
    ![Процесс динамического программирования после оптимизации памяти для рюкзака 0-1](knapsack_problem.assets/knapsack_dp_comp_step1.png){ class="animation-figure" }

=== "<2>"
    ![knapsack_dp_comp_step2](knapsack_problem.assets/knapsack_dp_comp_step2.png){ class="animation-figure" }

=== "<3>"
    ![knapsack_dp_comp_step3](knapsack_problem.assets/knapsack_dp_comp_step3.png){ class="animation-figure" }

=== "<4>"
    ![knapsack_dp_comp_step4](knapsack_problem.assets/knapsack_dp_comp_step4.png){ class="animation-figure" }

=== "<5>"
    ![knapsack_dp_comp_step5](knapsack_problem.assets/knapsack_dp_comp_step5.png){ class="animation-figure" }

=== "<6>"
    ![knapsack_dp_comp_step6](knapsack_problem.assets/knapsack_dp_comp_step6.png){ class="animation-figure" }

<p align="center"> Рисунок 14-21 &nbsp; Процесс динамического программирования после оптимизации памяти для рюкзака 0-1 </p>

В коде для этого достаточно удалить первое измерение массива `dp` , а внутренний цикл заменить на обратный обход:

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """Рюкзак 0-1: динамическое программирование с оптимизацией памяти"""
        n = len(wgt)
        # Инициализация таблицы dp
        dp = [0] * (cap + 1)
        # Переход состояний
        for i in range(1, n + 1):
            # Обход в обратном порядке
            for c in range(cap, 0, -1):
                if wgt[i - 1] > c:
                    # Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c]
                else:
                    # Большее из двух решений: не брать или взять предмет i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // Инициализация таблицы dp
        vector<int> dp(cap + 1, 0);
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            // Обход в обратном порядке
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Инициализация таблицы dp
        int[] dp = new int[cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            // Обход в обратном порядке
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Инициализация таблицы dp
        int[] dp = new int[cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            // Обход в обратном порядке
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.Max(dp[c], dp[c - weight[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    func knapsackDPComp(wgt, val []int, cap int) int {
        n := len(wgt)
        // Инициализация таблицы dp
        dp := make([]int, cap+1)
        // Переход состояний
        for i := 1; i <= n; i++ {
            // Обход в обратном порядке
            for c := cap; c >= 1; c-- {
                if wgt[i-1] <= c {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // Инициализация таблицы dp
        var dp = Array(repeating: 0, count: cap + 1)
        // Переход состояний
        for i in 1 ... n {
            // Обход в обратном порядке
            for c in (1 ... cap).reversed() {
                if wgt[i - 1] <= c {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    function knapsackDPComp(wgt, val, cap) {
        const n = wgt.length;
        // Инициализация таблицы dp
        const dp = Array(cap + 1).fill(0);
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            // Обход в обратном порядке
            for (let c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    function knapsackDPComp(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // Инициализация таблицы dp
        const dp = Array(cap + 1).fill(0);
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            // Обход в обратном порядке
            for (let c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // Инициализация таблицы dp
      List<int> dp = List.filled(cap + 1, 0);
      // Переход состояний
      for (int i = 1; i <= n; i++) {
        // Обход в обратном порядке
        for (int c = cap; c >= 1; c--) {
          if (wgt[i - 1] <= c) {
            // Большее из двух решений: не брать или взять предмет i
            dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[cap];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // Инициализация таблицы dp
        let mut dp = vec![0; cap + 1];
        // Переход состояний
        for i in 1..=n {
            // Обход в обратном порядке
            for c in (1..=cap).rev() {
                if wgt[i - 1] <= c as i32 {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[cap]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // Инициализация таблицы dp
        int *dp = calloc(cap + 1, sizeof(int));
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            // Обход в обратном порядке
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[cap];
        // Освободить память
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // Инициализация таблицы dp
        val dp = IntArray(cap + 1)
        // Переход состояний
        for (i in 1..n) {
            // Обход в обратном порядке
            for (c in cap downTo 1) {
                if (wgt[i - 1] <= c) {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    =begin
    File: knapsack.rb
    Created Time: 2024-05-29
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    # ## Рюкзак 0-1: полный перебор ###
    def knapsack_dfs(wgt, val, i, c)
      # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
      return 0 if i == 0 || c == 0
      # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
      return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
      # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
      no = knapsack_dfs(wgt, val, i - 1, c)
      yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
      # Вернуть вариант с большей стоимостью из двух возможных
      [no, yes].max
    end

    # ## Рюкзак 0-1: поиск с мемоизацией ###
    def knapsack_dfs_mem(wgt, val, mem, i, c)
      # Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
      return 0 if i == 0 || c == 0
      # Если запись уже есть, вернуть сразу
      return mem[i][c] if mem[i][c] != -1
      # Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
      return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
      # Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
      no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
      yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
      # Сохранить и вернуть вариант с большей стоимостью из двух решений
      mem[i][c] = [no, yes].max
    end

    # ## Рюкзак 0-1: динамическое программирование ###
    def knapsack_dp(wgt, val, cap)
      n = wgt.length
      # Инициализация таблицы dp
      dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
      # Переход состояний
      for i in 1...(n + 1)
        for c in 1...(cap + 1)
          if wgt[i - 1] > c
            # Если вместимость рюкзака превышена, предмет i не выбирать
            dp[i][c] = dp[i - 1][c]
          else
            # Большее из двух решений: не брать или взять предмет i
            dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end

    # ## Рюкзак 0-1: динамическое программирование с оптимизацией памяти ###
    def knapsack_dp_comp(wgt, val, cap)
      n = wgt.length
      # Инициализация таблицы dp
      dp = Array.new(cap + 1, 0)
      # Переход состояний
      for i in 1...(n + 1)
        # Обход в обратном порядке
        for c in cap.downto(1)
          if wgt[i - 1] > c
            # Если вместимость рюкзака превышена, предмет i не выбирать
            dp[c] = dp[c]
          else
            # Большее из двух решений: не брать или взять предмет i
            dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[cap]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp_comp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%200-1%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%B2%20%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D0%BE%D0%BC%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B5%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%28cap%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%91%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D%2C%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20res%20%3D%20knapsack_dp_comp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp_comp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%200-1%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%B2%20%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D0%BE%D0%BC%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B5%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%28cap%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%91%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D%2C%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20res%20%3D%20knapsack_dp_comp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>
