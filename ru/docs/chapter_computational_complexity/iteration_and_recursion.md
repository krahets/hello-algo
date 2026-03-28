---
comments: true
---

# 2.2 &nbsp; Итерация и рекурсия

В алгоритмах очень часто приходится многократно выполнять одну и ту же задачу, и это тесно связано с анализом сложности. Поэтому, прежде чем переходить к временной и пространственной сложности, давай сначала разберемся, как в программах организуется повторяющееся выполнение задач, то есть с двумя базовыми управляющими структурами: итерацией и рекурсией.

## 2.2.1 &nbsp; Итерация

<u>Итерация (iteration)</u> - это управляющая структура, предназначенная для многократного выполнения некоторой задачи. При итерации программа повторно выполняет определенный фрагмент кода при соблюдении некоторого условия, пока это условие не перестанет выполняться.

### 1. &nbsp; Цикл for

Цикл `for` - одна из самых распространенных форм итерации, **она хорошо подходит в тех случаях, когда число повторений известно заранее**.

Следующая функция реализует вычисление суммы $1 + 2 + \dots + n$ на основе цикла `for` , а результат сохраняется в переменной `res` . Обрати внимание, что в Python `range(a, b)` соответствует "лево-замкнутому, право-открытому" интервалу, то есть перебираются значения $a, a + 1, \dots, b-1$ :

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

На рисунке 2-1 показана блок-схема этой функции суммирования.

![Блок-схема функции суммирования](iteration_and_recursion.assets/iteration.png){ class="animation-figure" }

<p align="center"> Рисунок 2-1 &nbsp; Блок-схема функции суммирования </p>

Число операций в этой функции суммирования пропорционально размеру входных данных $n$ , то есть между ними существует "линейная зависимость". На самом деле **временная сложность как раз и описывает такую "линейную зависимость"**. Соответствующий материал будет подробно разобран в следующем разделе.

### 2. &nbsp; Цикл while

Подобно циклу `for` , цикл `while` тоже является способом реализации итерации. В цикле `while` программа в каждом раунде сначала проверяет условие: если условие истинно, выполнение продолжается, иначе цикл завершается.

Ниже мы используем цикл `while` для реализации суммы $1 + 2 + \dots + n$ :

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

**Цикл `while` обладает большей свободой, чем цикл `for` **. В цикле `while` мы можем свободно задавать шаги инициализации и обновления условной переменной.

Например, в следующем коде условная переменная $i$ обновляется два раза за один проход, и такой случай уже не слишком удобно выражать через цикл `for` :

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
    ### Цикл while (двойное обновление) ###
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

В целом **код с `for` обычно компактнее, а `while` более гибок**; обе конструкции позволяют реализовывать итерационные структуры. Выбор между ними должен определяться требованиями конкретной задачи.

### 3. &nbsp; Вложенные циклы

Мы можем вкладывать одну циклическую структуру в другую; ниже показан пример на основе цикла `for` :

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

На рисунке 2-2 показана блок-схема такого вложенного цикла.

![Блок-схема вложенного цикла](iteration_and_recursion.assets/nested_iteration.png){ class="animation-figure" }

<p align="center"> Рисунок 2-2 &nbsp; Блок-схема вложенного цикла </p>

В этом случае число операций функции пропорционально $n^2$ , то есть время работы алгоритма и размер входных данных $n$ находятся в "квадратичной зависимости".

Мы можем продолжать добавлять вложенные циклы, и каждое новое вложение будет означать очередное "повышение размерности", увеличивая временную сложность до "кубической зависимости", "зависимости четвертой степени" и так далее.

## 2.2.2 &nbsp; Рекурсия

 <u>Рекурсия (recursion)</u> - это алгоритмическая стратегия, в которой функция решает задачу, вызывая саму себя. В основном она включает две фазы.

1. **Спуск**: программа все глубже вызывает саму себя, обычно передавая меньшие или более упрощенные параметры, пока не достигнет "условия завершения".
2. **Подъем**: после срабатывания "условия завершения" программа начинает возвращаться от самой глубокой рекурсивной функции вверх, собирая результаты с каждого уровня.

С точки зрения реализации рекурсивный код в основном состоит из трех элементов.

1. **Условие завершения**: определяет момент перехода от "спуска" к "подъему".
2. **Рекурсивный вызов**: соответствует "спуску", когда функция вызывает саму себя, обычно с меньшими или более упрощенными параметрами.
3. **Возврат результата**: соответствует "подъему", когда результат текущего уровня рекурсии передается предыдущему.

Посмотри на следующий код: нам достаточно вызвать функцию `recur(n)`  , чтобы вычислить $1 + 2 + \dots + n$ :

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

На рисунке 2-3 показан рекурсивный процесс этой функции.

