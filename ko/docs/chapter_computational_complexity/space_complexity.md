---
comments: true
---

# 2.4 &nbsp; 공간 복잡도

<u>공간 복잡도(space complexity)</u>는 데이터 양이 많아질 때 알고리즘이 차지하는 메모리 공간이 증가하는 추세를 측정한다. 시간 복잡도와 매우 비슷한 개념으로, ‘실행 시간’을 ‘차지하는 메모리 공간’으로 바꾸면 된다.

## 2.4.1 &nbsp; 알고리즘과 관련된 공간

알고리즘이 실행 중 사용하는 메모리 공간에는 주로 다음과 같은 종류가 있다.

- **입력 공간**: 알고리즘의 입력 데이터를 저장한다.
- **임시 공간**: 실행 중의 변수, 객체, 함수 문맥 등의 데이터를 저장한다.
- **출력 공간**: 알고리즘의 출력 데이터를 저장한다.

일반적으로 공간 복잡도에 포함하는 범위는 ‘임시 공간’과 ‘출력 공간’의 합이다.

임시 공간은 다시 세 부분으로 나눌 수 있다.

- **임시 데이터**: 실행 중의 각종 상수, 변수, 객체 등을 저장한다.
- **스택 프레임 공간**: 호출한 함수의 문맥 데이터를 저장한다. 시스템은 함수가 호출될 때마다 스택 맨 위에 스택 프레임을 만들며, 함수가 반환되면 이 공간을 해제한다.
- **명령어 공간**: 컴파일된 프로그램 명령어를 저장하며, 실제 계산에서는 보통 무시한다.

프로그램의 공간 복잡도를 분석할 때는 아래 그림(2-15)과 같이 **보통 임시 데이터, 스택 프레임 공간, 출력 데이터의 세 부분을 계산한다**.

![알고리즘이 사용하는 공간](space_complexity.assets/space_types.png){ class="animation-figure" }

<p align="center"> 그림 2-15 &nbsp; 알고리즘이 사용하는 공간 </p>

관련 코드는 다음과 같다.

=== "Python"

    ```python title=""
    class Node:
        """클래스"""
        def __init__(self, x: int):
            self.val: int = x              # 노드 값
            self.next: Node | None = None  # 다음 노드를 가리키는 참조

    def function() -> int:
        """함수"""
        # 몇 가지 연산 수행...
        return 0

    def algorithm(n) -> int:  # 입력 데이터
        A = 0                 # 임시 데이터(상수, 보통 대문자로 표기)
        b = 0                 # 임시 데이터(변수)
        node = Node(0)        # 임시 데이터(객체)
        c = function()        # 스택 프레임 공간(함수 호출)
        return A + b + c      # 출력 데이터
    ```

=== "C++"

    ```cpp title=""
    /* 구조체 */
    struct Node {
        int val;
        Node *next;
        Node(int x) : val(x), next(nullptr) {}
    };

    /* 함수 */
    int func() {
        // 몇 가지 연산 수행...
        return 0;
    }

    int algorithm(int n) {        // 입력 데이터
        const int a = 0;          // 임시 데이터(상수)
        int b = 0;                // 임시 데이터(변수)
        Node* node = new Node(0); // 임시 데이터(객체)
        int c = func();           // 스택 프레임 공간(함수 호출)
        return a + b + c;         // 출력 데이터
    }
    ```

=== "Java"

    ```java title=""
    /* 클래스 */
    class Node {
        int val;
        Node next;
        Node(int x) { val = x; }
    }
    
    /* 함수 */
    int function() {
        // 몇 가지 연산 수행...
        return 0;
    }
    
    int algorithm(int n) {        // 입력 데이터
        final int a = 0;          // 임시 데이터(상수)
        int b = 0;                // 임시 데이터(변수)
        Node node = new Node(0);  // 임시 데이터(객체)
        int c = function();       // 스택 프레임 공간(함수 호출)
        return a + b + c;         // 출력 데이터
    }
    ```

=== "C#"

    ```csharp title=""
    /* 클래스 */
    class Node(int x) {
        int val = x;
        Node next;
    }

    /* 함수 */
    int Function() {
        // 몇 가지 연산 수행...
        return 0;
    }

    int Algorithm(int n) {        // 입력 데이터
        const int a = 0;          // 임시 데이터(상수)
        int b = 0;                // 임시 데이터(변수)
        Node node = new(0);       // 임시 데이터(객체)
        int c = Function();       // 스택 프레임 공간(함수 호출)
        return a + b + c;         // 출력 데이터
    }
    ```

=== "Go"

    ```go title=""
    /* 구조체 */
    type node struct {
        val  int
        next *node
    }

    /* node 구조체 생성  */
    func newNode(val int) *node {
        return &node{val: val}
    }
    
    /* 함수 */
    func function() int {
        // 몇 가지 연산 수행...
        return 0
    }

    func algorithm(n int) int { // 입력 데이터
        const a = 0             // 임시 데이터(상수)
        b := 0                  // 임시 데이터(변수)
        newNode(0)              // 임시 데이터(객체)
        c := function()         // 스택 프레임 공간(함수 호출)
        return a + b + c        // 출력 데이터
    }
    ```

=== "Swift"

    ```swift title=""
    /* 클래스 */
    class Node {
        var val: Int
        var next: Node?

        init(x: Int) {
            val = x
        }
    }

    /* 함수 */
    func function() -> Int {
        // 몇 가지 연산 수행...
        return 0
    }

    func algorithm(n: Int) -> Int { // 입력 데이터
        let a = 0             // 임시 데이터(상수)
        var b = 0             // 임시 데이터(변수)
        let node = Node(x: 0) // 임시 데이터(객체)
        let c = function()    // 스택 프레임 공간(함수 호출)
        return a + b + c      // 출력 데이터
    }
    ```

=== "JS"

    ```javascript title=""
    /* 클래스 */
    class Node {
        val;
        next;
        constructor(val) {
            this.val = val === undefined ? 0 : val; // 노드 값
            this.next = null;                       // 다음 노드를 가리키는 참조
        }
    }

    /* 함수 */
    function constFunc() {
        // 몇 가지 연산 수행
        return 0;
    }

    function algorithm(n) {       // 입력 데이터
        const a = 0;              // 임시 데이터(상수)
        let b = 0;                // 임시 데이터(변수)
        const node = new Node(0); // 임시 데이터(객체)
        const c = constFunc();    // 스택 프레임 공간(함수 호출)
        return a + b + c;         // 출력 데이터
    }
    ```

