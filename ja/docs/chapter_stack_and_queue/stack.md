---
comments: true
---

# 5.1 &nbsp; スタック

<u>スタック（stack）</u>は、後入れ先出しの論理に従う線形データ構造です。

スタックは机の上に積まれた皿の山にたとえられます。1回に1枚の皿しか動かせないとすると、いちばん下の皿を取り出すには、上にある皿を順番にどかす必要があります。この皿をさまざまな型の要素（整数、文字、オブジェクトなど）に置き換えたものが、スタックというデータ構造です。

下図のように、積み重なった要素の上端を「スタックトップ」、下端を「スタックボトム」と呼びます。要素をスタックトップに追加する操作を「プッシュ」、スタックトップの要素を削除する操作を「ポップ」と呼びます。

![スタックの後入れ先出しの規則](stack.assets/stack_operations.png){ class="animation-figure" }

<p align="center"> 図 5-1 &nbsp; スタックの後入れ先出しの規則 </p>

## 5.1.1 &nbsp; スタックの基本操作

スタックの基本操作を以下の表に示します。具体的なメソッド名は使用するプログラミング言語によって異なります。ここでは、一般的な `push()`、`pop()`、`peek()` を例に挙げます。

<p align="center"> 表 5-1 &nbsp; スタックの操作効率 </p>

<div class="center-table" markdown>

| メソッド | 説明                   | 時間計算量 |
| -------- | ---------------------- | ---------- |
| `push()` | 要素をプッシュする（スタックトップに追加） | $O(1)$     |
| `pop()`  | スタックトップの要素をポップする           | $O(1)$     |
| `peek()` | スタックトップの要素にアクセスする         | $O(1)$     |

</div>

通常は、プログラミング言語に組み込まれているスタッククラスをそのまま利用できます。ただし、専用のスタッククラスが用意されていない言語もあります。その場合は、その言語の「配列」や「連結リスト」をスタックとして用い、プログラムのロジック上でスタックに無関係な操作を無視します。

=== "Python"

    ```python title="stack.py"
    # スタックを初期化
    # Python には組み込みのスタッククラスがないため、list をスタックとして使用できる
    stack: list[int] = []

    # 要素をプッシュ
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    # スタックトップの要素にアクセス
    peek: int = stack[-1]

    # 要素をポップ
    pop: int = stack.pop()

    # スタックの長さを取得
    size: int = len(stack)

    # 空かどうかを判定
    is_empty: bool = len(stack) == 0
    ```

=== "C++"

    ```cpp title="stack.cpp"
    /* スタックを初期化 */
    stack<int> stack;

    /* 要素をプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックトップの要素にアクセス */
    int top = stack.top();

    /* 要素をポップ */
    stack.pop(); // 戻り値なし

    /* スタックの長さを取得 */
    int size = stack.size();

    /* 空かどうかを判定 */
    bool empty = stack.empty();
    ```

=== "Java"

    ```java title="stack.java"
    /* スタックを初期化 */
    Stack<Integer> stack = new Stack<>();

    /* 要素をプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックトップの要素にアクセス */
    int peek = stack.peek();

    /* 要素をポップ */
    int pop = stack.pop();

    /* スタックの長さを取得 */
    int size = stack.size();

    /* 空かどうかを判定 */
    boolean isEmpty = stack.isEmpty();
    ```

=== "C#"

    ```csharp title="stack.cs"
    /* スタックを初期化 */
    Stack<int> stack = new();

    /* 要素をプッシュ */
    stack.Push(1);
    stack.Push(3);
    stack.Push(2);
    stack.Push(5);
    stack.Push(4);

    /* スタックトップの要素にアクセス */
    int peek = stack.Peek();

    /* 要素をポップ */
    int pop = stack.Pop();

    /* スタックの長さを取得 */
    int size = stack.Count;

    /* 空かどうかを判定 */
    bool isEmpty = stack.Count == 0;
    ```

=== "Go"

    ```go title="stack_test.go"
    /* スタックを初期化 */
    // Go では、Slice をスタックとして使うのが一般的
    var stack []int

    /* 要素をプッシュ */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)

    /* スタックトップの要素にアクセス */
    peek := stack[len(stack)-1]

    /* 要素をポップ */
    pop := stack[len(stack)-1]
    stack = stack[:len(stack)-1]

    /* スタックの長さを取得 */
    size := len(stack)

    /* 空かどうかを判定 */
    isEmpty := len(stack) == 0
    ```

=== "Swift"

    ```swift title="stack.swift"
    /* スタックを初期化 */
    // Swift には組み込みのスタッククラスがないため、Array をスタックとして使用できる
    var stack: [Int] = []

    /* 要素をプッシュ */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    /* スタックトップの要素にアクセス */
    let peek = stack.last!

    /* 要素をポップ */
    let pop = stack.removeLast()

    /* スタックの長さを取得 */
    let size = stack.count

    /* 空かどうかを判定 */
    let isEmpty = stack.isEmpty
    ```

=== "JS"

    ```javascript title="stack.js"
    /* スタックを初期化 */
    // JavaScript には組み込みのスタッククラスがないため、Array をスタックとして使用できる
    const stack = [];

    /* 要素をプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックトップの要素にアクセス */
    const peek = stack[stack.length-1];

    /* 要素をポップ */
    const pop = stack.pop();

    /* スタックの長さを取得 */
    const size = stack.length;

    /* 空かどうかを判定 */
    const is_empty = stack.length === 0;
    ```

