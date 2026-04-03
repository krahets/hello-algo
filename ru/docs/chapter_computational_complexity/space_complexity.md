---
comments: true
---

# 2.4 &nbsp; Пространственная сложность

<u>Пространственная сложность (space complexity)</u> служит для оценки того, как меняется объем памяти, требуемой алгоритму, по мере роста объема данных. Это понятие очень похоже на временную сложность, только вместо времени выполнения рассматривается объем используемой памяти.

## 2.4.1 &nbsp; Пространство, связанное с алгоритмом

Память, которую использует алгоритм во время работы, в основном делится на следующие части.

- **Входное пространство**: используется для хранения входных данных алгоритма.
- **Временное пространство**: используется для хранения переменных, объектов, контекста функций и других данных, возникающих во время выполнения алгоритма.
- **Выходное пространство**: используется для хранения выходных данных алгоритма.

Как правило, при анализе пространственной сложности в расчет включают временное пространство и выходное пространство.

Временное пространство можно дополнительно разделить на три части.

- **Временные данные**: используются для хранения различных констант, переменных, объектов и т.д., возникающих во время выполнения алгоритма.
- **Пространство кадров стека**: используется для хранения контекстных данных вызываемых функций. При каждом вызове функции система создает на вершине стека новый кадр; после возврата функции пространство этого кадра освобождается.
- **Пространство инструкций**: используется для хранения скомпилированных инструкций программы и в реальном подсчете обычно не учитывается.

При анализе пространственной сложности программы **обычно учитываются временные данные, пространство стека и выходные данные**, как показано на рисунке 2-15.

![Пространство, используемое алгоритмом](space_complexity.assets/space_types.png){ class="animation-figure" }

<p align="center"> Рисунок 2-15 &nbsp; Пространство, используемое алгоритмом </p>

Ниже приведен соответствующий код:

=== "Python"

    ```python title=""
    class Node:
        """Класс"""
        def __init__(self, x: int):
            self.val: int = x              # Значение узла
            self.next: Node | None = None  # Ссылка на следующий узел

    def function() -> int:
        """Функция"""
        # Выполнить некоторые операции...
        return 0

    def algorithm(n) -> int:  # Входные данные
        A = 0                 # Временные данные (константа, обычно обозначается заглавной буквой)
        b = 0                 # Временные данные (переменная)
        node = Node(0)        # Временные данные (объект)
        c = function()        # Пространство кадра стека (вызов функции)
        return A + b + c      # Выходные данные
    ```

=== "C++"

    ```cpp title=""
    /* Структура */
    struct Node {
        int val;
        Node *next;
        Node(int x) : val(x), next(nullptr) {}
    };

    /* Функция */
    int func() {
        // Выполнить некоторые операции...
        return 0;
    }

    int algorithm(int n) {        // Входные данные
        const int a = 0;          // Временные данные (константа)
        int b = 0;                // Временные данные (переменная)
        Node* node = new Node(0); // Временные данные (объект)
        int c = func();           // Пространство кадра стека (вызов функции)
        return a + b + c;         // Выходные данные
    }
    ```

=== "Java"

    ```java title=""
    /* Класс */
    class Node {
        int val;
        Node next;
        Node(int x) { val = x; }
    }
    
    /* Функция */
    int function() {
        // Выполнить некоторые операции...
        return 0;
    }
    
    int algorithm(int n) {        // Входные данные
        final int a = 0;          // Временные данные (константа)
        int b = 0;                // Временные данные (переменная)
        Node node = new Node(0);  // Временные данные (объект)
        int c = function();       // Пространство кадра стека (вызов функции)
        return a + b + c;         // Выходные данные
    }
    ```

=== "C#"

    ```csharp title=""
    /* Класс */
    class Node(int x) {
        int val = x;
        Node next;
    }

    /* Функция */
    int Function() {
        // Выполнить некоторые операции...
        return 0;
    }

    int Algorithm(int n) {        // Входные данные
        const int a = 0;          // Временные данные (константа)
        int b = 0;                // Временные данные (переменная)
        Node node = new(0);       // Временные данные (объект)
        int c = Function();       // Пространство кадра стека (вызов функции)
        return a + b + c;         // Выходные данные
    }
    ```

=== "Go"

    ```go title=""
    /* Структура */
    type node struct {
        val  int
        next *node
    }

    /* Создать структуру node */
    func newNode(val int) *node {
        return &node{val: val}
    }
    
    /* Функция */
    func function() int {
        // Выполнить некоторые операции...
        return 0
    }

    func algorithm(n int) int { // Входные данные
        const a = 0             // Временные данные (константа)
        b := 0                  // Временные данные (переменная)
        newNode(0)              // Временные данные (объект)
        c := function()         // Пространство кадра стека (вызов функции)
        return a + b + c        // Выходные данные
    }
    ```

=== "Swift"

    ```swift title=""
    /* Класс */
    class Node {
        var val: Int
        var next: Node?

        init(x: Int) {
            val = x
        }
    }

    /* Функция */
    func function() -> Int {
        // Выполнить некоторые операции...
        return 0
    }

    func algorithm(n: Int) -> Int { // Входные данные
        let a = 0             // Временные данные (константа)
        var b = 0             // Временные данные (переменная)
        let node = Node(x: 0) // Временные данные (объект)
        let c = function()    // Пространство кадра стека (вызов функции)
        return a + b + c      // Выходные данные
    }
    ```

=== "JS"

    ```javascript title=""
    /* Класс */
    class Node {
        val;
        next;
        constructor(val) {
            this.val = val === undefined ? 0 : val; // Значение узла
            this.next = null;                       // Ссылка на следующий узел
        }
    }

    /* Функция */
    function constFunc() {
        // Выполнить некоторые операции
        return 0;
    }

    function algorithm(n) {       // Входные данные
        const a = 0;              // Временные данные (константа)
        let b = 0;                // Временные данные (переменная)
        const node = new Node(0); // Временные данные (объект)
        const c = constFunc();    // Пространство кадра стека (вызов функции)
        return a + b + c;         // Выходные данные
    }
    ```

=== "TS"

    ```typescript title=""
    /* Класс */
    class Node {
        val: number;
        next: Node | null;
        constructor(val?: number) {
            this.val = val === undefined ? 0 : val; // Значение узла
            this.next = null;                       // Ссылка на следующий узел
        }
    }

    /* Функция */
    function constFunc(): number {
        // Выполнить некоторые операции
        return 0;
    }

    function algorithm(n: number): number { // Входные данные
        const a = 0;                        // Временные данные (константа)
        let b = 0;                          // Временные данные (переменная)
        const node = new Node(0);           // Временные данные (объект)
        const c = constFunc();              // Пространство кадра стека (вызов функции)
        return a + b + c;                   // Выходные данные
    }
    ```

