---
comments: true
---

# 2.3 &nbsp; Временная сложность

Время выполнения действительно может наглядно и точно отражать эффективность алгоритма. Но если мы захотим точно оценить время работы некоторого фрагмента кода, то столкнемся со следующими шагами.

1. **Определить платформу выполнения**, включая конфигурацию оборудования, язык программирования, системную среду и т.д., поскольку все эти факторы влияют на эффективность выполнения кода.
2. **Оценить время выполнения различных вычислительных операций**, например операция сложения `+` требует 1 нс , операция умножения `*` требует 10 нс , операция вывода `print()` требует 5 нс и т.д.
3. **Подсчитать все вычислительные операции в коде** и суммировать время выполнения всех операций, чтобы получить общее время работы.

Например, в следующем коде размер входных данных равен $n$ :

=== "Python"

    ```python title=""
    # На некоторой платформе выполнения
    def algorithm(n: int):
        a = 2      # 1 нс
        a = a + 1  # 1 нс
        a = a * 2  # 10 нс
        # Цикл выполняется n раз
        for _ in range(n):  # 1 нс
            print(0)        # 5 нс
    ```

=== "C++"

    ```cpp title=""
    // На некоторой платформе выполнения
    void algorithm(int n) {
        int a = 2;  // 1 нс
        a = a + 1;  // 1 нс
        a = a * 2;  // 10 нс
        // Цикл выполняется n раз
        for (int i = 0; i < n; i++) {  // 1 нс
            cout << 0 << endl;         // 5 нс
        }
    }
    ```

=== "Java"

    ```java title=""
    // На некоторой платформе выполнения
    void algorithm(int n) {
        int a = 2;  // 1 нс
        a = a + 1;  // 1 нс
        a = a * 2;  // 10 нс
        // Цикл выполняется n раз
        for (int i = 0; i < n; i++) {  // 1 нс
            System.out.println(0);     // 5 нс
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // На некоторой платформе выполнения
    void Algorithm(int n) {
        int a = 2;  // 1 нс
        a = a + 1;  // 1 нс
        a = a * 2;  // 10 нс
        // Цикл выполняется n раз
        for (int i = 0; i < n; i++) {  // 1 нс
            Console.WriteLine(0);      // 5 нс
        }
    }
    ```

=== "Go"

    ```go title=""
    // На некоторой платформе выполнения
    func algorithm(n int) {
        a := 2     // 1 нс
        a = a + 1  // 1 нс
        a = a * 2  // 10 нс
        // Цикл выполняется n раз
        for i := 0; i < n; i++ {  // 1 нс
            fmt.Println(a)        // 5 нс
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // На некоторой платформе выполнения
    func algorithm(n: Int) {
        var a = 2 // 1 нс
        a = a + 1 // 1 нс
        a = a * 2 // 10 нс
        // Цикл выполняется n раз
        for _ in 0 ..< n { // 1 нс
            print(0) // 5 нс
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // На некоторой платформе выполнения
    function algorithm(n) {
        var a = 2; // 1 нс
        a = a + 1; // 1 нс
        a = a * 2; // 10 нс
        // Цикл выполняется n раз
        for(let i = 0; i < n; i++) { // 1 нс
            console.log(0); // 5 нс
        }
    }
    ```

=== "TS"

    ```typescript title=""
    // На некоторой платформе выполнения
    function algorithm(n: number): void {
        var a: number = 2; // 1 нс
        a = a + 1; // 1 нс
        a = a * 2; // 10 нс
        // Цикл выполняется n раз
        for(let i = 0; i < n; i++) { // 1 нс
            console.log(0); // 5 нс
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // На некоторой платформе выполнения
    void algorithm(int n) {
      int a = 2; // 1 нс
      a = a + 1; // 1 нс
      a = a * 2; // 10 нс
      // Цикл выполняется n раз
      for (int i = 0; i < n; i++) { // 1 нс
        print(0); // 5 нс
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // На некоторой платформе выполнения
    fn algorithm(n: i32) {
        let mut a = 2;      // 1 нс
        a = a + 1;          // 1 нс
        a = a * 2;          // 10 нс
        // Цикл выполняется n раз
        for _ in 0..n {     // 1 нс
            println!("{}", 0);  // 5 нс
        }
    }
    ```

=== "C"

    ```c title=""
    // На некоторой платформе выполнения
    void algorithm(int n) {
        int a = 2;  // 1 нс
        a = a + 1;  // 1 нс
        a = a * 2;  // 10 нс
        // Цикл выполняется n раз
        for (int i = 0; i < n; i++) {   // 1 нс
            printf("%d", 0);            // 5 нс
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // На некоторой платформе выполнения
    fun algorithm(n: Int) {
        var a = 2 // 1 нс
        a = a + 1 // 1 нс
        a = a * 2 // 10 нс
        // Цикл выполняется n раз
        for (i in 0..<n) {  // 1 нс
            println(0)      // 5 нс
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # На некоторой платформе выполнения
    def algorithm(n)
        a = 2       # 1 нс
        a = a + 1   # 1 нс
        a = a * 2   # 10 нс
        # Цикл выполняется n раз
        (0...n).each do # 1 нс
            puts 0      # 5 нс
        end
    end
    ```

Согласно приведенному выше методу, время работы алгоритма равно $(6n + 12)$ нс :

$$
1 + 1 + 10 + (1 + 5) \times n = 6n + 12
$$

Но на практике **подсчитывать реальное время выполнения алгоритма и неразумно, и нереалистично**. Во-первых, мы не хотим привязывать оценку времени к конкретной платформе, потому что алгоритм должен запускаться на самых разных платформах. Во-вторых, нам трудно определить время выполнения каждого типа операций, а это делает точную оценку крайне затруднительной.

## 2.3.1 &nbsp; Подсчет тенденции роста времени

Анализ временной сложности оценивает не само время выполнения алгоритма, **а тенденцию роста этого времени по мере увеличения объема данных**.

Понятие "тенденции роста времени" выглядит довольно абстрактным, поэтому разберем его на примере. Предположим, размер входных данных равен $n$ , и даны три алгоритма `A` , `B` и `C` :

=== "Python"

    ```python title=""
    # Временная сложность алгоритма A: постоянная
    def algorithm_A(n: int):
        print(0)
    # Временная сложность алгоритма B: линейная
    def algorithm_B(n: int):
        for _ in range(n):
            print(0)
    # Временная сложность алгоритма C: постоянная
    def algorithm_C(n: int):
        for _ in range(1000000):
            print(0)
    ```

=== "C++"

    ```cpp title=""
    // Временная сложность алгоритма A: постоянная
    void algorithm_A(int n) {
        cout << 0 << endl;
    }
    // Временная сложность алгоритма B: линейная
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            cout << 0 << endl;
        }
    }
    // Временная сложность алгоритма C: постоянная
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            cout << 0 << endl;
        }
    }
    ```

=== "Java"

    ```java title=""
    // Временная сложность алгоритма A: постоянная
    void algorithm_A(int n) {
        System.out.println(0);
    }
    // Временная сложность алгоритма B: линейная
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            System.out.println(0);
        }
    }
    // Временная сложность алгоритма C: постоянная
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            System.out.println(0);
        }
    }
    ```

=== "C#"

    ```csharp title=""
    // Временная сложность алгоритма A: постоянная
    void AlgorithmA(int n) {
        Console.WriteLine(0);
    }
    // Временная сложность алгоритма B: линейная
    void AlgorithmB(int n) {
        for (int i = 0; i < n; i++) {
            Console.WriteLine(0);
        }
    }
    // Временная сложность алгоритма C: постоянная
    void AlgorithmC(int n) {
        for (int i = 0; i < 1000000; i++) {
            Console.WriteLine(0);
        }
    }
    ```

=== "Go"

    ```go title=""
    // Временная сложность алгоритма A: постоянная
    func algorithm_A(n int) {
        fmt.Println(0)
    }
    // Временная сложность алгоритма B: линейная
    func algorithm_B(n int) {
        for i := 0; i < n; i++ {
            fmt.Println(0)
        }
    }
    // Временная сложность алгоритма C: постоянная
    func algorithm_C(n int) {
        for i := 0; i < 1000000; i++ {
            fmt.Println(0)
        }
    }
    ```

=== "Swift"

    ```swift title=""
    // Временная сложность алгоритма A: постоянная
    func algorithmA(n: Int) {
        print(0)
    }

    // Временная сложность алгоритма B: линейная
    func algorithmB(n: Int) {
        for _ in 0 ..< n {
            print(0)
        }
    }

    // Временная сложность алгоритма C: постоянная
    func algorithmC(n: Int) {
        for _ in 0 ..< 1_000_000 {
            print(0)
        }
    }
    ```

=== "JS"

    ```javascript title=""
    // Временная сложность алгоритма A: постоянная
    function algorithm_A(n) {
        console.log(0);
    }
    // Временная сложность алгоритма B: линейная
    function algorithm_B(n) {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // Временная сложность алгоритма C: постоянная
    function algorithm_C(n) {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }

    ```

=== "TS"

    ```typescript title=""
    // Временная сложность алгоритма A: постоянная
    function algorithm_A(n: number): void {
        console.log(0);
    }
    // Временная сложность алгоритма B: линейная
    function algorithm_B(n: number): void {
        for (let i = 0; i < n; i++) {
            console.log(0);
        }
    }
    // Временная сложность алгоритма C: постоянная
    function algorithm_C(n: number): void {
        for (let i = 0; i < 1000000; i++) {
            console.log(0);
        }
    }
    ```

=== "Dart"

    ```dart title=""
    // Временная сложность алгоритма A: постоянная
    void algorithmA(int n) {
      print(0);
    }
    // Временная сложность алгоритма B: линейная
    void algorithmB(int n) {
      for (int i = 0; i < n; i++) {
        print(0);
      }
    }
    // Временная сложность алгоритма C: постоянная
    void algorithmC(int n) {
      for (int i = 0; i < 1000000; i++) {
        print(0);
      }
    }
    ```

=== "Rust"

    ```rust title=""
    // Временная сложность алгоритма A: постоянная
    fn algorithm_A(n: i32) {
        println!("{}", 0);
    }
    // Временная сложность алгоритма B: линейная
    fn algorithm_B(n: i32) {
        for _ in 0..n {
            println!("{}", 0);
        }
    }
    // Временная сложность алгоритма C: постоянная
    fn algorithm_C(n: i32) {
        for _ in 0..1000000 {
            println!("{}", 0);
        }
    }
    ```