![Рекурсивный процесс функции суммирования](iteration_and_recursion.assets/recursion_sum.png){ class="animation-figure" }

<p align="center"> Рисунок 2-3 &nbsp; Рекурсивный процесс функции суммирования </p>

Хотя с вычислительной точки зрения итерация и рекурсия могут давать один и тот же результат, **они представляют собой две совершенно разные парадигмы мышления и решения задач**.

- **Итерация**: решает задачу "снизу вверх". Мы начинаем с самых базовых шагов, а затем многократно повторяем или накапливаем их, пока задача не будет завершена.
- **Рекурсия**: решает задачу "сверху вниз". Исходная задача разбивается на более мелкие подзадачи той же формы. Затем эти подзадачи продолжают разбиваться еще дальше, пока не будет достигнут базовый случай (для которого решение уже известно).

Возьмем в качестве примера указанную выше функцию суммирования и обозначим задачу как $f(n) = 1 + 2 + \dots + n$ .

- **Итерация**: в цикле моделируется процесс суммирования от $1$ до $n$ , и на каждом шаге выполняется операция сложения, в результате чего получается $f(n)$ .
- **Рекурсия**: задача раскладывается на подзадачу $f(n) = n + f(n-1)$ , а затем продолжает раскладываться (рекурсивно) до базового случая $f(1) = 1$ .

### 1. &nbsp; Стек вызовов

Каждый раз, когда рекурсивная функция вызывает сама себя, система выделяет память для нового экземпляра функции, чтобы хранить локальные переменные, адрес возврата и другую информацию. Это приводит к двум последствиям.

- Контекстные данные функции хранятся в области памяти, называемой "пространством кадра стека", и освобождаются только после возврата функции. Поэтому **рекурсия обычно требует больше памяти, чем итерация**.
- Вызов рекурсивной функции создает дополнительный накладной расход. **Поэтому рекурсия обычно уступает циклам по временной эффективности**.

Как показано на рисунке 2-4, до срабатывания условия завершения одновременно существует $n$ еще не завершившихся рекурсивных вызовов, а **глубина рекурсии равна $n$** .

![Глубина рекурсивного вызова](iteration_and_recursion.assets/recursion_sum_depth.png){ class="animation-figure" }

<p align="center"> Рисунок 2-4 &nbsp; Глубина рекурсивного вызова </p>

На практике разрешенная языком программирования глубина рекурсии обычно ограничена, и слишком глубокая рекурсия может привести к ошибке переполнения стека.

### 2. &nbsp; Хвостовая рекурсия

Интересно, что **если функция выполняет рекурсивный вызов в самом последнем действии перед возвратом** , то компилятор или интерпретатор может оптимизировать такую функцию так, чтобы по использованию памяти она была сопоставима с итерацией. Такой случай называется <u>хвостовой рекурсией (tail recursion)</u>.

- **Обычная рекурсия**: когда функция возвращается на предыдущий уровень, ей все еще нужно продолжать выполнять код, поэтому системе приходится сохранять контекст вызова предыдущего уровня.
- **Хвостовая рекурсия**: рекурсивный вызов - это последняя операция перед возвратом, а значит, после возвращения на предыдущий уровень не требуется выполнять дополнительных действий, и системе не нужно сохранять контекст предыдущей функции.

На примере вычисления $1 + 2 + \dots + n$ можно сделать переменную результата `res` параметром функции и тем самым реализовать хвостовую рекурсию:

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

Процесс выполнения хвостовой рекурсии показан на рисунке 2-5. Если сравнить обычную рекурсию и хвостовую рекурсию, то видно, что точка выполнения операции суммирования у них различается.

- **Обычная рекурсия**: операция суммирования выполняется в процессе "подъема", то есть после возврата с каждого уровня еще нужно выполнить очередное сложение.
- **Хвостовая рекурсия**: операция суммирования выполняется в процессе "спуска", а сам "подъем" сводится лишь к последовательному возврату.

![Процесс хвостовой рекурсии](iteration_and_recursion.assets/tail_recursion_sum.png){ class="animation-figure" }

<p align="center"> Рисунок 2-5 &nbsp; Процесс хвостовой рекурсии </p>

!!! tip

    Обрати внимание: многие компиляторы и интерпретаторы не поддерживают оптимизацию хвостовой рекурсии. Например, Python по умолчанию такую оптимизацию не выполняет, поэтому даже функция в хвостово-рекурсивной форме все равно может привести к переполнению стека.

### 3. &nbsp; Дерево рекурсии

При решении алгоритмических задач, связанных с "разделяй и властвуй", рекурсия часто дает более интуитивный способ рассуждения и более читаемый код, чем итерация. Возьмем в качестве примера "последовательность Фибоначчи".