=== "TS"

    ```typescript title="stack.ts"
    /* スタックを初期化 */
    // TypeScript には組み込みのスタッククラスがないため、Array をスタックとして使用できる
    const stack: number[] = [];

    /* 要素をプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックトップの要素にアクセス */
    const peek = stack[stack.length - 1];

    /* 要素をポップ */
    const pop = stack.pop();

    /* スタックの長さを取得 */
    const size = stack.length;

    /* 空かどうかを判定 */
    const is_empty = stack.length === 0;
    ```

=== "Dart"

    ```dart title="stack.dart"
    /* スタックを初期化 */
    // Dart には組み込みのスタッククラスがないため、List をスタックとして使用できる
    List<int> stack = [];

    /* 要素をプッシュ */
    stack.add(1);
    stack.add(3);
    stack.add(2);
    stack.add(5);
    stack.add(4);

    /* スタックトップの要素にアクセス */
    int peek = stack.last;

    /* 要素をポップ */
    int pop = stack.removeLast();

    /* スタックの長さを取得 */
    int size = stack.length;

    /* 空かどうかを判定 */
    bool isEmpty = stack.isEmpty;
    ```

=== "Rust"

    ```rust title="stack.rs"
    /* スタックを初期化 */
    // Vec をスタックとして使用する
    let mut stack: Vec<i32> = Vec::new();

    /* 要素をプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックトップの要素にアクセス */
    let top = stack.last().unwrap();

    /* 要素をポップ */
    let pop = stack.pop().unwrap();

    /* スタックの長さを取得 */
    let size = stack.len();

    /* 空かどうかを判定 */
    let is_empty = stack.is_empty();
    ```

=== "C"

    ```c title="stack.c"
    // C には組み込みのスタックがない
    ```

=== "Kotlin"

    ```kotlin title="stack.kt"
    /* スタックを初期化 */
    val stack = Stack<Int>()

    /* 要素をプッシュ */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)

    /* スタックトップの要素にアクセス */
    val peek = stack.peek()

    /* 要素をポップ */
    val pop = stack.pop()

    /* スタックの長さを取得 */
    val size = stack.size

    /* 空かどうかを判定 */
    val isEmpty = stack.isEmpty()
    ```

=== "Ruby"

    ```ruby title="stack.rb"
    # スタックを初期化
    # Ruby には組み込みのスタッククラスがないため、Array をスタックとして使用できる
    stack = []

    # 要素をプッシュ
    stack << 1
    stack << 3
    stack << 2
    stack << 5
    stack << 4

    # スタックトップの要素にアクセス
    peek = stack.last

    # 要素をポップ
    pop = stack.pop

    # スタックの長さを取得
    size = stack.length

    # 空かどうかを判定
    is_empty = stack.empty?
    ```

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%88%0A%20%20%20%20%23%20Python%20%E6%B2%A1%E6%9C%89%E5%86%85%E7%BD%AE%E7%9A%84%E6%A0%88%E7%B1%BB%EF%BC%8C%E5%8F%AF%E4%BB%A5%E6%8A%8A%20list%20%E5%BD%93%E4%BD%9C%E6%A0%88%E6%9D%A5%E4%BD%BF%E7%94%A8%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E6%A0%88%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%E6%A0%88%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E6%A0%88%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%90%8E%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E6%A0%88%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 5.1.2 &nbsp; スタックの実装

スタックの動作の仕組みをより深く理解するために、自分でスタッククラスを実装してみましょう。

スタックは後入れ先出しの原則に従うため、要素の追加や削除はスタックトップでしか行えません。一方、配列や連結リストでは任意の位置で要素を追加・削除できます。**つまり、スタックは制限付きの配列または連結リストとみなせます。** 言い換えると、配列や連結リストのうち無関係な操作を「隠蔽」することで、外から見た振る舞いをスタックの特性に合わせられます。

### 1. &nbsp; 連結リストによる実装

連結リストでスタックを実装する場合、連結リストの先頭ノードをスタックトップ、末尾ノードをスタックボトムとみなせます。

下図のように、プッシュ操作では要素を連結リストの先頭に挿入するだけでよく、このノード挿入方法は「頭部挿入法」と呼ばれます。ポップ操作では、先頭ノードを連結リストから削除するだけです。

=== "<1>"
    ![連結リストによるスタック実装のプッシュ・ポップ操作](stack.assets/linkedlist_stack_step1.png){ class="animation-figure" }

=== "<2>"
    ![linkedlist_stack_push](stack.assets/linkedlist_stack_step2_push.png){ class="animation-figure" }

