---
comments: true
---

# 5.1 &nbsp; スタック

<u>スタック（stack）</u>は、先入れ後出しの規則に従う線形データ構造です。

机の上に重ねた皿に例えられます。一度に一枚しか動かせないなら、一番下の皿を取るには、上の皿から順に取り除く必要があります。皿を整数、文字、オブジェクトなどの要素に置き換えると、スタックというデータ構造になります。

図 5-1 のように、積み重ねた要素の上端を「スタックの先頭」、下端を「底」と呼びます。先頭に要素を追加する操作を「プッシュ」、先頭要素を削除する操作を「ポップ」と呼びます。

![スタックの先入れ後出しの規則](stack.assets/stack_operations.png){ class="animation-figure" }

<p align="center"> 図 5-1 &nbsp; スタックの先入れ後出しの規則 </p>

## 5.1.1 &nbsp; スタックの主な操作

主な操作を表 5-1 に示します。具体的なメソッド名は言語によりますが、ここでは一般的な `push()`、`pop()`、`peek()` を例にします。

<p align="center"> 表 5-1 &nbsp; スタックの操作効率 </p>

<div class="center-table" markdown>

| メソッド     | 説明                   | 時間計算量 |
| -------- | ---------------------- | ---------- |
| `push()` | 要素をプッシュする（先頭に追加） | $O(1)$     |
| `pop()`  | 先頭要素をポップする           | $O(1)$     |
| `peek()` | 先頭要素にアクセスする           | $O(1)$     |

</div>

通常は、言語に組み込まれたスタッククラスをそのまま使えます。専用クラスがない言語では、配列や連結リストをスタックとして使い、スタックに関係しない操作をプログラムの論理上使わないようにします。