=== "Dart"

    ```dart title=""
    /* Класс */
    class Node {
      int val;
      Node next;
      Node(this.val, [this.next]);
    }

    /* Функция */
    int function() {
      // Выполнить некоторые операции...
      return 0;
    }

    int algorithm(int n) {  // Входные данные
      const int a = 0;      // Временные данные (константа)
      int b = 0;            // Временные данные (переменная)
      Node node = Node(0);  // Временные данные (объект)
      int c = function();   // Пространство кадра стека (вызов функции)
      return a + b + c;     // Выходные данные
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;
    
    /* Структура */
    struct Node {
        val: i32,
        next: Option<Rc<RefCell<Node>>>,
    }

    /* Создать структуру Node */
    impl Node {
        fn new(val: i32) -> Self {
            Self { val: val, next: None }
        }
    }

    /* Функция */
    fn function() -> i32 {      
        // Выполнить некоторые операции...
        return 0;
    }

    fn algorithm(n: i32) -> i32 {       // Входные данные
        const a: i32 = 0;               // Временные данные (константа)
        let mut b = 0;                  // Временные данные (переменная)
        let node = Node::new(0);        // Временные данные (объект)
        let c = function();             // Пространство кадра стека (вызов функции)
        return a + b + c;               // Выходные данные
    }
    ```

=== "C"

    ```c title=""
    /* Функция */
    int func() {
        // Выполнить некоторые операции...
        return 0;
    }

    int algorithm(int n) { // Входные данные
        const int a = 0;   // Временные данные (константа)
        int b = 0;         // Временные данные (переменная)
        int c = func();    // Пространство кадра стека (вызов функции)
        return a + b + c;  // Выходные данные
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Класс */
    class Node(var _val: Int) {
        var next: Node? = null
    }

    /* Функция */
    fun function(): Int {
        // Выполнить некоторые операции...
        return 0
    }

    fun algorithm(n: Int): Int { // Входные данные
        val a = 0                // Временные данные (константа)
        var b = 0                // Временные данные (переменная)
        val node = Node(0)       // Временные данные (объект)
        val c = function()       // Пространство кадра стека (вызов функции)
        return a + b + c         // Выходные данные
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### Класс ###
    class Node
        attr_accessor :val      # Значение узла
        attr_accessor :next     # Ссылка на следующий узел

        def initialize(x)
            @val = x
        end
    end

    ### Функция ###
    def function
        # Выполнить некоторые операции...
        0
    end

    ### Алгоритм ###
    def algorithm(n)        # Входные данные
        a = 0               # Временные данные (константа)
        b = 0               # Временные данные (переменная)
        node = Node.new(0)  # Временные данные (объект)
        c = function        # Пространство кадра стека (вызов функции)
        a + b + c           # Выходные данные
    end
    ```

## 2.4.2 &nbsp; Метод вывода

Метод вывода пространственной сложности в целом аналогичен выводу временной сложности: меняется только объект подсчета, с количества операций на размер используемого пространства.

В отличие от временной сложности, **обычно рассматривается только худшая пространственная сложность**. Это связано с тем, что память является жестким ограничением: необходимо гарантировать, что для любых входных данных у программы будет достаточно памяти.

Рассмотрим следующий код. Понятие худшей пространственной сложности здесь имеет два значения.