=== "<3>"
    ![linkedlist_stack_pop](stack.assets/linkedlist_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> 図 5-2 &nbsp; 連結リストによるスタック実装のプッシュ・ポップ操作 </p>

以下は、連結リストによってスタックを実装したコード例です：

=== "Python"

    ```python title="linkedlist_stack.py"
    class LinkedListStack:
        """連結リストベースのスタック"""

        def __init__(self):
            """コンストラクタ"""
            self._peek: ListNode | None = None
            self._size: int = 0

        def size(self) -> int:
            """スタックの長さを取得"""
            return self._size

        def is_empty(self) -> bool:
            """スタックが空かどうかを判定"""
            return self._size == 0

        def push(self, val: int):
            """プッシュ"""
            node = ListNode(val)
            node.next = self._peek
            self._peek = node
            self._size += 1

        def pop(self) -> int:
            """ポップ"""
            num = self.peek()
            self._peek = self._peek.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """スタックトップの要素にアクセス"""
            if self.is_empty():
                raise IndexError("スタックが空です")
            return self._peek.val

        def to_list(self) -> list[int]:
            """表示用にリストへ変換"""
            arr = []
            node = self._peek
            while node:
                arr.append(node.val)
                node = node.next
            arr.reverse()
            return arr
    ```

=== "C++"

    ```cpp title="linkedlist_stack.cpp"
    /* 連結リストベースのスタック */
    class LinkedListStack {
      private:
        ListNode *stackTop; // 先頭ノードをスタックトップとする
        int stkSize;        // スタックの長さ

      public:
        LinkedListStack() {
            stackTop = nullptr;
            stkSize = 0;
        }

        ~LinkedListStack() {
            // 連結リストを走査してノードを削除し、メモリを解放する
            freeMemoryLinkedList(stackTop);
        }

        /* スタックの長さを取得 */
        int size() {
            return stkSize;
        }

        /* スタックが空かどうかを判定 */
        bool isEmpty() {
            return size() == 0;
        }

        /* プッシュ */
        void push(int num) {
            ListNode *node = new ListNode(num);
            node->next = stackTop;
            stackTop = node;
            stkSize++;
        }

        /* ポップ */
        int pop() {
            int num = top();
            ListNode *tmp = stackTop;
            stackTop = stackTop->next;
            // メモリを解放する
            delete tmp;
            stkSize--;
            return num;
        }

        /* スタックトップの要素にアクセス */
        int top() {
            if (isEmpty())
                throw out_of_range("スタックが空です");
            return stackTop->val;
        }

        /* List を Array に変換して返す */
        vector<int> toVector() {
            ListNode *node = stackTop;
            vector<int> res(size());
            for (int i = res.size() - 1; i >= 0; i--) {
                res[i] = node->val;
                node = node->next;
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="linkedlist_stack.java"
    /* 連結リストベースのスタック */
    class LinkedListStack {
        private ListNode stackPeek; // 先頭ノードをスタックトップとする
        private int stkSize = 0; // スタックの長さ

        public LinkedListStack() {
            stackPeek = null;
        }

        /* スタックの長さを取得 */
        public int size() {
            return stkSize;
        }

        /* スタックが空かどうかを判定 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* プッシュ */
        public void push(int num) {
            ListNode node = new ListNode(num);
            node.next = stackPeek;
            stackPeek = node;
            stkSize++;
        }

        /* ポップ */
        public int pop() {
            int num = peek();
            stackPeek = stackPeek.next;
            stkSize--;
            return num;
        }

        /* スタックトップの要素にアクセス */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stackPeek.val;
        }

        /* List を Array に変換して返す */
        public int[] toArray() {
            ListNode node = stackPeek;
            int[] res = new int[size()];
            for (int i = res.length - 1; i >= 0; i--) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="linkedlist_stack.cs"
    /* 連結リストベースのスタック */
    class LinkedListStack {
        ListNode? stackPeek;  // 先頭ノードをスタックトップとする
        int stkSize = 0;   // スタックの長さ

        public LinkedListStack() {
            stackPeek = null;
        }

        /* スタックの長さを取得 */
        public int Size() {
            return stkSize;
        }

        /* スタックが空かどうかを判定 */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* プッシュ */
        public void Push(int num) {
            ListNode node = new(num) {
                next = stackPeek
            };
            stackPeek = node;
            stkSize++;
        }

        /* ポップ */
        public int Pop() {
            int num = Peek();
            stackPeek = stackPeek!.next;
            stkSize--;
            return num;
        }

        /* スタックトップの要素にアクセス */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stackPeek!.val;
        }

        /* List を Array に変換して返す */
        public int[] ToArray() {
            if (stackPeek == null)
                return [];

            ListNode? node = stackPeek;
            int[] res = new int[Size()];
            for (int i = res.Length - 1; i >= 0; i--) {
                res[i] = node!.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_stack.go"
    /* 連結リストベースのスタック */
    type linkedListStack struct {
        // 組み込みパッケージ list でスタックを実装する
        data *list.List
    }

    /* スタックを初期化 */
    func newLinkedListStack() *linkedListStack {
        return &linkedListStack{
            data: list.New(),
        }
    }

    /* プッシュ */
    func (s *linkedListStack) push(value int) {
        s.data.PushBack(value)
    }

    /* ポップ */
    func (s *linkedListStack) pop() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    /* スタックトップの要素にアクセス */
    func (s *linkedListStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* スタックの長さを取得 */
    func (s *linkedListStack) size() int {
        return s.data.Len()
    }

    /* スタックが空かどうかを判定 */
    func (s *linkedListStack) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* 表示用に List を取得 */
    func (s *linkedListStack) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_stack.swift"
    /* 連結リストベースのスタック */
    class LinkedListStack {
        private var _peek: ListNode? // 先頭ノードをスタックトップとする
        private var _size: Int // スタックの長さ

        init() {
            _size = 0
        }

        /* スタックの長さを取得 */
        func size() -> Int {
            _size
        }

        /* スタックが空かどうかを判定 */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* プッシュ */
        func push(num: Int) {
            let node = ListNode(x: num)
            node.next = _peek
            _peek = node
            _size += 1
        }

        /* ポップ */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            _peek = _peek?.next
            _size -= 1
            return num
        }

        /* スタックトップの要素にアクセス */
        func peek() -> Int {
            if isEmpty() {
                fatalError("スタックが空です")
            }
            return _peek!.val
        }

        /* List を Array に変換して返す */
        func toArray() -> [Int] {
            var node = _peek
            var res = Array(repeating: 0, count: size())
            for i in res.indices.reversed() {
                res[i] = node!.val
                node = node?.next
            }
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="linkedlist_stack.js"
    /* 連結リストベースのスタック */
    class LinkedListStack {
        #stackPeek; // 先頭ノードをスタックトップとする
        #stkSize = 0; // スタックの長さ

        constructor() {
            this.#stackPeek = null;
        }

        /* スタックの長さを取得 */
        get size() {
            return this.#stkSize;
        }

        /* スタックが空かどうかを判定 */
        isEmpty() {
            return this.size === 0;
        }

        /* プッシュ */
        push(num) {
            const node = new ListNode(num);
            node.next = this.#stackPeek;
            this.#stackPeek = node;
            this.#stkSize++;
        }

        /* ポップ */
        pop() {
            const num = this.peek();
            this.#stackPeek = this.#stackPeek.next;
            this.#stkSize--;
            return num;
        }

        /* スタックトップの要素にアクセス */
        peek() {
            if (!this.#stackPeek) throw new Error('スタックが空');
            return this.#stackPeek.val;
        }

        /* 連結リストを Array に変換して返す */
        toArray() {
            let node = this.#stackPeek;
            const res = new Array(this.size);
            for (let i = res.length - 1; i >= 0; i--) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_stack.ts"
    /* 連結リストベースのスタック */
    class LinkedListStack {
        private stackPeek: ListNode | null; // 先頭ノードをスタックトップとする
        private stkSize: number = 0; // スタックの長さ

        constructor() {
            this.stackPeek = null;
        }

        /* スタックの長さを取得 */
        get size(): number {
            return this.stkSize;
        }

        /* スタックが空かどうかを判定 */
        isEmpty(): boolean {
            return this.size === 0;
        }

        /* プッシュ */
        push(num: number): void {
            const node = new ListNode(num);
            node.next = this.stackPeek;
            this.stackPeek = node;
            this.stkSize++;
        }

        /* ポップ */
        pop(): number {
            const num = this.peek();
            if (!this.stackPeek) throw new Error('スタックが空です');
            this.stackPeek = this.stackPeek.next;
            this.stkSize--;
            return num;
        }

        /* スタックトップの要素にアクセス */
        peek(): number {
            if (!this.stackPeek) throw new Error('スタックが空です');
            return this.stackPeek.val;
        }

        /* 連結リストを Array に変換して返す */
        toArray(): number[] {
            let node = this.stackPeek;
            const res = new Array<number>(this.size);
            for (let i = res.length - 1; i >= 0; i--) {
                res[i] = node!.val;
                node = node!.next;
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_stack.dart"
    /* 連結リストクラスに基づくスタック */
    class LinkedListStack {
      ListNode? _stackPeek; // 先頭ノードをスタックトップとする
      int _stkSize = 0; // スタックの長さ

      LinkedListStack() {
        _stackPeek = null;
      }

      /* スタックの長さを取得 */
      int size() {
        return _stkSize;
      }

      /* スタックが空かどうかを判定 */
      bool isEmpty() {
        return _stkSize == 0;
      }

      /* プッシュ */
      void push(int _num) {
        final ListNode node = ListNode(_num);
        node.next = _stackPeek;
        _stackPeek = node;
        _stkSize++;
      }

      /* ポップ */
      int pop() {
        final int _num = peek();
        _stackPeek = _stackPeek!.next;
        _stkSize--;
        return _num;
      }

      /* スタックトップの要素にアクセス */
      int peek() {
        if (_stackPeek == null) {
          throw Exception("スタックが空です");
        }
        return _stackPeek!.val;
      }

      /* 連結リストを List に変換して返す */
      List<int> toList() {
        ListNode? node = _stackPeek;
        List<int> list = [];
        while (node != null) {
          list.add(node.val);
          node = node.next;
        }
        list = list.reversed.toList();
        return list;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_stack.rs"
    /* 連結リストベースのスタック */
    #[allow(dead_code)]
    pub struct LinkedListStack<T> {
        stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // 先頭ノードをスタックトップとする
        stk_size: usize,                              // スタックの長さ
    }

    impl<T: Copy> LinkedListStack<T> {
        pub fn new() -> Self {
            Self {
                stack_peek: None,
                stk_size: 0,
            }
        }

        /* スタックの長さを取得 */
        pub fn size(&self) -> usize {
            return self.stk_size;
        }

        /* スタックが空かどうかを判定 */
        pub fn is_empty(&self) -> bool {
            return self.size() == 0;
        }

        /* プッシュ */
        pub fn push(&mut self, num: T) {
            let node = ListNode::new(num);
            node.borrow_mut().next = self.stack_peek.take();
            self.stack_peek = Some(node);
            self.stk_size += 1;
        }

        /* ポップ */
        pub fn pop(&mut self) -> Option<T> {
            self.stack_peek.take().map(|old_head| {
                self.stack_peek = old_head.borrow_mut().next.take();
                self.stk_size -= 1;

                old_head.borrow().val
            })
        }

        /* スタックトップの要素にアクセス */
        pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.stack_peek.as_ref()
        }

        /* List を Array に変換して返す */
        pub fn to_array(&self) -> Vec<T> {
            fn _to_array<T: Sized + Copy>(head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
                if let Some(node) = head {
                    let mut nums = _to_array(node.borrow().next.as_ref());
                    nums.push(node.borrow().val);
                    return nums;
                }
                return Vec::new();
            }

            _to_array(self.peek())
        }
    }
    ```

=== "C"

    ```c title="linkedlist_stack.c"
    /* 連結リストベースのスタック */
    typedef struct {
        ListNode *top; // 先頭ノードをスタックトップとする
        int size;      // スタックの長さ
    } LinkedListStack;

    /* コンストラクタ */
    LinkedListStack *newLinkedListStack() {
        LinkedListStack *s = malloc(sizeof(LinkedListStack));
        s->top = NULL;
        s->size = 0;
        return s;
    }

    /* デストラクタ */
    void delLinkedListStack(LinkedListStack *s) {
        while (s->top) {
            ListNode *n = s->top->next;
            free(s->top);
            s->top = n;
        }
        free(s);
    }

    /* スタックの長さを取得 */
    int size(LinkedListStack *s) {
        return s->size;
    }

    /* スタックが空かどうかを判定 */
    bool isEmpty(LinkedListStack *s) {
        return size(s) == 0;
    }

    /* プッシュ */
    void push(LinkedListStack *s, int num) {
        ListNode *node = (ListNode *)malloc(sizeof(ListNode));
        node->next = s->top; // 新しく追加したノードのポインタフィールドを更新
        node->val = num;     // 新しく追加したノードのデータフィールドを更新
        s->top = node;       // スタックトップを更新
        s->size++;           // スタックサイズを更新
    }

    /* スタックトップの要素にアクセス */
    int peek(LinkedListStack *s) {
        if (s->size == 0) {
            printf("スタックは空です\n");
            return INT_MAX;
        }
        return s->top->val;
    }

    /* ポップ */
    int pop(LinkedListStack *s) {
        int val = peek(s);
        ListNode *tmp = s->top;
        s->top = s->top->next;
        // メモリを解放する
        free(tmp);
        s->size--;
        return val;
    }
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_stack.kt"
    /* 連結リストベースのスタック */
    class LinkedListStack(
        private var stackPeek: ListNode? = null, // 先頭ノードをスタックトップとする
        private var stkSize: Int = 0 // スタックの長さ
    ) {

        /* スタックの長さを取得 */
        fun size(): Int {
            return stkSize
        }

        /* スタックが空かどうかを判定 */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* プッシュ */
        fun push(num: Int) {
            val node = ListNode(num)
            node.next = stackPeek
            stackPeek = node
            stkSize++
        }

        /* ポップ */
        fun pop(): Int? {
            val num = peek()
            stackPeek = stackPeek?.next
            stkSize--
            return num
        }

        /* スタックトップの要素にアクセス */
        fun peek(): Int? {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stackPeek?._val
        }

        /* List を Array に変換して返す */
        fun toArray(): IntArray {
            var node = stackPeek
            val res = IntArray(size())
            for (i in res.size - 1 downTo 0) {
                res[i] = node?._val!!
                node = node.next
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="linkedlist_stack.rb"
    ### 連結リストで実装したスタック ###
    class LinkedListStack
      attr_reader :size

      ### コンストラクタ ###
      def initialize
        @size = 0
      end

      ### スタックが空か判定 ###
      def is_empty?
        @peek.nil?
      end

      ### プッシュ ###
      def push(val)
        node = ListNode.new(val)
        node.next = @peek
        @peek = node
        @size += 1
      end

      ### ポップ ###
      def pop
        num = peek
        @peek = @peek.next
        @size -= 1
        num
      end

      ### スタックトップ要素を参照 ###
      def peek
        raise IndexError, 'スタックは空です' if is_empty?

        @peek.val
      end

      ### 連結リストを Array に変換して返す ###
      def to_array
        arr = []
        node = @peek
        while node
          arr << node.val
          node = node.next
        end
        arr.reverse
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B6%9A%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%0Aclass%20LinkedListStack%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%9D%E3%83%83%E3%83%97%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E7%A4%BA%E7%94%A8%E3%81%AB%E3%83%AA%E3%82%B9%E3%83%88%E3%81%B8%E5%A4%89%E6%8F%9B%22%22%22%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E8%A6%81%E7%B4%A0%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E5%BE%8C%20stack%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%20%3D%22%2C%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B6%9A%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%0Aclass%20LinkedListStack%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%9D%E3%83%83%E3%83%97%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E7%A4%BA%E7%94%A8%E3%81%AB%E3%83%AA%E3%82%B9%E3%83%88%E3%81%B8%E5%A4%89%E6%8F%9B%22%22%22%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E8%A6%81%E7%B4%A0%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E5%BE%8C%20stack%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%20%3D%22%2C%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

### 2. &nbsp; 配列による実装

配列でスタックを実装する場合、配列の末尾をスタックトップとして扱えます。下図のように、プッシュとポップはそれぞれ配列末尾への要素追加と削除に対応し、どちらの時間計算量も $O(1)$ です。

=== "<1>"
    ![配列によるスタック実装のプッシュ・ポップ操作](stack.assets/array_stack_step1.png){ class="animation-figure" }

=== "<2>"
    ![array_stack_push](stack.assets/array_stack_step2_push.png){ class="animation-figure" }

=== "<3>"
    ![array_stack_pop](stack.assets/array_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> 図 5-3 &nbsp; 配列によるスタック実装のプッシュ・ポップ操作 </p>

プッシュされる要素は際限なく増える可能性があるため、動的配列を使えば、配列の拡張を自前で処理する必要がありません。以下にコード例を示します：

=== "Python"

    ```python title="array_stack.py"
    class ArrayStack:
        """配列ベースのスタック"""

        def __init__(self):
            """コンストラクタ"""
            self._stack: list[int] = []

        def size(self) -> int:
            """スタックの長さを取得"""
            return len(self._stack)

        def is_empty(self) -> bool:
            """スタックが空かどうかを判定"""
            return self.size() == 0

        def push(self, item: int):
            """プッシュ"""
            self._stack.append(item)

        def pop(self) -> int:
            """ポップ"""
            if self.is_empty():
                raise IndexError("スタックが空です")
            return self._stack.pop()

        def peek(self) -> int:
            """スタックトップの要素にアクセス"""
            if self.is_empty():
                raise IndexError("スタックが空です")
            return self._stack[-1]

        def to_list(self) -> list[int]:
            """表示用のリストを返す"""
            return self._stack
    ```

=== "C++"

    ```cpp title="array_stack.cpp"
    /* 配列ベースのスタック */
    class ArrayStack {
      private:
        vector<int> stack;

      public:
        /* スタックの長さを取得 */
        int size() {
            return stack.size();
        }

        /* スタックが空かどうかを判定 */
        bool isEmpty() {
            return stack.size() == 0;
        }

        /* プッシュ */
        void push(int num) {
            stack.push_back(num);
        }

        /* ポップ */
        int pop() {
            int num = top();
            stack.pop_back();
            return num;
        }

        /* スタックトップの要素にアクセス */
        int top() {
            if (isEmpty())
                throw out_of_range("スタックが空です");
            return stack.back();
        }

        /* Vector を返す */
        vector<int> toVector() {
            return stack;
        }
    };
    ```

=== "Java"

    ```java title="array_stack.java"
    /* 配列ベースのスタック */
    class ArrayStack {
        private ArrayList<Integer> stack;

        public ArrayStack() {
            // リスト（動的配列）を初期化する
            stack = new ArrayList<>();
        }

        /* スタックの長さを取得 */
        public int size() {
            return stack.size();
        }

        /* スタックが空かどうかを判定 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* プッシュ */
        public void push(int num) {
            stack.add(num);
        }

        /* ポップ */
        public int pop() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.remove(size() - 1);
        }

        /* スタックトップの要素にアクセス */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.get(size() - 1);
        }

        /* List を Array に変換して返す */
        public Object[] toArray() {
            return stack.toArray();
        }
    }
    ```

=== "C#"

    ```csharp title="array_stack.cs"
    /* 配列ベースのスタック */
    class ArrayStack {
        List<int> stack;
        public ArrayStack() {
            // リスト（動的配列）を初期化する
            stack = [];
        }

        /* スタックの長さを取得 */
        public int Size() {
            return stack.Count;
        }

        /* スタックが空かどうかを判定 */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* プッシュ */
        public void Push(int num) {
            stack.Add(num);
        }

        /* ポップ */
        public int Pop() {
            if (IsEmpty())
                throw new Exception();
            var val = Peek();
            stack.RemoveAt(Size() - 1);
            return val;
        }

        /* スタックトップの要素にアクセス */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stack[Size() - 1];
        }

        /* List を Array に変換して返す */
        public int[] ToArray() {
            return [.. stack];
        }
    }
    ```

=== "Go"

    ```go title="array_stack.go"
    /* 配列ベースのスタック */
    type arrayStack struct {
        data []int // データ
    }

    /* スタックを初期化 */
    func newArrayStack() *arrayStack {
        return &arrayStack{
            // スタックの長さを 0、容量を 16 に設定
            data: make([]int, 0, 16),
        }
    }

    /* スタックの長さ */
    func (s *arrayStack) size() int {
        return len(s.data)
    }

    /* スタックが空かどうか */
    func (s *arrayStack) isEmpty() bool {
        return s.size() == 0
    }

    /* プッシュ */
    func (s *arrayStack) push(v int) {
        // スライスは自動で拡張される
        s.data = append(s.data, v)
    }

    /* ポップ */
    func (s *arrayStack) pop() any {
        val := s.peek()
        s.data = s.data[:len(s.data)-1]
        return val
    }

    /* スタックトップ要素を取得する */
    func (s *arrayStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        val := s.data[len(s.data)-1]
        return val
    }

    /* 表示用に Slice を取得 */
    func (s *arrayStack) toSlice() []int {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="array_stack.swift"
    /* 配列ベースのスタック */
    class ArrayStack {
        private var stack: [Int]

        init() {
            // リスト（動的配列）を初期化する
            stack = []
        }

        /* スタックの長さを取得 */
        func size() -> Int {
            stack.count
        }

        /* スタックが空かどうかを判定 */
        func isEmpty() -> Bool {
            stack.isEmpty
        }

        /* プッシュ */
        func push(num: Int) {
            stack.append(num)
        }

        /* ポップ */
        @discardableResult
        func pop() -> Int {
            if isEmpty() {
                fatalError("スタックが空です")
            }
            return stack.removeLast()
        }

        /* スタックトップの要素にアクセス */
        func peek() -> Int {
            if isEmpty() {
                fatalError("スタックが空です")
            }
            return stack.last!
        }

        /* List を Array に変換して返す */
        func toArray() -> [Int] {
            stack
        }
    }
    ```

=== "JS"

    ```javascript title="array_stack.js"
    /* 配列ベースのスタック */
    class ArrayStack {
        #stack;
        constructor() {
            this.#stack = [];
        }

        /* スタックの長さを取得 */
        get size() {
            return this.#stack.length;
        }

        /* スタックが空かどうかを判定 */
        isEmpty() {
            return this.#stack.length === 0;
        }

        /* プッシュ */
        push(num) {
            this.#stack.push(num);
        }

        /* ポップ */
        pop() {
            if (this.isEmpty()) throw new Error('スタックが空');
            return this.#stack.pop();
        }

        /* スタックトップの要素にアクセス */
        top() {
            if (this.isEmpty()) throw new Error('スタックが空');
            return this.#stack[this.#stack.length - 1];
        }

        /* Array を返す */
        toArray() {
            return this.#stack;
        }
    }
    ```

=== "TS"

    ```typescript title="array_stack.ts"
    /* 配列ベースのスタック */
    class ArrayStack {
        private stack: number[];
        constructor() {
            this.stack = [];
        }

        /* スタックの長さを取得 */
        get size(): number {
            return this.stack.length;
        }

        /* スタックが空かどうかを判定 */
        isEmpty(): boolean {
            return this.stack.length === 0;
        }

        /* プッシュ */
        push(num: number): void {
            this.stack.push(num);
        }

        /* ポップ */
        pop(): number | undefined {
            if (this.isEmpty()) throw new Error('スタックが空です');
            return this.stack.pop();
        }

        /* スタックトップの要素にアクセス */
        top(): number | undefined {
            if (this.isEmpty()) throw new Error('スタックが空です');
            return this.stack[this.stack.length - 1];
        }

        /* Array を返す */
        toArray() {
            return this.stack;
        }
    }
    ```

=== "Dart"

    ```dart title="array_stack.dart"
    /* 配列ベースのスタック */
    class ArrayStack {
      late List<int> _stack;
      ArrayStack() {
        _stack = [];
      }

      /* スタックの長さを取得 */
      int size() {
        return _stack.length;
      }

      /* スタックが空かどうかを判定 */
      bool isEmpty() {
        return _stack.isEmpty;
      }

      /* プッシュ */
      void push(int _num) {
        _stack.add(_num);
      }

      /* ポップ */
      int pop() {
        if (isEmpty()) {
          throw Exception("スタックが空です");
        }
        return _stack.removeLast();
      }

      /* スタックトップの要素にアクセス */
      int peek() {
        if (isEmpty()) {
          throw Exception("スタックが空です");
        }
        return _stack.last;
      }

      /* スタックを Array に変換して返す */
      List<int> toArray() => _stack;
    }
    ```

=== "Rust"

    ```rust title="array_stack.rs"
    /* 配列ベースのスタック */
    struct ArrayStack<T> {
        stack: Vec<T>,
    }

    impl<T> ArrayStack<T> {
        /* スタックを初期化 */
        fn new() -> ArrayStack<T> {
            ArrayStack::<T> {
                stack: Vec::<T>::new(),
            }
        }

        /* スタックの長さを取得 */
        fn size(&self) -> usize {
            self.stack.len()
        }

        /* スタックが空かどうかを判定 */
        fn is_empty(&self) -> bool {
            self.size() == 0
        }

        /* プッシュ */
        fn push(&mut self, num: T) {
            self.stack.push(num);
        }

        /* ポップ */
        fn pop(&mut self) -> Option<T> {
            self.stack.pop()
        }

        /* スタックトップの要素にアクセス */
        fn peek(&self) -> Option<&T> {
            if self.is_empty() {
                panic!("スタックが空です")
            };
            self.stack.last()
        }

        /* &Vec を返す */
        fn to_array(&self) -> &Vec<T> {
            &self.stack
        }
    }
    ```

=== "C"

    ```c title="array_stack.c"
    /* 配列ベースのスタック */
    typedef struct {
        int *data;
        int size;
    } ArrayStack;

    /* コンストラクタ */
    ArrayStack *newArrayStack() {
        ArrayStack *stack = malloc(sizeof(ArrayStack));
        // 大きめの容量で初期化し、拡張を避ける
        stack->data = malloc(sizeof(int) * MAX_SIZE);
        stack->size = 0;
        return stack;
    }

    /* デストラクタ */
    void delArrayStack(ArrayStack *stack) {
        free(stack->data);
        free(stack);
    }

    /* スタックの長さを取得 */
    int size(ArrayStack *stack) {
        return stack->size;
    }

    /* スタックが空かどうかを判定 */
    bool isEmpty(ArrayStack *stack) {
        return stack->size == 0;
    }

    /* プッシュ */
    void push(ArrayStack *stack, int num) {
        if (stack->size == MAX_SIZE) {
            printf("スタックは満杯です\n");
            return;
        }
        stack->data[stack->size] = num;
        stack->size++;
    }

    /* スタックトップの要素にアクセス */
    int peek(ArrayStack *stack) {
        if (stack->size == 0) {
            printf("スタックは空です\n");
            return INT_MAX;
        }
        return stack->data[stack->size - 1];
    }

    /* ポップ */
    int pop(ArrayStack *stack) {
        int val = peek(stack);
        stack->size--;
        return val;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_stack.kt"
    /* 配列ベースのスタック */
    class ArrayStack {
        // リスト（動的配列）を初期化する
        private val stack = mutableListOf<Int>()

        /* スタックの長さを取得 */
        fun size(): Int {
            return stack.size
        }

        /* スタックが空かどうかを判定 */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* プッシュ */
        fun push(num: Int) {
            stack.add(num)
        }

        /* ポップ */
        fun pop(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack.removeAt(size() - 1)
        }

        /* スタックトップの要素にアクセス */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack[size() - 1]
        }

        /* List を Array に変換して返す */
        fun toArray(): Array<Any> {
            return stack.toTypedArray()
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_stack.rb"
    ### 配列で実装したスタック ###
    class ArrayStack
      ### コンストラクタ ###
      def initialize
        @stack = []
      end

      ### スタックの長さを取得 ###
      def size
        @stack.length
      end

      ### スタックが空か判定 ###
      def is_empty?
        @stack.empty?
      end

      ### プッシュ ###
      def push(item)
        @stack << item
      end

      ### ポップ ###
      def pop
        raise IndexError, 'スタックは空です' if is_empty?

        @stack.pop
      end

      ### スタックトップ要素を参照 ###
      def peek
        raise IndexError, 'スタックは空です' if is_empty?

        @stack.last
      end

      ### 表示用のリストを返す ###
      def to_array
        @stack
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22%E9%85%8D%E5%88%97%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self%2C%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%9D%E3%83%83%E3%83%97%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E7%A4%BA%E7%94%A8%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E8%A6%81%E7%B4%A0%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E5%BE%8C%20stack%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%20%3D%22%2C%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22%E9%85%8D%E5%88%97%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self%2C%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%9D%E3%83%83%E3%83%97%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E7%A4%BA%E7%94%A8%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E8%A6%81%E7%B4%A0%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E5%BE%8C%20stack%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%20%3D%22%2C%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

## 5.1.3 &nbsp; 2つの実装の比較

**対応する操作**

どちらの実装も、スタックの定義に含まれる各種操作をサポートします。配列ベースの実装はランダムアクセスも可能ですが、これはスタックの定義範囲を超えているため、通常は利用しません。

**時間効率**

配列ベースの実装では、プッシュとポップの両方があらかじめ確保された連続メモリ上で行われるため、キャッシュ局所性が高く、効率に優れます。ただし、プッシュ時に配列容量を超えると拡張処理が発生し、その1回のプッシュの時間計算量は $O(n)$ になります。

連結リストベースの実装では、サイズ拡張が非常に柔軟であり、前述のような配列拡張による効率低下はありません。ただし、プッシュ時にはノードオブジェクトの初期化とポインタの更新が必要になるため、効率は相対的に低くなります。もっとも、プッシュする要素自体がノードオブジェクトであれば、初期化の手間を省けるため、効率を高められます。

以上を踏まえると、プッシュおよびポップの対象が `int` や `double` のような基本データ型である場合、次の結論が得られます。

- 配列ベースのスタックは拡張時に効率が低下しますが、拡張は低頻度の操作であるため、平均効率はより高くなります。
- 連結リストベースのスタックは、より安定した効率を提供できます。

**空間効率**

リストを初期化するとき、システムは「初期容量」を割り当てますが、この容量は実際の必要量を上回ることがあります。また、拡張は通常、一定の倍率（たとえば2倍）で行われるため、拡張後の容量も実際の必要量を超える可能性があります。したがって、**配列ベースのスタックは一定のメモリ浪費を招く可能性があります。**

一方で、連結リストのノードはポインタを追加で保持する必要があるため、**連結リストノードは相対的に大きな領域を占有します。**

以上より、どちらの実装がより省メモリかを単純に断定することはできず、具体的な状況に応じて分析する必要があります。

## 5.1.4 &nbsp; スタックの典型的な応用

- **ブラウザにおける戻ると進む、ソフトウェアにおける取り消しとやり直し**。新しいWebページを開くたびに、ブラウザは直前のページをスタックにプッシュするため、戻る操作によって前のページに戻れます。戻る操作は実際にはポップに相当します。戻ると進むを同時にサポートするには、2つのスタックを組み合わせて実現する必要があります。
- **プログラムのメモリ管理**。関数を呼び出すたびに、システムはスタックトップにスタックフレームを追加し、関数のコンテキスト情報を記録します。再帰関数では、下向きに再帰していく段階でプッシュが繰り返され、上向きにバックトラックする段階でポップが繰り返されます。