=== "TS"

    ```typescript title=""
    /* 클래스 */
    class Node {
        val: number;
        next: Node | null;
        constructor(val?: number) {
            this.val = val === undefined ? 0 : val; // 노드 값
            this.next = null;                       // 다음 노드를 가리키는 참조
        }
    }

    /* 함수 */
    function constFunc(): number {
        // 몇 가지 연산 수행
        return 0;
    }

    function algorithm(n: number): number { // 입력 데이터
        const a = 0;                        // 임시 데이터(상수)
        let b = 0;                          // 임시 데이터(변수)
        const node = new Node(0);           // 임시 데이터(객체)
        const c = constFunc();              // 스택 프레임 공간(함수 호출)
        return a + b + c;                   // 출력 데이터
    }
    ```

=== "Dart"

    ```dart title=""
    /* 클래스 */
    class Node {
      int val;
      Node next;
      Node(this.val, [this.next]);
    }

    /* 함수 */
    int function() {
      // 몇 가지 연산 수행...
      return 0;
    }

    int algorithm(int n) {  // 입력 데이터
      const int a = 0;      // 임시 데이터(상수)
      int b = 0;            // 임시 데이터(변수)
      Node node = Node(0);  // 임시 데이터(객체)
      int c = function();   // 스택 프레임 공간(함수 호출)
      return a + b + c;     // 출력 데이터
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;
    
    /* 구조체 */
    struct Node {
        val: i32,
        next: Option<Rc<RefCell<Node>>>,
    }

    /* Node 구조체 생성 */
    impl Node {
        fn new(val: i32) -> Self {
            Self { val: val, next: None }
        }
    }

    /* 함수 */
    fn function() -> i32 {      
        // 몇 가지 연산 수행...
        return 0;
    }

    fn algorithm(n: i32) -> i32 {       // 입력 데이터
        const a: i32 = 0;               // 임시 데이터(상수)
        let mut b = 0;                  // 임시 데이터(변수)
        let node = Node::new(0);        // 임시 데이터(객체)
        let c = function();             // 스택 프레임 공간(함수 호출)
        return a + b + c;               // 출력 데이터
    }
    ```

=== "C"

    ```c title=""
    /* 함수 */
    int func() {
        // 몇 가지 연산 수행...
        return 0;
    }

    int algorithm(int n) { // 입력 데이터
        const int a = 0;   // 임시 데이터(상수)
        int b = 0;         // 임시 데이터(변수)
        int c = func();    // 스택 프레임 공간(함수 호출)
        return a + b + c;  // 출력 데이터
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* 클래스 */
    class Node(var _val: Int) {
        var next: Node? = null
    }

    /* 함수 */
    fun function(): Int {
        // 몇 가지 연산 수행...
        return 0
    }

    fun algorithm(n: Int): Int { // 입력 데이터
        val a = 0                // 임시 데이터(상수)
        var b = 0                // 임시 데이터(변수)
        val node = Node(0)       // 임시 데이터(객체)
        val c = function()       // 스택 프레임 공간(함수 호출)
        return a + b + c         // 출력 데이터
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### 클래스 ###
    class Node
        attr_accessor :val      # 노드 값
        attr_accessor :next     # 다음 노드를 가리키는 참조

        def initialize(x)
            @val = x
        end
    end

    ### 함수 ###
    def function
        # 몇 가지 연산 수행...
        0
    end

    ### 알고리즘 ###
    def algorithm(n)        # 입력 데이터
        a = 0               # 임시 데이터(상수)
        b = 0               # 임시 데이터(변수)
        node = Node.new(0)  # 임시 데이터(객체)
        c = function        # 스택 프레임 공간(함수 호출)
        a + b + c           # 출력 데이터
    end
    ```

## 2.4.2 &nbsp; 계산 방법

공간 복잡도를 구하는 방법은 시간 복잡도와 대체로 같다. 계산 대상을 ‘연산 횟수’에서 ‘사용 공간의 크기’로 바꾸면 된다.

시간 복잡도와 달리 **보통 최악 공간 복잡도에만 관심을 둔다**. 메모리 공간은 반드시 충족해야 하는 요구 사항이므로, 어떤 입력 데이터에서도 충분한 메모리 공간이 확보되어 있어야 하기 때문이다.

다음 코드를 보면 최악 공간 복잡도에서 ‘최악’은 두 가지 의미를 지닌다.

1. **가장 불리한 입력 데이터를 기준으로 한다**: $n < 10$이면 공간 복잡도는 $O(1)$이다. 그러나 $n > 10$이면 초기화한 배열 `nums`가 $O(n)$ 공간을 차지하므로 최악 공간 복잡도는 $O(n)$이다.
2. **알고리즘 실행 중 최대 메모리 사용량을 기준으로 한다**: 예를 들어 프로그램이 마지막 줄을 실행하기 전에는 $O(1)$ 공간을 차지하지만, 배열 `nums`를 초기화하면 $O(n)$ 공간을 차지한다. 따라서 최악 공간 복잡도는 $O(n)$이다.

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

**재귀 함수에서는 스택 프레임 공간을 계산하는 데 주의해야 한다**. 다음 코드를 살펴보자.

=== "Python"

    ```python title=""
    def function() -> int:
        # 몇 가지 연산 수행
        return 0

    def loop(n: int):
        """반복문의 공간 복잡도는 O(1)"""
        for _ in range(n):
            function()

    def recur(n: int):
        """재귀의 공간 복잡도는 O(n)"""
        if n == 1:
            return
        return recur(n - 1)
    ```