=== "Python"

    ```python title="stack.py"
    # スタックを初期化
    # Python には組み込みのスタッククラスがないため、list をスタックとして使える
    stack: list[int] = []

    # 要素をプッシュ
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    # スタックの先頭要素にアクセス
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

    /* スタックの先頭要素にアクセス */
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

    /* スタックの先頭要素にアクセス */
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

    /* スタックの先頭要素にアクセス */
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
    // Go では Slice をスタックとして使うことを推奨
    var stack []int

    /* 要素をプッシュ */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)

    /* スタックの先頭要素にアクセス */
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
    // Swift には組み込みのスタッククラスがないため、Array をスタックとして使える
    var stack: [Int] = []

    /* 要素をプッシュ */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    /* スタックの先頭要素にアクセス */
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
    // JavaScript には組み込みのスタッククラスがないため、Array をスタックとして使える
    const stack = [];

    /* 要素をプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックの先頭要素にアクセス */
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
    // TypeScript には組み込みのスタッククラスがないため、Array をスタックとして使える
    const stack: number[] = [];

    /* 要素をプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックの先頭要素にアクセス */
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
    // Dart には組み込みのスタッククラスがないため、List をスタックとして使える
    List<int> stack = [];

    /* 要素をプッシュ */
    stack.add(1);
    stack.add(3);
    stack.add(2);
    stack.add(5);
    stack.add(4);

    /* スタックの先頭要素にアクセス */
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
    // Vec をスタックとして使う
    let mut stack: Vec<i32> = Vec::new();

    /* 要素をプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックの先頭要素にアクセス */
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

    /* スタックの先頭要素にアクセス */
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
    # Ruby には組み込みのスタッククラスがないため、Array をスタックとして使える
    stack = []

    # 要素をプッシュ
    stack << 1
    stack << 3
    stack << 2
    stack << 5
    stack << 4

    # スタックの先頭要素にアクセス
    peek = stack.last

    # 要素をポップ
    pop = stack.pop

    # スタックの長さを取得
    size = stack.length

    # 空かどうかを判定
    is_empty = stack.empty?
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20Python%20%E3%81%AB%E3%81%AF%E7%B5%84%E3%81%BF%E8%BE%BC%E3%81%BF%E3%81%AE%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%8C%E3%81%AA%E3%81%84%E3%81%9F%E3%82%81%E3%80%81list%20%E3%82%92%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%A8%E3%81%97%E3%81%A6%E4%BD%BF%E3%81%88%E3%82%8B%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%0A%20%20%20%20stack.append(1)%0A%20%20%20%20stack.append(3)%0A%20%20%20%20stack.append(2)%0A%20%20%20%20stack.append(5)%0A%20%20%20%20stack.append(4)%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22%2C%20stack)%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20peek%20%3D%22%2C%20peek)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%0A%20%20%20%20pop%20%3D%20stack.pop()%0A%20%20%20%20print(%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22%2C%20pop)%0A%20%20%20%20print(%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20stack%20%3D%22%2C%20stack)%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(stack)%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size)%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len(stack)%20%3D%3D%200%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22%2C%20is_empty)&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=2&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20Python%20%E3%81%AB%E3%81%AF%E7%B5%84%E3%81%BF%E8%BE%BC%E3%81%BF%E3%81%AE%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%8C%E3%81%AA%E3%81%84%E3%81%9F%E3%82%81%E3%80%81list%20%E3%82%92%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%A8%E3%81%97%E3%81%A6%E4%BD%BF%E3%81%88%E3%82%8B%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%0A%20%20%20%20stack.append(1)%0A%20%20%20%20stack.append(3)%0A%20%20%20%20stack.append(2)%0A%20%20%20%20stack.append(5)%0A%20%20%20%20stack.append(4)%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22%2C%20stack)%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20peek%20%3D%22%2C%20peek)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%0A%20%20%20%20pop%20%3D%20stack.pop()%0A%20%20%20%20print(%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22%2C%20pop)%0A%20%20%20%20print(%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20stack%20%3D%22%2C%20stack)%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(stack)%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size)%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len(stack)%20%3D%3D%200%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22%2C%20is_empty)&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=2&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 5.1.2 &nbsp; スタックの実装

動作の仕組みを深く理解するため、スタッククラスを自分で実装してみましょう。

スタックは先入れ後出しなので、要素の追加と削除は先頭でしかできません。一方、配列や連結リストは任意の位置で追加や削除ができるため、**スタックは制限を加えた配列や連結リストと見なせます**。つまり、不要な操作を使えなくすることで、外から見た動作をスタックの性質に合わせられます。

### 1. &nbsp; 連結リストによる実装

連結リストを使う場合、先頭ノードをスタックの先頭、末尾ノードを底と見なせます。

図 5-2 のように、プッシュではリストの先頭へ要素を挿入するだけです。この方法を「先頭挿入」と呼びます。ポップでは、先頭ノードをリストから削除するだけです。

=== "<1>"
    ![連結リストによるスタックのプッシュとポップ](stack.assets/linkedlist_stack_step1.png){ class="animation-figure" }

=== "<2>"
    ![連結リストによるスタック：要素の挿入](stack.assets/linkedlist_stack_step2_push.png){ class="animation-figure" }

=== "<3>"
    ![連結リストによるスタック：要素の取り出し](stack.assets/linkedlist_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> 図 5-2 &nbsp; 連結リストによるスタックのプッシュとポップ </p>

連結リストによる実装例を示します。

=== "Python"

    ```python title="linkedlist_stack.py"
    class LinkedListStack:
        """連結リストで実装したスタック"""

        def __init__(self):
            """コンストラクタ"""
            self._peek: ListNode | None = None
            self._size: int = 0

        def size(self) -> int:
            """スタックの長さを取得する"""
            return self._size

        def is_empty(self) -> bool:
            """スタックが空かどうかを判定する"""
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
            """スタックの先頭要素にアクセスする"""
            if self.is_empty():
                raise IndexError("スタックが空です")
            return self._peek.val

        def to_list(self) -> list[int]:
            """表示用のリストに変換する"""
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
    /* 連結リストで実装したスタック */
    class LinkedListStack {
      private:
        ListNode *stackTop; // 先頭ノードをスタックの先頭とする
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

        /* スタックの長さを取得する */
        int size() {
            return stkSize;
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 連結リストで実装したスタック */
    class LinkedListStack {
        private ListNode stackPeek; // 先頭ノードをスタックの先頭とする
        private int stkSize = 0; // スタックの長さ

        public LinkedListStack() {
            stackPeek = null;
        }

        /* スタックの長さを取得する */
        public int size() {
            return stkSize;
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 連結リストで実装したスタック */
    class LinkedListStack {
        ListNode? stackPeek;  // 先頭ノードをスタックの先頭とする
        int stkSize = 0;   // スタックの長さ

        public LinkedListStack() {
            stackPeek = null;
        }

        /* スタックの長さを取得する */
        public int Size() {
            return stkSize;
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 連結リストで実装したスタック */
    type linkedListStack struct {
        // 組み込みパッケージ list でスタックを実装する
        data *list.List
    }

    /* スタックを初期化する */
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

    /* スタックの先頭要素にアクセスする */
    func (s *linkedListStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* スタックの長さを取得する */
    func (s *linkedListStack) size() int {
        return s.data.Len()
    }

    /* スタックが空かどうかを判定する */
    func (s *linkedListStack) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* 表示用の List を取得する */
    func (s *linkedListStack) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_stack.swift"
    /* 連結リストで実装したスタック */
    class LinkedListStack {
        private var _peek: ListNode? // 先頭ノードをスタックの先頭とする
        private var _size: Int // スタックの長さ

        init() {
            _size = 0
        }

        /* スタックの長さを取得する */
        func size() -> Int {
            _size
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 連結リストで実装したスタック */
    class LinkedListStack {
        #stackPeek; // 先頭ノードをスタックの先頭とする
        #stkSize = 0; // スタックの長さ

        constructor() {
            this.#stackPeek = null;
        }

        /* スタックの長さを取得する */
        get size() {
            return this.#stkSize;
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
        peek() {
            if (!this.#stackPeek) throw new Error('スタックが空です');
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
    /* 連結リストで実装したスタック */
    class LinkedListStack {
        private stackPeek: ListNode | null; // 先頭ノードをスタックの先頭とする
        private stkSize: number = 0; // スタックの長さ

        constructor() {
            this.stackPeek = null;
        }

        /* スタックの長さを取得する */
        get size(): number {
            return this.stkSize;
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 連結リストクラスで実装したスタック */
    class LinkedListStack {
      ListNode? _stackPeek; // 先頭ノードをスタックの先頭とする
      int _stkSize = 0; // スタックの長さ

      LinkedListStack() {
        _stackPeek = null;
      }

      /* スタックの長さを取得する */
      int size() {
        return _stkSize;
      }

      /* スタックが空かどうかを判定する */
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

      /* スタックの先頭要素にアクセスする */
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
    /* 連結リストで実装したスタック */
    #[allow(dead_code)]
    pub struct LinkedListStack<T> {
        stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // 先頭ノードをスタックの先頭とする
        stk_size: usize,                              // スタックの長さ
    }

    impl<T: Copy> LinkedListStack<T> {
        pub fn new() -> Self {
            Self {
                stack_peek: None,
                stk_size: 0,
            }
        }

        /* スタックの長さを取得する */
        pub fn size(&self) -> usize {
            return self.stk_size;
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 連結リストで実装したスタック */
    typedef struct {
        ListNode *top; // 先頭ノードをスタックの先頭とする
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

    /* スタックの長さを取得する */
    int size(LinkedListStack *s) {
        return s->size;
    }

    /* スタックが空かどうかを判定する */
    bool isEmpty(LinkedListStack *s) {
        return size(s) == 0;
    }

    /* プッシュ */
    void push(LinkedListStack *s, int num) {
        ListNode *node = (ListNode *)malloc(sizeof(ListNode));
        node->next = s->top; // 追加するノードのポインタ領域を更新する
        node->val = num;     // 追加するノードのデータ領域を更新する
        s->top = node;       // スタックの先頭を更新する
        s->size++;           // スタックのサイズを更新する
    }

    /* スタックの先頭要素にアクセスする */
    int peek(LinkedListStack *s) {
        if (s->size == 0) {
            printf("スタックが空です\n");
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
    /* 連結リストで実装したスタック */
    class LinkedListStack(
        private var stackPeek: ListNode? = null, // 先頭ノードをスタックの先頭とする
        private var stkSize: Int = 0 // スタックの長さ
    ) {

        /* スタックの長さを取得する */
        fun size(): Int {
            return stkSize
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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

      ### スタックが空かどうかを判定する ###
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

      ### スタックの先頭要素にアクセスする ###
      def peek
        raise IndexError, 'スタックが空です' if is_empty?

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

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B6%9A%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%0Aclass%20LinkedListStack%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%97%E3%81%9F%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%9D%E3%83%83%E3%83%97%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E7%A4%BA%E7%94%A8%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E5%A4%89%E6%8F%9B%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%E3%81%99%E3%82%8B%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%E3%81%99%E3%82%8B%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E5%BE%8C%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%BE%8C%E7%B6%9A%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%0Aclass%20LinkedListStack%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%97%E3%81%9F%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%9D%E3%83%83%E3%83%97%22%22%22%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E7%A4%BA%E7%94%A8%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E5%A4%89%E6%8F%9B%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%E3%81%99%E3%82%8B%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%E3%81%99%E3%82%8B%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E5%BE%8C%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 2. &nbsp; 配列による実装

配列を使う場合、配列の末尾をスタックの先頭にできます。図 5-3 のように、プッシュとポップは配列末尾への追加と削除に対応し、どちらも時間計算量は $O(1)$ です。

=== "<1>"
    ![配列によるスタックのプッシュとポップ](stack.assets/array_stack_step1.png){ class="animation-figure" }

=== "<2>"
    ![配列によるスタック：要素の挿入](stack.assets/array_stack_step2_push.png){ class="animation-figure" }

=== "<3>"
    ![配列によるスタック：要素の取り出し](stack.assets/array_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> 図 5-3 &nbsp; 配列によるスタックのプッシュとポップ </p>

プッシュする要素が増え続ける可能性があるため、動的配列を使うと、容量拡張を自分で処理せずに済みます。コード例を示します。

=== "Python"

    ```python title="array_stack.py"
    class ArrayStack:
        """配列で実装したスタック"""

        def __init__(self):
            """コンストラクタ"""
            self._stack: list[int] = []

        def size(self) -> int:
            """スタックの長さを取得する"""
            return len(self._stack)

        def is_empty(self) -> bool:
            """スタックが空かどうかを判定する"""
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
            """スタックの先頭要素にアクセスする"""
            if self.is_empty():
                raise IndexError("スタックが空です")
            return self._stack[-1]

        def to_list(self) -> list[int]:
            """表示用のリストを返す"""
            return self._stack
    ```

=== "C++"

    ```cpp title="array_stack.cpp"
    /* 配列で実装したスタック */
    class ArrayStack {
      private:
        vector<int> stack;

      public:
        /* スタックの長さを取得する */
        int size() {
            return stack.size();
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 配列で実装したスタック */
    class ArrayStack {
        private ArrayList<Integer> stack;

        public ArrayStack() {
            // リスト（動的配列）を初期化する
            stack = new ArrayList<>();
        }

        /* スタックの長さを取得する */
        public int size() {
            return stack.size();
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 配列で実装したスタック */
    class ArrayStack {
        List<int> stack;
        public ArrayStack() {
            // リスト（動的配列）を初期化する
            stack = [];
        }

        /* スタックの長さを取得する */
        public int Size() {
            return stack.Count;
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 配列で実装したスタック */
    type arrayStack struct {
        data []int // データ
    }

    /* スタックを初期化する */
    func newArrayStack() *arrayStack {
        return &arrayStack{
            // スタックの長さを 0、容量を 16 に設定する
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
        // スライスの容量は自動で拡張される
        s.data = append(s.data, v)
    }

    /* ポップ */
    func (s *arrayStack) pop() any {
        val := s.peek()
        s.data = s.data[:len(s.data)-1]
        return val
    }

    /* スタックの先頭要素を取得する */
    func (s *arrayStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        val := s.data[len(s.data)-1]
        return val
    }

    /* 表示用の Slice を取得する */
    func (s *arrayStack) toSlice() []int {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="array_stack.swift"
    /* 配列で実装したスタック */
    class ArrayStack {
        private var stack: [Int]

        init() {
            // リスト（動的配列）を初期化する
            stack = []
        }

        /* スタックの長さを取得する */
        func size() -> Int {
            stack.count
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 配列で実装したスタック */
    class ArrayStack {
        #stack;
        constructor() {
            this.#stack = [];
        }

        /* スタックの長さを取得する */
        get size() {
            return this.#stack.length;
        }

        /* スタックが空かどうかを判定する */
        isEmpty() {
            return this.#stack.length === 0;
        }

        /* プッシュ */
        push(num) {
            this.#stack.push(num);
        }

        /* ポップ */
        pop() {
            if (this.isEmpty()) throw new Error('スタックが空です');
            return this.#stack.pop();
        }

        /* スタックの先頭要素にアクセスする */
        top() {
            if (this.isEmpty()) throw new Error('スタックが空です');
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
    /* 配列で実装したスタック */
    class ArrayStack {
        private stack: number[];
        constructor() {
            this.stack = [];
        }

        /* スタックの長さを取得する */
        get size(): number {
            return this.stack.length;
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 配列で実装したスタック */
    class ArrayStack {
      late List<int> _stack;
      ArrayStack() {
        _stack = [];
      }

      /* スタックの長さを取得する */
      int size() {
        return _stack.length;
      }

      /* スタックが空かどうかを判定する */
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

      /* スタックの先頭要素にアクセスする */
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
    /* 配列で実装したスタック */
    struct ArrayStack<T> {
        stack: Vec<T>,
    }

    impl<T> ArrayStack<T> {
        /* スタックを初期化する */
        fn new() -> ArrayStack<T> {
            ArrayStack::<T> {
                stack: Vec::<T>::new(),
            }
        }

        /* スタックの長さを取得する */
        fn size(&self) -> usize {
            self.stack.len()
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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
    /* 配列で実装したスタック */
    typedef struct {
        int *data;
        int size;
    } ArrayStack;

    /* コンストラクタ */
    ArrayStack *newArrayStack() {
        ArrayStack *stack = malloc(sizeof(ArrayStack));
        // 容量の拡張を避けるため、初期容量を大きくする
        stack->data = malloc(sizeof(int) * MAX_SIZE);
        stack->size = 0;
        return stack;
    }

    /* デストラクタ */
    void delArrayStack(ArrayStack *stack) {
        free(stack->data);
        free(stack);
    }

    /* スタックの長さを取得する */
    int size(ArrayStack *stack) {
        return stack->size;
    }

    /* スタックが空かどうかを判定する */
    bool isEmpty(ArrayStack *stack) {
        return stack->size == 0;
    }

    /* プッシュ */
    void push(ArrayStack *stack, int num) {
        if (stack->size == MAX_SIZE) {
            printf("スタックが満杯です\n");
            return;
        }
        stack->data[stack->size] = num;
        stack->size++;
    }

    /* スタックの先頭要素にアクセスする */
    int peek(ArrayStack *stack) {
        if (stack->size == 0) {
            printf("スタックが空です\n");
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
    /* 配列で実装したスタック */
    class ArrayStack {
        // リスト（動的配列）を初期化する
        private val stack = mutableListOf<Int>()

        /* スタックの長さを取得する */
        fun size(): Int {
            return stack.size
        }

        /* スタックが空かどうかを判定する */
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

        /* スタックの先頭要素にアクセスする */
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

      ### スタックの長さを取得する ###
      def size
        @stack.length
      end

      ### スタックが空かどうかを判定する ###
      def is_empty?
        @stack.empty?
      end

      ### プッシュ ###
      def push(item)
        @stack << item
      end

      ### ポップ ###
      def pop
        raise IndexError, 'スタックが空です' if is_empty?

        @stack.pop
      end

      ### スタックの先頭要素にアクセスする ###
      def peek
        raise IndexError, 'スタックが空です' if is_empty?

        @stack.last
      end

      ### 表示用のリストを返す ###
      def to_array
        @stack
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22%E9%85%8D%E5%88%97%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%97%E3%81%9F%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self,%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%9D%E3%83%83%E3%83%97%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E7%A4%BA%E7%94%A8%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%E3%81%99%E3%82%8B%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%E3%81%99%E3%82%8B%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E5%BE%8C%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22%E9%85%8D%E5%88%97%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%97%E3%81%9F%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self,%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%9D%E3%83%83%E3%83%97%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A1%A8%E7%A4%BA%E7%94%A8%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E8%BF%94%E3%81%99%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%E3%81%99%E3%82%8B%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%E3%81%99%E3%82%8B%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E3%83%9D%E3%83%83%E3%83%97%E5%BE%8C%20stack%20%3D%22,%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 5.1.3 &nbsp; 二つの実装の比較

**対応する操作**

どちらもスタックで定義された操作をすべて実現できます。配列の実装はランダムアクセスにも対応しますが、スタックの定義を超えるため、通常は使いません。

**時間効率**

配列の実装では、プッシュとポップは確保済みの連続したメモリ上で行われます。キャッシュの局所性がよいため、効率が高くなります。ただし、プッシュで容量を超えると拡張が発生し、その一回の時間計算量は $O(n)$ になります。

連結リストは柔軟に拡張できるため、配列の容量拡張による効率低下はありません。ただし、プッシュ時にノードの初期化とポインタの変更が必要なので、効率は比較的低くなります。要素自体がノードオブジェクトなら、初期化を省いて効率を高められます。

以上より、`int` や `double` などの基本データ型をプッシュ・ポップする場合、次のように結論付けられます。

- 配列によるスタックは、拡張時に効率が下がるものの、その頻度は低いため、平均的な効率は高くなります。
- 連結リストによるスタックは、より安定した効率を提供できます。

**空間効率**

リストを初期化すると、実際の必要量を超える場合がある初期容量が割り当てられます。また、拡張は通常、2 倍など一定の倍率で行うため、拡張後も必要量を超える可能性があります。したがって、**配列によるスタックでは、ある程度の領域が無駄になる場合があります**。

一方、連結リストのノードはポインタも格納するため、**一つのノードが使う領域は比較的大きくなります**。

どちらがメモリを節約できるかは一概に決められず、具体的な状況を分析する必要があります。

## 5.1.4 &nbsp; スタックの代表的な用途

- **ブラウザの戻る・進む、ソフトウェアの元に戻す・やり直す**。新しいページを開くたびに、ブラウザは前のページをプッシュします。戻る操作で前のページに戻るときは、実際にはポップを行っています。戻ると進むの両方に対応するには、二つのスタックを組み合わせます。
- **プログラムのメモリ管理**。関数を呼ぶたびに、システムはスタックの先頭にスタックフレームを追加し、関数の実行状況を記録します。再帰関数では、呼び出しを深める段階でプッシュを繰り返し、戻る段階でポップを繰り返します。