1. **Ориентир на худшие входные данные**: когда $n < 10$ , пространственная сложность равна $O(1)$ ; но когда $n > 10$ , инициализированный массив `nums` занимает $O(n)$ пространства, поэтому худшая пространственная сложность равна $O(n)$ .
2. **Ориентир на пиковое использование памяти во время выполнения**: например, до выполнения последней строки программа занимает $O(1)$ пространства; при инициализации массива `nums` она занимает $O(n)$ пространства, поэтому худшая пространственная сложность также равна $O(n)$ .

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 0               # O(1)
        b = [0] * 10000     # O(1)
        if n > 10:
            nums = [0] * n  # O(n)
    ```

=== "C++"

    ```cpp title=""
    void algorithm(int n) {
        int a = 0;               // O(1)
        vector<int> b(10000);    // O(1)
        if (n > 10)
            vector<int> nums(n); // O(n)
    }
    ```

=== "Java"

    ```java title=""
    void algorithm(int n) {
        int a = 0;                   // O(1)
        int[] b = new int[10000];    // O(1)
        if (n > 10)
            int[] nums = new int[n]; // O(n)
    }
    ```

=== "C#"

    ```csharp title=""
    void Algorithm(int n) {
        int a = 0;                   // O(1)
        int[] b = new int[10000];    // O(1)
        if (n > 10) {
            int[] nums = new int[n]; // O(n)
        }
    }
    ```

=== "Go"

    ```go title=""
    func algorithm(n int) {
        a := 0                      // O(1)
        b := make([]int, 10000)     // O(1)
        var nums []int
        if n > 10 {
            nums := make([]int, n)  // O(n)
        }
        fmt.Println(a, b, nums)
    }
    ```

=== "Swift"

    ```swift title=""
    func algorithm(n: Int) {
        let a = 0 // O(1)
        let b = Array(repeating: 0, count: 10000) // O(1)
        if n > 10 {
            let nums = Array(repeating: 0, count: n) // O(n)
        }
    }
    ```

=== "JS"

    ```javascript title=""
    function algorithm(n) {
        const a = 0;                   // O(1)
        const b = new Array(10000);    // O(1)
        if (n > 10) {
            const nums = new Array(n); // O(n)
        }
    }
    ```

=== "TS"

    ```typescript title=""
    function algorithm(n: number): void {
        const a = 0;                   // O(1)
        const b = new Array(10000);    // O(1)
        if (n > 10) {
            const nums = new Array(n); // O(n)
        }
    }
    ```

=== "Dart"

    ```dart title=""
    void algorithm(int n) {
      int a = 0;                            // O(1)
      List<int> b = List.filled(10000, 0);  // O(1)
      if (n > 10) {
        List<int> nums = List.filled(n, 0); // O(n)
      }
    }
    ```

=== "Rust"

    ```rust title=""
    fn algorithm(n: i32) {
        let a = 0;                              // O(1)
        let b = [0; 10000];                     // O(1)
        if n > 10 {
            let nums = vec![0; n as usize];     // O(n)
        }
    }
    ```

=== "C"

    ```c title=""
    void algorithm(int n) {
        int a = 0;               // O(1)
        int b[10000];            // O(1)
        if (n > 10)
            int nums[n] = {0};   // O(n)
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun algorithm(n: Int) {
        val a = 0                    // O(1)
        val b = IntArray(10000)      // O(1)
        if (n > 10) {
            val nums = IntArray(n)   // O(n)
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    def algorithm(n)
        a = 0                           # O(1)
        b = Array.new(10000)            # O(1)
        nums = Array.new(n) if n > 10   # O(n)
    end
    ```

**В рекурсивных функциях необходимо учитывать пространство кадров стека**. Рассмотрим следующий код:

=== "Python"

    ```python title=""
    def function() -> int:
        # Выполнить некоторые операции
        return 0

    def loop(n: int):
        """Пространственная сложность цикла равна O(1)"""
        for _ in range(n):
            function()

    def recur(n: int):
        """Пространственная сложность рекурсии равна O(n)"""
        if n == 1:
            return
        return recur(n - 1)
    ```

=== "C++"

    ```cpp title=""
    int func() {
        // Выполнить некоторые операции
        return 0;
    }
    /* Пространственная сложность цикла равна O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* Пространственная сложность рекурсии равна O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Java"

    ```java title=""
    int function() {
        // Выполнить некоторые операции
        return 0;
    }
    /* Пространственная сложность цикла равна O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    /* Пространственная сложность рекурсии равна O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "C#"

    ```csharp title=""
    int Function() {
        // Выполнить некоторые операции
        return 0;
    }
    /* Пространственная сложность цикла равна O(1) */
    void Loop(int n) {
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    /* Пространственная сложность рекурсии равна O(n) */
    int Recur(int n) {
        if (n == 1) return 1;
        return Recur(n - 1);
    }
    ```

=== "Go"

    ```go title=""
    func function() int {
        // Выполнить некоторые операции
        return 0
    }
    
    /* Пространственная сложность цикла равна O(1) */
    func loop(n int) {
        for i := 0; i < n; i++ {
            function()
        }
    }
    
    /* Пространственная сложность рекурсии равна O(n) */
    func recur(n int) {
        if n == 1 {
            return
        }
        recur(n - 1)
    }
    ```

=== "Swift"

    ```swift title=""
    @discardableResult
    func function() -> Int {
        // Выполнить некоторые операции
        return 0
    }

    /* Пространственная сложность цикла равна O(1) */
    func loop(n: Int) {
        for _ in 0 ..< n {
            function()
        }
    }

    /* Пространственная сложность рекурсии равна O(n) */
    func recur(n: Int) {
        if n == 1 {
            return
        }
        recur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title=""
    function constFunc() {
        // Выполнить некоторые операции
        return 0;
    }
    /* Пространственная сложность цикла равна O(1) */
    function loop(n) {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* Пространственная сложность рекурсии равна O(n) */
    function recur(n) {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "TS"

    ```typescript title=""
    function constFunc(): number {
        // Выполнить некоторые операции
        return 0;
    }
    /* Пространственная сложность цикла равна O(1) */
    function loop(n: number): void {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* Пространственная сложность рекурсии равна O(n) */
    function recur(n: number): void {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "Dart"

    ```dart title=""
    int function() {
      // Выполнить некоторые операции
      return 0;
    }
    /* Пространственная сложность цикла равна O(1) */
    void loop(int n) {
      for (int i = 0; i < n; i++) {
        function();
      }
    }
    /* Пространственная сложность рекурсии равна O(n) */
    void recur(int n) {
      if (n == 1) return;
      recur(n - 1);
    }
    ```

=== "Rust"

    ```rust title=""
    fn function() -> i32 {
        // Выполнить некоторые операции
        return 0;
    }
    /* Пространственная сложность цикла равна O(1) */
    fn loop(n: i32) {
        for i in 0..n {
            function();
        }
    }
    /* Пространственная сложность рекурсии равна O(n) */
    fn recur(n: i32) {
        if n == 1 {
            return;
        }
        recur(n - 1);
    }
    ```

=== "C"

    ```c title=""
    int func() {
        // Выполнить некоторые операции
        return 0;
    }
    /* Пространственная сложность цикла равна O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* Пространственная сложность рекурсии равна O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun function(): Int {
        // Выполнить некоторые операции
        return 0
    }
    /* Пространственная сложность цикла равна O(1) */
    fun loop(n: Int) {
        for (i in 0..<n) {
            function()
        }
    }
    /* Пространственная сложность рекурсии равна O(n) */
    fun recur(n: Int) {
        if (n == 1) return
        return recur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title=""
    def function
        # Выполнить некоторые операции
        0
    end

    ### Пространственная сложность цикла равна O(1) ###
    def loop(n)
        (0...n).each { function }
    end

    ### Пространственная сложность рекурсии равна O(n) ###
    def recur(n)
        return if n == 1
        recur(n - 1)
    end
    ```

Функции `loop()` и `recur()` имеют временную сложность $O(n)$ , но их пространственная сложность различается.

- Функция `loop()` вызывает `function()` в цикле $n$ раз; на каждой итерации `function()` возвращается и освобождает пространство своего кадра стека, поэтому пространственная сложность по-прежнему равна $O(1)$ .
- Рекурсивная функция `recur()` во время выполнения одновременно содержит $n$ еще не завершившихся экземпляров `recur()` , поэтому занимает $O(n)$ пространства кадров стека.

## 2.4.3 &nbsp; Распространенные типы

Пусть размер входных данных равен $n$ . На рисунке 2-16 показаны распространенные типы пространственной сложности в порядке от меньшей к большей.

$$
\begin{aligned}
O(1) < O(\log n) < O(n) < O(n^2) < O(2^n) \newline
\text{Постоянная} < \text{Логарифмическая} < \text{Линейная} < \text{Квадратичная} < \text{Экспоненциальная}
\end{aligned}
$$

![Распространенные типы пространственной сложности](space_complexity.assets/space_complexity_common_types.png){ class="animation-figure" }

<p align="center"> Рисунок 2-16 &nbsp; Распространенные типы пространственной сложности </p>

### 1. &nbsp; Постоянная сложность $O(1)$ {data-toc-label="1. &nbsp; Постоянная сложность"}

Постоянная сложность обычно встречается у констант, переменных и объектов, количество которых не зависит от размера входных данных $n$ .

Следует заметить, что память, занятая инициализацией переменных или вызовом функций внутри цикла, освобождается при переходе к следующей итерации, поэтому она не накапливается, и пространственная сложность по-прежнему остается $O(1)$ :

=== "Python"

    ```python title="space_complexity.py"
    def function() -> int:
        """Функция"""
        # Выполнить некоторые операции
        return 0

    def constant(n: int):
        """Постоянная сложность"""
        # Константы, переменные и объекты занимают O(1) памяти
        a = 0
        nums = [0] * 10000
        node = ListNode(0)
        # Переменные в цикле занимают O(1) памяти
        for _ in range(n):
            c = 0
        # Функции в цикле занимают O(1) памяти
        for _ in range(n):
            function()
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Функция */
    int func() {
        // Выполнить некоторые операции
        return 0;
    }

    /* Постоянная сложность */
    void constant(int n) {
        // Константы, переменные и объекты занимают O(1) памяти
        const int a = 0;
        int b = 0;
        vector<int> nums(10000);
        ListNode node(0);
        // Переменные в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Функции в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* Функция */
    int function() {
        // Выполнить некоторые операции
        return 0;
    }

    /* Постоянная сложность */
    void constant(int n) {
        // Константы, переменные и объекты занимают O(1) памяти
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // Переменные в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Функции в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* Функция */
    int Function() {
        // Выполнить некоторые операции
        return 0;
    }

    /* Постоянная сложность */
    void Constant(int n) {
        // Константы, переменные и объекты занимают O(1) памяти
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // Переменные в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Функции в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* Функция */
    func function() int {
        // Выполнить некоторые операции...
        return 0
    }

    /* Постоянная сложность */
    func spaceConstant(n int) {
        // Константы, переменные и объекты занимают O(1) памяти
        const a = 0
        b := 0
        nums := make([]int, 10000)
        node := newNode(0)
        // Переменные в цикле занимают O(1) памяти
        var c int
        for i := 0; i < n; i++ {
            c = 0
        }
        // Функции в цикле занимают O(1) памяти
        for i := 0; i < n; i++ {
            function()
        }
        b += 0
        c += 0
        nums[0] = 0
        node.val = 0
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* Функция */
    @discardableResult
    func function() -> Int {
        // Выполнить некоторые операции
        return 0
    }

    /* Постоянная сложность */
    func constant(n: Int) {
        // Константы, переменные и объекты занимают O(1) памяти
        let a = 0
        var b = 0
        let nums = Array(repeating: 0, count: 10000)
        let node = ListNode(x: 0)
        // Переменные в цикле занимают O(1) памяти
        for _ in 0 ..< n {
            let c = 0
        }
        // Функции в цикле занимают O(1) памяти
        for _ in 0 ..< n {
            function()
        }
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* Функция */
    function constFunc() {
        // Выполнить некоторые операции
        return 0;
    }

    /* Постоянная сложность */
    function constant(n) {
        // Константы, переменные и объекты занимают O(1) памяти
        const a = 0;
        const b = 0;
        const nums = new Array(10000);
        const node = new ListNode(0);
        // Переменные в цикле занимают O(1) памяти
        for (let i = 0; i < n; i++) {
            const c = 0;
        }
        // Функции в цикле занимают O(1) памяти
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* Функция */
    function constFunc(): number {
        // Выполнить некоторые операции
        return 0;
    }

    /* Постоянная сложность */
    function constant(n: number): void {
        // Константы, переменные и объекты занимают O(1) памяти
        const a = 0;
        const b = 0;
        const nums = new Array(10000);
        const node = new ListNode(0);
        // Переменные в цикле занимают O(1) памяти
        for (let i = 0; i < n; i++) {
            const c = 0;
        }
        // Функции в цикле занимают O(1) памяти
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* Функция */
    int function() {
      // Выполнить некоторые операции
      return 0;
    }

    /* Постоянная сложность */
    void constant(int n) {
      // Константы, переменные и объекты занимают O(1) памяти
      final int a = 0;
      int b = 0;
      List<int> nums = List.filled(10000, 0);
      ListNode node = ListNode(0);
      // Переменные в цикле занимают O(1) памяти
      for (var i = 0; i < n; i++) {
        int c = 0;
      }
      // Функции в цикле занимают O(1) памяти
      for (var i = 0; i < n; i++) {
        function();
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* Функция */
    fn function() -> i32 {
        // Выполнить некоторые операции
        return 0;
    }

    /* Постоянная сложность */
    #[allow(unused)]
    fn constant(n: i32) {
        // Константы, переменные и объекты занимают O(1) памяти
        const A: i32 = 0;
        let b = 0;
        let nums = vec![0; 10000];
        let node = ListNode::new(0);
        // Переменные в цикле занимают O(1) памяти
        for i in 0..n {
            let c = 0;
        }
        // Функции в цикле занимают O(1) памяти
        for i in 0..n {
            function();
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* Функция */
    int func() {
        // Выполнить некоторые операции
        return 0;
    }

    /* Постоянная сложность */
    void constant(int n) {
        // Константы, переменные и объекты занимают O(1) памяти
        const int a = 0;
        int b = 0;
        int nums[1000];
        ListNode *node = newListNode(0);
        free(node);
        // Переменные в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // Функции в цикле занимают O(1) памяти
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* Функция */
    fun function(): Int {
        // Выполнить некоторые операции
        return 0
    }

    /* Постоянная сложность */
    fun constant(n: Int) {
        // Константы, переменные и объекты занимают O(1) памяти
        val a = 0
        var b = 0
        val nums = Array(10000) { 0 }
        val node = ListNode(0)
        // Переменные в цикле занимают O(1) памяти
        for (i in 0..<n) {
            val c = 0
        }
        // Функции в цикле занимают O(1) памяти
        for (i in 0..<n) {
            function()
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### Функция ###
    def function
      # Выполнить некоторые операции
      0
    end

    ### Постоянная сложность ###
    def constant(n)
      # Константы, переменные и объекты занимают O(1) памяти
      a = 0
      nums = [0] * 10000
      node = ListNode.new

      # Переменные в цикле занимают O(1) памяти
      (0...n).each { c = 0 }
      # Функции в цикле занимают O(1) памяти
      (0...n).each { function }
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%83%D0%B7%D0%B5%D0%BB-%D0%BF%D1%80%D0%B5%D0%B5%D0%BC%D0%BD%D0%B8%D0%BA%0A%0Adef%20function%28%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A4%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%92%D1%8B%D0%BF%D0%BE%D0%BB%D0%BD%D0%B8%D1%82%D1%8C%20%D0%BD%D0%B5%D0%BA%D0%BE%D1%82%D0%BE%D1%80%D1%8B%D0%B5%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%0A%20%20%20%20return%200%0A%0Adef%20constant%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D0%B0%D0%BD%D1%82%D1%8B%2C%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5%20%D0%B8%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D1%8B%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D1%8E%D1%82%20O%281%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20a%20%3D%200%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20node%20%3D%20ListNode%280%29%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D1%8E%D1%82%20O%281%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20c%20%3D%200%0A%20%20%20%20%23%20%D0%A4%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D1%8E%D1%82%20O%281%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20function%28%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20constant%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%83%D0%B7%D0%B5%D0%BB-%D0%BF%D1%80%D0%B5%D0%B5%D0%BC%D0%BD%D0%B8%D0%BA%0A%0Adef%20function%28%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A4%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D1%8F%22%22%22%0A%20%20%20%20%23%20%D0%92%D1%8B%D0%BF%D0%BE%D0%BB%D0%BD%D0%B8%D1%82%D1%8C%20%D0%BD%D0%B5%D0%BA%D0%BE%D1%82%D0%BE%D1%80%D1%8B%D0%B5%20%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%0A%20%20%20%20return%200%0A%0Adef%20constant%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20%23%20%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D0%B0%D0%BD%D1%82%D1%8B%2C%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5%20%D0%B8%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D1%8B%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D1%8E%D1%82%20O%281%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20a%20%3D%200%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20node%20%3D%20ListNode%280%29%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D1%8E%D1%82%20O%281%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20c%20%3D%200%0A%20%20%20%20%23%20%D0%A4%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B5%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D1%8E%D1%82%20O%281%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20function%28%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20constant%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 2. &nbsp; Линейная сложность $O(n)$ {data-toc-label="2. &nbsp; Линейная сложность"}

Линейная сложность часто встречается у массивов, списков, стеков, очередей и других структур, число элементов в которых пропорционально $n$ :

=== "Python"

    ```python title="space_complexity.py"
    def linear(n: int):
        """Линейная сложность"""
        # Список длины n занимает O(n) памяти
        nums = [0] * n
        # Хеш-таблица длины n занимает O(n) памяти
        hmap = dict[int, str]()
        for i in range(n):
            hmap[i] = str(i)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Линейная сложность */
    void linear(int n) {
        // Массив длины n занимает O(n) памяти
        vector<int> nums(n);
        // Список длины n занимает O(n) памяти
        vector<ListNode> nodes;
        for (int i = 0; i < n; i++) {
            nodes.push_back(ListNode(i));
        }
        // Хеш-таблица длины n занимает O(n) памяти
        unordered_map<int, string> map;
        for (int i = 0; i < n; i++) {
            map[i] = to_string(i);
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* Линейная сложность */
    void linear(int n) {
        // Массив длины n занимает O(n) памяти
        int[] nums = new int[n];
        // Список длины n занимает O(n) памяти
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // Хеш-таблица длины n занимает O(n) памяти
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* Линейная сложность */
    void Linear(int n) {
        // Массив длины n занимает O(n) памяти
        int[] nums = new int[n];
        // Список длины n занимает O(n) памяти
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // Хеш-таблица длины n занимает O(n) памяти
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* Линейная сложность */
    func spaceLinear(n int) {
        // Массив длины n занимает O(n) памяти
        _ = make([]int, n)
        // Список длины n занимает O(n) памяти
        var nodes []*node
        for i := 0; i < n; i++ {
            nodes = append(nodes, newNode(i))
        }
        // Хеш-таблица длины n занимает O(n) памяти
        m := make(map[int]string, n)
        for i := 0; i < n; i++ {
            m[i] = strconv.Itoa(i)
        }
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* Линейная сложность */
    func linear(n: Int) {
        // Массив длины n занимает O(n) памяти
        let nums = Array(repeating: 0, count: n)
        // Список длины n занимает O(n) памяти
        let nodes = (0 ..< n).map { ListNode(x: $0) }
        // Хеш-таблица длины n занимает O(n) памяти
        let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* Линейная сложность */
    function linear(n) {
        // Массив длины n занимает O(n) памяти
        const nums = new Array(n);
        // Список длины n занимает O(n) памяти
        const nodes = [];
        for (let i = 0; i < n; i++) {
            nodes.push(new ListNode(i));
        }
        // Хеш-таблица длины n занимает O(n) памяти
        const map = new Map();
        for (let i = 0; i < n; i++) {
            map.set(i, i.toString());
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* Линейная сложность */
    function linear(n: number): void {
        // Массив длины n занимает O(n) памяти
        const nums = new Array(n);
        // Список длины n занимает O(n) памяти
        const nodes: ListNode[] = [];
        for (let i = 0; i < n; i++) {
            nodes.push(new ListNode(i));
        }
        // Хеш-таблица длины n занимает O(n) памяти
        const map = new Map();
        for (let i = 0; i < n; i++) {
            map.set(i, i.toString());
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* Линейная сложность */
    void linear(int n) {
      // Массив длины n занимает O(n) памяти
      List<int> nums = List.filled(n, 0);
      // Список длины n занимает O(n) памяти
      List<ListNode> nodes = [];
      for (var i = 0; i < n; i++) {
        nodes.add(ListNode(i));
      }
      // Хеш-таблица длины n занимает O(n) памяти
      Map<int, String> map = HashMap();
      for (var i = 0; i < n; i++) {
        map.putIfAbsent(i, () => i.toString());
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* Линейная сложность */
    #[allow(unused)]
    fn linear(n: i32) {
        // Массив длины n занимает O(n) памяти
        let mut nums = vec![0; n as usize];
        // Список длины n занимает O(n) памяти
        let mut nodes = Vec::new();
        for i in 0..n {
            nodes.push(ListNode::new(i))
        }
        // Хеш-таблица длины n занимает O(n) памяти
        let mut map = HashMap::new();
        for i in 0..n {
            map.insert(i, i.to_string());
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* Хеш-таблица */
    typedef struct {
        int key;
        int val;
        UT_hash_handle hh; // Реализовано на основе uthash.h
    } HashTable;

    /* Линейная сложность */
    void linear(int n) {
        // Массив длины n занимает O(n) памяти
        int *nums = malloc(sizeof(int) * n);
        free(nums);

        // Список длины n занимает O(n) памяти
        ListNode **nodes = malloc(sizeof(ListNode *) * n);
        for (int i = 0; i < n; i++) {
            nodes[i] = newListNode(i);
        }
        // Освобождение памяти
        for (int i = 0; i < n; i++) {
            free(nodes[i]);
        }
        free(nodes);

        // Хеш-таблица длины n занимает O(n) памяти
        HashTable *h = NULL;
        for (int i = 0; i < n; i++) {
            HashTable *tmp = malloc(sizeof(HashTable));
            tmp->key = i;
            tmp->val = i;
            HASH_ADD_INT(h, key, tmp);
        }

        // Освобождение памяти
        HashTable *curr, *tmp;
        HASH_ITER(hh, h, curr, tmp) {
            HASH_DEL(h, curr);
            free(curr);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* Линейная сложность */
    fun linear(n: Int) {
        // Массив длины n занимает O(n) памяти
        val nums = Array(n) { 0 }
        // Список длины n занимает O(n) памяти
        val nodes = mutableListOf<ListNode>()
        for (i in 0..<n) {
            nodes.add(ListNode(i))
        }
        // Хеш-таблица длины n занимает O(n) памяти
        val map = mutableMapOf<Int, String>()
        for (i in 0..<n) {
            map[i] = i.toString()
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### Линейная сложность ###
    def linear(n)
      # Список длины n занимает O(n) памяти
      nums = Array.new(n, 0)

      # Хеш-таблица длины n занимает O(n) памяти
      hmap = {}
      for i in 0...n
        hmap[i] = i.to_s
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20n%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D0%B5%D1%82%20O%28n%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20n%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D0%B5%D1%82%20O%28n%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20hmap%20%3D%20dict%5Bint%2C%20str%5D%28%29%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20hmap%5Bi%5D%20%3D%20str%28i%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20linear%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20n%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D0%B5%D1%82%20O%28n%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20n%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D0%B5%D1%82%20O%28n%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20hmap%20%3D%20dict%5Bint%2C%20str%5D%28%29%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20hmap%5Bi%5D%20%3D%20str%28i%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20linear%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Как показано на рисунке 2-17, глубина рекурсии этой функции равна $n$ , то есть одновременно существует $n$ еще не завершившихся функций `linear_recur()` , которые используют $O(n)$ пространства кадров стека:

=== "Python"

    ```python title="space_complexity.py"
    def linear_recur(n: int):
        """Линейная сложность (рекурсивная реализация)"""
        print("Рекурсия n =", n)
        if n == 1:
            return
        linear_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Линейная сложность (рекурсивная реализация) */
    void linearRecur(int n) {
        cout << "Рекурсия n = " << n << endl;
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* Линейная сложность (рекурсивная реализация) */
    void linearRecur(int n) {
        System.out.println("Рекурсия n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* Линейная сложность (рекурсивная реализация) */
    void LinearRecur(int n) {
        Console.WriteLine("Рекурсия n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* Линейная сложность (рекурсивная реализация) */
    func spaceLinearRecur(n int) {
        fmt.Println("Рекурсия n =", n)
        if n == 1 {
            return
        }
        spaceLinearRecur(n - 1)
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* Линейная сложность (рекурсивная реализация) */
    func linearRecur(n: Int) {
        print("Рекурсия n = \(n)")
        if n == 1 {
            return
        }
        linearRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* Линейная сложность (рекурсивная реализация) */
    function linearRecur(n) {
        console.log(`Рекурсия n = ${n}`);
        if (n === 1) return;
        linearRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* Линейная сложность (рекурсивная реализация) */
    function linearRecur(n: number): void {
        console.log(`Рекурсия n = ${n}`);
        if (n === 1) return;
        linearRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* Линейная сложность (рекурсивная реализация) */
    void linearRecur(int n) {
      print('Рекурсия n = $n');
      if (n == 1) return;
      linearRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* Линейная сложность (рекурсивная реализация) */
    fn linear_recur(n: i32) {
        println!("Рекурсия n = {}", n);
        if n == 1 {
            return;
        };
        linear_recur(n - 1);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* Линейная сложность (рекурсивная реализация) */
    void linearRecur(int n) {
        printf("Рекурсия n = %d\r\n", n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* Линейная сложность (рекурсивная реализация) */
    fun linearRecur(n: Int) {
        println("Рекурсия n = $n")
        if (n == 1)
            return
        linearRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### Линейная сложность ###
    def linear(n)
      # Список длины n занимает O(n) памяти
      nums = Array.new(n, 0)

      # Хеш-таблица длины n занимает O(n) памяти
      hmap = {}
      for i in 0...n
        hmap[i] = i.to_s
      end
    end

    # ## Линейная сложность (рекурсивная реализация) ###
    def linear_recur(n)
      puts "Рекурсия n = #{n}"
      return if n == 1
      linear_recur(n - 1)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20linear_recur%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20print%28%22%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%20n%20%3D%22%2C%20n%29%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20linear_recur%28n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20linear_recur%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear_recur%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20print%28%22%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8F%20n%20%3D%22%2C%20n%29%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20linear_recur%28n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%9B%D0%B8%D0%BD%D0%B5%D0%B9%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20linear_recur%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

![Линейная пространственная сложность, порождаемая рекурсивной функцией](space_complexity.assets/space_complexity_recursive_linear.png){ class="animation-figure" }

<p align="center"> Рисунок 2-17 &nbsp; Линейная пространственная сложность, порождаемая рекурсивной функцией </p>

### 3. &nbsp; Квадратичная сложность $O(n^2)$ {data-toc-label="3. &nbsp; Квадратичная сложность"}

Квадратичная сложность часто встречается у матриц и графов, где число элементов связано с $n$ квадратичной зависимостью:

=== "Python"

    ```python title="space_complexity.py"
    def quadratic(n: int):
        """Квадратичная сложность"""
        # Двумерный список занимает O(n^2) памяти
        num_matrix = [[0] * n for _ in range(n)]
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Квадратичная сложность */
    void quadratic(int n) {
        // Двумерный список занимает O(n^2) памяти
        vector<vector<int>> numMatrix;
        for (int i = 0; i < n; i++) {
            vector<int> tmp;
            for (int j = 0; j < n; j++) {
                tmp.push_back(0);
            }
            numMatrix.push_back(tmp);
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* Квадратичная сложность */
    void quadratic(int n) {
        // Матрица занимает O(n^2) памяти
        int[][] numMatrix = new int[n][n];
        // Двумерный список занимает O(n^2) памяти
        List<List<Integer>> numList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> tmp = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                tmp.add(0);
            }
            numList.add(tmp);
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* Квадратичная сложность */
    void Quadratic(int n) {
        // Матрица занимает O(n^2) памяти
        int[,] numMatrix = new int[n, n];
        // Двумерный список занимает O(n^2) памяти
        List<List<int>> numList = [];
        for (int i = 0; i < n; i++) {
            List<int> tmp = [];
            for (int j = 0; j < n; j++) {
                tmp.Add(0);
            }
            numList.Add(tmp);
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* Квадратичная сложность */
    func spaceQuadratic(n int) {
        // Матрица занимает O(n^2) памяти
        numMatrix := make([][]int, n)
        for i := 0; i < n; i++ {
            numMatrix[i] = make([]int, n)
        }
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* Квадратичная сложность */
    func quadratic(n: Int) {
        // Двумерный список занимает O(n^2) памяти
        let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* Квадратичная сложность */
    function quadratic(n) {
        // Матрица занимает O(n^2) памяти
        const numMatrix = Array(n)
            .fill(null)
            .map(() => Array(n).fill(null));
        // Двумерный список занимает O(n^2) памяти
        const numList = [];
        for (let i = 0; i < n; i++) {
            const tmp = [];
            for (let j = 0; j < n; j++) {
                tmp.push(0);
            }
            numList.push(tmp);
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* Квадратичная сложность */
    function quadratic(n: number): void {
        // Матрица занимает O(n^2) памяти
        const numMatrix = Array(n)
            .fill(null)
            .map(() => Array(n).fill(null));
        // Двумерный список занимает O(n^2) памяти
        const numList = [];
        for (let i = 0; i < n; i++) {
            const tmp = [];
            for (let j = 0; j < n; j++) {
                tmp.push(0);
            }
            numList.push(tmp);
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* Квадратичная сложность */
    void quadratic(int n) {
      // Матрица занимает O(n^2) памяти
      List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
      // Двумерный список занимает O(n^2) памяти
      List<List<int>> numList = [];
      for (var i = 0; i < n; i++) {
        List<int> tmp = [];
        for (int j = 0; j < n; j++) {
          tmp.add(0);
        }
        numList.add(tmp);
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* Квадратичная сложность */
    #[allow(unused)]
    fn quadratic(n: i32) {
        // Матрица занимает O(n^2) памяти
        let num_matrix = vec![vec![0; n as usize]; n as usize];
        // Двумерный список занимает O(n^2) памяти
        let mut num_list = Vec::new();
        for i in 0..n {
            let mut tmp = Vec::new();
            for j in 0..n {
                tmp.push(0);
            }
            num_list.push(tmp);
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* Квадратичная сложность */
    void quadratic(int n) {
        // Двумерный список занимает O(n^2) памяти
        int **numMatrix = malloc(sizeof(int *) * n);
        for (int i = 0; i < n; i++) {
            int *tmp = malloc(sizeof(int) * n);
            for (int j = 0; j < n; j++) {
                tmp[j] = 0;
            }
            numMatrix[i] = tmp;
        }

        // Освобождение памяти
        for (int i = 0; i < n; i++) {
            free(numMatrix[i]);
        }
        free(numMatrix);
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* Квадратичная сложность */
    fun quadratic(n: Int) {
        // Матрица занимает O(n^2) памяти
        val numMatrix = arrayOfNulls<Array<Int>?>(n)
        // Двумерный список занимает O(n^2) памяти
        val numList = mutableListOf<MutableList<Int>>()
        for (i in 0..<n) {
            val tmp = mutableListOf<Int>()
            for (j in 0..<n) {
                tmp.add(0)
            }
            numList.add(tmp)
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### Квадратичная сложность ###
    def quadratic(n)
      # Двумерный список занимает O(n^2) памяти
      Array.new(n) { Array.new(n, 0) }
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 405px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20%23%20%D0%94%D0%B2%D1%83%D0%BC%D0%B5%D1%80%D0%BD%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D0%B5%D1%82%20O%28n%5E2%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20num_matrix%20%3D%20%5B%5B0%5D%20%2A%20n%20for%20_%20in%20range%28n%29%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20quadratic%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20%20%20%23%20%D0%94%D0%B2%D1%83%D0%BC%D0%B5%D1%80%D0%BD%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D0%B5%D1%82%20O%28n%5E2%29%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20num_matrix%20%3D%20%5B%5B0%5D%20%2A%20n%20for%20_%20in%20range%28n%29%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20quadratic%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Как показано на рисунке 2-18, глубина рекурсии этой функции равна $n$ , и в каждой рекурсивной функции инициализируется массив длины $n$ , $n-1$ , $\dots$ , $2$ , $1$ ; его средняя длина равна $n / 2$ , поэтому в сумме используется $O(n^2)$ пространства:

=== "Python"

    ```python title="space_complexity.py"
    def quadratic_recur(n: int) -> int:
        """Квадратичная сложность (рекурсивная реализация)"""
        if n <= 0:
            return 0
        # Длина массива nums равна n, n-1, ..., 2, 1
        nums = [0] * n
        return quadratic_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Квадратичная сложность (рекурсивная реализация) */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        vector<int> nums(n);
        cout << "Рекурсия n = " << n << " , длина nums = " << nums.size() << endl;
        return quadraticRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* Квадратичная сложность (рекурсивная реализация) */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // Длина массива nums равна n, n-1, ..., 2, 1
        int[] nums = new int[n];
        System.out.println("В рекурсии n = " + n + ", длина nums = " + nums.length);
        return quadraticRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* Квадратичная сложность (рекурсивная реализация) */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("В рекурсии n = " + n + ", длина nums = " + nums.Length);
        return QuadraticRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* Квадратичная сложность (рекурсивная реализация) */
    func spaceQuadraticRecur(n int) int {
        if n <= 0 {
            return 0
        }
        nums := make([]int, n)
        fmt.Printf("В рекурсии n = %d, длина nums = %d\n", n, len(nums))
        return spaceQuadraticRecur(n - 1)
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* Квадратичная сложность (рекурсивная реализация) */
    @discardableResult
    func quadraticRecur(n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        // Длина массива nums равна n, n-1, ..., 2, 1
        let nums = Array(repeating: 0, count: n)
        print("В рекурсии n = \(n), длина nums = \(nums.count)")
        return quadraticRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* Квадратичная сложность (рекурсивная реализация) */
    function quadraticRecur(n) {
        if (n <= 0) return 0;
        const nums = new Array(n);
        console.log(`В рекурсии n = ${n} длина nums = ${nums.length}`);
        return quadraticRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* Квадратичная сложность (рекурсивная реализация) */
    function quadraticRecur(n: number): number {
        if (n <= 0) return 0;
        const nums = new Array(n);
        console.log(`В рекурсии n = ${n} длина nums = ${nums.length}`);
        return quadraticRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* Квадратичная сложность (рекурсивная реализация) */
    int quadraticRecur(int n) {
      if (n <= 0) return 0;
      List<int> nums = List.filled(n, 0);
      print('В рекурсии n = $n длина nums = ${nums.length}');
      return quadraticRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* Квадратичная сложность (рекурсивная реализация) */
    fn quadratic_recur(n: i32) -> i32 {
        if n <= 0 {
            return 0;
        };
        // Длина массива nums равна n, n-1, ..., 2, 1
        let nums = vec![0; n as usize];
        println!("В рекурсии n = {} , длина nums = {}", n, nums.len());
        return quadratic_recur(n - 1);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* Квадратичная сложность (рекурсивная реализация) */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        int *nums = malloc(sizeof(int) * n);
        printf("Рекурсия n = %d, длина nums = %d\r\n", n, n);
        int res = quadraticRecur(n - 1);
        free(nums);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* Квадратичная сложность (рекурсивная реализация) */
    tailrec fun quadraticRecur(n: Int): Int {
        if (n <= 0)
            return 0
        // Длина массива nums равна n, n-1, ..., 2, 1
        val nums = Array(n) { 0 }
        println("В рекурсии n = $n длина nums = ${nums.size}")
        return quadraticRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### Квадратичная сложность ###
    def quadratic(n)
      # Двумерный список занимает O(n^2) памяти
      Array.new(n) { Array.new(n, 0) }
    end

    # ## Квадратичная сложность (рекурсивная реализация) ###
    def quadratic_recur(n)
      return 0 unless n > 0

      # Длина массива nums равна n, n-1, ..., 2, 1
      nums = Array.new(n, 0)
      quadratic_recur(n - 1)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20nums%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20n%2C%20n-1%2C%20...%2C%202%2C%201%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20return%20quadratic_recur%28n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20quadratic_recur%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=28&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20nums%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20n%2C%20n-1%2C%20...%2C%202%2C%201%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20return%20quadratic_recur%28n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%9A%D0%B2%D0%B0%D0%B4%D1%80%D0%B0%D1%82%D0%B8%D1%87%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20quadratic_recur%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=28&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

![Квадратичная пространственная сложность, порождаемая рекурсивной функцией](space_complexity.assets/space_complexity_recursive_quadratic.png){ class="animation-figure" }

<p align="center"> Рисунок 2-18 &nbsp; Квадратичная пространственная сложность, порождаемая рекурсивной функцией </p>

### 4. &nbsp; Экспоненциальная сложность $O(2^n)$ {data-toc-label="4. &nbsp; Экспоненциальная сложность"}

Экспоненциальная сложность часто встречается у бинарных деревьев. Полное бинарное дерево с $n$ уровнями содержит $2^n - 1$ узлов и занимает $O(2^n)$ пространства:

=== "Python"

    ```python title="space_complexity.py"
    def build_tree(n: int) -> TreeNode | None:
        """Экспоненциальная сложность (построение полного двоичного дерева)"""
        if n == 0:
            return None
        root = TreeNode(0)
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
        return root
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    TreeNode *buildTree(int n) {
        if (n == 0)
            return nullptr;
        TreeNode *root = new TreeNode(0);
        root->left = buildTree(n - 1);
        root->right = buildTree(n - 1);
        return root;
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    TreeNode buildTree(int n) {
        if (n == 0)
            return null;
        TreeNode root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    TreeNode? BuildTree(int n) {
        if (n == 0) return null;
        TreeNode root = new(0) {
            left = BuildTree(n - 1),
            right = BuildTree(n - 1)
        };
        return root;
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    func buildTree(n int) *TreeNode {
        if n == 0 {
            return nil
        }
        root := NewTreeNode(0)
        root.Left = buildTree(n - 1)
        root.Right = buildTree(n - 1)
        return root
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    func buildTree(n: Int) -> TreeNode? {
        if n == 0 {
            return nil
        }
        let root = TreeNode(x: 0)
        root.left = buildTree(n: n - 1)
        root.right = buildTree(n: n - 1)
        return root
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    function buildTree(n) {
        if (n === 0) return null;
        const root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    function buildTree(n: number): TreeNode | null {
        if (n === 0) return null;
        const root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    TreeNode? buildTree(int n) {
      if (n == 0) return null;
      TreeNode root = TreeNode(0);
      root.left = buildTree(n - 1);
      root.right = buildTree(n - 1);
      return root;
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    fn build_tree(n: i32) -> Option<Rc<RefCell<TreeNode>>> {
        if n == 0 {
            return None;
        };
        let root = TreeNode::new(0);
        root.borrow_mut().left = build_tree(n - 1);
        root.borrow_mut().right = build_tree(n - 1);
        return Some(root);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    TreeNode *buildTree(int n) {
        if (n == 0)
            return NULL;
        TreeNode *root = newTreeNode(0);
        root->left = buildTree(n - 1);
        root->right = buildTree(n - 1);
        return root;
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* Экспоненциальная сложность (построение полного двоичного дерева) */
    fun buildTree(n: Int): TreeNode? {
        if (n == 0)
            return null
        val root = TreeNode(0)
        root.left = buildTree(n - 1)
        root.right = buildTree(n - 1)
        return root
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### Квадратичная сложность ###
    def quadratic(n)
      # Двумерный список занимает O(n^2) памяти
      Array.new(n) { Array.new(n, 0) }
    end

    # ## Квадратичная сложность (рекурсивная реализация) ###
    def quadratic_recur(n)
      return 0 unless n > 0

      # Длина массива nums равна n, n-1, ..., 2, 1
      nums = Array.new(n, 0)
      quadratic_recur(n - 1)
    end

    # ## Экспоненциальная сложность (построение полного двоичного дерева) ###
    def build_tree(n)
      return if n == 0

      TreeNode.new.tap do |root|
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0Adef%20build_tree%28n%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%AD%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BF%D0%BE%D0%BB%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%280%29%0A%20%20%20%20root.left%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20root.right%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20return%20root%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%AD%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20root%20%3D%20build_tree%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=507&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0Adef%20build_tree%28n%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%AD%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%28%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BF%D0%BE%D0%BB%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%280%29%0A%20%20%20%20root.left%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20root.right%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20return%20root%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%B2%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D1%85%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20n%20%3D%22%2C%20n%29%0A%0A%20%20%20%20%23%20%D0%AD%D0%BA%D1%81%D0%BF%D0%BE%D0%BD%D0%B5%D0%BD%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%0A%20%20%20%20root%20%3D%20build_tree%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=507&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

![Экспоненциальная пространственная сложность, порождаемая полным бинарным деревом](space_complexity.assets/space_complexity_exponential.png){ class="animation-figure" }

<p align="center"> Рисунок 2-19 &nbsp; Экспоненциальная пространственная сложность, порождаемая полным бинарным деревом </p>

### 5. &nbsp; Логарифмическая сложность $O(\log n)$ {data-toc-label="5. &nbsp; Логарифмическая сложность"}

Логарифмическая сложность часто встречается в алгоритмах "разделяй и властвуй". Например, при сортировке слиянием входной массив длины $n$ на каждом шаге рекурсии делится пополам, образуя рекурсивное дерево высоты $\log n$ и используя $O(\log n)$ пространства кадров стека.

Еще один пример - преобразование числа в строку. Если задано положительное целое число $n$ , то количество его цифр равно $\lfloor \log_{10} n \rfloor + 1$ , то есть длина соответствующей строки тоже равна $\lfloor \log_{10} n \rfloor + 1$ , следовательно, пространственная сложность составляет $O(\log_{10} n + 1) = O(\log n)$ .

## 2.4.4 &nbsp; Компромисс между временем и пространством

В идеальных условиях хотелось бы, чтобы и временная, и пространственная сложность алгоритма были оптимальными. Однако на практике одновременно оптимизировать и время, и память обычно очень трудно.

**Снижение временной сложности обычно достигается ценой увеличения пространственной сложности, и наоборот**. Подход, при котором жертвуют памятью ради ускорения работы алгоритма, называется обменом пространства на время; обратный подход называется обменом времени на пространство.

Выбор между этими двумя идеями зависит от того, что важнее в конкретной задаче. В большинстве случаев время ценнее памяти, поэтому стратегия обмена пространства на время используется чаще. Но при очень больших объемах данных контроль пространственной сложности тоже становится крайне важным.