=== "C"

    ```c title=""
    // Временная сложность алгоритма A: постоянная
    void algorithm_A(int n) {
        printf("%d", 0);
    }
    // Временная сложность алгоритма B: линейная
    void algorithm_B(int n) {
        for (int i = 0; i < n; i++) {
            printf("%d", 0);
        }
    }
    // Временная сложность алгоритма C: постоянная
    void algorithm_C(int n) {
        for (int i = 0; i < 1000000; i++) {
            printf("%d", 0);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    // Временная сложность алгоритма A: постоянная
    fun algoritm_A(n: Int) {
        println(0)
    }
    // Временная сложность алгоритма B: линейная
    fun algorithm_B(n: Int) {
        for (i in 0..<n){
            println(0)
        }
    }
    // Временная сложность алгоритма C: постоянная
    fun algorithm_C(n: Int) {
        for (i in 0..<1000000) {
            println(0)
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    # Временная сложность алгоритма A: постоянная
    def algorithm_A(n)
        puts 0
    end

    # Временная сложность алгоритма B: линейная
    def algorithm_B(n)
        (0...n).each { puts 0 }
    end

    # Временная сложность алгоритма C: постоянная
    def algorithm_C(n)
        (0...1_000_000).each { puts 0 }
    end
    ```

Ниже показаны временные сложности трех приведенных выше функций.

- У алгоритма `A` есть только одна операция вывода, и время его работы не растет с увеличением $n$ . Такую временную сложность называют постоянной.
- В алгоритме `B` операция вывода выполняется в цикле $n$ раз, поэтому время работы растет линейно по мере увеличения $n$ . Такая временная сложность называется линейной.
- В алгоритме `C` операция вывода выполняется $1000000$ раз; хотя время работы велико, оно не зависит от размера входных данных $n$ . Поэтому временная сложность `C` такая же, как у `A` , и тоже является постоянной.

![Тенденции роста времени для алгоритмов A, B и C](time_complexity.assets/time_complexity_simple_example.png){ class="animation-figure" }

<p align="center"> Рисунок 2-7 &nbsp; Тенденции роста времени для алгоритмов A, B и C </p>

Какие особенности имеет анализ временной сложности по сравнению с непосредственным измерением времени работы алгоритма?

- **Временная сложность позволяет эффективно оценивать эффективность алгоритма**. Например, время работы алгоритма `B` растет линейно: при $n > 1$ он медленнее алгоритма `A` , а при $n > 1000000$ медленнее алгоритма `C` . Если размер входных данных достаточно велик, алгоритм с постоянной сложностью обязательно лучше алгоритма с линейной сложностью. В этом и состоит смысл тенденции роста времени.
- **Метод вывода временной сложности проще**. Платформа выполнения и тип вычислительных операций не влияют на тенденцию роста времени работы алгоритма. Поэтому в анализе временной сложности можно считать время выполнения всех вычислительных операций одинаковым единичным временем и тем самым упростить подсчет времени выполнения до подсчета количества операций.
- **У временной сложности есть и определенные ограничения**. Например, хотя временная сложность алгоритмов `A` и `C` одинакова, их реальное время выполнения сильно различается. Точно так же, хотя временная сложность `B` выше, чем у `C` , при малых $n$ алгоритм `B` очевидно лучше `C` . Несмотря на эти ограничения, анализ сложности все равно остается самым эффективным и самым распространенным способом оценки алгоритмов.

## 2.3.2 &nbsp; Асимптотическая верхняя граница функции

