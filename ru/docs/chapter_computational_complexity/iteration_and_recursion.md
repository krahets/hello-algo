---
comments: true
---

# 2.2 &nbsp; Итерация и рекурсия

В алгоритмах часто требуется повторное выполнение определенной задачи, что тесно связано с анализом сложности. Поэтому, прежде чем перейти к обсуждению временной и пространственной сложности, рассмотрим, как реализовать повторное выполнение задач в программе, а именно две основные структуры управления программой: итерацию и рекурсию.

## 2.2.1 &nbsp; Итерация

<u>Итерация (iteration)</u> - это структура управления, которая позволяет повторно выполнять определенную задачу. В итерации программа повторяет выполнение определенного участка кода, пока выполняется определенное условие.

### 1. &nbsp; Цикл for

Цикл `for` - одна из наиболее распространенных форм итерации, **которая подходит для использования, когда количество итераций известно заранее**.

Следующая функция реализует суммирование $1 + 2 + \dots + n$ с использованием цикла `for` , а результат суммирования сохраняется в переменной `res` . Следует отметить, что в Python диапазон `range(a, b)` соответствует левому закрытому, правому открытому интервалу, то есть перебираются значения $a, a + 1, \dots, b-1$ :

=== "Python"

    ```python title="iteration.py"
    def for_loop(n: int) -> int:
        """Цикл for"""
        res = 0
        # Циклическое суммирование 1, 2, ..., n-1, n
        for i in range(1, n + 1):
            res += i
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* Цикл for */
    int forLoop(int n) {
        int res = 0;
        // Циклическое суммирование 1, 2, ..., n-1, n
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* Цикл for */
    int forLoop(int n) {
        int res = 0;
        // Циклическое суммирование 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* Цикл for */
    int ForLoop(int n) {
        int res = 0;
        // Циклическое суммирование 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* Цикл for */
    func forLoop(n int) int {
        res := 0
        // Циклическое суммирование 1, 2, ..., n-1, n
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* Цикл for */
    func forLoop(n: Int) -> Int {
        var res = 0
        // Циклическое суммирование 1, 2, ..., n-1, n
        for i in 1 ... n {
            res += i
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* Цикл for */
    function forLoop(n) {
        let res = 0;
        // Циклическое суммирование 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* Цикл for */
    function forLoop(n: number): number {
        let res = 0;
        // Циклическое суммирование 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* Цикл for */
    int forLoop(int n) {
      int res = 0;
      // Циклическое суммирование 1, 2, ..., n-1, n
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* Цикл for */
    fn for_loop(n: i32) -> i32 {
        let mut res = 0;
        // Циклическое суммирование 1, 2, ..., n-1, n
        for i in 1..=n {
            res += i;
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* Цикл for */
    int forLoop(int n) {
        int res = 0;
        // Циклическое суммирование 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* Цикл for */
    fun forLoop(n: Int): Int {
        var res = 0
        // Циклическое суммирование 1, 2, ..., n-1, n
        for (i in 1..n) {
            res += i
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### Цикл for ###
    def for_loop(n)
      res = 0

      # Циклическое суммирование 1, 2, ..., n-1, n
      for i in 1..n
        res += i
      end

      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20for_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A6%D0%B8%D0%BA%D0%BB%20for%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%D0%A6%D0%B8%D0%BA%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%201%2C%202%2C%20...%2C%20n-1%2C%20n%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20for%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20for_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A6%D0%B8%D0%BA%D0%BB%20for%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%D0%A6%D0%B8%D0%BA%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%201%2C%202%2C%20...%2C%20n-1%2C%20n%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20for%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Ниже представлена блок-схема этой функции суммирования.

![Блок-схема функции суммирования](iteration_and_recursion.assets/iteration.png){ class="animation-figure" }

<p align="center"> Рисунок 2-1 &nbsp; Блок-схема функции суммирования </p>

Количество операций этой функции суммирования пропорционально размеру входных данных $n$ , или, другими словами, линейно зависит от него. **На самом деле временная сложность описывает именно эту линейную зависимость**. Соответствующий материал будет подробно рассмотрен в следующем разделе.

### 2. &nbsp; Цикл while

Подобно циклу `for` , цикл `while` также представляет собой метод реализации итерации. В цикле `while` программа перед каждой итерацией проверяет условие: если условие истинно, то выполнение продолжается, иначе цикл завершается.

Ниже приведен пример реализации суммирования $1 + 2 + \dots + n$ с использованием цикла `while` :

=== "Python"

    ```python title="iteration.py"
    def while_loop(n: int) -> int:
        """Цикл while"""
        res = 0
        i = 1  # Инициализация условной переменной
        # Циклическое суммирование 1, 2, ..., n-1, n
        while i <= n:
            res += i
            i += 1  # Обновить условную переменную
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* Цикл while */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Обновить условную переменную
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* Цикл while */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Обновить условную переменную
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* Цикл while */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i += 1; // Обновить условную переменную
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* Цикл while */
    func whileLoop(n int) int {
        res := 0
        // Инициализация условной переменной
        i := 1
        // Циклическое суммирование 1, 2, ..., n-1, n
        for i <= n {
            res += i
            // Обновить условную переменную
            i++
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* Цикл while */
    func whileLoop(n: Int) -> Int {
        var res = 0
        var i = 1 // Инициализация условной переменной
        // Циклическое суммирование 1, 2, ..., n-1, n
        while i <= n {
            res += i
            i += 1 // Обновить условную переменную
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* Цикл while */
    function whileLoop(n) {
        let res = 0;
        let i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Обновить условную переменную
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* Цикл while */
    function whileLoop(n: number): number {
        let res = 0;
        let i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Обновить условную переменную
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* Цикл while */
    int whileLoop(int n) {
      int res = 0;
      int i = 1; // Инициализация условной переменной
      // Циклическое суммирование 1, 2, ..., n-1, n
      while (i <= n) {
        res += i;
        i++; // Обновить условную переменную
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* Цикл while */
    fn while_loop(n: i32) -> i32 {
        let mut res = 0;
        let mut i = 1; // Инициализация условной переменной

        // Циклическое суммирование 1, 2, ..., n-1, n
        while i <= n {
            res += i;
            i += 1; // Обновить условную переменную
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* Цикл while */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Обновить условную переменную
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* Цикл while */
    fun whileLoop(n: Int): Int {
        var res = 0
        var i = 1 // Инициализация условной переменной
        // Циклическое суммирование 1, 2, ..., n-1, n
        while (i <= n) {
            res += i
            i++ // Обновить условную переменную
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### Цикл while ###
    def while_loop(n)
      res = 0
      i = 1 # Инициализация условной переменной

      # Циклическое суммирование 1, 2, ..., n-1, n
      while i <= n
        res += i
        i += 1 # Обновить условную переменную
      end

      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20while_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A6%D0%B8%D0%BA%D0%BB%20while%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%83%D1%81%D0%BB%D0%BE%D0%B2%D0%BD%D0%BE%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%0A%20%20%20%20%23%20%D0%A6%D0%B8%D0%BA%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%201%2C%202%2C%20...%2C%20n-1%2C%20n%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%D0%9E%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%83%D1%81%D0%BB%D0%BE%D0%B2%D0%BD%D1%83%D1%8E%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%83%D1%8E%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20while%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20while_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A6%D0%B8%D0%BA%D0%BB%20while%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%83%D1%81%D0%BB%D0%BE%D0%B2%D0%BD%D0%BE%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%0A%20%20%20%20%23%20%D0%A6%D0%B8%D0%BA%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%201%2C%202%2C%20...%2C%20n-1%2C%20n%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%D0%9E%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%83%D1%81%D0%BB%D0%BE%D0%B2%D0%BD%D1%83%D1%8E%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%83%D1%8E%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20while%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

**Цикл `while` обладает большей степенью свободы по сравнению с циклом `for` **. В цикле `while` можно свободно управлять инициализацией и обновлением условной переменной.

Например, в следующем коде условная переменная $i$ обновляется дважды на каждой итерации, что затруднительно сделать с использованием цикла `for` :

=== "Python"

    ```python title="iteration.py"
    def while_loop_ii(n: int) -> int:
        """Цикл while (двойное обновление)"""
        res = 0
        i = 1  # Инициализация условной переменной
        # Циклическое суммирование 1, 4, 10, ...
        while i <= n:
            res += i
            # Обновить условную переменную
            i += 1
            i *= 2
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* Цикл while (двойное обновление) */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Обновить условную переменную
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* Цикл while (двойное обновление) */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Обновить условную переменную
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* Цикл while (двойное обновление) */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Обновить условную переменную
            i += 1; 
            i *= 2;
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* Цикл while (двойное обновление) */
    func whileLoopII(n int) int {
        res := 0
        // Инициализация условной переменной
        i := 1
        // Циклическое суммирование 1, 4, 10, ...
        for i <= n {
            res += i
            // Обновить условную переменную
            i++
            i *= 2
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* Цикл while (двойное обновление) */
    func whileLoopII(n: Int) -> Int {
        var res = 0
        var i = 1 // Инициализация условной переменной
        // Циклическое суммирование 1, 4, 10, ...
        while i <= n {
            res += i
            // Обновить условную переменную
            i += 1
            i *= 2
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* Цикл while (двойное обновление) */
    function whileLoopII(n) {
        let res = 0;
        let i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Обновить условную переменную
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* Цикл while (двойное обновление) */
    function whileLoopII(n: number): number {
        let res = 0;
        let i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Обновить условную переменную
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* Цикл while (двойное обновление) */
    int whileLoopII(int n) {
      int res = 0;
      int i = 1; // Инициализация условной переменной
      // Циклическое суммирование 1, 4, 10, ...
      while (i <= n) {
        res += i;
        // Обновить условную переменную
        i++;
        i *= 2;
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* Цикл while (двойное обновление) */
    fn while_loop_ii(n: i32) -> i32 {
        let mut res = 0;
        let mut i = 1; // Инициализация условной переменной

        // Циклическое суммирование 1, 4, 10, ...
        while i <= n {
            res += i;
            // Обновить условную переменную
            i += 1;
            i *= 2;
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* Цикл while (двойное обновление) */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Обновить условную переменную
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* Цикл while (двойное обновление) */
    fun whileLoopII(n: Int): Int {
        var res = 0
        var i = 1 // Инициализация условной переменной
        // Циклическое суммирование 1, 4, 10, ...
        while (i <= n) {
            res += i
            // Обновить условную переменную
            i++
            i *= 2
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### Цикл while ###
    def while_loop(n)
      res = 0
      i = 1 # Инициализация условной переменной

      # Циклическое суммирование 1, 2, ..., n-1, n
      while i <= n
        res += i
        i += 1 # Обновить условную переменную
      end

      res
    end

    # ## Цикл while (двойное обновление) ###
    def while_loop_ii(n)
      res = 0
      i = 1 # Инициализация условной переменной

      # Циклическое суммирование 1, 4, 10, ...
      while i <= n
        res += i
        # Обновить условную переменную
        i += 1
        i *= 2
      end

      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20while_loop_ii%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A6%D0%B8%D0%BA%D0%BB%20while%20%28%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%B5%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%29%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%83%D1%81%D0%BB%D0%BE%D0%B2%D0%BD%D0%BE%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%0A%20%20%20%20%23%20%D0%A6%D0%B8%D0%BA%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%201%2C%204%2C%2010%2C%20...%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%83%D1%81%D0%BB%D0%BE%D0%B2%D0%BD%D1%83%D1%8E%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%83%D1%8E%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20i%20%2A%3D%202%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop_ii%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20while%20%28%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%B5%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%29%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20while_loop_ii%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A6%D0%B8%D0%BA%D0%BB%20while%20%28%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%B5%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%29%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%83%D1%81%D0%BB%D0%BE%D0%B2%D0%BD%D0%BE%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%0A%20%20%20%20%23%20%D0%A6%D0%B8%D0%BA%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%201%2C%204%2C%2010%2C%20...%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%83%D1%81%D0%BB%D0%BE%D0%B2%D0%BD%D1%83%D1%8E%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%83%D1%8E%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20i%20%2A%3D%202%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop_ii%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20while%20%28%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%B5%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%29%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

В целом **код с использованием цикла `for` более компактный, а цикл `while` более гибкий**. Но они оба могут реализовать итерационную структуру. Выбор между ними определяется требованиями конкретной задачи.

### 3. &nbsp; Вложенные циклы

Внутрь одной циклической структуры можно вложить другую, например используя два цикла `for` :

=== "Python"

    ```python title="iteration.py"
    def nested_for_loop(n: int) -> str:
        """Двойной цикл for"""
        res = ""
        # Цикл по i = 1, 2, ..., n-1, n
        for i in range(1, n + 1):
            # Цикл по j = 1, 2, ..., n-1, n
            for j in range(1, n + 1):
                res += f"({i}, {j}), "
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* Двойной цикл for */
    string nestedForLoop(int n) {
        ostringstream res;
        // Цикл по i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; ++i) {
            // Цикл по j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; ++j) {
                res << "(" << i << ", " << j << "), ";
            }
        }
        return res.str();
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* Двойной цикл for */
    String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // Цикл по i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Цикл по j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* Двойной цикл for */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // Цикл по i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Цикл по j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* Двойной цикл for */
    func nestedForLoop(n int) string {
        res := ""
        // Цикл по i = 1, 2, ..., n-1, n
        for i := 1; i <= n; i++ {
            for j := 1; j <= n; j++ {
                // Цикл по j = 1, 2, ..., n-1, n
                res += fmt.Sprintf("(%d, %d), ", i, j)
            }
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* Двойной цикл for */
    func nestedForLoop(n: Int) -> String {
        var res = ""
        // Цикл по i = 1, 2, ..., n-1, n
        for i in 1 ... n {
            // Цикл по j = 1, 2, ..., n-1, n
            for j in 1 ... n {
                res.append("(\(i), \(j)), ")
            }
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* Двойной цикл for */
    function nestedForLoop(n) {
        let res = '';
        // Цикл по i = 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            // Цикл по j = 1, 2, ..., n-1, n
            for (let j = 1; j <= n; j++) {
                res += `(${i}, ${j}), `;
            }
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* Двойной цикл for */
    function nestedForLoop(n: number): string {
        let res = '';
        // Цикл по i = 1, 2, ..., n-1, n
        for (let i = 1; i <= n; i++) {
            // Цикл по j = 1, 2, ..., n-1, n
            for (let j = 1; j <= n; j++) {
                res += `(${i}, ${j}), `;
            }
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* Двойной цикл for */
    String nestedForLoop(int n) {
      String res = "";
      // Цикл по i = 1, 2, ..., n-1, n
      for (int i = 1; i <= n; i++) {
        // Цикл по j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; j++) {
          res += "($i, $j), ";
        }
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* Двойной цикл for */
    fn nested_for_loop(n: i32) -> String {
        let mut res = vec![];
        // Цикл по i = 1, 2, ..., n-1, n
        for i in 1..=n {
            // Цикл по j = 1, 2, ..., n-1, n
            for j in 1..=n {
                res.push(format!("({}, {}), ", i, j));
            }
        }
        res.join("")
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* Двойной цикл for */
    char *nestedForLoop(int n) {
        // n * n — это число соответствующих точек, а максимальная длина строки "(i, j), " равна 6+10*2, плюс дополнительное место для завершающего нулевого символа \0
        int size = n * n * 26 + 1;
        char *res = malloc(size * sizeof(char));
        // Цикл по i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Цикл по j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                char tmp[26];
                snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
                strncat(res, tmp, size - strlen(res) - 1);
            }
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* Двойной цикл for */
    fun nestedForLoop(n: Int): String {
        val res = StringBuilder()
        // Цикл по i = 1, 2, ..., n-1, n
        for (i in 1..n) {
            // Цикл по j = 1, 2, ..., n-1, n
            for (j in 1..n) {
                res.append(" ($i, $j), ")
            }
        }
        return res.toString()
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### Двойной цикл for ###
    def nested_for_loop(n)
      res = ""

      # Цикл по i = 1, 2, ..., n-1, n
      for i in 1..n
        # Цикл по j = 1, 2, ..., n-1, n
        for j in 1..n
          res += "(#{i}, #{j}), "
        end
      end

      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20nested_for_loop%28n%3A%20int%29%20-%3E%20str%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%20for%22%22%22%0A%20%20%20%20res%20%3D%20%22%22%0A%20%20%20%20%23%20%D0%A6%D0%B8%D0%BA%D0%BB%20%D0%BF%D0%BE%20i%20%3D%201%2C%202%2C%20...%2C%20n-1%2C%20n%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%A6%D0%B8%D0%BA%D0%BB%20%D0%BF%D0%BE%20j%20%3D%201%2C%202%2C%20...%2C%20n-1%2C%20n%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20f%22%28%7Bi%7D%2C%20%7Bj%7D%29%2C%20%22%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20nested_for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B0%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%BC%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20for%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20nested_for_loop%28n%3A%20int%29%20-%3E%20str%3A%0A%20%20%20%20%22%22%22%D0%94%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%20for%22%22%22%0A%20%20%20%20res%20%3D%20%22%22%0A%20%20%20%20%23%20%D0%A6%D0%B8%D0%BA%D0%BB%20%D0%BF%D0%BE%20i%20%3D%201%2C%202%2C%20...%2C%20n-1%2C%20n%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%A6%D0%B8%D0%BA%D0%BB%20%D0%BF%D0%BE%20j%20%3D%201%2C%202%2C%20...%2C%20n-1%2C%20n%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20f%22%28%7Bi%7D%2C%20%7Bj%7D%29%2C%20%22%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20nested_for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B0%20%D0%B2%20%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%BC%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20for%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Ниже приведена блок-схема такого вложенного цикла.

![Блок-схема вложенного цикла](iteration_and_recursion.assets/nested_iteration.png){ class="animation-figure" }

<p align="center"> Рисунок 2-2 &nbsp; Блок-схема вложенного цикла </p>

В этом случае количество выполненных действий пропорционально $n^2$ , или, другими словами, время выполнения алгоритма и размер входных данных $n$ находятся в квадратичной зависимости.

Можно и дальше добавлять вложенные циклы, тогда каждое вложение будет повышать размерность, увеличивая временную сложность до кубической зависимости, зависимости четвертой степени и так далее.

## 2.2.2 &nbsp; Рекурсия

 <u>Рекурсия (recursion)</u> - это стратегия алгоритма, при которой функция вызывает саму себя для решения задачи. Она включает два основных этапа.

1. **Вызов**: программа постоянно вызывает саму себя, обычно передавая меньшие или более упрощенные параметры, пока не будет достигнуто условие завершения.
2. **Возврат**: после срабатывания условия завершения программа начинает возвращаться из самой глубокой рекурсивной функции, объединяя результаты каждого уровня.

С точки зрения реализации рекурсивный код включает три основных элемента.

1. **Условие завершения**: используется для определения момента перехода от вызова к возврату.
2. **Рекурсивный вызов**: соответствует вызову, функция вызывает саму себя, обычно с меньшими или упрощенными параметрами.
3. **Возврат результата**: соответствует возврату, возвращает результат текущего уровня рекурсии на предыдущий уровень.

Рассмотрим следующий код: вызов функции `recur(n)` позволяет вычислить сумму $1 + 2 + \dots + n$ :

=== "Python"

    ```python title="recursion.py"
    def recur(n: int) -> int:
        """Рекурсия"""
        # Условие завершения
        if n == 1:
            return 1
        # Рекурсия: рекурсивный вызов
        res = recur(n - 1)
        # Возврат: вернуть результат
        return n + res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* Рекурсия */
    int recur(int n) {
        // Условие завершения
        if (n == 1)
            return 1;
        // Рекурсия: рекурсивный вызов
        int res = recur(n - 1);
        // Возврат: вернуть результат
        return n + res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* Рекурсия */
    int recur(int n) {
        // Условие завершения
        if (n == 1)
            return 1;
        // Рекурсия: рекурсивный вызов
        int res = recur(n - 1);
        // Возврат: вернуть результат
        return n + res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* Рекурсия */
    int Recur(int n) {
        // Условие завершения
        if (n == 1)
            return 1;
        // Рекурсия: рекурсивный вызов
        int res = Recur(n - 1);
        // Возврат: вернуть результат
        return n + res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* Рекурсия */
    func recur(n int) int {
        // Условие завершения
        if n == 1 {
            return 1
        }
        // Рекурсия: рекурсивный вызов
        res := recur(n - 1)
        // Возврат: вернуть результат
        return n + res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* Рекурсия */
    func recur(n: Int) -> Int {
        // Условие завершения
        if n == 1 {
            return 1
        }
        // Рекурсия: рекурсивный вызов
        let res = recur(n: n - 1)
        // Возврат: вернуть результат
        return n + res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* Рекурсия */
    function recur(n) {
        // Условие завершения
        if (n === 1) return 1;
        // Рекурсия: рекурсивный вызов
        const res = recur(n - 1);
        // Возврат: вернуть результат
        return n + res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* Рекурсия */
    function recur(n: number): number {
        // Условие завершения
        if (n === 1) return 1;
        // Рекурсия: рекурсивный вызов
        const res = recur(n - 1);
        // Возврат: вернуть результат
        return n + res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* Рекурсия */
    int recur(int n) {
      // Условие завершения
      if (n == 1) return 1;
      // Рекурсия: рекурсивный вызов
      int res = recur(n - 1);
      // Возврат: вернуть результат
      return n + res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* Рекурсия */
    fn recur(n: i32) -> i32 {
        // Условие завершения
        if n == 1 {
            return 1;
        }
        // Рекурсия: рекурсивный вызов
        let res = recur(n - 1);
        // Возврат: вернуть результат
        n + res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* Рекурсия */
    int recur(int n) {
        // Условие завершения
        if (n == 1)
            return 1;
        // Рекурсия: рекурсивный вызов
        int res = recur(n - 1);
        // Возврат: вернуть результат
        return n + res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* Рекурсия */
    fun recur(n: Int): Int {
        // Условие завершения
        if (n == 1)
            return 1
        // Рекурсивный шаг: рекурсивный вызов
        val res = recur(n - 1)
        // Возврат: вернуть результат
        return n + res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### Рекурсия ###
    def recur(n)
      # Условие завершения
      return 1 if n == 1
      # Рекурсия: рекурсивный вызов
      res = recur(n - 1)
      # Возврат: вернуть результат
      n + res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%A3%D1%81%D0%BB%D0%BE%D0%B2%D0%B8%D0%B5%20%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%0A%20%20%20%20res%20%3D%20recur%28n%20-%201%29%0A%20%20%20%20%23%20%D0%92%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%3A%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%0A%20%20%20%20return%20n%20%2B%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%D0%B9%20%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%A3%D1%81%D0%BB%D0%BE%D0%B2%D0%B8%D0%B5%20%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%0A%20%20%20%20res%20%3D%20recur%28n%20-%201%29%0A%20%20%20%20%23%20%D0%92%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%3A%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%0A%20%20%20%20return%20n%20%2B%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%D0%B9%20%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Ниже представлен рекурсивный процесс этой функции.

![Рекурсивный процесс функции суммирования](iteration_and_recursion.assets/recursion_sum.png){ class="animation-figure" }

<p align="center"> Рисунок 2-3 &nbsp; Рекурсивный процесс функции суммирования </p>

Хотя с точки зрения вычислений итерация и рекурсия могут давать одинаковый результат, **они представляют собой совершенно разные парадигмы мышления и решения задач**.

- **Итерация**: решение задачи снизу вверх. Начинаем с самых базовых шагов, которые затем повторяются или накапливаются до завершения задачи.
- **Рекурсия**: решение задачи сверху вниз. Исходная задача разбивается на более мелкие подзадачи, которые имеют ту же форму, что и исходная задача. Далее подзадачи продолжают делиться на еще более мелкие, пока не достигается базовый случай, решение которого известно.

Рассмотрим в качестве примера вышеупомянутую функцию суммирования, где решается задача $f(n) = 1 + 2 + \dots + n$ .

- **Итерация**: моделирование процесса суммирования в цикле проходит от $1$ до $n$ , выполняя операцию суммирования на каждом шаге, чтобы получить итоговое значение $f(n)$ .
- **Рекурсия**: последовательное разбиение задачи на подзадачи вида $f(n) = n + f(n - 1)$ до достижения базового случая $f(1) = 1$ .

### 1. &nbsp; Стек вызовов

Каждый раз, когда рекурсивная функция вызывает саму себя, система выделяет память для нового вызова функции, чтобы хранить локальные переменные, адрес вызова и другую информацию. Это поведение имеет два последствия.

- Контекстные данные функции хранятся в области памяти, называемой пространством стекового кадра, и освобождаются только после возврата функции. **Поэтому рекурсия обычно требует больше памяти, чем итерация**.
- Рекурсивный вызов функции создает дополнительные накладные расходы. **Поэтому рекурсия обычно менее эффективна по времени, чем цикл**.

Как показано на рисунке 2-4, до срабатывания условия завершения одновременно существует $n$ невозвращенных рекурсивных функций, а **глубина рекурсии равна $n$** .

![Глубина рекурсивного вызова](iteration_and_recursion.assets/recursion_sum_depth.png){ class="animation-figure" }

<p align="center"> Рисунок 2-4 &nbsp; Глубина рекурсивного вызова </p>

На практике глубина рекурсии, разрешенная языком программирования, обычно ограничена, и слишком глубокая рекурсия может привести к ошибке переполнения стека.

### 2. &nbsp; Хвостовая рекурсия

Интересно, что **если рекурсивный вызов происходит на последнем шаге перед возвратом функции** , то компилятор или интерпретатор может оптимизировать этот вызов, сделав его по эффективности использования памяти сопоставимым с итерацией. Это называется <u>хвостовой рекурсией (tail recursion)</u>.

- **Обычная рекурсия**: когда функция возвращается на предыдущий уровень, необходимо продолжить выполнение кода, поэтому системе нужно сохранить контекст предыдущего вызова.
- **Хвостовая рекурсия**: рекурсивный вызов является последней операцией перед возвратом функции, что означает, что после возврата на предыдущий уровень не требуется выполнять другие операции, поэтому системе не нужно сохранять контекст предыдущей функции.

В качестве примера вычисления суммы $1 + 2 + \dots + n$ можно установить переменную результата `res` в качестве параметра функции, чтобы реализовать хвостовую рекурсию:

=== "Python"

    ```python title="recursion.py"
    def tail_recur(n, res):
        """Хвостовая рекурсия"""
        # Условие завершения
        if n == 0:
            return res
        # Хвостовой рекурсивный вызов
        return tail_recur(n - 1, res + n)
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* Хвостовая рекурсия */
    int tailRecur(int n, int res) {
        // Условие завершения
        if (n == 0)
            return res;
        // Хвостовой рекурсивный вызов
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* Хвостовая рекурсия */
    int tailRecur(int n, int res) {
        // Условие завершения
        if (n == 0)
            return res;
        // Хвостовой рекурсивный вызов
        return tailRecur(n - 1, res + n);
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* Хвостовая рекурсия */
    int TailRecur(int n, int res) {
        // Условие завершения
        if (n == 0)
            return res;
        // Хвостовой рекурсивный вызов
        return TailRecur(n - 1, res + n);
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* Хвостовая рекурсия */
    func tailRecur(n int, res int) int {
        // Условие завершения
        if n == 0 {
            return res
        }
        // Хвостовой рекурсивный вызов
        return tailRecur(n-1, res+n)
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* Хвостовая рекурсия */
    func tailRecur(n: Int, res: Int) -> Int {
        // Условие завершения
        if n == 0 {
            return res
        }
        // Хвостовой рекурсивный вызов
        return tailRecur(n: n - 1, res: res + n)
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* Хвостовая рекурсия */
    function tailRecur(n, res) {
        // Условие завершения
        if (n === 0) return res;
        // Хвостовой рекурсивный вызов
        return tailRecur(n - 1, res + n);
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* Хвостовая рекурсия */
    function tailRecur(n: number, res: number): number {
        // Условие завершения
        if (n === 0) return res;
        // Хвостовой рекурсивный вызов
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* Хвостовая рекурсия */
    int tailRecur(int n, int res) {
      // Условие завершения
      if (n == 0) return res;
      // Хвостовой рекурсивный вызов
      return tailRecur(n - 1, res + n);
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* Хвостовая рекурсия */
    fn tail_recur(n: i32, res: i32) -> i32 {
        // Условие завершения
        if n == 0 {
            return res;
        }
        // Хвостовой рекурсивный вызов
        tail_recur(n - 1, res + n)
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* Хвостовая рекурсия */
    int tailRecur(int n, int res) {
        // Условие завершения
        if (n == 0)
            return res;
        // Хвостовой рекурсивный вызов
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* Хвостовая рекурсия */
    tailrec fun tailRecur(n: Int, res: Int): Int {
        // Добавить ключевое слово tailrec, чтобы включить оптимизацию хвостовой рекурсии
        // Условие завершения
        if (n == 0)
            return res
        // Хвостовой рекурсивный вызов
        return tailRecur(n - 1, res + n)
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### Хвостовая рекурсия ###
    def tail_recur(n, res)
      # Условие завершения
      return res if n == 0
      # Хвостовой рекурсивный вызов
      tail_recur(n - 1, res + n)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20tail_recur%28n%2C%20res%29%3A%0A%20%20%20%20%22%22%22%D0%A5%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%A3%D1%81%D0%BB%D0%BE%D0%B2%D0%B8%D0%B5%20%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20res%0A%20%20%20%20%23%20%D0%A5%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%0A%20%20%20%20return%20tail_recur%28n%20-%201%2C%20res%20%2B%20n%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20tail_recur%28n%2C%200%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20tail_recur%28n%2C%20res%29%3A%0A%20%20%20%20%22%22%22%D0%A5%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%A3%D1%81%D0%BB%D0%BE%D0%B2%D0%B8%D0%B5%20%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20res%0A%20%20%20%20%23%20%D0%A5%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%0A%20%20%20%20return%20tail_recur%28n%20-%201%2C%20res%20%2B%20n%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20tail_recur%28n%2C%200%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Процесс выполнения хвостовой рекурсии показан на рисунке 2-5. Сравнивая обычную и хвостовую рекурсии, можно заметить, что точка выполнения операции суммирования у них различается.

- **Обычная рекурсия**: операция суммирования выполняется в процессе возврата, после каждого возврата необходимо снова выполнить операцию суммирования.
- **Хвостовая рекурсия**: операция суммирования выполняется в процессе вызова, а процесс возврата требует только последовательного возврата.

![Процесс хвостовой рекурсии](iteration_and_recursion.assets/tail_recursion_sum.png){ class="animation-figure" }

<p align="center"> Рисунок 2-5 &nbsp; Процесс хвостовой рекурсии </p>

!!! tip

    Обратите внимание: многие компиляторы и интерпретаторы не поддерживают оптимизацию хвостовой рекурсии. Например, Python по умолчанию такую оптимизацию не выполняет, поэтому даже функция в хвостово-рекурсивной форме все равно может привести к переполнению стека.

### 3. &nbsp; Дерево рекурсии

При решении задач, связанных с алгоритмами типа "разделяй и властвуй", рекурсия часто оказывается более интуитивной и читабельной, чем итерация. Рассмотрим в качестве примера последовательность Фибоначчи.

!!! question

    Дана последовательность Фибоначчи $0, 1, 1, 2, 3, 5, 8, 13, \dots$ ; найди $n$-й элемент этой последовательности.

Обозначив $n$-й член последовательности Фибоначчи как $f(n)$ , можно сформулировать два утверждения.

- Первые два числа последовательности: $f(1) = 0$ и $f(2) = 1$ .
- Каждое число последовательности является суммой двух предыдущих чисел, то есть $f(n) = f(n - 1) + f(n - 2)$ .

Используя рекурсивные вызовы в соответствии с рекуррентным соотношением и принимая первые два числа за условия остановки, можно написать рекурсивный код. Вызов `fib(n)` позволит получить $n$-й член последовательности Фибоначчи:

=== "Python"

    ```python title="recursion.py"
    def fib(n: int) -> int:
        """Последовательность Фибоначчи: рекурсия"""
        # Условие завершения: f(1) = 0, f(2) = 1
        if n == 1 or n == 2:
            return n - 1
        # Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        res = fib(n - 1) + fib(n - 2)
        # Вернуть результат f(n)
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* Последовательность Фибоначчи: рекурсия */
    int fib(int n) {
        // Условие завершения: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // Вернуть результат f(n)
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* Последовательность Фибоначчи: рекурсия */
    int fib(int n) {
        // Условие завершения: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // Вернуть результат f(n)
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* Последовательность Фибоначчи: рекурсия */
    int Fib(int n) {
        // Условие завершения: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // Вернуть результат f(n)
        return res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* Последовательность Фибоначчи: рекурсия */
    func fib(n int) int {
        // Условие завершения: f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1
        }
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        res := fib(n-1) + fib(n-2)
        // Вернуть результат f(n)
        return res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* Последовательность Фибоначчи: рекурсия */
    func fib(n: Int) -> Int {
        // Условие завершения: f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1
        }
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        let res = fib(n: n - 1) + fib(n: n - 2)
        // Вернуть результат f(n)
        return res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* Последовательность Фибоначчи: рекурсия */
    function fib(n) {
        // Условие завершения: f(1) = 0, f(2) = 1
        if (n === 1 || n === 2) return n - 1;
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        const res = fib(n - 1) + fib(n - 2);
        // Вернуть результат f(n)
        return res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* Последовательность Фибоначчи: рекурсия */
    function fib(n: number): number {
        // Условие завершения: f(1) = 0, f(2) = 1
        if (n === 1 || n === 2) return n - 1;
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        const res = fib(n - 1) + fib(n - 2);
        // Вернуть результат f(n)
        return res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* Последовательность Фибоначчи: рекурсия */
    int fib(int n) {
      // Условие завершения: f(1) = 0, f(2) = 1
      if (n == 1 || n == 2) return n - 1;
      // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
      int res = fib(n - 1) + fib(n - 2);
      // Вернуть результат f(n)
      return res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* Последовательность Фибоначчи: рекурсия */
    fn fib(n: i32) -> i32 {
        // Условие завершения: f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1;
        }
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        let res = fib(n - 1) + fib(n - 2);
        // Вернуть результат
        res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* Последовательность Фибоначчи: рекурсия */
    int fib(int n) {
        // Условие завершения: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // Вернуть результат f(n)
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* Последовательность Фибоначчи: рекурсия */
    fun fib(n: Int): Int {
        // Условие завершения: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        val res = fib(n - 1) + fib(n - 2)
        // Вернуть результат f(n)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### Последовательность Фибоначчи: рекурсия ###
    def fib(n)
      # Условие завершения: f(1) = 0, f(2) = 1
      return n - 1 if n == 1 || n == 2
      # Рекурсивный вызов f(n) = f(n-1) + f(n-2)
      res = fib(n - 1) + fib(n - 2)
      # Вернуть результат f(n)
      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20fib%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%D0%A4%D0%B8%D0%B1%D0%BE%D0%BD%D0%B0%D1%87%D1%87%D0%B8%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%A3%D1%81%D0%BB%D0%BE%D0%B2%D0%B8%D0%B5%20%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%3A%20f%281%29%20%3D%200%2C%20f%282%29%20%3D%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%20-%201%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%20f%28n%29%20%3D%20f%28n-1%29%20%2B%20f%28n-2%29%0A%20%20%20%20res%20%3D%20fib%28n%20-%201%29%20%2B%20fib%28n%20-%202%29%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20f%28n%29%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20fib%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A7%D0%BB%D0%B5%D0%BD%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%D0%A4%D0%B8%D0%B1%D0%BE%D0%BD%D0%B0%D1%87%D1%87%D0%B8%20%D1%81%20%D0%BD%D0%BE%D0%BC%D0%B5%D1%80%D0%BE%D0%BC%20%7Bn%7D%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20fib%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%D0%A4%D0%B8%D0%B1%D0%BE%D0%BD%D0%B0%D1%87%D1%87%D0%B8%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%A3%D1%81%D0%BB%D0%BE%D0%B2%D0%B8%D0%B5%20%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%3A%20f%281%29%20%3D%200%2C%20f%282%29%20%3D%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%20-%201%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%20f%28n%29%20%3D%20f%28n-1%29%20%2B%20f%28n-2%29%0A%20%20%20%20res%20%3D%20fib%28n%20-%201%29%20%2B%20fib%28n%20-%202%29%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20f%28n%29%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20fib%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A7%D0%BB%D0%B5%D0%BD%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%D0%A4%D0%B8%D0%B1%D0%BE%D0%BD%D0%B0%D1%87%D1%87%D0%B8%20%D1%81%20%D0%BD%D0%BE%D0%BC%D0%B5%D1%80%D0%BE%D0%BC%20%7Bn%7D%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Проанализировав приведенный код, можно заметить, что внутри функции осуществляется рекурсивный вызов двух функций, **то есть из одного вызова образуются два ветвления**. Как показано на рисунке 2-6, при последующем выполнении рекурсивных вызовов в итоге образуется <u>дерево рекурсии (recursion tree)</u> глубиной $n$ .

![Дерево рекурсии последовательности Фибоначчи](iteration_and_recursion.assets/recursion_tree.png){ class="animation-figure" }

<p align="center"> Рисунок 2-6 &nbsp; Дерево рекурсии последовательности Фибоначчи </p>

По своей сути рекурсия отражает парадигму мышления "разбиение задачи на более мелкие подзадачи", что делает стратегию "разделяй и властвуй" крайне важной.

- С точки зрения **алгоритмов** многие важные алгоритмические стратегии, такие как поиск, сортировка, возврат, "разделяй и властвуй" и динамическое программирование, прямо или косвенно используют этот подход.
- С точки зрения **структур данных** рекурсия естественно подходит для решения задач, связанных со списками, деревьями и графами, поскольку они очень хорошо поддаются анализу с использованием идеи "разделяй и властвуй".

## 2.2.3 &nbsp; Сравнение

Подводя итог, можно сказать, что итерация и рекурсия различаются по реализации, производительности и применимости, как показано в таблице 2-1.

<p align="center"> Таблица 2-1 &nbsp; Сравнение итерации и рекурсии </p>

<div class="center-table" markdown>

|          | Итерация                               | Рекурсия                                                     |
| -------- | -------------------------------------- | ------------------------------------------------------------ |
| Способ реализации | Циклическая структура | Функция вызывает саму себя |
| Временная эффективность | Обычно высокая эффективность, нет затрат на вызов функции | Каждый вызов функции создает затраты |
| Использование памяти | Обычно используется фиксированный объем памяти | Накопление вызовов функции может использовать значительное количество пространства стека |
| Сфера использования | Подходит для простых циклических задач, код интуитивно понятен и хорошо читаем | Подходит для разбиения на подзадачи, для структур деревья и графы, алгоритмов "разделяй и властвуй", возврата и т. д.; структура кода проста и ясна |

</div>

!!! tip

    Если дальнейшее содержание кажется сложным, можно вернуться к нему после чтения главы о "стеке".

Какова же внутренняя связь между итерацией и рекурсией? В рассмотренном примере рекурсивной функции операция сложения выполняется на этапе возврата рекурсии. Это означает, что функция, вызванная первой, фактически завершает операцию сложения последней, **что соответствует принципу стека "первым пришел - последним вышел"**.

На самом деле такие термины рекурсии, как "стек вызовов" и "пространство стекового кадра", уже намекают на тесную связь между рекурсией и стеком.

1. **Вызов**: когда вызывается функция, система выделяет для нее новый стековый кадр в "стеке вызовов" для хранения локальных переменных функции, параметров, адреса возврата и других данных.
2. **Возврат**: когда функция завершает выполнение и возвращает результат, соответствующий стековый кадр удаляется из "стека вызовов", восстанавливая среду выполнения предыдущей функции.

Таким образом, **можно использовать явный стек для моделирования поведения стека вызовов**, чтобы преобразовать рекурсию в итеративную форму:

=== "Python"

    ```python title="recursion.py"
    def for_loop_recur(n: int) -> int:
        """Имитация рекурсии итерацией"""
        # Использовать явный стек для имитации системного стека вызовов
        stack = []
        res = 0
        # Рекурсия: рекурсивный вызов
        for i in range(n, 0, -1):
            # Имитировать «рекурсию» с помощью операции помещения в стек
            stack.append(i)
        # Возврат: вернуть результат
        while stack:
            # Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.pop()
        # res = 1+2+3+...+n
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* Имитация рекурсии итерацией */
    int forLoopRecur(int n) {
        // Использовать явный стек для имитации системного стека вызовов
        stack<int> stack;
        int res = 0;
        // Рекурсия: рекурсивный вызов
        for (int i = n; i > 0; i--) {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.push(i);
        }
        // Возврат: вернуть результат
        while (!stack.empty()) {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.top();
            stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* Имитация рекурсии итерацией */
    int forLoopRecur(int n) {
        // Использовать явный стек для имитации системного стека вызовов
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // Рекурсия: рекурсивный вызов
        for (int i = n; i > 0; i--) {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.push(i);
        }
        // Возврат: вернуть результат
        while (!stack.isEmpty()) {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* Имитация рекурсии итерацией */
    int ForLoopRecur(int n) {
        // Использовать явный стек для имитации системного стека вызовов
        Stack<int> stack = new();
        int res = 0;
        // Рекурсия: рекурсивный вызов
        for (int i = n; i > 0; i--) {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.Push(i);
        }
        // Возврат: вернуть результат
        while (stack.Count > 0) {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* Имитация рекурсии итерацией */
    func forLoopRecur(n int) int {
        // Использовать явный стек для имитации системного стека вызовов
        stack := list.New()
        res := 0
        // Рекурсия: рекурсивный вызов
        for i := n; i > 0; i-- {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.PushBack(i)
        }
        // Возврат: вернуть результат
        for stack.Len() != 0 {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.Back().Value.(int)
            stack.Remove(stack.Back())
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* Имитация рекурсии итерацией */
    func forLoopRecur(n: Int) -> Int {
        // Использовать явный стек для имитации системного стека вызовов
        var stack: [Int] = []
        var res = 0
        // Рекурсия: рекурсивный вызов
        for i in (1 ... n).reversed() {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.append(i)
        }
        // Возврат: вернуть результат
        while !stack.isEmpty {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.removeLast()
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* Имитация рекурсии итерацией */
    function forLoopRecur(n) {
        // Использовать явный стек для имитации системного стека вызовов
        const stack = [];
        let res = 0;
        // Рекурсия: рекурсивный вызов
        for (let i = n; i > 0; i--) {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.push(i);
        }
        // Возврат: вернуть результат
        while (stack.length) {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* Имитация рекурсии итерацией */
    function forLoopRecur(n: number): number {
        // Использовать явный стек для имитации системного стека вызовов
        const stack: number[] = [];
        let res: number = 0;
        // Рекурсия: рекурсивный вызов
        for (let i = n; i > 0; i--) {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.push(i);
        }
        // Возврат: вернуть результат
        while (stack.length) {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* Имитация рекурсии итерацией */
    int forLoopRecur(int n) {
      // Использовать явный стек для имитации системного стека вызовов
      List<int> stack = [];
      int res = 0;
      // Рекурсия: рекурсивный вызов
      for (int i = n; i > 0; i--) {
        // Имитировать «рекурсию» с помощью операции помещения в стек
        stack.add(i);
      }
      // Возврат: вернуть результат
      while (!stack.isEmpty) {
        // Имитировать «возврат» с помощью операции извлечения из стека
        res += stack.removeLast();
      }
      // res = 1+2+3+...+n
      return res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* Имитация рекурсии итерацией */
    fn for_loop_recur(n: i32) -> i32 {
        // Использовать явный стек для имитации системного стека вызовов
        let mut stack = Vec::new();
        let mut res = 0;
        // Рекурсия: рекурсивный вызов
        for i in (1..=n).rev() {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.push(i);
        }
        // Возврат: вернуть результат
        while !stack.is_empty() {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.pop().unwrap();
        }
        // res = 1+2+3+...+n
        res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* Имитация рекурсии итерацией */
    int forLoopRecur(int n) {
        int stack[1000]; // Использовать большой массив для имитации стека
        int top = -1;    // Индекс вершины стека
        int res = 0;
        // Рекурсия: рекурсивный вызов
        for (int i = n; i > 0; i--) {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack[1 + top++] = i;
        }
        // Возврат: вернуть результат
        while (top >= 0) {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack[top--];
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* Имитация рекурсии итерацией */
    fun forLoopRecur(n: Int): Int {
        // Использовать явный стек для имитации системного стека вызовов
        val stack = Stack<Int>()
        var res = 0
        // Рекурсивный шаг: рекурсивный вызов
        for (i in n downTo 0) {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.push(i)
        }
        // Возврат: вернуть результат
        while (stack.isNotEmpty()) {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.pop()
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### Имитация рекурсии итерацией ###
    def for_loop_recur(n)
      # Использовать явный стек для имитации системного стека вызовов
      stack = []
      res = 0

      # Рекурсия: рекурсивный вызов
      for i in n.downto(0)
        # Имитировать «рекурсию» с помощью операции помещения в стек
        stack << i
      end
      # Возврат: вернуть результат
      while !stack.empty?
        res += stack.pop
      end

      # res = 1+2+3+...+n
      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20for_loop_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%98%D0%BC%D0%B8%D1%82%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B8%20%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%22%22%22%0A%20%20%20%20%23%20%D0%98%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%8F%D0%B2%D0%BD%D1%8B%D0%B9%20%D1%81%D1%82%D0%B5%D0%BA%20%D0%B4%D0%BB%D1%8F%20%D0%B8%D0%BC%D0%B8%D1%82%D0%B0%D1%86%D0%B8%D0%B8%20%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%D0%BE%D0%B2%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%0A%20%20%20%20for%20i%20in%20range%28n%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%98%D0%BC%D0%B8%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%C2%AB%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8E%C2%BB%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20%20%20%20%20stack.append%28i%29%0A%20%20%20%20%23%20%D0%92%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%3A%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%0A%20%20%20%20while%20stack%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%98%D0%BC%D0%B8%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%C2%AB%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%C2%BB%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20stack.pop%28%29%0A%20%20%20%20%23%20res%20%3D%201%2B2%2B3%2B...%2Bn%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop_recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%BF%D1%80%D0%B8%20%D0%B8%D0%BC%D0%B8%D1%82%D0%B0%D1%86%D0%B8%D0%B8%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20for_loop_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%98%D0%BC%D0%B8%D1%82%D0%B0%D1%86%D0%B8%D1%8F%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B8%20%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%22%22%22%0A%20%20%20%20%23%20%D0%98%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%8F%D0%B2%D0%BD%D1%8B%D0%B9%20%D1%81%D1%82%D0%B5%D0%BA%20%D0%B4%D0%BB%D1%8F%20%D0%B8%D0%BC%D0%B8%D1%82%D0%B0%D1%86%D0%B8%D0%B8%20%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%D0%BE%D0%B2%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%3A%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9%20%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%0A%20%20%20%20for%20i%20in%20range%28n%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%98%D0%BC%D0%B8%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%C2%AB%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8E%C2%BB%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20%20%20%20%20stack.append%28i%29%0A%20%20%20%20%23%20%D0%92%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%3A%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%0A%20%20%20%20while%20stack%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%98%D0%BC%D0%B8%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%C2%AB%D0%B2%D0%BE%D0%B7%D0%B2%D1%80%D0%B0%D1%82%C2%BB%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20stack.pop%28%29%0A%20%20%20%20%23%20res%20%3D%201%2B2%2B3%2B...%2Bn%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop_recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%D0%A0%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%20%D1%81%D1%83%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%BF%D1%80%D0%B8%20%D0%B8%D0%BC%D0%B8%D1%82%D0%B0%D1%86%D0%B8%D0%B8%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B8%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Наблюдая за приведенным выше кодом, можно заметить, что после преобразования рекурсии в итерацию код становится более сложным. Хотя во многих случаях итерация и рекурсия действительно могут быть преобразованы друг в друга, это не всегда стоит делать по двум причинам.

- Преобразованный код может стать труднее для понимания и менее читаемым.
- Для некоторых сложных задач моделирование поведения системного стека вызовов может оказаться очень трудным.

Итак, **выбор между итерацией и рекурсией зависит от природы конкретной задачи**. В практическом программировании крайне важно взвешивать преимущества и недостатки обоих подходов и выбирать подходящий метод с учетом контекста.