!!! question

    Дана последовательность Фибоначчи $0, 1, 1, 2, 3, 5, 8, 13, \dots$ ; найди $n$-й элемент этой последовательности.

Обозначим $n$-й элемент последовательности Фибоначчи как $f(n)$ . Тогда нетрудно получить два вывода.

- Первые два числа последовательности равны $f(1) = 0$ и $f(2) = 1$ .
- Каждое последующее число равно сумме двух предыдущих, то есть $f(n) = f(n - 1) + f(n - 2)$ .

Следуя рекуррентному соотношению и используя первые два числа как условия завершения, мы можем написать рекурсивный код. Вызов `fib(n)` даст нам $n$-й элемент последовательности Фибоначчи:

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

Если посмотреть на приведенный код, внутри функции выполняются два рекурсивных вызова, **а это означает, что один вызов рождает две ветви вызова**. Как показано на рисунке 2-6, при таком продолжении рекурсивных вызовов в итоге получается <u>дерево рекурсии (recursion tree)</u> глубиной $n$ .

![Дерево рекурсии последовательности Фибоначчи](iteration_and_recursion.assets/recursion_tree.png){ class="animation-figure" }

<p align="center"> Рисунок 2-6 &nbsp; Дерево рекурсии последовательности Фибоначчи </p>

По своей сути рекурсия воплощает парадигму "разбиения задачи на более мелкие подзадачи", и именно поэтому стратегия разделяй-и-властвуй столь важна.

- С точки зрения алгоритмов многие важнейшие стратегии, такие как поиск, сортировка, бэктрекинг, разделяй-и-властвуй и динамическое программирование, прямо или косвенно используют такой образ мышления.
- С точки зрения структур данных рекурсия естественным образом подходит для решения задач, связанных со связными списками, деревьями и графами, потому что они хорошо поддаются анализу через идеи разделения задачи.

## 2.2.3 &nbsp; Сравнение двух подходов

Обобщая все сказанное выше, можно представить различия между итерацией и рекурсией с точки зрения реализации, производительности и применимости в следующей таблице.

<p align="center"> Таблица 2-1 &nbsp; Сравнение характеристик итерации и рекурсии </p>

<div class="center-table" markdown>

|          | Итерация                               | Рекурсия                                                     |
| -------- | -------------------------------------- | ------------------------------------------------------------ |
| Реализация | Циклическая структура                  | Функция вызывает сама себя                                   |
| Временная эффективность | Обычно выше, так как нет накладных расходов на вызовы функций | Каждый вызов функции создает накладные расходы               |
| Использование памяти | Обычно требуется фиксированный объем памяти | Накопление вызовов функции может занимать много места в кадрах стека |
| Подходящие задачи | Хорошо подходит для простых циклических задач, код интуитивен и легко читается | Хорошо подходит для разложения на подзадачи, например для деревьев, графов, разделяй-и-властвуй, бэктрекинга и т. д.; код при этом получается компактным и ясным |

</div>

!!! tip

    Если тебе сложно понять дальнейшее содержание, можешь вернуться к нему после чтения главы о "стеке".

Какова же внутренняя связь между итерацией и рекурсией? Если снова взять рекурсивную функцию выше, операция суммирования выполняется в фазе "подъема" рекурсии. Это означает, что функция, вызванная первой, на самом деле завершает сложение последней, **и такой механизм очень похож на принцип стека "последним пришел - первым ушел"**.

На самом деле такие термины рекурсии, как "стек вызовов" и "пространство кадра стека", уже прямо намекают на тесную связь между рекурсией и стеком.

1. **Спуск**: когда вызывается функция, система выделяет для нее новый кадр стека в "стеке вызовов", чтобы хранить локальные переменные, параметры, адрес возврата и другие данные.
2. **Подъем**: когда функция завершает выполнение и возвращается, соответствующий кадр стека удаляется из "стека вызовов", а среда выполнения предыдущей функции восстанавливается.

Поэтому **мы можем использовать явный стек для имитации поведения стека вызовов** и тем самым преобразовать рекурсию в итеративную форму:

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

Если посмотреть на приведенный выше код, видно, что после преобразования рекурсии в итерацию код становится сложнее. Хотя во многих случаях итерация и рекурсия действительно могут быть преобразованы друг в друга, это не всегда стоит делать по двум причинам.

- Преобразованный код может стать труднее для понимания и менее читаемым.
- Для некоторых сложных задач имитация поведения системного стека вызовов может оказаться очень трудной.

Итак, **выбор между итерацией и рекурсией зависит от природы конкретной задачи**. В практическом программировании крайне важно взвешивать плюсы и минусы обоих подходов и выбирать подходящий метод с учетом контекста.