=== "C++"

    ```cpp title=""
    int func() {
        // 몇 가지 연산 수행
        return 0;
    }
    /* 반복문의 공간 복잡도는 O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* 재귀의 공간 복잡도는 O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Java"

    ```java title=""
    int function() {
        // 몇 가지 연산 수행
        return 0;
    }
    /* 반복문의 공간 복잡도는 O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    /* 재귀의 공간 복잡도는 O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "C#"

    ```csharp title=""
    int Function() {
        // 몇 가지 연산 수행
        return 0;
    }
    /* 반복문의 공간 복잡도는 O(1) */
    void Loop(int n) {
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    /* 재귀의 공간 복잡도는 O(n) */
    int Recur(int n) {
        if (n == 1) return 1;
        return Recur(n - 1);
    }
    ```

=== "Go"

    ```go title=""
    func function() int {
        // 몇 가지 연산 수행
        return 0
    }
    
    /* 반복문의 공간 복잡도는 O(1) */
    func loop(n int) {
        for i := 0; i < n; i++ {
            function()
        }
    }
    
    /* 재귀의 공간 복잡도는 O(n) */
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
        // 몇 가지 연산 수행
        return 0
    }

    /* 반복문의 공간 복잡도는 O(1) */
    func loop(n: Int) {
        for _ in 0 ..< n {
            function()
        }
    }

    /* 재귀의 공간 복잡도는 O(n) */
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
        // 몇 가지 연산 수행
        return 0;
    }
    /* 반복문의 공간 복잡도는 O(1) */
    function loop(n) {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* 재귀의 공간 복잡도는 O(n) */
    function recur(n) {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "TS"

    ```typescript title=""
    function constFunc(): number {
        // 몇 가지 연산 수행
        return 0;
    }
    /* 반복문의 공간 복잡도는 O(1) */
    function loop(n: number): void {
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    /* 재귀의 공간 복잡도는 O(n) */
    function recur(n: number): void {
        if (n === 1) return;
        return recur(n - 1);
    }
    ```

=== "Dart"

    ```dart title=""
    int function() {
      // 몇 가지 연산 수행
      return 0;
    }
    /* 반복문의 공간 복잡도는 O(1) */
    void loop(int n) {
      for (int i = 0; i < n; i++) {
        function();
      }
    }
    /* 재귀의 공간 복잡도는 O(n) */
    void recur(int n) {
      if (n == 1) return;
      recur(n - 1);
    }
    ```

=== "Rust"

    ```rust title=""
    fn function() -> i32 {
        // 몇 가지 연산 수행
        return 0;
    }
    /* 반복문의 공간 복잡도는 O(1) */
    fn loop(n: i32) {
        for i in 0..n {
            function();
        }
    }
    /* 재귀의 공간 복잡도는 O(n) */
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
        // 몇 가지 연산 수행
        return 0;
    }
    /* 반복문의 공간 복잡도는 O(1) */
    void loop(int n) {
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    /* 재귀의 공간 복잡도는 O(n) */
    void recur(int n) {
        if (n == 1) return;
        recur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    fun function(): Int {
        // 몇 가지 연산 수행
        return 0
    }
    /* 반복문의 공간 복잡도는 O(1) */
    fun loop(n: Int) {
        for (i in 0..<n) {
            function()
        }
    }
    /* 재귀의 공간 복잡도는 O(n) */
    fun recur(n: Int) {
        if (n == 1) return
        return recur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title=""
    def function
        # 몇 가지 연산 수행
        0
    end

    ### 반복문의 공간 복잡도는 O(1) ###
    def loop(n)
        (0...n).each { function }
    end

    ### 재귀의 공간 복잡도는 O(n) ###
    def recur(n)
        return if n == 1
        recur(n - 1)
    end
    ```

함수 `loop()`와 `recur()`의 시간 복잡도는 모두 $O(n)$이지만 공간 복잡도는 다르다.

- 함수 `loop()`는 반복문에서 `function()`을 $n$번 호출한다. 매번 `function()`이 반환되어 스택 프레임 공간이 해제되므로, 공간 복잡도는 여전히 $O(1)$이다.
- 재귀 함수 `recur()`의 실행 중에는 아직 반환되지 않은 `recur()`가 $n$개 동시에 존재하므로, $O(n)$의 스택 프레임 공간을 차지한다.

## 2.4.3 &nbsp; 대표적인 유형

입력 데이터 크기를 $n$이라고 할 때, 아래 그림(2-16)은 대표적인 공간 복잡도 유형을 낮은 순서대로 보여 준다.

$$
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n^2) < O(2^n) \newline
& \text{상수} < \text{로그} < \text{선형} < \text{제곱} < \text{지수}
\end{aligned}
$$

![대표적인 공간 복잡도 유형](space_complexity.assets/space_complexity_common_types.png){ class="animation-figure" }

<p align="center"> 그림 2-16 &nbsp; 대표적인 공간 복잡도 유형 </p>

### 1. &nbsp; 상수 공간 $O(1)$ {data-toc-label="1. &nbsp; 상수 공간"}

상수 공간은 개수가 입력 데이터 크기 $n$과 무관한 상수, 변수, 객체에서 흔히 나타난다.

반복문에서 변수를 초기화하거나 함수를 호출할 때 사용하는 메모리는 다음 반복에 들어가면 해제되므로 공간이 누적되지 않는다. 따라서 공간 복잡도는 여전히 $O(1)$이다.

=== "Python"

    ```python title="space_complexity.py"
    def function() -> int:
        """함수"""
        # 몇 가지 연산을 수행한다
        return 0

    def constant(n: int):
        """상수 차수"""
        # 상수, 변수, 객체는 O(1) 공간을 차지한다
        a = 0
        nums = [0] * 10000
        node = ListNode(0)
        # 반복문 안의 변수는 O(1) 공간을 차지한다
        for _ in range(n):
            c = 0
        # 반복문 안의 함수는 O(1) 공간을 차지한다
        for _ in range(n):
            function()
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 함수 */
    int func() {
        // 몇 가지 연산을 수행한다
        return 0;
    }

    /* 상수 차수 */
    void constant(int n) {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        const int a = 0;
        int b = 0;
        vector<int> nums(10000);
        ListNode node(0);
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 함수 */
    int function() {
        // 몇 가지 연산을 수행한다
        return 0;
    }

    /* 상수 차수 */
    void constant(int n) {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
        for (int i = 0; i < n; i++) {
            function();
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 함수 */
    int Function() {
        // 몇 가지 연산을 수행한다
        return 0;
    }

    /* 상수 차수 */
    void Constant(int n) {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new(0);
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
        for (int i = 0; i < n; i++) {
            Function();
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 함수 */
    func function() int {
        // 몇 가지 연산을 수행한다...
        return 0
    }

    /* 상수 차수 */
    func spaceConstant(n int) {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        const a = 0
        b := 0
        nums := make([]int, 10000)
        node := newNode(0)
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        var c int
        for i := 0; i < n; i++ {
            c = 0
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
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
    /* 함수 */
    @discardableResult
    func function() -> Int {
        // 몇 가지 연산을 수행한다
        return 0
    }

    /* 상수 차수 */
    func constant(n: Int) {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        let a = 0
        var b = 0
        let nums = Array(repeating: 0, count: 10000)
        let node = ListNode(x: 0)
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        for _ in 0 ..< n {
            let c = 0
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
        for _ in 0 ..< n {
            function()
        }
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 함수 */
    function constFunc() {
        // 몇 가지 연산을 수행한다
        return 0;
    }

    /* 상수 차수 */
    function constant(n) {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        const a = 0;
        const b = 0;
        const nums = new Array(10000);
        const node = new ListNode(0);
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        for (let i = 0; i < n; i++) {
            const c = 0;
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 함수 */
    function constFunc(): number {
        // 몇 가지 연산을 수행한다
        return 0;
    }

    /* 상수 차수 */
    function constant(n: number): void {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        const a = 0;
        const b = 0;
        const nums = new Array(10000);
        const node = new ListNode(0);
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        for (let i = 0; i < n; i++) {
            const c = 0;
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
        for (let i = 0; i < n; i++) {
            constFunc();
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 함수 */
    int function() {
      // 몇 가지 연산을 수행한다
      return 0;
    }

    /* 상수 차수 */
    void constant(int n) {
      // 상수, 변수, 객체는 O(1) 공간을 차지한다
      final int a = 0;
      int b = 0;
      List<int> nums = List.filled(10000, 0);
      ListNode node = ListNode(0);
      // 반복문 안의 변수는 O(1) 공간을 차지한다
      for (var i = 0; i < n; i++) {
        int c = 0;
      }
      // 반복문 안의 함수는 O(1) 공간을 차지한다
      for (var i = 0; i < n; i++) {
        function();
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 함수 */
    fn function() -> i32 {
        // 몇 가지 연산을 수행한다
        return 0;
    }

    /* 상수 차수 */
    #[allow(unused)]
    fn constant(n: i32) {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        const A: i32 = 0;
        let b = 0;
        let nums = vec![0; 10000];
        let node = ListNode::new(0);
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        for i in 0..n {
            let c = 0;
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
        for i in 0..n {
            function();
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 함수 */
    int func() {
        // 몇 가지 연산을 수행한다
        return 0;
    }

    /* 상수 차수 */
    void constant(int n) {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        const int a = 0;
        int b = 0;
        int nums[1000];
        ListNode *node = newListNode(0);
        free(node);
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
        for (int i = 0; i < n; i++) {
            func();
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 함수 */
    fun function(): Int {
        // 몇 가지 연산을 수행한다
        return 0
    }

    /* 상수 차수 */
    fun constant(n: Int) {
        // 상수, 변수, 객체는 O(1) 공간을 차지한다
        val a = 0
        var b = 0
        val nums = Array(10000) { 0 }
        val node = ListNode(0)
        // 반복문 안의 변수는 O(1) 공간을 차지한다
        for (i in 0..<n) {
            val c = 0
        }
        // 반복문 안의 함수는 O(1) 공간을 차지한다
        for (i in 0..<n) {
            function()
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 함수 ###
    def function
      # 몇 가지 연산을 수행한다
      0
    end

    ### 상수 차수 ###
    def constant(n)
      # 상수, 변수, 객체는 O(1) 공간을 차지한다
      a = 0
      nums = [0] * 10000
      node = ListNode.new

      # 반복문 안의 변수는 O(1) 공간을 차지한다
      (0...n).each { c = 0 }
      # 반복문 안의 함수는 O(1) 공간을 차지한다
      (0...n).each { function }
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20function%28%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%95%A8%EC%88%98%22%22%22%0A%20%20%20%20%23%20%EB%AA%87%20%EA%B0%80%EC%A7%80%20%EC%97%B0%EC%82%B0%EC%9D%84%20%EC%88%98%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%200%0A%0Adef%20constant%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%83%81%EC%88%98%20%EC%B0%A8%EC%88%98%22%22%22%0A%20%20%20%20%23%20%EC%83%81%EC%88%98,%20%EB%B3%80%EC%88%98,%20%EA%B0%9D%EC%B2%B4%EB%8A%94%20O%281%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20a%20%3D%200%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20node%20%3D%20ListNode%280%29%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%EB%AC%B8%20%EC%95%88%EC%9D%98%20%EB%B3%80%EC%88%98%EB%8A%94%20O%281%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20c%20%3D%200%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%EB%AC%B8%20%EC%95%88%EC%9D%98%20%ED%95%A8%EC%88%98%EB%8A%94%20O%281%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20function%28%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%83%81%EC%88%98%20%EC%B0%A8%EC%88%98%0A%20%20%20%20constant%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20function%28%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%95%A8%EC%88%98%22%22%22%0A%20%20%20%20%23%20%EB%AA%87%20%EA%B0%80%EC%A7%80%20%EC%97%B0%EC%82%B0%EC%9D%84%20%EC%88%98%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%200%0A%0Adef%20constant%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%83%81%EC%88%98%20%EC%B0%A8%EC%88%98%22%22%22%0A%20%20%20%20%23%20%EC%83%81%EC%88%98,%20%EB%B3%80%EC%88%98,%20%EA%B0%9D%EC%B2%B4%EB%8A%94%20O%281%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20a%20%3D%200%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20node%20%3D%20ListNode%280%29%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%EB%AC%B8%20%EC%95%88%EC%9D%98%20%EB%B3%80%EC%88%98%EB%8A%94%20O%281%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20c%20%3D%200%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%EB%AC%B8%20%EC%95%88%EC%9D%98%20%ED%95%A8%EC%88%98%EB%8A%94%20O%281%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20_%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20function%28%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%83%81%EC%88%98%20%EC%B0%A8%EC%88%98%0A%20%20%20%20constant%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 2. &nbsp; 선형 공간 $O(n)$ {data-toc-label="2. &nbsp; 선형 공간"}

선형 공간은 원소 수가 $n$에 비례하는 배열, 연결 리스트, 스택, 큐 등에 흔히 나타난다.

=== "Python"

    ```python title="space_complexity.py"
    def linear(n: int):
        """선형 차수"""
        # 길이가 n인 리스트는 O(n) 공간을 차지한다
        nums = [0] * n
        # 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        hmap = dict[int, str]()
        for i in range(n):
            hmap[i] = str(i)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 선형 차수 */
    void linear(int n) {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        vector<int> nums(n);
        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        vector<ListNode> nodes;
        for (int i = 0; i < n; i++) {
            nodes.push_back(ListNode(i));
        }
        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        unordered_map<int, string> map;
        for (int i = 0; i < n; i++) {
            map[i] = to_string(i);
        }
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 선형 차수 */
    void linear(int n) {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        int[] nums = new int[n];
        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 선형 차수 */
    void Linear(int n) {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        int[] nums = new int[n];
        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        List<ListNode> nodes = [];
        for (int i = 0; i < n; i++) {
            nodes.Add(new ListNode(i));
        }
        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        Dictionary<int, string> map = [];
        for (int i = 0; i < n; i++) {
            map.Add(i, i.ToString());
        }
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 선형 차수 */
    func spaceLinear(n int) {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        _ = make([]int, n)
        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        var nodes []*node
        for i := 0; i < n; i++ {
            nodes = append(nodes, newNode(i))
        }
        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        m := make(map[int]string, n)
        for i := 0; i < n; i++ {
            m[i] = strconv.Itoa(i)
        }
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 선형 차수 */
    func linear(n: Int) {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        let nums = Array(repeating: 0, count: n)
        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        let nodes = (0 ..< n).map { ListNode(x: $0) }
        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 선형 차수 */
    function linear(n) {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        const nums = new Array(n);
        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        const nodes = [];
        for (let i = 0; i < n; i++) {
            nodes.push(new ListNode(i));
        }
        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        const map = new Map();
        for (let i = 0; i < n; i++) {
            map.set(i, i.toString());
        }
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 선형 차수 */
    function linear(n: number): void {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        const nums = new Array(n);
        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        const nodes: ListNode[] = [];
        for (let i = 0; i < n; i++) {
            nodes.push(new ListNode(i));
        }
        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        const map = new Map();
        for (let i = 0; i < n; i++) {
            map.set(i, i.toString());
        }
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 선형 차수 */
    void linear(int n) {
      // 길이가 n인 배열은 O(n) 공간을 차지한다
      List<int> nums = List.filled(n, 0);
      // 길이가 n인 리스트는 O(n) 공간을 차지한다
      List<ListNode> nodes = [];
      for (var i = 0; i < n; i++) {
        nodes.add(ListNode(i));
      }
      // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
      Map<int, String> map = HashMap();
      for (var i = 0; i < n; i++) {
        map.putIfAbsent(i, () => i.toString());
      }
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 선형 차수 */
    #[allow(unused)]
    fn linear(n: i32) {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        let mut nums = vec![0; n as usize];
        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        let mut nodes = Vec::new();
        for i in 0..n {
            nodes.push(ListNode::new(i))
        }
        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        let mut map = HashMap::new();
        for i in 0..n {
            map.insert(i, i.to_string());
        }
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 해시 테이블 */
    typedef struct {
        int key;
        int val;
        UT_hash_handle hh; // uthash.h를 기반으로 구현한다
    } HashTable;

    /* 선형 차수 */
    void linear(int n) {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        int *nums = malloc(sizeof(int) * n);
        free(nums);

        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        ListNode **nodes = malloc(sizeof(ListNode *) * n);
        for (int i = 0; i < n; i++) {
            nodes[i] = newListNode(i);
        }
        // 메모리 해제
        for (int i = 0; i < n; i++) {
            free(nodes[i]);
        }
        free(nodes);

        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        HashTable *h = NULL;
        for (int i = 0; i < n; i++) {
            HashTable *tmp = malloc(sizeof(HashTable));
            tmp->key = i;
            tmp->val = i;
            HASH_ADD_INT(h, key, tmp);
        }

        // 메모리 해제
        HashTable *curr, *tmp;
        HASH_ITER(hh, h, curr, tmp) {
            HASH_DEL(h, curr);
            free(curr);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 선형 차수 */
    fun linear(n: Int) {
        // 길이가 n인 배열은 O(n) 공간을 차지한다
        val nums = Array(n) { 0 }
        // 길이가 n인 리스트는 O(n) 공간을 차지한다
        val nodes = mutableListOf<ListNode>()
        for (i in 0..<n) {
            nodes.add(ListNode(i))
        }
        // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
        val map = mutableMapOf<Int, String>()
        for (i in 0..<n) {
            map[i] = i.toString()
        }
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 선형 차수 ###
    def linear(n)
      # 길이가 n인 리스트는 O(n) 공간을 차지한다
      nums = Array.new(n, 0)

      # 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
      hmap = {}
      for i in 0...n
        hmap[i] = i.to_s
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%84%A0%ED%98%95%20%EC%B0%A8%EC%88%98%22%22%22%0A%20%20%20%20%23%20%EA%B8%B8%EC%9D%B4%EA%B0%80%20n%EC%9D%B8%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%8A%94%20O%28n%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%23%20%EA%B8%B8%EC%9D%B4%EA%B0%80%20n%EC%9D%B8%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%80%20O%28n%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20hmap%20%3D%20dict%5Bint,%20str%5D%28%29%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20hmap%5Bi%5D%20%3D%20str%28i%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%84%A0%ED%98%95%20%EC%B0%A8%EC%88%98%0A%20%20%20%20linear%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%84%A0%ED%98%95%20%EC%B0%A8%EC%88%98%22%22%22%0A%20%20%20%20%23%20%EA%B8%B8%EC%9D%B4%EA%B0%80%20n%EC%9D%B8%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%8A%94%20O%28n%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20%23%20%EA%B8%B8%EC%9D%B4%EA%B0%80%20n%EC%9D%B8%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%80%20O%28n%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20hmap%20%3D%20dict%5Bint,%20str%5D%28%29%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20hmap%5Bi%5D%20%3D%20str%28i%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%84%A0%ED%98%95%20%EC%B0%A8%EC%88%98%0A%20%20%20%20linear%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(2-17)과 같이 이 함수의 재귀 깊이는 $n$이다. 즉, 아직 반환되지 않은 `linear_recur()` 함수가 $n$개 동시에 존재하며 $O(n)$ 크기의 스택 프레임 공간을 사용한다.

=== "Python"

    ```python title="space_complexity.py"
    def linear_recur(n: int):
        """선형 차수(재귀 구현)"""
        print("재귀 n =", n)
        if n == 1:
            return
        linear_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 선형 차수(재귀 구현) */
    void linearRecur(int n) {
        cout << "재귀 n = " << n << endl;
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 선형 차수(재귀 구현) */
    void linearRecur(int n) {
        System.out.println("재귀 n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 선형 차수(재귀 구현) */
    void LinearRecur(int n) {
        Console.WriteLine("재귀 n = " + n);
        if (n == 1) return;
        LinearRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 선형 차수(재귀 구현) */
    func spaceLinearRecur(n int) {
        fmt.Println("재귀 n =", n)
        if n == 1 {
            return
        }
        spaceLinearRecur(n - 1)
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 선형 차수(재귀 구현) */
    func linearRecur(n: Int) {
        print("재귀 n = \(n)")
        if n == 1 {
            return
        }
        linearRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 선형 차수(재귀 구현) */
    function linearRecur(n) {
        console.log(`재귀 n = ${n}`);
        if (n === 1) return;
        linearRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 선형 차수(재귀 구현) */
    function linearRecur(n: number): void {
        console.log(`재귀 n = ${n}`);
        if (n === 1) return;
        linearRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 선형 차수(재귀 구현) */
    void linearRecur(int n) {
      print('재귀 n = $n');
      if (n == 1) return;
      linearRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 선형 차수(재귀 구현) */
    fn linear_recur(n: i32) {
        println!("재귀 n = {}", n);
        if n == 1 {
            return;
        };
        linear_recur(n - 1);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 선형 차수(재귀 구현) */
    void linearRecur(int n) {
        printf("재귀 n = %d\r\n", n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 선형 차수(재귀 구현) */
    fun linearRecur(n: Int) {
        println("재귀 n = $n")
        if (n == 1)
            return
        linearRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 선형 차수(재귀 구현)###
    def linear_recur(n)
      puts "재귀 n = #{n}"
      return if n == 1
      linear_recur(n - 1)
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 441px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20linear_recur%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%84%A0%ED%98%95%20%EC%B0%A8%EC%88%98%28%EC%9E%AC%EA%B7%80%20%EA%B5%AC%ED%98%84%29%22%22%22%0A%20%20%20%20print%28%22%EC%9E%AC%EA%B7%80%20n%20%3D%22,%20n%29%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20linear_recur%28n%20-%201%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%84%A0%ED%98%95%20%EC%B0%A8%EC%88%98%0A%20%20%20%20linear_recur%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20linear_recur%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%84%A0%ED%98%95%20%EC%B0%A8%EC%88%98%28%EC%9E%AC%EA%B7%80%20%EA%B5%AC%ED%98%84%29%22%22%22%0A%20%20%20%20print%28%22%EC%9E%AC%EA%B7%80%20n%20%3D%22,%20n%29%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20linear_recur%28n%20-%201%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%84%A0%ED%98%95%20%EC%B0%A8%EC%88%98%0A%20%20%20%20linear_recur%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=25&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

![재귀 함수에서 발생하는 선형 공간 복잡도](space_complexity.assets/space_complexity_recursive_linear.png){ class="animation-figure" }

<p align="center"> 그림 2-17 &nbsp; 재귀 함수에서 발생하는 선형 공간 복잡도 </p>

### 3. &nbsp; 제곱 공간 $O(n^2)$ {data-toc-label="3. &nbsp; 제곱 공간"}

제곱 공간은 원소 수가 $n$의 제곱에 비례하는 행렬과 그래프에 흔히 나타난다.

=== "Python"

    ```python title="space_complexity.py"
    def quadratic(n: int):
        """제곱 차수"""
        # 이차원 리스트는 O(n^2) 공간을 차지한다
        num_matrix = [[0] * n for _ in range(n)]
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 제곱 차수 */
    void quadratic(int n) {
        // 이차원 리스트는 O(n^2) 공간을 차지한다
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
    /* 제곱 차수 */
    void quadratic(int n) {
        // 행렬은 O(n^2) 공간을 차지한다
        int[][] numMatrix = new int[n][n];
        // 이차원 리스트는 O(n^2) 공간을 차지한다
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
    /* 제곱 차수 */
    void Quadratic(int n) {
        // 행렬은 O(n^2) 공간을 차지한다
        int[,] numMatrix = new int[n, n];
        // 이차원 리스트는 O(n^2) 공간을 차지한다
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
    /* 제곱 차수 */
    func spaceQuadratic(n int) {
        // 행렬은 O(n^2) 공간을 차지한다
        numMatrix := make([][]int, n)
        for i := 0; i < n; i++ {
            numMatrix[i] = make([]int, n)
        }
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 제곱 차수 */
    func quadratic(n: Int) {
        // 이차원 리스트는 O(n^2) 공간을 차지한다
        let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 제곱 차수 */
    function quadratic(n) {
        // 행렬은 O(n^2) 공간을 차지한다
        const numMatrix = Array(n)
            .fill(null)
            .map(() => Array(n).fill(null));
        // 이차원 리스트는 O(n^2) 공간을 차지한다
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
    /* 제곱 차수 */
    function quadratic(n: number): void {
        // 행렬은 O(n^2) 공간을 차지한다
        const numMatrix = Array(n)
            .fill(null)
            .map(() => Array(n).fill(null));
        // 이차원 리스트는 O(n^2) 공간을 차지한다
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
    /* 제곱 차수 */
    void quadratic(int n) {
      // 행렬은 O(n^2) 공간을 차지한다
      List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
      // 이차원 리스트는 O(n^2) 공간을 차지한다
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
    /* 제곱 차수 */
    #[allow(unused)]
    fn quadratic(n: i32) {
        // 행렬은 O(n^2) 공간을 차지한다
        let num_matrix = vec![vec![0; n as usize]; n as usize];
        // 이차원 리스트는 O(n^2) 공간을 차지한다
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
    /* 제곱 차수 */
    void quadratic(int n) {
        // 이차원 리스트는 O(n^2) 공간을 차지한다
        int **numMatrix = malloc(sizeof(int *) * n);
        for (int i = 0; i < n; i++) {
            int *tmp = malloc(sizeof(int) * n);
            for (int j = 0; j < n; j++) {
                tmp[j] = 0;
            }
            numMatrix[i] = tmp;
        }

        // 메모리 해제
        for (int i = 0; i < n; i++) {
            free(numMatrix[i]);
        }
        free(numMatrix);
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 제곱 차수 */
    fun quadratic(n: Int) {
        // 행렬은 O(n^2) 공간을 차지한다
        val numMatrix = arrayOfNulls<Array<Int>?>(n)
        // 이차원 리스트는 O(n^2) 공간을 차지한다
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
    ### 제곱 차수 ###
    def quadratic(n)
      # 이차원 리스트는 O(n^2) 공간을 차지한다
      Array.new(n) { Array.new(n, 0) }
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 405px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%A0%9C%EA%B3%B1%20%EC%B0%A8%EC%88%98%22%22%22%0A%20%20%20%20%23%20%EC%9D%B4%EC%B0%A8%EC%9B%90%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%8A%94%20O%28n%5E2%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20num_matrix%20%3D%20%5B%5B0%5D%20%2A%20n%20for%20_%20in%20range%28n%29%5D%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%A0%9C%EA%B3%B1%20%EC%B0%A8%EC%88%98%0A%20%20%20%20quadratic%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic%28n%3A%20int%29%3A%0A%20%20%20%20%22%22%22%EC%A0%9C%EA%B3%B1%20%EC%B0%A8%EC%88%98%22%22%22%0A%20%20%20%20%23%20%EC%9D%B4%EC%B0%A8%EC%9B%90%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%8A%94%20O%28n%5E2%29%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B0%A8%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20num_matrix%20%3D%20%5B%5B0%5D%20%2A%20n%20for%20_%20in%20range%28n%29%5D%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%A0%9C%EA%B3%B1%20%EC%B0%A8%EC%88%98%0A%20%20%20%20quadratic%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(2-18)과 같이 이 함수의 재귀 깊이는 $n$이고, 각 재귀 함수에서 길이가 각각 $n$, $n-1$, $\dots$, $2$, $1$인 배열을 초기화한다. 평균 길이는 $n / 2$이므로 전체적으로 $O(n^2)$ 공간을 차지한다.

=== "Python"

    ```python title="space_complexity.py"
    def quadratic_recur(n: int) -> int:
        """제곱 차수(재귀 구현)"""
        if n <= 0:
            return 0
        # 배열 nums의 길이는 n, n-1, ..., 2, 1이다
        nums = [0] * n
        return quadratic_recur(n - 1)
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 제곱 차수(재귀 구현) */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        vector<int> nums(n);
        cout << "재귀 n = " << n << " 일 때 nums의 길이 = " << nums.size() << endl;
        return quadraticRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="space_complexity.java"
    /* 제곱 차수(재귀 구현) */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // 배열 nums의 길이는 n, n-1, ..., 2, 1이다
        int[] nums = new int[n];
        System.out.println("재귀 n = " + n + " 일 때 nums의 길이 = " + nums.length);
        return quadraticRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="space_complexity.cs"
    /* 제곱 차수(재귀 구현) */
    int QuadraticRecur(int n) {
        if (n <= 0) return 0;
        int[] nums = new int[n];
        Console.WriteLine("재귀 n = " + n + " 일 때 nums의 길이 = " + nums.Length);
        return QuadraticRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="space_complexity.go"
    /* 제곱 차수(재귀 구현) */
    func spaceQuadraticRecur(n int) int {
        if n <= 0 {
            return 0
        }
        nums := make([]int, n)
        fmt.Printf("재귀 n = %d에서 nums의 길이 = %d \n", n, len(nums))
        return spaceQuadraticRecur(n - 1)
    }
    ```

=== "Swift"

    ```swift title="space_complexity.swift"
    /* 제곱 차수(재귀 구현) */
    @discardableResult
    func quadraticRecur(n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        // 배열 nums의 길이는 n, n-1, ..., 2, 1이다
        let nums = Array(repeating: 0, count: n)
        print("재귀(n = \(n))의 nums 길이 = \(nums.count)")
        return quadraticRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="space_complexity.js"
    /* 제곱 차수(재귀 구현) */
    function quadraticRecur(n) {
        if (n <= 0) return 0;
        const nums = new Array(n);
        console.log(`재귀 n = ${n}일 때 nums의 길이 = ${nums.length}`);
        return quadraticRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="space_complexity.ts"
    /* 제곱 차수(재귀 구현) */
    function quadraticRecur(n: number): number {
        if (n <= 0) return 0;
        const nums = new Array(n);
        console.log(`재귀 n = ${n}일 때 nums의 길이 = ${nums.length}`);
        return quadraticRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="space_complexity.dart"
    /* 제곱 차수(재귀 구현) */
    int quadraticRecur(int n) {
      if (n <= 0) return 0;
      List<int> nums = List.filled(n, 0);
      print('재귀(n = $n)의 nums 길이 = ${nums.length}');
      return quadraticRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="space_complexity.rs"
    /* 제곱 차수(재귀 구현) */
    fn quadratic_recur(n: i32) -> i32 {
        if n <= 0 {
            return 0;
        };
        // 배열 nums의 길이는 n, n-1, ..., 2, 1이다
        let nums = vec![0; n as usize];
        println!("재귀 n = {}에서 nums의 길이 = {}", n, nums.len());
        return quadratic_recur(n - 1);
    }
    ```

=== "C"

    ```c title="space_complexity.c"
    /* 제곱 차수(재귀 구현) */
    int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        int *nums = malloc(sizeof(int) * n);
        printf("재귀 n = %d에서 nums의 길이 = %d\r\n", n, n);
        int res = quadraticRecur(n - 1);
        free(nums);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="space_complexity.kt"
    /* 제곱 차수(재귀 구현) */
    tailrec fun quadraticRecur(n: Int): Int {
        if (n <= 0)
            return 0
        // 배열 nums의 길이는 n, n-1, ..., 2, 1이다
        val nums = Array(n) { 0 }
        println("재귀(n = $n)의 nums 길이 = ${nums.size}")
        return quadraticRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="space_complexity.rb"
    ### 제곱 차수(재귀 구현)###
    def quadratic_recur(n)
      return 0 unless n > 0

      # 배열 nums의 길이는 n, n-1, ..., 2, 1이다
      nums = Array.new(n, 0)
      quadratic_recur(n - 1)
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20quadratic_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%A0%9C%EA%B3%B1%20%EC%B0%A8%EC%88%98%28%EC%9E%AC%EA%B7%80%20%EA%B5%AC%ED%98%84%29%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%EB%B0%B0%EC%97%B4%20nums%EC%9D%98%20%EA%B8%B8%EC%9D%B4%EB%8A%94%20n,%20n-1,%20...,%202,%201%EC%9D%B4%EB%8B%A4%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20return%20quadratic_recur%28n%20-%201%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%A0%9C%EA%B3%B1%20%EC%B0%A8%EC%88%98%0A%20%20%20%20quadratic_recur%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=28&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20quadratic_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%A0%9C%EA%B3%B1%20%EC%B0%A8%EC%88%98%28%EC%9E%AC%EA%B7%80%20%EA%B5%AC%ED%98%84%29%22%22%22%0A%20%20%20%20if%20n%20%3C%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%EB%B0%B0%EC%97%B4%20nums%EC%9D%98%20%EA%B8%B8%EC%9D%B4%EB%8A%94%20n,%20n-1,%20...,%202,%201%EC%9D%B4%EB%8B%A4%0A%20%20%20%20nums%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20return%20quadratic_recur%28n%20-%201%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%A0%9C%EA%B3%B1%20%EC%B0%A8%EC%88%98%0A%20%20%20%20quadratic_recur%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=28&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

![재귀 함수에서 발생하는 제곱 공간 복잡도](space_complexity.assets/space_complexity_recursive_quadratic.png){ class="animation-figure" }

<p align="center"> 그림 2-18 &nbsp; 재귀 함수에서 발생하는 제곱 공간 복잡도 </p>

### 4. &nbsp; 지수 공간 $O(2^n)$ {data-toc-label="4. &nbsp; 지수 공간"}

지수 공간은 이진 트리에 흔히 나타난다. 아래 그림(2-19)에서 층수가 $n$인 ‘포화 이진 트리’의 노드 수는 $2^n - 1$이므로 $O(2^n)$ 공간을 차지한다.

=== "Python"

    ```python title="space_complexity.py"
    def build_tree(n: int) -> TreeNode | None:
        """지수 차수(포화 이진 트리 구성)"""
        if n == 0:
            return None
        root = TreeNode(0)
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
        return root
    ```

=== "C++"

    ```cpp title="space_complexity.cpp"
    /* 지수 차수(포화 이진 트리 구성) */
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
    /* 지수 차수(포화 이진 트리 구성) */
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
    /* 지수 차수(포화 이진 트리 구성) */
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
    /* 지수 차수(포화 이진 트리 구성) */
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
    /* 지수 차수(포화 이진 트리 구성) */
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
    /* 지수 차수(포화 이진 트리 구성) */
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
    /* 지수 차수(포화 이진 트리 구성) */
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
    /* 지수 차수(포화 이진 트리 구성) */
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
    /* 지수 차수(포화 이진 트리 구성) */
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
    /* 지수 차수(포화 이진 트리 구성) */
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
    /* 지수 차수(포화 이진 트리 구성) */
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
    ### 지수 차수(포화 이진 트리 구성)###
    def build_tree(n)
      return if n == 0

      TreeNode.new.tap do |root|
        root.left = build_tree(n - 1)
        root.right = build_tree(n - 1)
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20build_tree%28n%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EC%A7%80%EC%88%98%20%EC%B0%A8%EC%88%98%28%ED%8F%AC%ED%99%94%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EC%84%B1%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%280%29%0A%20%20%20%20root.left%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20root.right%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20return%20root%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%A7%80%EC%88%98%20%EC%B0%A8%EC%88%98%0A%20%20%20%20root%20%3D%20build_tree%28n%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=507&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%9E%90%EC%8B%9D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0Adef%20build_tree%28n%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%EC%A7%80%EC%88%98%20%EC%B0%A8%EC%88%98%28%ED%8F%AC%ED%99%94%20%EC%9D%B4%EC%A7%84%20%ED%8A%B8%EB%A6%AC%20%EA%B5%AC%EC%84%B1%29%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20root%20%3D%20TreeNode%280%29%0A%20%20%20%20root.left%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20root.right%20%3D%20build_tree%28n%20-%201%29%0A%20%20%20%20return%20root%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20print%28%22%EC%9E%85%EB%A0%A5%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%81%AC%EA%B8%B0%20n%20%3D%22,%20n%29%0A%0A%20%20%20%20%23%20%EC%A7%80%EC%88%98%20%EC%B0%A8%EC%88%98%0A%20%20%20%20root%20%3D%20build_tree%28n%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=507&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

![포화 이진 트리에서 발생하는 지수 공간 복잡도](space_complexity.assets/space_complexity_exponential.png){ class="animation-figure" }

<p align="center"> 그림 2-19 &nbsp; 포화 이진 트리에서 발생하는 지수 공간 복잡도 </p>

### 5. &nbsp; 로그 공간 $O(\log n)$ {data-toc-label="5. &nbsp; 로그 공간"}

로그 공간은 분할 정복 알고리즘에 흔히 나타난다. 예를 들어 병합 정렬은 길이가 $n$인 배열을 입력받아 재귀 호출마다 중간 지점에서 반으로 나눈다. 높이가 $\log n$인 재귀 트리가 만들어지므로 $O(\log n)$의 스택 프레임 공간을 사용한다.

또 다른 예로 수를 문자열로 변환하는 경우를 보자. 양의 정수 $n$을 입력받으면 자릿수는 $\lfloor \log_{10} n \rfloor + 1$이며, 대응하는 문자열 길이도 $\lfloor \log_{10} n \rfloor + 1$이다. 따라서 공간 복잡도는 $O(\log_{10} n + 1) = O(\log n)$이다.

## 2.4.4 &nbsp; 시간과 공간의 절충

이상적으로는 알고리즘의 시간 복잡도와 공간 복잡도가 모두 최적이기를 바란다. 그러나 실제로 두 복잡도를 동시에 최적화하기는 대개 매우 어렵다.

**시간 복잡도를 낮추려면 보통 공간 복잡도가 높아지는 대가를 치러야 하며, 그 반대도 마찬가지다**. 메모리 공간을 더 사용하여 실행 속도를 높이는 방식을 ‘공간으로 시간을 절약하기’, 반대의 방식을 ‘시간으로 공간을 절약하기’라고 한다.

어떤 방식을 선택할지는 어느 쪽을 더 중시하는지에 달려 있다. 대부분의 경우 시간이 공간보다 귀하므로 ‘공간으로 시간을 절약하기’가 더 널리 쓰인다. 물론 데이터 양이 매우 많다면 공간 복잡도를 관리하는 것 역시 중요하다.