Для функции с входным размером $n$ :

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +1
        a = a + 1  # +1
        a = a * 2  # +1
        # Цикл выполняется n раз
        for i in range(n):  # +1
            print(0)        # +1
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // Цикл выполняется n раз
        for (int i = 0; i < n; i++) { // +1 (каждый раз выполняется i ++)
            cout << 0 << endl;    // +1
        }
    }
    ```

=== "Java"

    ```java title=""
    void algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // Цикл выполняется n раз
        for (int i = 0; i < n; i++) { // +1 (каждый раз выполняется i ++)
            System.out.println(0);    // +1
        }
    }
    ```

=== "C#"

    ```csharp title=""
    void Algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // Цикл выполняется n раз
        for (int i = 0; i < n; i++) {   // +1 (каждый раз выполняется i ++)
            Console.WriteLine(0);   // +1
        }
    }
    ```

=== "Go"

    ```go title=""
    func algorithm(n int) {
        a := 1      // +1
        a = a + 1   // +1
        a = a * 2   // +1
        // Цикл выполняется n раз
        for i := 0; i < n; i++ {   // +1
            fmt.Println(a)         // +1
        }
    }
    ```

=== "Swift"

    ```swift title=""
    func algorithm(n: Int) {
        var a = 1 // +1
        a = a + 1 // +1
        a = a * 2 // +1
        // Цикл выполняется n раз
        for _ in 0 ..< n { // +1
            print(0) // +1
        }
    }
    ```

=== "JS"

    ```javascript title=""
    function algorithm(n) {
        var a = 1; // +1
        a += 1; // +1
        a *= 2; // +1
        // Цикл выполняется n раз
        for(let i = 0; i < n; i++){ // +1 (каждый раз выполняется i ++)
            console.log(0); // +1
        }
    }
    ```

=== "TS"

    ```typescript title=""
    function algorithm(n: number): void{
        var a: number = 1; // +1
        a += 1; // +1
        a *= 2; // +1
        // Цикл выполняется n раз
        for(let i = 0; i < n; i++){ // +1 (каждый раз выполняется i ++)
            console.log(0); // +1
        }
    }
    ```

=== "Dart"

    ```dart title=""
    void algorithm(int n) {
      int a = 1; // +1
      a = a + 1; // +1
      a = a * 2; // +1
      // Цикл выполняется n раз
      for (int i = 0; i < n; i++) { // +1 (каждый раз выполняется i ++)
        print(0); // +1
      }
    }
    ```

=== "Rust"

    ```rust title=""
    fn algorithm(n: i32) {
        let mut a = 1;   // +1
        a = a + 1;      // +1
        a = a * 2;      // +1

        // Цикл выполняется n раз
        for _ in 0..n { // +1 (каждый раз выполняется i ++)
            println!("{}", 0); // +1
        }
    }
    ```

=== "C"

    ```c title=""
    void algorithm(int n) {
        int a = 1;  // +1
        a = a + 1;  // +1
        a = a * 2;  // +1
        // Цикл выполняется n раз
        for (int i = 0; i < n; i++) {   // +1 (каждый раз выполняется i ++)
            printf("%d", 0);            // +1
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun algorithm(n: Int) {
        var a = 1 // +1
        a = a + 1 // +1
        a = a * 2 // +1
        // Цикл выполняется n раз
        for (i in 0..<n) { // +1 (каждый раз выполняется i ++)
            println(0) // +1
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    def algorithm(n)
        a = 1       # +1
        a = a + 1   # +1
        a = a * 2   # +1
        # Цикл выполняется n раз
        (0...n).each do # +1
            puts 0      # +1
        end
    end
    ```

Пусть количество операций алгоритма является функцией от размера входных данных $n$ и обозначается как $T(n)$ ; тогда для приведенной выше функции число операций равно:

$$
T(n) = 3 + 2n
$$

$T(n)$ - линейная функция, а это означает, что тенденция роста времени работы линейна, следовательно, временная сложность здесь тоже линейна.

Линейную временную сложность записывают как $O(n)$ ; этот математический символ называется <u>нотацией Big $O$ (big-$O$ notation)</u> и обозначает <u>асимптотическую верхнюю границу (asymptotic upper bound)</u> функции $T(n)$ .

Иными словами, анализ временной сложности сводится к определению асимптотической верхней границы числа операций $T(n)$, и у этого понятия есть строгое математическое определение.

!!! note "Асимптотическая верхняя граница функции"

    Если существуют положительное действительное число $c$ и действительное число $n_0$ , такие что для всех $n > n_0$ выполняется $T(n) \leq c \cdot f(n)$ , то можно считать, что $f(n)$ задает асимптотическую верхнюю границу для $T(n)$ ; это записывается как $T(n) = O(f(n))$ .

Как показано на рисунке 2-8, вычислить асимптотическую верхнюю границу - значит найти такую функцию $f(n)$ , что при стремлении $n$ к бесконечности функции $T(n)$ и $f(n)$ имеют один и тот же порядок роста и отличаются только постоянным коэффициентом $c$.

![Асимптотическая верхняя граница функции](time_complexity.assets/asymptotic_upper_bound.png){ class="animation-figure" }

<p align="center"> Рисунок 2-8 &nbsp; Асимптотическая верхняя граница функции </p>

## 2.3.3 &nbsp; Метод вывода

Математическое определение асимптотической верхней границы выглядит довольно формально, и если оно пока не до конца понятно, переживать не стоит. Сначала можно освоить сам метод вывода, а в процессе дальнейшей практики постепенно почувствовать его математический смысл.

Согласно определению, после того как мы определили $f(n)$ , можно получить временную сложность $O(f(n))$ . Но как определить саму асимптотическую верхнюю границу $f(n)$ ? В целом процесс состоит из двух шагов: сначала подсчитать количество операций, затем определить асимптотическую верхнюю границу.

### 1. &nbsp; Шаг 1: подсчет количества операций

Для кода это можно делать построчно сверху вниз. Однако, поскольку в выражении $c \cdot f(n)$ постоянный коэффициент $c$ может быть сколь угодно большим, **различные коэффициенты и постоянные члены в числе операций $T(n)$ можно игнорировать**. Исходя из этого принципа, можно сформулировать следующие упрощающие приемы подсчета.

1. **Игнорировать константы в $T(n)$**. Они не зависят от $n$ , а значит не влияют на временную сложность.
2. **Опускать все коэффициенты**. Например, циклы на $2n$ раз или $5n + 1$ раз можно упростить до $n$ раз, потому что коэффициент перед $n$ не влияет на временную сложность.
3. **При вложенных циклах использовать умножение**. Общее число операций равно произведению числа операций внешнего и внутреннего циклов; при этом для каждого уровня цикла по-прежнему можно применять приемы из пунктов `1.` и `2.` .

Для заданной функции мы можем использовать перечисленные выше приемы и подсчитать число операций:

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +0 (прием 1)
        a = a + n  # +0 (прием 1)
        # +n (прием 2)
        for i in range(5 * n + 1):
            print(0)
        # +n*n (прием 3)
        for i in range(2 * n):
            for j in range(n + 1):
                print(0)
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 1;  // +0 (прием 1)
        a = a + n;  // +0 (прием 1)
        // +n (прием 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            cout << 0 << endl;
        }
        // +n*n (прием 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                cout << 0 << endl;
            }
        }
    }
    ```

=== "Java"

    ```java title=""
    void algorithm(int n) {
        int a = 1;  // +0 (прием 1)
        a = a + n;  // +0 (прием 1)
        // +n (прием 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            System.out.println(0);
        }
        // +n*n (прием 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                System.out.println(0);
            }
        }
    }
    ```

=== "C#"

    ```csharp title=""
    void Algorithm(int n) {
        int a = 1;  // +0 (прием 1)
        a = a + n;  // +0 (прием 1)
        // +n (прием 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            Console.WriteLine(0);
        }
        // +n*n (прием 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                Console.WriteLine(0);
            }
        }
    }
    ```

=== "Go"

    ```go title=""
    func algorithm(n int) {
        a := 1     // +0 (прием 1)
        a = a + n  // +0 (прием 1)
        // +n (прием 2)
        for i := 0; i < 5 * n + 1; i++ {
            fmt.Println(0)
        }
        // +n*n (прием 3)
        for i := 0; i < 2 * n; i++ {
            for j := 0; j < n + 1; j++ {
                fmt.Println(0)
            }
        }
    }
    ```

=== "Swift"

    ```swift title=""
    func algorithm(n: Int) {
        var a = 1 // +0 (прием 1)
        a = a + n // +0 (прием 1)
        // +n (прием 2)
        for _ in 0 ..< (5 * n + 1) {
            print(0)
        }
        // +n*n (прием 3)
        for _ in 0 ..< (2 * n) {
            for _ in 0 ..< (n + 1) {
                print(0)
            }
        }
    }
    ```

=== "JS"

    ```javascript title=""
    function algorithm(n) {
        let a = 1;  // +0 (прием 1)
        a = a + n;  // +0 (прием 1)
        // +n (прием 2)
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n (прием 3)
        for (let i = 0; i < 2 * n; i++) {
            for (let j = 0; j < n + 1; j++) {
                console.log(0);
            }
        }
    }
    ```

=== "TS"

    ```typescript title=""
    function algorithm(n: number): void {
        let a = 1;  // +0 (прием 1)
        a = a + n;  // +0 (прием 1)
        // +n (прием 2)
        for (let i = 0; i < 5 * n + 1; i++) {
            console.log(0);
        }
        // +n*n (прием 3)
        for (let i = 0; i < 2 * n; i++) {
            for (let j = 0; j < n + 1; j++) {
                console.log(0);
            }
        }
    }
    ```

=== "Dart"

    ```dart title=""
    void algorithm(int n) {
      int a = 1; // +0 (прием 1)
      a = a + n; // +0 (прием 1)
      // +n (прием 2)
      for (int i = 0; i < 5 * n + 1; i++) {
        print(0);
      }
      // +n*n (прием 3)
      for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
          print(0);
        }
      }
    }
    ```

=== "Rust"

    ```rust title=""
    fn algorithm(n: i32) {
        let mut a = 1;     // +0 (прием 1)
        a = a + n;        // +0 (прием 1)

        // +n (прием 2)
        for i in 0..(5 * n + 1) {
            println!("{}", 0);
        }

        // +n*n (прием 3)
        for i in 0..(2 * n) {
            for j in 0..(n + 1) {
                println!("{}", 0);
            }
        }
    }
    ```

=== "C"

    ```c title=""
    void algorithm(int n) {
        int a = 1;  // +0 (прием 1)
        a = a + n;  // +0 (прием 1)
        // +n (прием 2)
        for (int i = 0; i < 5 * n + 1; i++) {
            printf("%d", 0);
        }
        // +n*n (прием 3)
        for (int i = 0; i < 2 * n; i++) {
            for (int j = 0; j < n + 1; j++) {
                printf("%d", 0);
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun algorithm(n: Int) {
        var a = 1   // +0 (прием 1)
        a = a + n   // +0 (прием 1)
        // +n (прием 2)
        for (i in 0..<5 * n + 1) {
            println(0)
        }
        // +n*n (прием 3)
        for (i in 0..<2 * n) {
            for (j in 0..<n + 1) {
                println(0)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    def algorithm(n)
        a = 1       # +0 (прием 1)
        a = a + n   # +0 (прием 1)
        # +n (прием 2)
        (0...(5 * n + 1)).each do { puts 0 }
        # +n*n (прием 3)
        (0...(2 * n)).each do
            (0...(n + 1)).each do { puts 0 }
        end
    end
    ```

Следующая формула показывает результаты подсчета до и после использования перечисленных выше приемов; в обоих случаях выводимая временная сложность равна $O(n^2)$ .

$$
\begin{aligned}
T(n) & = 2n(n + 1) + (5n + 1) + 2 & \text{полный подсчет (-.-|||)} \newline
& = 2n^2 + 7n + 3 \newline
T(n) & = n^2 + n & \text{ленивый подсчет (o.O)}
\end{aligned}
$$

### 2. &nbsp; Шаг 2: определение асимптотической верхней границы

**Временная сложность определяется старшим по степени членом в $T(n)$ **. Это связано с тем, что при стремлении $n$ к бесконечности именно старший член начинает доминировать, а влиянием остальных членов можно пренебречь.

В таблице 2-2 приведены несколько примеров. Некоторые значения специально сделаны преувеличенными, чтобы подчеркнуть вывод: коэффициент не способен изменить порядок. Когда $n$ стремится к бесконечности, эти константы становятся несущественными.

<p align="center"> Таблица 2-2 &nbsp; Временная сложность, соответствующая разному количеству операций </p>

<div class="center-table" markdown>

| Число операций $T(n)$ | Временная сложность $O(f(n))$ |
| ---------------------- | -------------------- |
| $100000$               | $O(1)$               |
| $3n + 2$               | $O(n)$               |
| $2n^2 + 3n + 2$        | $O(n^2)$             |
| $n^3 + 10000n^2$       | $O(n^3)$             |
| $2^n + 10000n^{10000}$ | $O(2^n)$             |

</div>

## 2.3.4 &nbsp; Распространенные типы

Пусть размер входных данных равен $n$ ; распространенные типы временной сложности показаны на рисунке 2-9 в порядке от меньшей к большей.

$$
\begin{aligned}
O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
\text{Постоянная} < \text{Логарифмическая} < \text{Линейная} < \text{Линейно-логарифмическая} < \text{Квадратичная} < \text{Экспоненциальная} < \text{Факториальная}
\end{aligned}
$$

![Распространенные типы временной сложности](time_complexity.assets/time_complexity_common_types.png){ class="animation-figure" }

<p align="center"> Рисунок 2-9 &nbsp; Распространенные типы временной сложности </p>

### 1. &nbsp; Постоянная сложность $O(1)$ {data-toc-label="1. &nbsp; Постоянная сложность"}

Число операций при постоянной сложности не зависит от размера входных данных $n$ , то есть не изменяется вместе с изменением $n$ .

В следующей функции, хотя число операций `size` может быть большим, оно не зависит от размера входных данных $n$ , поэтому временная сложность по-прежнему равна $O(1)$ :

=== "Python"

    ```python title="time_complexity.py"
    def constant(n: int) -> int:
        """Постоянная сложность"""
        count = 0
        size = 100000
        for _ in range(size):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Постоянная сложность */
    int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Постоянная сложность */
    int constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Постоянная сложность */
    int Constant(int n) {
        int count = 0;
        int size = 100000;
        for (int i = 0; i < size; i++)
            count++;
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Постоянная сложность */
    func constant(n int) int {
        count := 0
        size := 100000
        for i := 0; i < size; i++ {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Постоянная сложность */
    func constant(n: Int) -> Int {
        var count = 0
        let size = 100_000
        for _ in 0 ..< size {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Постоянная сложность */
    function constant(n) {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Постоянная сложность */
    function constant(n: number): number {
        let count = 0;
        const size = 100000;
        for (let i = 0; i < size; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Постоянная сложность */
    int constant(int n) {
      int count = 0;
      int size = 100000;
      for (var i = 0; i < size; i++) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Постоянная сложность */
    fn constant(n: i32) -> i32 {
        _ = n;
        let mut count = 0;
        let size = 100_000;
        for _ in 0..size {
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Постоянная сложность */
    int constant(int n) {
        int count = 0;
        int size = 100000;
        int i = 0;
        for (int i = 0; i < size; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Постоянная сложность */
    fun constant(n: Int): Int {
        var count = 0
        val size = 100000
        for (i in 0..<size)
            count++
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Постоянная сложность ###
    def constant(n)
      count = 0
      size = 100000

      (0...size).each { count += 1 }

      count
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20constant%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20size%20%3D%2010%0A%20%20%20%20for%20_%20in%20range%28size%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20constant%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D0%B0%D0%BD%D1%82%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20constant%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20size%20%3D%2010%0A%20%20%20%20for%20_%20in%20range%28size%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20constant%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D0%B0%D0%BD%D1%82%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 2. &nbsp; Линейная сложность $O(n)$ {data-toc-label="2. &nbsp; Линейная сложность"}

Линейная сложность характеризуется тем, что число операций растет линейно относительно размера входных данных $n$ . Линейная сложность обычно встречается в одноуровневых циклах:

=== "Python"

    ```python title="time_complexity.py"
    def linear(n: int) -> int:
        """Линейная сложность"""
        count = 0
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Линейная сложность */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Линейная сложность */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Линейная сложность */
    int Linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++)
            count++;
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Линейная сложность */
    func linear(n int) int {
        count := 0
        for i := 0; i < n; i++ {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Линейная сложность */
    func linear(n: Int) -> Int {
        var count = 0
        for _ in 0 ..< n {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Линейная сложность */
    function linear(n) {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Линейная сложность */
    function linear(n: number): number {
        let count = 0;
        for (let i = 0; i < n; i++) count++;
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Линейная сложность */
    int linear(int n) {
      int count = 0;
      for (var i = 0; i < n; i++) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Линейная сложность */
    fn linear(n: i32) -> i32 {
        let mut count = 0;
        for _ in 0..n {
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Линейная сложность */
    int linear(int n) {
        int count = 0;
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Линейная сложность */
    fun linear(n: Int): Int {
        var count = 0
        for (i in 0..<n)
            count++
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Линейная сложность ###
    def linear(n)
      count = 0
      (0...n).each { count += 1 }
      count
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20linear%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BB%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20linear%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BB%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Операции обхода массива и обхода связного списка имеют временную сложность $O(n)$ , где $n$ - длина массива или списка:

=== "Python"

    ```python title="time_complexity.py"
    def array_traversal(nums: list[int]) -> int:
        """Линейная сложность (обход массива)"""
        count = 0
        # Число итераций пропорционально длине массива
        for num in nums:
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Линейная сложность (обход массива) */
    int arrayTraversal(vector<int> &nums) {
        int count = 0;
        // Число итераций пропорционально длине массива
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Линейная сложность (обход массива) */
    int arrayTraversal(int[] nums) {
        int count = 0;
        // Число итераций пропорционально длине массива
        for (int num : nums) {
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Линейная сложность (обход массива) */
    int ArrayTraversal(int[] nums) {
        int count = 0;
        // Число итераций пропорционально длине массива
        foreach (int num in nums) {
            count++;
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Линейная сложность (обход массива) */
    func arrayTraversal(nums []int) int {
        count := 0
        // Число итераций пропорционально длине массива
        for range nums {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Линейная сложность (обход массива) */
    func arrayTraversal(nums: [Int]) -> Int {
        var count = 0
        // Число итераций пропорционально длине массива
        for _ in nums {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Линейная сложность (обход массива) */
    function arrayTraversal(nums) {
        let count = 0;
        // Число итераций пропорционально длине массива
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Линейная сложность (обход массива) */
    function arrayTraversal(nums: number[]): number {
        let count = 0;
        // Число итераций пропорционально длине массива
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Линейная сложность (обход массива) */
    int arrayTraversal(List<int> nums) {
      int count = 0;
      // Число итераций пропорционально длине массива
      for (var _num in nums) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Линейная сложность (обход массива) */
    fn array_traversal(nums: &[i32]) -> i32 {
        let mut count = 0;
        // Число итераций пропорционально длине массива
        for _ in nums {
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Линейная сложность (обход массива) */
    int arrayTraversal(int *nums, int n) {
        int count = 0;
        // Число итераций пропорционально длине массива
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Линейная сложность (обход массива) */
    fun arrayTraversal(nums: IntArray): Int {
        var count = 0
        // Число итераций пропорционально длине массива
        for (num in nums) {
            count++
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Линейная сложность ###
    def linear(n)
      count = 0
      (0...n).each { count += 1 }
      count
    end

    # ## Линейная сложность (обход массива) ###
    def array_traversal(nums)
      count = 0

      # Число итераций пропорционально длине массива
      for num in nums
        count += 1
      end

      count
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20array_traversal%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BF%D1%80%D0%BE%D0%BF%D0%BE%D1%80%D1%86%D0%B8%D0%BE%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B5%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20array_traversal%28%5B0%5D%20%2A%20n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BB%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%29%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20array_traversal%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BF%D1%80%D0%BE%D0%BF%D0%BE%D1%80%D1%86%D0%B8%D0%BE%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B5%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20array_traversal%28%5B0%5D%20%2A%20n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BB%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%29%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Стоит отметить, что **размер входных данных $n$ нужно определять конкретно в зависимости от типа входа**. Например, в первом примере переменная $n$ сама является размером входных данных; во втором примере размером данных служит длина массива.

### 3. &nbsp; Квадратичная сложность $O(n^2)$ {data-toc-label="3. &nbsp; Квадратичная сложность"}

Квадратичная сложность характеризуется тем, что число операций растет квадратично относительно размера входных данных $n$ . Квадратичная сложность обычно встречается во вложенных циклах: временная сложность внешнего и внутреннего циклов равна $O(n)$ , поэтому общая временная сложность составляет $O(n^2)$ :

=== "Python"

    ```python title="time_complexity.py"
    def quadratic(n: int) -> int:
        """Квадратичная сложность"""
        count = 0
        # Число итераций квадратично зависит от размера данных n
        for i in range(n):
            for j in range(n):
                count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Квадратичная сложность */
    int quadratic(int n) {
        int count = 0;
        // Число итераций квадратично зависит от размера данных n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Квадратичная сложность */
    int quadratic(int n) {
        int count = 0;
        // Число итераций квадратично зависит от размера данных n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Квадратичная сложность */
    int Quadratic(int n) {
        int count = 0;
        // Число итераций квадратично зависит от размера данных n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Квадратичная сложность */
    func quadratic(n int) int {
        count := 0
        // Число итераций квадратично зависит от размера данных n
        for i := 0; i < n; i++ {
            for j := 0; j < n; j++ {
                count++
            }
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Квадратичная сложность */
    func quadratic(n: Int) -> Int {
        var count = 0
        // Число итераций квадратично зависит от размера данных n
        for _ in 0 ..< n {
            for _ in 0 ..< n {
                count += 1
            }
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Квадратичная сложность */
    function quadratic(n) {
        let count = 0;
        // Число итераций квадратично зависит от размера данных n
        for (let i = 0; i < n; i++) {
            for (let j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Квадратичная сложность */
    function quadratic(n: number): number {
        let count = 0;
        // Число итераций квадратично зависит от размера данных n
        for (let i = 0; i < n; i++) {
            for (let j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Квадратичная сложность */
    int quadratic(int n) {
      int count = 0;
      // Число итераций квадратично зависит от размера данных n
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
          count++;
        }
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Квадратичная сложность */
    fn quadratic(n: i32) -> i32 {
        let mut count = 0;
        // Число итераций квадратично зависит от размера данных n
        for _ in 0..n {
            for _ in 0..n {
                count += 1;
            }
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Квадратичная сложность */
    int quadratic(int n) {
        int count = 0;
        // Число итераций квадратично зависит от размера данных n
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                count++;
            }
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Квадратичная сложность */
    fun quadratic(n: Int): Int {
        var count = 0
        // Число итераций квадратично зависит от размера данных n
        for (i in 0..<n) {
            for (j in 0..<n) {
                count++
            }
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Квадратичная сложность ###
    def quadratic(n)
      count = 0

      # Число итераций квадратично зависит от размера данных n
      for i in 0...n
        for j in 0...n
          count += 1
        end
      end

      count
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BA%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%BE%20%D0%B7%D0%B0%D0%B2%D0%B8%D1%81%D0%B8%D1%82%20%D0%BE%D1%82%20%D1%80%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%D0%B0%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20quadratic%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BA%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BA%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%BE%20%D0%B7%D0%B0%D0%B2%D0%B8%D1%81%D0%B8%D1%82%20%D0%BE%D1%82%20%D1%80%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%D0%B0%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20quadratic%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BA%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

На рисунке 2-10 сравниваются три временные сложности: постоянная, линейная и квадратичная.

![Постоянная, линейная и квадратичная временная сложность](time_complexity.assets/time_complexity_constant_linear_quadratic.png){ class="animation-figure" }

<p align="center"> Рисунок 2-10 &nbsp; Постоянная, линейная и квадратичная временная сложность </p>

Возьмем в качестве примера пузырьковую сортировку: внешний цикл выполняется $n - 1$ раз, внутренний цикл выполняется $n-1$ , $n-2$ , $\dots$ , $2$ , $1$ раз, в среднем это $n / 2$ раз, поэтому временная сложность равна $O((n - 1)n / 2) = O(n^2)$ :

=== "Python"

    ```python title="time_complexity.py"
    def bubble_sort(nums: list[int]) -> int:
        """Квадратичная сложность (пузырьковая сортировка)"""
        count = 0  # Счетчик
        # Внешний цикл: неотсортированный диапазон [0, i]
        for i in range(len(nums) - 1, 0, -1):
            # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Поменять местами nums[j] и nums[j + 1]
                    tmp: int = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3  # Обмен элементов включает 3 элементарные операции
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Квадратичная сложность (пузырьковая сортировка) */
    int bubbleSort(vector<int> &nums) {
        int count = 0; // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Квадратичная сложность (пузырьковая сортировка) */
    int bubbleSort(int[] nums) {
        int count = 0; // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Квадратичная сложность (пузырьковая сортировка) */
    int BubbleSort(int[] nums) {
        int count = 0;  // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    count += 3;  // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Квадратичная сложность (пузырьковая сортировка) */
    func bubbleSort(nums []int) int {
        count := 0 // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // Поменять местами nums[j] и nums[j + 1]
                    tmp := nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = tmp
                    count += 3 // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Квадратичная сложность (пузырьковая сортировка) */
    func bubbleSort(nums: inout [Int]) -> Int {
        var count = 0 // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // Поменять местами nums[j] и nums[j + 1]
                    let tmp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = tmp
                    count += 3 // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Квадратичная сложность (пузырьковая сортировка) */
    function bubbleSort(nums) {
        let count = 0; // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Квадратичная сложность (пузырьковая сортировка) */
    function bubbleSort(nums: number[]): number {
        let count = 0; // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Квадратичная сложность (пузырьковая сортировка) */
    int bubbleSort(List<int> nums) {
      int count = 0; // Счетчик
      // Внешний цикл: неотсортированный диапазон [0, i]
      for (var i = nums.length - 1; i > 0; i--) {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for (var j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // Поменять местами nums[j] и nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            count += 3; // Обмен элементов включает 3 элементарные операции
          }
        }
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Квадратичная сложность (пузырьковая сортировка) */
    fn bubble_sort(nums: &mut [i32]) -> i32 {
        let mut count = 0; // Счетчик

        // Внешний цикл: неотсортированный диапазон [0, i]
        for i in (1..nums.len()).rev() {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // Поменять местами nums[j] и nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Квадратичная сложность (пузырьковая сортировка) */
    int bubbleSort(int *nums, int n) {
        int count = 0; // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = n - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Квадратичная сложность (пузырьковая сортировка) */
    fun bubbleSort(nums: IntArray): Int {
        var count = 0 // Счетчик
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (i in nums.size - 1 downTo 1) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    count += 3 // Обмен элементов включает 3 элементарные операции
                }
            }
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Квадратичная сложность ###
    def quadratic(n)
      count = 0

      # Число итераций квадратично зависит от размера данных n
      for i in 0...n
        for j in 0...n
          count += 1
        end
      end

      count
    end

    # ## Квадратичная сложность (пузырьковая сортировка) ###
    def bubble_sort(nums)
      count = 0  # Счетчик

      # Внешний цикл: неотсортированный диапазон [0, i]
      for i in (nums.length - 1).downto(0)
        # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Поменять местами nums[j] и nums[j + 1]
            tmp = nums[j]
            nums[j] = nums[j + 1]
            nums[j + 1] = tmp
            count += 3 # Обмен элементов включает 3 элементарные операции
          end
        end
      end

      count
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D0%BF%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%29%22%22%22%0A%20%20%20%20count%20%3D%200%20%20%23%20%D0%A1%D1%87%D0%B5%D1%82%D1%87%D0%B8%D0%BA%0A%20%20%20%20%23%20%D0%92%D0%BD%D0%B5%D1%88%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%92%D0%BD%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%D0%B0%20%5B0%2C%20i%5D%20%D0%B2%20%D0%B5%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D0%BD%D1%8F%D1%82%D1%8C%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%D0%BC%D0%B8%20nums%5Bj%5D%20%D0%B8%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%20%3D%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%203%20%20%23%20%D0%9E%D0%B1%D0%BC%D0%B5%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B0%D0%B5%D1%82%203%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D1%80%D0%BD%D1%8B%D0%B5%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%28n%2C%200%2C%20-1%29%5D%20%20%23%20%5Bn%2C%20n-1%2C%20...%2C%202%2C%201%5D%0A%20%20%20%20count%20%3D%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BA%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D0%BF%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%29%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D0%BF%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%29%22%22%22%0A%20%20%20%20count%20%3D%200%20%20%23%20%D0%A1%D1%87%D0%B5%D1%82%D1%87%D0%B8%D0%BA%0A%20%20%20%20%23%20%D0%92%D0%BD%D0%B5%D1%88%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%92%D0%BD%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%D0%B0%20%5B0%2C%20i%5D%20%D0%B2%20%D0%B5%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D0%BD%D1%8F%D1%82%D1%8C%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%D0%BC%D0%B8%20nums%5Bj%5D%20%D0%B8%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%20%3D%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%203%20%20%23%20%D0%9E%D0%B1%D0%BC%D0%B5%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B0%D0%B5%D1%82%203%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D1%80%D0%BD%D1%8B%D0%B5%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%28n%2C%200%2C%20-1%29%5D%20%20%23%20%5Bn%2C%20n-1%2C%20...%2C%202%2C%201%5D%0A%20%20%20%20count%20%3D%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BA%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D0%BF%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%29%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 4. &nbsp; Экспоненциальная сложность $O(2^n)$ {data-toc-label="4. &nbsp; Экспоненциальная сложность"}

Типичный пример экспоненциального роста в биологии - деление клеток: в начальном состоянии есть одна клетка, после одного деления их становится 2, после двух делений - 4 и так далее; после $n$ раундов деления клеток становится $2^n$ .

На рисунке 2-11 и в следующем коде моделируется процесс деления клеток; временная сложность равна $O(2^n)$ . Здесь входное значение $n$ обозначает число раундов деления, а возвращаемое значение `count` обозначает общее число делений.

=== "Python"

    ```python title="time_complexity.py"
    def exponential(n: int) -> int:
        """Экспоненциальная сложность (итеративная реализация)"""
        count = 0
        base = 1
        # На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for _ in range(n):
            for _ in range(base):
                count += 1
            base *= 2
        # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Экспоненциальная сложность (итеративная реализация) */
    int exponential(int n) {
        int count = 0, base = 1;
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Экспоненциальная сложность (итеративная реализация) */
    int exponential(int n) {
        int count = 0, base = 1;
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Экспоненциальная сложность (итеративная реализация) */
    int Exponential(int n) {
        int count = 0, bas = 1;
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Экспоненциальная сложность (итеративная реализация) */
    func exponential(n int) int {
        count, base := 0, 1
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for i := 0; i < n; i++ {
            for j := 0; j < base; j++ {
                count++
            }
            base *= 2
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Экспоненциальная сложность (итеративная реализация) */
    func exponential(n: Int) -> Int {
        var count = 0
        var base = 1
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for _ in 0 ..< n {
            for _ in 0 ..< base {
                count += 1
            }
            base *= 2
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Экспоненциальная сложность (итеративная реализация) */
    function exponential(n) {
        let count = 0,
            base = 1;
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for (let i = 0; i < n; i++) {
            for (let j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Экспоненциальная сложность (итеративная реализация) */
    function exponential(n: number): number {
        let count = 0,
            base = 1;
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for (let i = 0; i < n; i++) {
            for (let j = 0; j < base; j++) {
                count++;
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Экспоненциальная сложность (итеративная реализация) */
    int exponential(int n) {
      int count = 0, base = 1;
      // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
      for (var i = 0; i < n; i++) {
        for (var j = 0; j < base; j++) {
          count++;
        }
        base *= 2;
      }
      // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Экспоненциальная сложность (итеративная реализация) */
    fn exponential(n: i32) -> i32 {
        let mut count = 0;
        let mut base = 1;
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for _ in 0..n {
            for _ in 0..base {
                count += 1
            }
            base *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Экспоненциальная сложность (итеративная реализация) */
    int exponential(int n) {
        int count = 0;
        int bas = 1;
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < bas; j++) {
                count++;
            }
            bas *= 2;
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Экспоненциальная сложность (итеративная реализация) */
    fun exponential(n: Int): Int {
        var count = 0
        var base = 1
        // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
        for (i in 0..<n) {
            for (j in 0..<base) {
                count++
            }
            base *= 2
        }
        // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Квадратичная сложность ###
    def quadratic(n)
      count = 0

      # Число итераций квадратично зависит от размера данных n
      for i in 0...n
        for j in 0...n
          count += 1
        end
      end

      count
    end

    # ## Квадратичная сложность (пузырьковая сортировка) ###
    def bubble_sort(nums)
      count = 0  # Счетчик

      # Внешний цикл: неотсортированный диапазон [0, i]
      for i in (nums.length - 1).downto(0)
        # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Поменять местами nums[j] и nums[j + 1]
            tmp = nums[j]
            nums[j] = nums[j + 1]
            nums[j + 1] = tmp
            count += 3 # Обмен элементов включает 3 элементарные операции
          end
        end
      end

      count
    end

    # ## Экспоненциальная сложность (итеративная реализация) ###
    def exponential(n)
      count, base = 0, 1

      # На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
      (0...n).each do
        (0...base).each { count += 1 }
        base *= 2
      end

      # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
      count
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20exponential%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%AD%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20base%20%3D%201%0A%20%20%20%20%23%20%D0%9D%D0%B0%20%D0%BA%D0%B0%D0%B6%D0%B4%D0%BE%D0%BC%20%D1%88%D0%B0%D0%B3%D0%B5%20%D0%BA%D0%BB%D0%B5%D1%82%D0%BA%D0%B0%20%D0%B4%D0%B5%D0%BB%D0%B8%D1%82%D1%81%D1%8F%20%D0%BD%D0%B0%D0%B4%D0%B2%D0%BE%D0%B5%2C%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D1%83%D1%8F%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D1%8C%201%2C%202%2C%204%2C%208%2C%20...%2C%202%5E%28n-1%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28base%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%20%20%20%20base%20%2A%3D%202%0A%20%20%20%20%23%20count%20%3D%201%20%2B%202%20%2B%204%20%2B%208%20%2B%20..%20%2B%202%5E%28n-1%29%20%3D%202%5En%20-%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20exponential%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D1%8D%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20exponential%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%AD%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20base%20%3D%201%0A%20%20%20%20%23%20%D0%9D%D0%B0%20%D0%BA%D0%B0%D0%B6%D0%B4%D0%BE%D0%BC%20%D1%88%D0%B0%D0%B3%D0%B5%20%D0%BA%D0%BB%D0%B5%D1%82%D0%BA%D0%B0%20%D0%B4%D0%B5%D0%BB%D0%B8%D1%82%D1%81%D1%8F%20%D0%BD%D0%B0%D0%B4%D0%B2%D0%BE%D0%B5%2C%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D1%83%D1%8F%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D1%8C%201%2C%202%2C%204%2C%208%2C%20...%2C%202%5E%28n-1%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28base%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%20%20%20%20base%20%2A%3D%202%0A%20%20%20%20%23%20count%20%3D%201%20%2B%202%20%2B%204%20%2B%208%20%2B%20..%20%2B%202%5E%28n-1%29%20%3D%202%5En%20-%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20exponential%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D1%8D%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

![Экспоненциальная временная сложность](time_complexity.assets/time_complexity_exponential.png){ class="animation-figure" }

<p align="center"> Рисунок 2-11 &nbsp; Экспоненциальная временная сложность </p>

В реальных алгоритмах экспоненциальная сложность также часто встречается в рекурсивных функциях. Например, в следующем коде процесс рекурсивно делится надвое и останавливается после $n$ разбиений:

=== "Python"

    ```python title="time_complexity.py"
    def exp_recur(n: int) -> int:
        """Экспоненциальная сложность (рекурсивная реализация)"""
        if n == 1:
            return 1
        return exp_recur(n - 1) + exp_recur(n - 1) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    int ExpRecur(int n) {
        if (n == 1) return 1;
        return ExpRecur(n - 1) + ExpRecur(n - 1) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    func expRecur(n int) int {
        if n == 1 {
            return 1
        }
        return expRecur(n-1) + expRecur(n-1) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    func expRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    function expRecur(n) {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    function expRecur(n: number): number {
        if (n === 1) return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    int expRecur(int n) {
      if (n == 1) return 1;
      return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    fn exp_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        exp_recur(n - 1) + exp_recur(n - 1) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    int expRecur(int n) {
        if (n == 1)
            return 1;
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Экспоненциальная сложность (рекурсивная реализация) */
    fun expRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return expRecur(n - 1) + expRecur(n - 1) + 1
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Квадратичная сложность ###
    def quadratic(n)
      count = 0

      # Число итераций квадратично зависит от размера данных n
      for i in 0...n
        for j in 0...n
          count += 1
        end
      end

      count
    end

    # ## Квадратичная сложность (пузырьковая сортировка) ###
    def bubble_sort(nums)
      count = 0  # Счетчик

      # Внешний цикл: неотсортированный диапазон [0, i]
      for i in (nums.length - 1).downto(0)
        # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Поменять местами nums[j] и nums[j + 1]
            tmp = nums[j]
            nums[j] = nums[j + 1]
            nums[j + 1] = tmp
            count += 3 # Обмен элементов включает 3 элементарные операции
          end
        end
      end

      count
    end

    # ## Экспоненциальная сложность (итеративная реализация) ###
    def exponential(n)
      count, base = 0, 1

      # На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
      (0...n).each do
        (0...base).each { count += 1 }
        base *= 2
      end

      # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
      count
    end

    # ## Экспоненциальная сложность (рекурсивная реализация) ###
    def exp_recur(n)
      return 1 if n == 1
      exp_recur(n - 1) + exp_recur(n - 1) + 1
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20exp_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%AD%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20return%20exp_recur%28n%20-%201%29%20%2B%20exp_recur%28n%20-%201%29%20%2B%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%207%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20exp_recur%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D1%8D%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20exp_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%AD%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20return%20exp_recur%28n%20-%201%29%20%2B%20exp_recur%28n%20-%201%29%20%2B%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%207%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20exp_recur%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D1%8D%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Экспоненциальный рост происходит очень быстро и часто встречается в переборных методах, грубой силе, поиске с возвратом и тому подобных подходах. Для задач большого масштаба экспоненциальная сложность неприемлема, и обычно приходится применять динамическое программирование, жадные алгоритмы и другие стратегии.

### 5. &nbsp; Логарифмическая сложность $O(\log n)$ {data-toc-label="5. &nbsp; Логарифмическая сложность"}

В противоположность экспоненциальной, логарифмическая сложность описывает ситуацию, когда **в каждом раунде размер задачи уменьшается вдвое**. Пусть размер входных данных равен $n$ ; так как на каждом шаге размер уменьшается вдвое, число итераций равно $\log_2 n$ , то есть является обратной функцией к $2^n$ .

На рисунке 2-12 и в следующем коде моделируется процесс, в котором **в каждом раунде размер задачи уменьшается вдвое**; временная сложность равна $O(\log_2 n)$ и кратко записывается как $O(\log n)$ :

=== "Python"

    ```python title="time_complexity.py"
    def logarithmic(n: int) -> int:
        """Логарифмическая сложность (итеративная реализация)"""
        count = 0
        while n > 1:
            n = n / 2
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Логарифмическая сложность (итеративная реализация) */
    int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Логарифмическая сложность (итеративная реализация) */
    int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Логарифмическая сложность (итеративная реализация) */
    int Logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n /= 2;
            count++;
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Логарифмическая сложность (итеративная реализация) */
    func logarithmic(n int) int {
        count := 0
        for n > 1 {
            n = n / 2
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Логарифмическая сложность (итеративная реализация) */
    func logarithmic(n: Int) -> Int {
        var count = 0
        var n = n
        while n > 1 {
            n = n / 2
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Логарифмическая сложность (итеративная реализация) */
    function logarithmic(n) {
        let count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Логарифмическая сложность (итеративная реализация) */
    function logarithmic(n: number): number {
        let count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Логарифмическая сложность (итеративная реализация) */
    int logarithmic(int n) {
      int count = 0;
      while (n > 1) {
        n = n ~/ 2;
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Логарифмическая сложность (итеративная реализация) */
    fn logarithmic(mut n: i32) -> i32 {
        let mut count = 0;
        while n > 1 {
            n = n / 2;
            count += 1;
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Логарифмическая сложность (итеративная реализация) */
    int logarithmic(int n) {
        int count = 0;
        while (n > 1) {
            n = n / 2;
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Логарифмическая сложность (итеративная реализация) */
    fun logarithmic(n: Int): Int {
        var n1 = n
        var count = 0
        while (n1 > 1) {
            n1 /= 2
            count++
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Квадратичная сложность ###
    def quadratic(n)
      count = 0

      # Число итераций квадратично зависит от размера данных n
      for i in 0...n
        for j in 0...n
          count += 1
        end
      end

      count
    end

    # ## Квадратичная сложность (пузырьковая сортировка) ###
    def bubble_sort(nums)
      count = 0  # Счетчик

      # Внешний цикл: неотсортированный диапазон [0, i]
      for i in (nums.length - 1).downto(0)
        # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Поменять местами nums[j] и nums[j + 1]
            tmp = nums[j]
            nums[j] = nums[j + 1]
            nums[j + 1] = tmp
            count += 3 # Обмен элементов включает 3 элементарные операции
          end
        end
      end

      count
    end

    # ## Экспоненциальная сложность (итеративная реализация) ###
    def exponential(n)
      count, base = 0, 1

      # На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
      (0...n).each do
        (0...base).each { count += 1 }
        base *= 2
      end

      # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
      count
    end

    # ## Экспоненциальная сложность (рекурсивная реализация) ###
    def exp_recur(n)
      return 1 if n == 1
      exp_recur(n - 1) + exp_recur(n - 1) + 1
    end

    # ## Логарифмическая сложность (итеративная реализация) ###
    def logarithmic(n)
      count = 0

      while n > 1
        n /= 2
        count += 1
      end

      count
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20logarithmic%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20while%20n%20%3E%201%3A%0A%20%20%20%20%20%20%20%20n%20%3D%20n%20%2F%202%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20logarithmic%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BB%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20logarithmic%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20while%20n%20%3E%201%3A%0A%20%20%20%20%20%20%20%20n%20%3D%20n%20%2F%202%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20logarithmic%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BB%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%82%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

![Логарифмическая временная сложность](time_complexity.assets/time_complexity_logarithmic.png){ class="animation-figure" }

<p align="center"> Рисунок 2-12 &nbsp; Логарифмическая временная сложность </p>

Подобно экспоненциальной сложности, логарифмическая также часто встречается в рекурсивных функциях. Следующий код формирует рекурсивное дерево высотой $\log_2 n$ :

=== "Python"

    ```python title="time_complexity.py"
    def log_recur(n: int) -> int:
        """Логарифмическая сложность (рекурсивная реализация)"""
        if n <= 1:
            return 0
        return log_recur(n / 2) + 1
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Логарифмическая сложность (рекурсивная реализация) */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Логарифмическая сложность (рекурсивная реализация) */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Логарифмическая сложность (рекурсивная реализация) */
    int LogRecur(int n) {
        if (n <= 1) return 0;
        return LogRecur(n / 2) + 1;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Логарифмическая сложность (рекурсивная реализация) */
    func logRecur(n int) int {
        if n <= 1 {
            return 0
        }
        return logRecur(n/2) + 1
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Логарифмическая сложность (рекурсивная реализация) */
    func logRecur(n: Int) -> Int {
        if n <= 1 {
            return 0
        }
        return logRecur(n: n / 2) + 1
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Логарифмическая сложность (рекурсивная реализация) */
    function logRecur(n) {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Логарифмическая сложность (рекурсивная реализация) */
    function logRecur(n: number): number {
        if (n <= 1) return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Логарифмическая сложность (рекурсивная реализация) */
    int logRecur(int n) {
      if (n <= 1) return 0;
      return logRecur(n ~/ 2) + 1;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Логарифмическая сложность (рекурсивная реализация) */
    fn log_recur(n: i32) -> i32 {
        if n <= 1 {
            return 0;
        }
        log_recur(n / 2) + 1
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Логарифмическая сложность (рекурсивная реализация) */
    int logRecur(int n) {
        if (n <= 1)
            return 0;
        return logRecur(n / 2) + 1;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Логарифмическая сложность (рекурсивная реализация) */
    fun logRecur(n: Int): Int {
        if (n <= 1)
            return 0
        return logRecur(n / 2) + 1
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Квадратичная сложность ###
    def quadratic(n)
      count = 0

      # Число итераций квадратично зависит от размера данных n
      for i in 0...n
        for j in 0...n
          count += 1
        end
      end

      count
    end

    # ## Квадратичная сложность (пузырьковая сортировка) ###
    def bubble_sort(nums)
      count = 0  # Счетчик

      # Внешний цикл: неотсортированный диапазон [0, i]
      for i in (nums.length - 1).downto(0)
        # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Поменять местами nums[j] и nums[j + 1]
            tmp = nums[j]
            nums[j] = nums[j + 1]
            nums[j + 1] = tmp
            count += 3 # Обмен элементов включает 3 элементарные операции
          end
        end
      end

      count
    end

    # ## Экспоненциальная сложность (итеративная реализация) ###
    def exponential(n)
      count, base = 0, 1

      # На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
      (0...n).each do
        (0...base).each { count += 1 }
        base *= 2
      end

      # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
      count
    end

    # ## Экспоненциальная сложность (рекурсивная реализация) ###
    def exp_recur(n)
      return 1 if n == 1
      exp_recur(n - 1) + exp_recur(n - 1) + 1
    end

    # ## Логарифмическая сложность (итеративная реализация) ###
    def logarithmic(n)
      count = 0

      while n > 1
        n /= 2
        count += 1
      end

      count
    end

    # ## Логарифмическая сложность (рекурсивная реализация) ###
    def log_recur(n)
      return 0 unless n > 1
      log_recur(n / 2) + 1
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20return%20log_recur%28n%20%2F%202%29%20%2B%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20log_recur%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BB%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20return%20log_recur%28n%20%2F%202%29%20%2B%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20log_recur%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BB%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Логарифмическая сложность часто встречается в алгоритмах, основанных на стратегии "разделяй и властвуй", и отражает идеи разбиения на части и упрощения сложной задачи. Она растет медленно и считается одной из самых желательных временных сложностей после константной.

!!! tip "Каково основание у $O(\log n)$ ?"

    Точнее говоря, "разделение на $m$ частей" соответствует временной сложности $O(\log_m n)$ . А по формуле перехода к другому основанию логарифма мы получаем равные по сложности выражения с разными основаниями:

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    Иными словами, основание $m$ можно менять без влияния на сложность. Поэтому мы обычно опускаем основание $m$ и напрямую записываем логарифмическую сложность как $O(\log n)$ .

### 6. &nbsp; Линейно-логарифмическая сложность $O(n \log n)$ {data-toc-label="6. &nbsp; Линейно-логарифмическая сложность"}

Линейно-логарифмическая сложность часто встречается в рекурсивных разбиениях, где временная сложность одного измерения равна $O(\log n)$ , а другого - $O(n)$ . Соответствующий код выглядит следующим образом:

=== "Python"

    ```python title="time_complexity.py"
    def linear_log_recur(n: int) -> int:
        """Линейно-логарифмическая сложность"""
        if n <= 1:
            return 1
        # Разделение надвое: размер подзадачи уменьшается вдвое
        count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
        # Текущая подзадача содержит n операций
        for _ in range(n):
            count += 1
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Линейно-логарифмическая сложность */
    int linearLogRecur(int n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Линейно-логарифмическая сложность */
    int linearLogRecur(int n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Линейно-логарифмическая сложность */
    int LinearLogRecur(int n) {
        if (n <= 1) return 1;
        int count = LinearLogRecur(n / 2) + LinearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Линейно-логарифмическая сложность */
    func linearLogRecur(n int) int {
        if n <= 1 {
            return 1
        }
        count := linearLogRecur(n/2) + linearLogRecur(n/2)
        for i := 0; i < n; i++ {
            count++
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Линейно-логарифмическая сложность */
    func linearLogRecur(n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        var count = linearLogRecur(n: n / 2) + linearLogRecur(n: n / 2)
        for _ in stride(from: 0, to: n, by: 1) {
            count += 1
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Линейно-логарифмическая сложность */
    function linearLogRecur(n) {
        if (n <= 1) return 1;
        let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (let i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Линейно-логарифмическая сложность */
    function linearLogRecur(n: number): number {
        if (n <= 1) return 1;
        let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (let i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Линейно-логарифмическая сложность */
    int linearLogRecur(int n) {
      if (n <= 1) return 1;
      int count = linearLogRecur(n ~/ 2) + linearLogRecur(n ~/ 2);
      for (var i = 0; i < n; i++) {
        count++;
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Линейно-логарифмическая сложность */
    fn linear_log_recur(n: i32) -> i32 {
        if n <= 1 {
            return 1;
        }
        let mut count = linear_log_recur(n / 2) + linear_log_recur(n / 2);
        for _ in 0..n {
            count += 1;
        }
        return count;
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Линейно-логарифмическая сложность */
    int linearLogRecur(int n) {
        if (n <= 1)
            return 1;
        int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
        for (int i = 0; i < n; i++) {
            count++;
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Линейно-логарифмическая сложность */
    fun linearLogRecur(n: Int): Int {
        if (n <= 1)
            return 1
        var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
        for (i in 0..<n) {
            count++
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Линейно-логарифмическая сложность ###
    def linear_log_recur(n)
      return 1 unless n > 1

      count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
      (0...n).each { count += 1 }

      count
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20linear_log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%BE-%D0%BB%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%20%2F%2F%202%29%20%2B%20linear_log_recur%28n%20%2F%2F%202%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BB%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%BE-%D0%BB%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear_log_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%BE-%D0%BB%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%20%2F%2F%202%29%20%2B%20linear_log_recur%28n%20%2F%2F%202%29%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%208%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20linear_log_recur%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BB%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%BE-%D0%BB%D0%BE%D0%B3%D0%B0%D1%80%D0%B8%D1%84%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

На рисунке 2-13 показано, как возникает линейно-логарифмическая сложность. Общее число операций на каждом уровне бинарного дерева равно $n$ , а дерево имеет $\log_2 n + 1$ уровней, поэтому временная сложность равна $O(n \log n)$ .

![Линейно-логарифмическая временная сложность](time_complexity.assets/time_complexity_logarithmic_linear.png){ class="animation-figure" }

<p align="center"> Рисунок 2-13 &nbsp; Линейно-логарифмическая временная сложность </p>

Временная сложность основных алгоритмов сортировки обычно равна $O(n \log n)$ , например у быстрой сортировки, сортировки слиянием, пирамидальной сортировки и т.д.

### 7. &nbsp; Факториальная сложность $O(n!)$ {data-toc-label="7. &nbsp; Факториальная сложность"}

Факториальная сложность соответствует математической задаче полной перестановки. Если даны $n$ попарно различных элементов, то число всех возможных перестановок равно:

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

Факториал обычно реализуют через рекурсию. Как показано на рисунке 2-14 и в следующем коде, на первом уровне происходит ветвление на $n$ подзадач, на втором - на $n - 1$ и так далее, пока на $n$-м уровне ветвление не прекращается:

=== "Python"

    ```python title="time_complexity.py"
    def factorial_recur(n: int) -> int:
        """Факториальная сложность (рекурсивная реализация)"""
        if n == 0:
            return 1
        count = 0
        # Из одного получается n
        for _ in range(n):
            count += factorial_recur(n - 1)
        return count
    ```

=== "C++"

    ```cpp title="time_complexity.cpp"
    /* Факториальная сложность (рекурсивная реализация) */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // Из одного получается n
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Java"

    ```java title="time_complexity.java"
    /* Факториальная сложность (рекурсивная реализация) */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        // Из одного получается n
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "C#"

    ```csharp title="time_complexity.cs"
    /* Факториальная сложность (рекурсивная реализация) */
    int FactorialRecur(int n) {
        if (n == 0) return 1;
        int count = 0;
        // Из одного получается n
        for (int i = 0; i < n; i++) {
            count += FactorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Go"

    ```go title="time_complexity.go"
    /* Факториальная сложность (рекурсивная реализация) */
    func factorialRecur(n int) int {
        if n == 0 {
            return 1
        }
        count := 0
        // Из одного получается n
        for i := 0; i < n; i++ {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="time_complexity.swift"
    /* Факториальная сложность (рекурсивная реализация) */
    func factorialRecur(n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var count = 0
        // Из одного получается n
        for _ in 0 ..< n {
            count += factorialRecur(n: n - 1)
        }
        return count
    }
    ```

=== "JS"

    ```javascript title="time_complexity.js"
    /* Факториальная сложность (рекурсивная реализация) */
    function factorialRecur(n) {
        if (n === 0) return 1;
        let count = 0;
        // Из одного получается n
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "TS"

    ```typescript title="time_complexity.ts"
    /* Факториальная сложность (рекурсивная реализация) */
    function factorialRecur(n: number): number {
        if (n === 0) return 1;
        let count = 0;
        // Из одного получается n
        for (let i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Dart"

    ```dart title="time_complexity.dart"
    /* Факториальная сложность (рекурсивная реализация) */
    int factorialRecur(int n) {
      if (n == 0) return 1;
      int count = 0;
      // Из одного получается n
      for (var i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
      }
      return count;
    }
    ```

=== "Rust"

    ```rust title="time_complexity.rs"
    /* Факториальная сложность (рекурсивная реализация) */
    fn factorial_recur(n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        let mut count = 0;
        // Из одного получается n
        for _ in 0..n {
            count += factorial_recur(n - 1);
        }
        count
    }
    ```

=== "C"

    ```c title="time_complexity.c"
    /* Факториальная сложность (рекурсивная реализация) */
    int factorialRecur(int n) {
        if (n == 0)
            return 1;
        int count = 0;
        for (int i = 0; i < n; i++) {
            count += factorialRecur(n - 1);
        }
        return count;
    }
    ```

=== "Kotlin"

    ```kotlin title="time_complexity.kt"
    /* Факториальная сложность (рекурсивная реализация) */
    fun factorialRecur(n: Int): Int {
        if (n == 0)
            return 1
        var count = 0
        // Из одного получается n
        for (i in 0..<n) {
            count += factorialRecur(n - 1)
        }
        return count
    }
    ```

=== "Ruby"

    ```ruby title="time_complexity.rb"
    ### Линейно-логарифмическая сложность ###
    def linear_log_recur(n)
      return 1 unless n > 1

      count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
      (0...n).each { count += 1 }

      count
    end

    # ## Факториальная сложность (рекурсивная реализация) ###
    def factorial_recur(n)
      return 1 if n == 0

      count = 0
      # Из одного получается n
      (0...n).each { count += factorial_recur(n - 1) }

      count
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20factorial_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A4%D0%B0%D0%BA%D1%82%D0%BE%D1%80%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%D0%98%D0%B7%20%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20n%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20factorial_recur%28n%20-%201%29%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20factorial_recur%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D1%84%D0%B0%D0%BA%D1%82%D0%BE%D1%80%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20factorial_recur%28n%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A4%D0%B0%D0%BA%D1%82%D0%BE%D1%80%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%D0%98%D0%B7%20%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20n%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20factorial_recur%28n%20-%201%29%0A%20%20%20%20return%20count%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20count%20%3D%20factorial_recur%28n%29%0A%20%20%20%20print%28%22%D0%A7%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B9%20%D1%84%D0%B0%D0%BA%D1%82%D0%BE%D1%80%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20%3D%22%2C%20count%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

![Факториальная временная сложность](time_complexity.assets/time_complexity_factorial.png){ class="animation-figure" }

<p align="center"> Рисунок 2-14 &nbsp; Факториальная временная сложность </p>

Следует отметить, что поскольку при $n \geq 4$ всегда выполняется $n! > 2^n$ , факториальная сложность растет еще быстрее, чем экспоненциальная, и при больших $n$ становится неприемлемой.

## 2.3.5 &nbsp; Худшая, лучшая и средняя временная сложность

**Временная эффективность алгоритма часто не фиксирована, а зависит от распределения входных данных**. Предположим, на вход подается массив `nums` длины $n$ , состоящий из чисел от $1$ до $n$ , каждое из которых встречается ровно один раз; при этом порядок элементов случайно перемешан. Задача состоит в том, чтобы вернуть индекс элемента $1$ . Тогда можно сделать следующие выводы.

- Когда `nums = [?, ?, ..., 1]` , то есть когда последний элемент равен $1$ , нужно полностью пройти по массиву, **что дает худшую временную сложность $O(n)$** .
- Когда `nums = [1, ?, ?, ...]` , то есть когда первый элемент равен $1$ , независимо от длины массива продолжать обход не нужно, **что дает лучшую временную сложность $\Omega(1)$** .

Худшая временная сложность соответствует асимптотической верхней границе функции и обозначается нотацией Big $O$ . Соответственно, лучшая временная сложность соответствует асимптотической нижней границе функции и обозначается символом $\Omega$ :

=== "Python"

    ```python title="worst_best_time_complexity.py"
    def random_numbers(n: int) -> list[int]:
        """Сгенерировать массив с элементами 1, 2, ..., n в случайном порядке"""
        # Создать массив nums =: 1, 2, 3, ..., n
        nums = [i for i in range(1, n + 1)]
        # Случайно перемешать элементы массива
        random.shuffle(nums)
        return nums

    def find_one(nums: list[int]) -> int:
        """Найти индекс числа 1 в массиве nums"""
        for i in range(len(nums)):
            # Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            # Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if nums[i] == 1:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="worst_best_time_complexity.cpp"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    vector<int> randomNumbers(int n) {
        vector<int> nums(n);
        // Создать массив nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Использовать системное время для генерации случайного seed
        unsigned seed = chrono::system_clock::now().time_since_epoch().count();
        // Случайно перемешать элементы массива
        shuffle(nums.begin(), nums.end(), default_random_engine(seed));
        return nums;
    }

    /* Найти индекс числа 1 в массиве nums */
    int findOne(vector<int> &nums) {
        for (int i = 0; i < nums.size(); i++) {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Java"

    ```java title="worst_best_time_complexity.java"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // Создать массив nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Случайно перемешать элементы массива
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* Найти индекс числа 1 в массиве nums */
    int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "C#"

    ```csharp title="worst_best_time_complexity.cs"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // Создать массив nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // Случайно перемешать элементы массива
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* Найти индекс числа 1 в массиве nums */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Go"

    ```go title="worst_best_time_complexity.go"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    func randomNumbers(n int) []int {
        nums := make([]int, n)
        // Создать массив nums = { 1, 2, 3, ..., n }
        for i := 0; i < n; i++ {
            nums[i] = i + 1
        }
        // Случайно перемешать элементы массива
        rand.Shuffle(len(nums), func(i, j int) {
            nums[i], nums[j] = nums[j], nums[i]
        })
        return nums
    }

    /* Найти индекс числа 1 в массиве nums */
    func findOne(nums []int) int {
        for i := 0; i < len(nums); i++ {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="worst_best_time_complexity.swift"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    func randomNumbers(n: Int) -> [Int] {
        // Создать массив nums = { 1, 2, 3, ..., n }
        var nums = Array(1 ... n)
        // Случайно перемешать элементы массива
        nums.shuffle()
        return nums
    }

    /* Найти индекс числа 1 в массиве nums */
    func findOne(nums: [Int]) -> Int {
        for i in nums.indices {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if nums[i] == 1 {
                return i
            }
        }
        return -1
    }
    ```

=== "JS"

    ```javascript title="worst_best_time_complexity.js"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    function randomNumbers(n) {
        const nums = Array(n);
        // Создать массив nums = { 1, 2, 3, ..., n }
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Случайно перемешать элементы массива
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* Найти индекс числа 1 в массиве nums */
    function findOne(nums) {
        for (let i = 0; i < nums.length; i++) {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="worst_best_time_complexity.ts"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    function randomNumbers(n: number): number[] {
        const nums = Array(n);
        // Создать массив nums = { 1, 2, 3, ..., n }
        for (let i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Случайно перемешать элементы массива
        for (let i = 0; i < n; i++) {
            const r = Math.floor(Math.random() * (i + 1));
            const temp = nums[i];
            nums[i] = nums[r];
            nums[r] = temp;
        }
        return nums;
    }

    /* Найти индекс числа 1 в массиве nums */
    function findOne(nums: number[]): number {
        for (let i = 0; i < nums.length; i++) {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if (nums[i] === 1) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "Dart"

    ```dart title="worst_best_time_complexity.dart"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    List<int> randomNumbers(int n) {
      final nums = List.filled(n, 0);
      // Создать массив nums = { 1, 2, 3, ..., n }
      for (var i = 0; i < n; i++) {
        nums[i] = i + 1;
      }
      // Случайно перемешать элементы массива
      nums.shuffle();

      return nums;
    }

    /* Найти индекс числа 1 в массиве nums */
    int findOne(List<int> nums) {
      for (var i = 0; i < nums.length; i++) {
        // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
        // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
        if (nums[i] == 1) return i;
      }

      return -1;
    }
    ```

=== "Rust"

    ```rust title="worst_best_time_complexity.rs"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    fn random_numbers(n: i32) -> Vec<i32> {
        // Создать массив nums = { 1, 2, 3, ..., n }
        let mut nums = (1..=n).collect::<Vec<i32>>();
        // Случайно перемешать элементы массива
        nums.shuffle(&mut thread_rng());
        nums
    }

    /* Найти индекс числа 1 в массиве nums */
    fn find_one(nums: &[i32]) -> Option<usize> {
        for i in 0..nums.len() {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if nums[i] == 1 {
                return Some(i);
            }
        }
        None
    }
    ```

=== "C"

    ```c title="worst_best_time_complexity.c"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    int *randomNumbers(int n) {
        // Выделить память в куче (создать одномерный массив переменной длины: число элементов равно n, тип элементов — int)
        int *nums = (int *)malloc(n * sizeof(int));
        // Создать массив nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Случайно перемешать элементы массива
        for (int i = n - 1; i > 0; i--) {
            int j = rand() % (i + 1);
            int temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
        }
        return nums;
    }

    /* Найти индекс числа 1 в массиве nums */
    int findOne(int *nums, int n) {
        for (int i = 0; i < n; i++) {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="worst_best_time_complexity.kt"
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    fun randomNumbers(n: Int): Array<Int?> {
        val nums = IntArray(n)
        // Создать массив nums = { 1, 2, 3, ..., n }
        for (i in 0..<n) {
            nums[i] = i + 1
        }
        // Случайно перемешать элементы массива
        nums.shuffle()
        val res = arrayOfNulls<Int>(n)
        for (i in 0..<n) {
            res[i] = nums[i]
        }
        return res
    }

    /* Найти индекс числа 1 в массиве nums */
    fun findOne(nums: Array<Int?>): Int {
        for (i in nums.indices) {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if (nums[i] == 1)
                return i
        }
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="worst_best_time_complexity.rb"
    ### Создать массив с элементами: 1, 2, ..., n в случайном порядке ###
    def random_numbers(n)
      # Создать массив nums =: 1, 2, 3, ..., n
      nums = Array.new(n) { |i| i + 1 }
      # Случайно перемешать элементы массива
      nums.shuffle!
    end

    ### Найти индекс числа 1 в массиве nums ###
    def find_one(nums)
      for i in 0...nums.length
        # Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
        # Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
        return i if nums[i] == 1
      end

      -1
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_numbers%28n%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%A1%D0%B3%D0%B5%D0%BD%D0%B5%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%81%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%201%2C%202%2C%20...%2C%20n%20%D0%B2%20%D1%81%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D0%BE%D0%BC%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B5%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%3A%201%2C%202%2C%203%2C%20...%2C%20n%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D0%BE%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%88%D0%B0%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20random.shuffle%28nums%29%0A%20%20%20%20return%20nums%0A%0Adef%20find_one%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%201%20%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B5%20nums%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%201%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%2C%20%D0%B4%D0%BE%D1%81%D1%82%D0%B8%D0%B3%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D0%BB%D1%83%D1%87%D1%88%D0%B0%D1%8F%20%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20O%281%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%201%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D1%86%D0%B5%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%2C%20%D0%B4%D0%BE%D1%81%D1%82%D0%B8%D0%B3%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D1%85%D1%83%D0%B4%D1%88%D0%B0%D1%8F%20%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20O%28n%29%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2010%0A%20%20%20%20nums%20%3D%20random_numbers%28n%29%0A%20%20%20%20index%20%3D%20find_one%28nums%29%0A%20%20%20%20print%28%22%5Cn%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%5B1%2C%202%2C%20...%2C%20n%5D%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%88%D0%B8%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%3D%22%2C%20nums%29%0A%20%20%20%20print%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%201%20%3D%22%2C%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_numbers%28n%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%A1%D0%B3%D0%B5%D0%BD%D0%B5%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%81%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%201%2C%202%2C%20...%2C%20n%20%D0%B2%20%D1%81%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D0%BE%D0%BC%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B5%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%3A%201%2C%202%2C%203%2C%20...%2C%20n%0A%20%20%20%20nums%20%3D%20%5Bi%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D0%BE%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%88%D0%B0%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20random.shuffle%28nums%29%0A%20%20%20%20return%20nums%0A%0Adef%20find_one%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%201%20%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B5%20nums%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%201%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%2C%20%D0%B4%D0%BE%D1%81%D1%82%D0%B8%D0%B3%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D0%BB%D1%83%D1%87%D1%88%D0%B0%D1%8F%20%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20O%281%29%0A%20%20%20%20%20%20%20%20%23%20%D0%9A%D0%BE%D0%B3%D0%B4%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%201%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D1%86%D0%B5%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%2C%20%D0%B4%D0%BE%D1%81%D1%82%D0%B8%D0%B3%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D1%85%D1%83%D0%B4%D1%88%D0%B0%D1%8F%20%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20O%28n%29%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2010%0A%20%20%20%20nums%20%3D%20random_numbers%28n%29%0A%20%20%20%20index%20%3D%20find_one%28nums%29%0A%20%20%20%20print%28%22%5Cn%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%5B1%2C%202%2C%20...%2C%20n%5D%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%88%D0%B8%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%20%3D%22%2C%20nums%29%0A%20%20%20%20print%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%201%20%3D%22%2C%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Стоит отметить, что на практике лучшая временная сложность используется редко, поскольку обычно она достигается лишь с очень малой вероятностью и может вводить в заблуждение. **Худшая временная сложность гораздо практичнее, потому что задает безопасную оценку эффективности** и позволяет уверенно использовать алгоритм.

Из приведенного выше примера видно, что худшая и лучшая временные сложности возникают только при особых распределениях данных; вероятность таких случаев может быть низкой, и они не всегда реально отражают эффективность алгоритма. Напротив, **средняя временная сложность способна показать эффективность алгоритма на случайных входных данных** и обозначается символом $\Theta$ .

Для некоторых алгоритмов можно относительно просто вывести средний случай при случайном распределении данных. Например, в приведенном выше примере входной массив перемешан, а вероятность появления элемента $1$ на любом индексе одинакова; следовательно, среднее число итераций алгоритма равно половине длины массива, то есть $n / 2$ , а средняя временная сложность равна $\Theta(n / 2) = \Theta(n)$ .

Однако для более сложных алгоритмов вычислить среднюю временную сложность часто непросто, потому что трудно проанализировать полное математическое ожидание на заданном распределении данных. В таких случаях обычно используют худшую временную сложность как критерий оценки эффективности алгоритма.

!!! question "Почему символ $\Theta$ встречается так редко?"

    Возможно, потому что символ $O$ звучит слишком привычно, и мы часто используем его для обозначения средней временной сложности. Но строго говоря, это некорректно. В этой книге и в других материалах, если встретится выражение вроде "средняя временная сложность $O(n)$", просто понимай его как $\Theta(n)$ .
