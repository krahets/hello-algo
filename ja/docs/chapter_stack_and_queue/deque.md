---
comments: true
---

# 5.3 &nbsp; 両端キュー

キューでは、先頭要素の削除と末尾への追加しかできません。図 5-7 の<u>両端キュー（double-ended queue）</u>は、先頭と末尾の両方で追加・削除ができ、より柔軟です。

![両端キューの操作](deque.assets/deque_operations.png){ class="animation-figure" }

<p align="center"> 図 5-7 &nbsp; 両端キューの操作 </p>

## 5.3.1 &nbsp; 両端キューの主な操作

主な操作を表 5-3 に示します。具体的なメソッド名は、使う言語によって異なります。

<p align="center"> 表 5-3 &nbsp; 両端キューの操作効率 </p>

<div class="center-table" markdown>

| メソッド名         | 説明             | 時間計算量 |
| -------------- | ---------------- | ---------- |
| `push_first()` | 先頭に要素を追加 | $O(1)$     |
| `push_last()`  | 末尾に要素を追加 | $O(1)$     |
| `pop_first()`  | 先頭要素を削除     | $O(1)$     |
| `pop_last()`   | 末尾要素を削除     | $O(1)$     |
| `peek_first()` | 先頭要素にアクセス     | $O(1)$     |
| `peek_last()`  | 末尾要素にアクセス     | $O(1)$     |

</div>

同様に、言語が用意する両端キュークラスをそのまま利用できます。

=== "Python"

    ```python title="deque.py"
    from collections import deque

    # 両端キューを初期化
    deq: deque[int] = deque()

    # 要素をエンキュー
    deq.append(2)      # 末尾に追加
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # 先頭に追加
    deq.appendleft(1)

    # 要素にアクセス
    front: int = deq[0]  # 先頭要素
    rear: int = deq[-1]  # 末尾要素

    # 要素をデキュー
    pop_front: int = deq.popleft()  # 先頭要素を取り出す
    pop_rear: int = deq.pop()       # 末尾要素を取り出す

    # 両端キューの長さを取得
    size: int = len(deq)

    # 両端キューが空かどうかを判定
    is_empty: bool = len(deq) == 0
    ```

=== "C++"

    ```cpp title="deque.cpp"
    /* 両端キューを初期化 */
    deque<int> deque;

    /* 要素をエンキュー */
    deque.push_back(2);   // 末尾に追加
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);  // 先頭に追加
    deque.push_front(1);

    /* 要素にアクセス */
    int front = deque.front(); // 先頭要素
    int back = deque.back();   // 末尾要素

    /* 要素をデキュー */
    deque.pop_front();  // 先頭要素を取り出す
    deque.pop_back();   // 末尾要素を取り出す

    /* 両端キューの長さを取得 */
    int size = deque.size();

    /* 両端キューが空かどうかを判定 */
    bool empty = deque.empty();
    ```

=== "Java"

    ```java title="deque.java"
    /* 両端キューを初期化 */
    Deque<Integer> deque = new LinkedList<>();

    /* 要素をエンキュー */
    deque.offerLast(2);   // 末尾に追加
    deque.offerLast(5);
    deque.offerLast(4);
    deque.offerFirst(3);  // 先頭に追加
    deque.offerFirst(1);

    /* 要素にアクセス */
    int peekFirst = deque.peekFirst();  // 先頭要素
    int peekLast = deque.peekLast();    // 末尾要素

    /* 要素をデキュー */
    int popFirst = deque.pollFirst();  // 先頭要素を取り出す
    int popLast = deque.pollLast();    // 末尾要素を取り出す

    /* 両端キューの長さを取得 */
    int size = deque.size();

    /* 両端キューが空かどうかを判定 */
    boolean isEmpty = deque.isEmpty();
    ```

=== "C#"

    ```csharp title="deque.cs"
    /* 両端キューを初期化 */
    // C# では LinkedList を両端キューとして使う
    LinkedList<int> deque = new();

    /* 要素をエンキュー */
    deque.AddLast(2);   // 末尾に追加
    deque.AddLast(5);
    deque.AddLast(4);
    deque.AddFirst(3);  // 先頭に追加
    deque.AddFirst(1);

    /* 要素にアクセス */
    int peekFirst = deque.First.Value;  // 先頭要素
    int peekLast = deque.Last.Value;    // 末尾要素

    /* 要素をデキュー */
    deque.RemoveFirst();  // 先頭要素を取り出す
    deque.RemoveLast();   // 末尾要素を取り出す

    /* 両端キューの長さを取得 */
    int size = deque.Count;

    /* 両端キューが空かどうかを判定 */
    bool isEmpty = deque.Count == 0;
    ```

=== "Go"

    ```go title="deque_test.go"
    /* 両端キューを初期化 */
    // Go では list を両端キューとして使う
    deque := list.New()

    /* 要素をエンキュー */
    deque.PushBack(2)      // 末尾に追加
    deque.PushBack(5)
    deque.PushBack(4)
    deque.PushFront(3)     // 先頭に追加
    deque.PushFront(1)

    /* 要素にアクセス */
    front := deque.Front() // 先頭要素
    rear := deque.Back()   // 末尾要素

    /* 要素をデキュー */
    deque.Remove(front)    // 先頭要素を取り出す
    deque.Remove(rear)     // 末尾要素を取り出す

    /* 両端キューの長さを取得 */
    size := deque.Len()

    /* 両端キューが空かどうかを判定 */
    isEmpty := deque.Len() == 0
    ```

=== "Swift"

    ```swift title="deque.swift"
    /* 両端キューを初期化 */
    // Swift には組み込みの両端キュークラスがないため、Array を両端キューとして使える
    var deque: [Int] = []

    /* 要素をエンキュー */
    deque.append(2) // 末尾に追加
    deque.append(5)
    deque.append(4)
    deque.insert(3, at: 0) // 先頭に追加
    deque.insert(1, at: 0)

    /* 要素にアクセス */
    let peekFirst = deque.first! // 先頭要素
    let peekLast = deque.last! // 末尾要素

    /* 要素をデキュー */
    // Array で代用する場合、popFirst の計算量は O(n)
    let popFirst = deque.removeFirst() // 先頭要素を取り出す
    let popLast = deque.removeLast() // 末尾要素を取り出す

    /* 両端キューの長さを取得 */
    let size = deque.count

    /* 両端キューが空かどうかを判定 */
    let isEmpty = deque.isEmpty
    ```

=== "JS"

    ```javascript title="deque.js"
    /* 両端キューを初期化 */
    // JavaScript には組み込みの両端キューがないため、Array で代用する必要がある
    const deque = [];

    /* 要素をエンキュー */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // 配列なので unshift() の時間計算量は O(n) であることに注意
    deque.unshift(3);
    deque.unshift(1);

    /* 要素にアクセス */
    const peekFirst = deque[0];
    const peekLast = deque[deque.length - 1];

    /* 要素をデキュー */
    // 配列なので shift() の時間計算量は O(n) であることに注意
    const popFront = deque.shift();
    const popBack = deque.pop();

    /* 両端キューの長さを取得 */
    const size = deque.length;

    /* 両端キューが空かどうかを判定 */
    const isEmpty = size === 0;
    ```

=== "TS"

    ```typescript title="deque.ts"
    /* 両端キューを初期化 */
    // TypeScript には組み込みの両端キューがないため、Array で代用する必要がある
    const deque: number[] = [];

    /* 要素をエンキュー */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // 配列なので unshift() の時間計算量は O(n) であることに注意
    deque.unshift(3);
    deque.unshift(1);

    /* 要素にアクセス */
    const peekFirst: number = deque[0];
    const peekLast: number = deque[deque.length - 1];

    /* 要素をデキュー */
    // 配列なので shift() の時間計算量は O(n) であることに注意
    const popFront: number = deque.shift() as number;
    const popBack: number = deque.pop() as number;

    /* 両端キューの長さを取得 */
    const size: number = deque.length;

    /* 両端キューが空かどうかを判定 */
    const isEmpty: boolean = size === 0;
    ```

=== "Dart"

    ```dart title="deque.dart"
    /* 両端キューを初期化 */
    // Dart では Queue は両端キューとして定義されている
    Queue<int> deque = Queue<int>();

    /* 要素をエンキュー */
    deque.addLast(2);  // 末尾に追加
    deque.addLast(5);
    deque.addLast(4);
    deque.addFirst(3); // 先頭に追加
    deque.addFirst(1);

    /* 要素にアクセス */
    int peekFirst = deque.first; // 先頭要素
    int peekLast = deque.last;   // 末尾要素

    /* 要素をデキュー */
    int popFirst = deque.removeFirst(); // 先頭要素を取り出す
    int popLast = deque.removeLast();   // 末尾要素を取り出す

    /* 両端キューの長さを取得 */
    int size = deque.length;

    /* 両端キューが空かどうかを判定 */
    bool isEmpty = deque.isEmpty;
    ```

=== "Rust"

    ```rust title="deque.rs"
    /* 両端キューを初期化 */
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* 要素をエンキュー */
    deque.push_back(2);  // 末尾に追加
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // 先頭に追加
    deque.push_front(1);

    /* 要素にアクセス */
    if let Some(front) = deque.front() { // 先頭要素
    }
    if let Some(rear) = deque.back() {   // 末尾要素
    }

    /* 要素をデキュー */
    if let Some(pop_front) = deque.pop_front() { // 先頭要素を取り出す
    }
    if let Some(pop_rear) = deque.pop_back() {   // 末尾要素を取り出す
    }

    /* 両端キューの長さを取得 */
    let size = deque.len();

    /* 両端キューが空かどうかを判定 */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="deque.c"
    // C には組み込みの両端キューがない
    ```

=== "Kotlin"

    ```kotlin title="deque.kt"
    /* 両端キューを初期化 */
    val deque = LinkedList<Int>()

    /* 要素をエンキュー */
    deque.offerLast(2)  // 末尾に追加
    deque.offerLast(5)
    deque.offerLast(4)
    deque.offerFirst(3) // 先頭に追加
    deque.offerFirst(1)

    /* 要素にアクセス */
    val peekFirst = deque.peekFirst() // 先頭要素
    val peekLast = deque.peekLast()   // 末尾要素

    /* 要素をデキュー */
    val popFirst = deque.pollFirst() // 先頭要素を取り出す
    val popLast = deque.pollLast()   // 末尾要素を取り出す

    /* 両端キューの長さを取得 */
    val size = deque.size

    /* 両端キューが空かどうかを判定 */
    val isEmpty = deque.isEmpty()
    ```

=== "Ruby"

    ```ruby title="deque.rb"
    # 両端キューを初期化
    # Ruby には組み込みの両端キューがないため、Array で代用する必要がある
    deque = []

    # 要素をエンキュー
    deque << 2
    deque << 5
    deque << 4
    # 配列なので Array#unshift の時間計算量は O(n) であることに注意
    deque.unshift(3)
    deque.unshift(1)

    # 要素にアクセス
    peek_first = deque.first
    peek_last = deque.last

    # 要素をデキュー
    # 配列なので Array#shift の時間計算量は O(n) であることに注意
    pop_front = deque.shift
    pop_back = deque.pop

    # 両端キューの長さを取得
    size = deque.length

    # 両端キューが空かどうかを判定
    is_empty = size.zero?
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20deq%20%3D%20deque()%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%82%A8%E3%83%B3%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20deq.append(2)%20%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20deq.append(5)%0A%20%20%20%20deq.append(4)%0A%20%20%20%20deq.appendleft(3)%20%20%23%20%E5%85%88%E9%A0%AD%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20deq.appendleft(1)%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%20deque%20%3D%22%2C%20deq)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20front%20%3D%22%2C%20front)%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%20rear%20%3D%22%2C%20rear)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%87%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20pop_front%20%3D%20deq.popleft()%20%20%23%20%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20%20pop_front%20%3D%22%2C%20pop_front)%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20deque%20%3D%22%2C%20deq)%0A%20%20%20%20pop_rear%20%3D%20deq.pop()%20%20%23%20%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20%20pop_rear%20%3D%22%2C%20pop_rear)%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20deque%20%3D%22%2C%20deq)%0A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(deq)%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size)%0A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len(deq)%20%3D%3D%200%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22%2C%20is_empty)&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20deq%20%3D%20deque()%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%82%A8%E3%83%B3%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20deq.append(2)%20%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20deq.append(5)%0A%20%20%20%20deq.append(4)%0A%20%20%20%20deq.appendleft(3)%20%20%23%20%E5%85%88%E9%A0%AD%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20deq.appendleft(1)%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%20deque%20%3D%22%2C%20deq)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20front%20%3D%22%2C%20front)%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%20rear%20%3D%22%2C%20rear)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%87%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20pop_front%20%3D%20deq.popleft()%20%20%23%20%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20%20pop_front%20%3D%22%2C%20pop_front)%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20deque%20%3D%22%2C%20deq)%0A%20%20%20%20pop_rear%20%3D%20deq.pop()%20%20%23%20%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20%20pop_rear%20%3D%22%2C%20pop_rear)%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20deque%20%3D%22%2C%20deq)%0A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(deq)%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size)%0A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len(deq)%20%3D%3D%200%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22%2C%20is_empty)&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 5.3.2 &nbsp; 両端キューの実装 *

実装はキューと似ており、基盤となるデータ構造に連結リストか配列を選べます。

### 1. &nbsp; 双方向連結リストによる実装

前節では、通常の単方向連結リストでキューを実装しました。先頭ノードの削除（デキュー）と、末尾ノードの後への追加（エンキュー）が容易だからです。

両端キューでは、先頭でも末尾でも追加と削除ができます。つまり、反対側の対称的な操作も必要です。そのため、基盤に双方向連結リストを使います。

図 5-8 のように、双方向連結リストの先頭と末尾を両端キューの先頭と末尾に対応させ、両端でノードを追加・削除できるようにします。

=== "<1>"
    ![連結リストによる両端キューの追加と削除](deque.assets/linkedlist_deque_step1.png){ class="animation-figure" }

=== "<2>"
    ![連結リストによる両端キュー：末尾に追加](deque.assets/linkedlist_deque_step2_push_last.png){ class="animation-figure" }

=== "<3>"
    ![連結リストによる両端キュー：先頭に追加](deque.assets/linkedlist_deque_step3_push_first.png){ class="animation-figure" }

=== "<4>"
    ![連結リストによる両端キュー：末尾から取り出す](deque.assets/linkedlist_deque_step4_pop_last.png){ class="animation-figure" }

=== "<5>"
    ![連結リストによる両端キュー：先頭から取り出す](deque.assets/linkedlist_deque_step5_pop_first.png){ class="animation-figure" }

<p align="center"> 図 5-8 &nbsp; 連結リストによる両端キューの追加と削除 </p>

実装は次のとおりです。

=== "Python"

    ```python title="linkedlist_deque.py"
    class ListNode:
        """双方向連結リストのノード"""

        def __init__(self, val: int):
            """コンストラクタ"""
            self.val: int = val
            self.next: ListNode | None = None  # 後続ノードへの参照
            self.prev: ListNode | None = None  # 前のノードへの参照

    class LinkedListDeque:
        """双方向連結リストで実装した両端キュー"""

        def __init__(self):
            """コンストラクタ"""
            self._front: ListNode | None = None  # 先頭ノード front
            self._rear: ListNode | None = None  # 末尾ノード rear
            self._size: int = 0  # 両端キューの長さ

        def size(self) -> int:
            """両端キューの長さを取得する"""
            return self._size

        def is_empty(self) -> bool:
            """両端キューが空かどうかを判定する"""
            return self._size == 0

        def push(self, num: int, is_front: bool):
            """エンキュー操作"""
            node = ListNode(num)
            # 連結リストが空の場合、front と rear の両方が node を指すようにする
            if self.is_empty():
                self._front = self._rear = node
            # 先頭へのエンキュー操作
            elif is_front:
                # node を連結リストの先頭に追加する
                self._front.prev = node
                node.next = self._front
                self._front = node  # 先頭ノードを更新する
            # 末尾へのエンキュー操作
            else:
                # node を連結リストの末尾に追加する
                self._rear.next = node
                node.prev = self._rear
                self._rear = node  # 末尾ノードを更新する
            self._size += 1  # キューの長さを更新する

        def push_first(self, num: int):
            """先頭にエンキューする"""
            self.push(num, True)

        def push_last(self, num: int):
            """末尾にエンキューする"""
            self.push(num, False)

        def pop(self, is_front: bool) -> int:
            """デキュー操作"""
            if self.is_empty():
                raise IndexError("両端キューが空です")
            # キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if self._size == 1:
                val: int = self._front.val
                self._front = None
                self._rear = None
            # 先頭からのデキュー操作
            elif is_front:
                val: int = self._front.val  # 先頭ノードの値を一時保存する
                # 先頭ノードを削除する
                fnext: ListNode | None = self._front.next
                fnext.prev = None
                self._front.next = None
                self._front = fnext  # 先頭ノードを更新する
            # 末尾からのデキュー操作
            else:
                val: int = self._rear.val  # 末尾ノードの値を一時保存する
                # 末尾ノードを削除する
                rprev: ListNode | None = self._rear.prev
                rprev.next = None
                self._rear.prev = None
                self._rear = rprev  # 末尾ノードを更新する
            self._size -= 1  # キューの長さを更新する
            return val

        def pop_first(self) -> int:
            """先頭からデキューする"""
            return self.pop(True)

        def pop_last(self) -> int:
            """末尾からデキューする"""
            return self.pop(False)

        def peek_first(self) -> int:
            """キューの先頭要素にアクセス"""
            if self.is_empty():
                raise IndexError("両端キューが空です")
            return self._front.val

        def peek_last(self) -> int:
            """キューの末尾要素にアクセスする"""
            if self.is_empty():
                raise IndexError("両端キューが空です")
            return self._rear.val

        def to_array(self) -> list[int]:
            """表示用の配列を返す"""
            node = self._front
            res = [0] * self.size()
            for i in range(self.size()):
                res[i] = node.val
                node = node.next
            return res
    ```

=== "C++"

    ```cpp title="linkedlist_deque.cpp"
    /* 双方向連結リストのノード */
    struct DoublyListNode {
        int val;              // ノードの値
        DoublyListNode *next; // 後続ノードへのポインタ
        DoublyListNode *prev; // 前のノードへのポインタ
        DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
        }
    };

    /* 双方向連結リストで実装した両端キュー */
    class LinkedListDeque {
      private:
        DoublyListNode *front, *rear; // 先頭ノード front 、末尾ノード rear
        int queSize = 0;              // 両端キューの長さ

      public:
        /* コンストラクタ */
        LinkedListDeque() : front(nullptr), rear(nullptr) {
        }

        /* デストラクタ */
        ~LinkedListDeque() {
            // 連結リストを走査してノードを削除し、メモリを解放する
            DoublyListNode *pre, *cur = front;
            while (cur != nullptr) {
                pre = cur;
                cur = cur->next;
                delete pre;
            }
        }

        /* 両端キューの長さを取得する */
        int size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定する */
        bool isEmpty() {
            return size() == 0;
        }

        /* エンキュー操作 */
        void push(int num, bool isFront) {
            DoublyListNode *node = new DoublyListNode(num);
            // 連結リストが空の場合、front と rear の両方が node を指すようにする
            if (isEmpty())
                front = rear = node;
            // 先頭へのエンキュー操作
            else if (isFront) {
                // node を連結リストの先頭に追加する
                front->prev = node;
                node->next = front;
                front = node; // 先頭ノードを更新する
            // 末尾へのエンキュー操作
            } else {
                // node を連結リストの末尾に追加する
                rear->next = node;
                node->prev = rear;
                rear = node; // 末尾ノードを更新する
            }
            queSize++; // キューの長さを更新する
        }

        /* 先頭にエンキューする */
        void pushFirst(int num) {
            push(num, true);
        }

        /* 末尾にエンキューする */
        void pushLast(int num) {
            push(num, false);
        }

        /* デキュー操作 */
        int pop(bool isFront) {
            if (isEmpty())
                throw out_of_range("キューが空です");
            int val;
            // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if (queSize == 1) {
                val = front->val;
                delete front; // 同じノードを指しているため、片方を解放すればよい
                front = nullptr;
                rear = nullptr;
            }
            // 先頭からのデキュー操作
            else if (isFront) {
                val = front->val; // 先頭ノードの値を一時保存する
                // 先頭ノードを削除する
                DoublyListNode *fNext = front->next;
                fNext->prev = nullptr;
                front->next = nullptr;
                delete front;
                front = fNext; // 先頭ノードを更新する
            // 末尾からのデキュー操作
            } else {
                val = rear->val; // 末尾ノードの値を一時保存する
                // 末尾ノードを削除する
                DoublyListNode *rPrev = rear->prev;
                rPrev->next = nullptr;
                rear->prev = nullptr;
                delete rear;
                rear = rPrev; // 末尾ノードを更新する
            }
            queSize--; // キューの長さを更新する
            return val;
        }

        /* 先頭からデキューする */
        int popFirst() {
            return pop(true);
        }

        /* 末尾からデキューする */
        int popLast() {
            return pop(false);
        }

        /* キューの先頭要素にアクセス */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("両端キューが空です");
            return front->val;
        }

        /* キューの末尾要素にアクセスする */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("両端キューが空です");
            return rear->val;
        }

        /* 表示用の配列を返す */
        vector<int> toVector() {
            DoublyListNode *node = front;
            vector<int> res(size());
            for (int i = 0; i < res.size(); i++) {
                res[i] = node->val;
                node = node->next;
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="linkedlist_deque.java"
    /* 双方向連結リストのノード */
    class ListNode {
        int val; // ノードの値
        ListNode next; // 後続ノードへの参照
        ListNode prev; // 前のノードへの参照

        ListNode(int val) {
            this.val = val;
            prev = next = null;
        }
    }

    /* 双方向連結リストで実装した両端キュー */
    class LinkedListDeque {
        private ListNode front, rear; // 先頭ノード front 、末尾ノード rear
        private int queSize = 0; // 両端キューの長さ

        public LinkedListDeque() {
            front = rear = null;
        }

        /* 両端キューの長さを取得する */
        public int size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定する */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* エンキュー操作 */
        private void push(int num, boolean isFront) {
            ListNode node = new ListNode(num);
            // 連結リストが空の場合、front と rear の両方が node を指すようにする
            if (isEmpty())
                front = rear = node;
            // 先頭へのエンキュー操作
            else if (isFront) {
                // node を連結リストの先頭に追加する
                front.prev = node;
                node.next = front;
                front = node; // 先頭ノードを更新する
            // 末尾へのエンキュー操作
            } else {
                // node を連結リストの末尾に追加する
                rear.next = node;
                node.prev = rear;
                rear = node; // 末尾ノードを更新する
            }
            queSize++; // キューの長さを更新する
        }

        /* 先頭にエンキューする */
        public void pushFirst(int num) {
            push(num, true);
        }

        /* 末尾にエンキューする */
        public void pushLast(int num) {
            push(num, false);
        }

        /* デキュー操作 */
        private int pop(boolean isFront) {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            int val;
            // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if (queSize == 1) {
                val = front.val;
                front = null;
                rear = null;
            }
            // 先頭からのデキュー操作
            else if (isFront) {
                val = front.val; // 先頭ノードの値を一時保存する
                // 先頭ノードを削除する
                ListNode fNext = front.next;
                fNext.prev = null;
                front.next = null;
                front = fNext; // 先頭ノードを更新する
            // 末尾からのデキュー操作
            } else {
                val = rear.val; // 末尾ノードの値を一時保存する
                // 末尾ノードを削除する
                ListNode rPrev = rear.prev;
                rPrev.next = null;
                rear.prev = null;
                rear = rPrev; // 末尾ノードを更新する
            }
            queSize--; // キューの長さを更新する
            return val;
        }

        /* 先頭からデキューする */
        public int popFirst() {
            return pop(true);
        }

        /* 末尾からデキューする */
        public int popLast() {
            return pop(false);
        }

        /* キューの先頭要素にアクセス */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* キューの末尾要素にアクセスする */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return rear.val;
        }

        /* 表示用の配列を返す */
        public int[] toArray() {
            ListNode node = front;
            int[] res = new int[size()];
            for (int i = 0; i < res.length; i++) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="linkedlist_deque.cs"
    /* 双方向連結リストのノード */
    class ListNode(int val) {
        public int val = val;       // ノードの値
        public ListNode? next = null; // 後続ノードへの参照
        public ListNode? prev = null; // 前のノードへの参照
    }

    /* 双方向連結リストで実装した両端キュー */
    class LinkedListDeque {
        ListNode? front, rear; // 先頭ノード front、末尾ノード rear
        int queSize = 0;      // 両端キューの長さ

        public LinkedListDeque() {
            front = null;
            rear = null;
        }

        /* 両端キューの長さを取得する */
        public int Size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定する */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* エンキュー操作 */
        void Push(int num, bool isFront) {
            ListNode node = new(num);
            // 連結リストが空の場合、front と rear の両方が node を指すようにする
            if (IsEmpty()) {
                front = node;
                rear = node;
            }
            // 先頭へのエンキュー操作
            else if (isFront) {
                // node を連結リストの先頭に追加する
                front!.prev = node;
                node.next = front;
                front = node; // 先頭ノードを更新する                           
            }
            // 末尾へのエンキュー操作
            else {
                // node を連結リストの末尾に追加する
                rear!.next = node;
                node.prev = rear;
                rear = node;  // 末尾ノードを更新する
            }

            queSize++; // キューの長さを更新する
        }

        /* 先頭にエンキューする */
        public void PushFirst(int num) {
            Push(num, true);
        }

        /* 末尾にエンキューする */
        public void PushLast(int num) {
            Push(num, false);
        }

        /* デキュー操作 */
        int? Pop(bool isFront) {
            if (IsEmpty())
                throw new Exception();
            int? val;
            // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if (queSize == 1) {
                val = front!.val;
                front = null;
                rear = null;
            }
            // 先頭からのデキュー操作
            else if (isFront) {
                val = front!.val; // 先頭ノードの値を一時保存する
                // 先頭ノードを削除する
                ListNode? fNext = front?.next;
                fNext!.prev = null;
                front.next = null;
                front = fNext;   // 先頭ノードを更新する
            }
            // 末尾からのデキュー操作
            else {
                val = rear!.val;  // 末尾ノードの値を一時保存する
                // 末尾ノードを削除する
                ListNode? rPrev = rear?.prev;
                rPrev!.next = null;
                rear.prev = null;
                rear = rPrev;    // 末尾ノードを更新する
            }

            queSize--; // キューの長さを更新する
            return val;
        }

        /* 先頭からデキューする */
        public int? PopFirst() {
            return Pop(true);
        }

        /* 末尾からデキューする */
        public int? PopLast() {
            return Pop(false);
        }

        /* キューの先頭要素にアクセス */
        public int? PeekFirst() {
            if (IsEmpty())
                throw new Exception();
            return front?.val;
        }

        /* キューの末尾要素にアクセスする */
        public int? PeekLast() {
            if (IsEmpty())
                throw new Exception();
            return rear?.val;
        }

        /* 表示用の配列を返す */
        public int?[] ToArray() {
            ListNode? node = front;
            int?[] res = new int?[Size()];
            for (int i = 0; i < res.Length; i++) {
                res[i] = node?.val;
                node = node?.next;
            }

            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_deque.go"
    /* 双方向連結リストで実装した両端キュー */
    type linkedListDeque struct {
        // 組み込みパッケージ list を使う
        data *list.List
    }

    /* 両端キューを初期化する */
    func newLinkedListDeque() *linkedListDeque {
        return &linkedListDeque{
            data: list.New(),
        }
    }

    /* 先頭に要素をエンキューする */
    func (s *linkedListDeque) pushFirst(value any) {
        s.data.PushFront(value)
    }

    /* 末尾に要素をエンキューする */
    func (s *linkedListDeque) pushLast(value any) {
        s.data.PushBack(value)
    }

    /* キューの先頭要素をデキューする */
    func (s *linkedListDeque) popFirst() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        s.data.Remove(e)
        return e.Value
    }

    /* キューの末尾要素をデキューする */
    func (s *linkedListDeque) popLast() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    /* キューの先頭要素にアクセス */
    func (s *linkedListDeque) peekFirst() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        return e.Value
    }

    /* キューの末尾要素にアクセスする */
    func (s *linkedListDeque) peekLast() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* キューの長さを取得 */
    func (s *linkedListDeque) size() int {
        return s.data.Len()
    }

    /* キューが空か判定 */
    func (s *linkedListDeque) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* 表示用の List を取得する */
    func (s *linkedListDeque) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_deque.swift"
    /* 双方向連結リストのノード */
    class ListNode {
        var val: Int // ノードの値
        var next: ListNode? // 後続ノードへの参照
        weak var prev: ListNode? // 前のノードへの参照

        init(val: Int) {
            self.val = val
        }
    }

    /* 双方向連結リストで実装した両端キュー */
    class LinkedListDeque {
        private var front: ListNode? // 先頭ノード front
        private var rear: ListNode? // 末尾ノード rear
        private var _size: Int // 両端キューの長さ

        init() {
            _size = 0
        }

        /* 両端キューの長さを取得する */
        func size() -> Int {
            _size
        }

        /* 両端キューが空かどうかを判定する */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* エンキュー操作 */
        private func push(num: Int, isFront: Bool) {
            let node = ListNode(val: num)
            // 連結リストが空の場合、front と rear の両方が node を指すようにする
            if isEmpty() {
                front = node
                rear = node
            }
            // 先頭へのエンキュー操作
            else if isFront {
                // node を連結リストの先頭に追加する
                front?.prev = node
                node.next = front
                front = node // 先頭ノードを更新する
            }
            // 末尾へのエンキュー操作
            else {
                // node を連結リストの末尾に追加する
                rear?.next = node
                node.prev = rear
                rear = node // 末尾ノードを更新する
            }
            _size += 1 // キューの長さを更新する
        }

        /* 先頭にエンキューする */
        func pushFirst(num: Int) {
            push(num: num, isFront: true)
        }

        /* 末尾にエンキューする */
        func pushLast(num: Int) {
            push(num: num, isFront: false)
        }

        /* デキュー操作 */
        private func pop(isFront: Bool) -> Int {
            if isEmpty() {
                fatalError("両端キューが空です")
            }
            let val: Int
            // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if _size == 1 {
                val = front!.val
                front = nil
                rear = nil
            }
            // 先頭からのデキュー操作
            else if isFront {
                val = front!.val // 先頭ノードの値を一時保存する
                // 先頭ノードを削除する
                let fNext = front?.next
                fNext?.prev = nil
                front?.next = nil
                front = fNext // 先頭ノードを更新する
            }
            // 末尾からのデキュー操作
            else {
                val = rear!.val // 末尾ノードの値を一時保存する
                // 末尾ノードを削除する
                let rPrev = rear?.prev
                rPrev?.next = nil
                rear?.prev = nil
                rear = rPrev // 末尾ノードを更新する
            }
            _size -= 1 // キューの長さを更新する
            return val
        }

        /* 先頭からデキューする */
        func popFirst() -> Int {
            pop(isFront: true)
        }

        /* 末尾からデキューする */
        func popLast() -> Int {
            pop(isFront: false)
        }

        /* キューの先頭要素にアクセス */
        func peekFirst() -> Int {
            if isEmpty() {
                fatalError("両端キューが空です")
            }
            return front!.val
        }

        /* キューの末尾要素にアクセスする */
        func peekLast() -> Int {
            if isEmpty() {
                fatalError("両端キューが空です")
            }
            return rear!.val
        }

        /* 表示用の配列を返す */
        func toArray() -> [Int] {
            var node = front
            var res = Array(repeating: 0, count: size())
            for i in res.indices {
                res[i] = node!.val
                node = node?.next
            }
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="linkedlist_deque.js"
    /* 双方向連結リストのノード */
    class ListNode {
        prev; // 前のノードへの参照（ポインタ）
        next; // 後続ノードへの参照（ポインタ）
        val; // ノードの値

        constructor(val) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* 双方向連結リストで実装した両端キュー */
    class LinkedListDeque {
        #front; // 先頭ノード front
        #rear; // 末尾ノード rear
        #queSize; // 両端キューの長さ

        constructor() {
            this.#front = null;
            this.#rear = null;
            this.#queSize = 0;
        }

        /* 末尾へのエンキュー操作 */
        pushLast(val) {
            const node = new ListNode(val);
            // 連結リストが空の場合、front と rear の両方が node を指すようにする
            if (this.#queSize === 0) {
                this.#front = node;
                this.#rear = node;
            } else {
                // node を連結リストの末尾に追加する
                this.#rear.next = node;
                node.prev = this.#rear;
                this.#rear = node; // 末尾ノードを更新する
            }
            this.#queSize++;
        }

        /* 先頭へのエンキュー操作 */
        pushFirst(val) {
            const node = new ListNode(val);
            // 連結リストが空の場合、front と rear の両方が node を指すようにする
            if (this.#queSize === 0) {
                this.#front = node;
                this.#rear = node;
            } else {
                // node を連結リストの先頭に追加する
                this.#front.prev = node;
                node.next = this.#front;
                this.#front = node; // 先頭ノードを更新する
            }
            this.#queSize++;
        }

        /* 末尾からのデキュー操作 */
        popLast() {
            if (this.#queSize === 0) {
                return null;
            }
            const value = this.#rear.val; // 末尾ノードの値を保存する
            // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if (this.#queSize === 1) {
                this.#front = null;
                this.#rear = null;
            }
            // 末尾ノードを削除する
            else {
                let temp = this.#rear.prev;
                temp.next = null;
                this.#rear.prev = null;
                this.#rear = temp; // 末尾ノードを更新する
            }
            this.#queSize--;
            return value;
        }

        /* 先頭からのデキュー操作 */
        popFirst() {
            if (this.#queSize === 0) {
                return null;
            }
            const value = this.#front.val; // 先頭ノードの値を保存する
            // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if (this.#queSize === 1) {
                this.#front = null;
                this.#rear = null;
            }
            // 先頭ノードを削除する
            else {
                let temp = this.#front.next;
                temp.prev = null;
                this.#front.next = null;
                this.#front = temp; // 先頭ノードを更新する
            }
            this.#queSize--;
            return value;
        }

        /* キューの末尾要素にアクセスする */
        peekLast() {
            return this.#queSize === 0 ? null : this.#rear.val;
        }

        /* キューの先頭要素にアクセス */
        peekFirst() {
            return this.#queSize === 0 ? null : this.#front.val;
        }

        /* 両端キューの長さを取得する */
        size() {
            return this.#queSize;
        }

        /* 両端キューが空かどうかを判定する */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* 両端キューを表示する */
        print() {
            const arr = [];
            let temp = this.#front;
            while (temp !== null) {
                arr.push(temp.val);
                temp = temp.next;
            }
            console.log('[' + arr.join(', ') + ']');
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_deque.ts"
    /* 双方向連結リストのノード */
    class ListNode {
        prev: ListNode; // 前のノードへの参照（ポインタ）
        next: ListNode; // 後続ノードへの参照（ポインタ）
        val: number; // ノードの値

        constructor(val: number) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* 双方向連結リストで実装した両端キュー */
    class LinkedListDeque {
        private front: ListNode; // 先頭ノード front
        private rear: ListNode; // 末尾ノード rear
        private queSize: number; // 両端キューの長さ

        constructor() {
            this.front = null;
            this.rear = null;
            this.queSize = 0;
        }

        /* 末尾へのエンキュー操作 */
        pushLast(val: number): void {
            const node: ListNode = new ListNode(val);
            // 連結リストが空の場合、front と rear の両方が node を指すようにする
            if (this.queSize === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // node を連結リストの末尾に追加する
                this.rear.next = node;
                node.prev = this.rear;
                this.rear = node; // 末尾ノードを更新する
            }
            this.queSize++;
        }

        /* 先頭へのエンキュー操作 */
        pushFirst(val: number): void {
            const node: ListNode = new ListNode(val);
            // 連結リストが空の場合、front と rear の両方が node を指すようにする
            if (this.queSize === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // node を連結リストの先頭に追加する
                this.front.prev = node;
                node.next = this.front;
                this.front = node; // 先頭ノードを更新する
            }
            this.queSize++;
        }

        /* 末尾からのデキュー操作 */
        popLast(): number {
            if (this.queSize === 0) {
                return null;
            }
            const value: number = this.rear!.val; // 末尾ノードの値を保存する
            // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if (this.queSize === 1) {
                this.front = null;
                this.rear = null;
            }
            // 末尾ノードを削除する
            else {
                let temp: ListNode = this.rear!.prev;
                temp!.next = null;
                this.rear!.prev = null;
                this.rear = temp; // 末尾ノードを更新する
            }
            this.queSize--;
            return value;
        }

        /* 先頭からのデキュー操作 */
        popFirst(): number {
            if (this.queSize === 0) {
                return null;
            }
            const value: number = this.front.val; // 先頭ノードの値を保存する
            // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if (this.queSize === 1) {
                this.front = null;
                this.rear = null;
            }
            // 先頭ノードを削除する
            else {
                let temp: ListNode = this.front!.next;
                temp!.prev = null;
                this.front!.next = null;
                this.front = temp; // 先頭ノードを更新する
            }
            this.queSize--;
            return value;
        }

        /* キューの末尾要素にアクセスする */
        peekLast(): number {
            return this.queSize === 0 ? null : this.rear.val;
        }

        /* キューの先頭要素にアクセス */
        peekFirst(): number {
            return this.queSize === 0 ? null : this.front.val;
        }

        /* 両端キューの長さを取得する */
        size(): number {
            return this.queSize;
        }

        /* 両端キューが空かどうかを判定する */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* 両端キューを表示する */
        print(): void {
            const arr: number[] = [];
            let temp: ListNode = this.front;
            while (temp !== null) {
                arr.push(temp.val);
                temp = temp.next;
            }
            console.log('[' + arr.join(', ') + ']');
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_deque.dart"
    /* 双方向連結リストのノード */
    class ListNode {
      int val; // ノードの値
      ListNode? next; // 後続ノードへの参照
      ListNode? prev; // 前のノードへの参照

      ListNode(this.val, {this.next, this.prev});
    }

    /* 双方向連結リストで実装した両端キュー */
    class LinkedListDeque {
      late ListNode? _front; // 先頭ノード _front
      late ListNode? _rear; // 末尾ノード _rear
      int _queSize = 0; // 両端キューの長さ

      LinkedListDeque() {
        this._front = null;
        this._rear = null;
      }

      /* 両端キューの長さを取得する */
      int size() {
        return this._queSize;
      }

      /* 両端キューが空かどうかを判定する */
      bool isEmpty() {
        return size() == 0;
      }

      /* エンキュー操作 */
      void push(int _num, bool isFront) {
        final ListNode node = ListNode(_num);
        if (isEmpty()) {
          // 連結リストが空の場合、_front と _rear の両方が node を指すようにする
          _front = _rear = node;
        } else if (isFront) {
          // 先頭へのエンキュー操作
          // node を連結リストの先頭に追加する
          _front!.prev = node;
          node.next = _front;
          _front = node; // 先頭ノードを更新する
        } else {
          // 末尾へのエンキュー操作
          // node を連結リストの末尾に追加する
          _rear!.next = node;
          node.prev = _rear;
          _rear = node; // 末尾ノードを更新する
        }
        _queSize++; // キューの長さを更新する
      }

      /* 先頭にエンキューする */
      void pushFirst(int _num) {
        push(_num, true);
      }

      /* 末尾にエンキューする */
      void pushLast(int _num) {
        push(_num, false);
      }

      /* デキュー操作 */
      int? pop(bool isFront) {
        // キューが空の場合、そのまま null を返す
        if (isEmpty()) {
          return null;
        }
        final int val;
        // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if (_queSize == 1) {
          val = _front!.val;
          _front = null;
          _rear = null;
        }
        // 先頭からのデキュー操作
        else if (isFront) {
          val = _front!.val; // 先頭ノードの値を一時保存する
          // 先頭ノードを削除する
          ListNode? fNext = _front!.next;
          fNext!.prev = null;
          _front!.next = null;
          _front = fNext; // 先頭ノードを更新する
        // 末尾からのデキュー操作
        } else {
          val = _rear!.val; // 末尾ノードの値を一時保存する
          // 末尾ノードを削除する
          ListNode? rPrev = _rear!.prev;
          rPrev!.next = null;
          _rear!.prev = null;
          _rear = rPrev; // 末尾ノードを更新する
        }
        _queSize--; // キューの長さを更新する
        return val;
      }

      /* 先頭からデキューする */
      int? popFirst() {
        return pop(true);
      }

      /* 末尾からデキューする */
      int? popLast() {
        return pop(false);
      }

      /* キューの先頭要素にアクセス */
      int? peekFirst() {
        return _front?.val;
      }

      /* キューの末尾要素にアクセスする */
      int? peekLast() {
        return _rear?.val;
      }

      /* 表示用の配列を返す */
      List<int> toArray() {
        ListNode? node = _front;
        final List<int> res = [];
        for (int i = 0; i < _queSize; i++) {
          res.add(node!.val);
          node = node.next;
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_deque.rs"
    /* 双方向連結リストのノード */
    pub struct ListNode<T> {
        pub val: T,                                 // ノードの値
        pub next: Option<Rc<RefCell<ListNode<T>>>>, // 後続ノードへのポインタ
        pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 前のノードへのポインタ
    }

    impl<T> ListNode<T> {
        pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
            Rc::new(RefCell::new(ListNode {
                val,
                next: None,
                prev: None,
            }))
        }
    }

    /* 双方向連結リストで実装した両端キュー */
    #[allow(dead_code)]
    pub struct LinkedListDeque<T> {
        front: Option<Rc<RefCell<ListNode<T>>>>, // 先頭ノード front
        rear: Option<Rc<RefCell<ListNode<T>>>>,  // 末尾ノード rear
        que_size: usize,                         // 両端キューの長さ
    }

    impl<T: Copy> LinkedListDeque<T> {
        pub fn new() -> Self {
            Self {
                front: None,
                rear: None,
                que_size: 0,
            }
        }

        /* 両端キューの長さを取得する */
        pub fn size(&self) -> usize {
            return self.que_size;
        }

        /* 両端キューが空かどうかを判定する */
        pub fn is_empty(&self) -> bool {
            return self.que_size == 0;
        }

        /* エンキュー操作 */
        fn push(&mut self, num: T, is_front: bool) {
            let node = ListNode::new(num);
            // 先頭へのエンキュー操作
            if is_front {
                match self.front.take() {
                    // 連結リストが空の場合、front と rear の両方が node を指すようにする
                    None => {
                        self.rear = Some(node.clone());
                        self.front = Some(node);
                    }
                    // node を連結リストの先頭に追加する
                    Some(old_front) => {
                        old_front.borrow_mut().prev = Some(node.clone());
                        node.borrow_mut().next = Some(old_front);
                        self.front = Some(node); // 先頭ノードを更新する
                    }
                }
            }
            // 末尾へのエンキュー操作
            else {
                match self.rear.take() {
                    // 連結リストが空の場合、front と rear の両方が node を指すようにする
                    None => {
                        self.front = Some(node.clone());
                        self.rear = Some(node);
                    }
                    // node を連結リストの末尾に追加する
                    Some(old_rear) => {
                        old_rear.borrow_mut().next = Some(node.clone());
                        node.borrow_mut().prev = Some(old_rear);
                        self.rear = Some(node); // 末尾ノードを更新する
                    }
                }
            }
            self.que_size += 1; // キューの長さを更新する
        }

        /* 先頭にエンキューする */
        pub fn push_first(&mut self, num: T) {
            self.push(num, true);
        }

        /* 末尾にエンキューする */
        pub fn push_last(&mut self, num: T) {
            self.push(num, false);
        }

        /* デキュー操作 */
        fn pop(&mut self, is_front: bool) -> Option<T> {
            // キューが空の場合、そのまま None を返す
            if self.is_empty() {
                return None;
            };
            // 先頭からのデキュー操作
            if is_front {
                self.front.take().map(|old_front| {
                    match old_front.borrow_mut().next.take() {
                        Some(new_front) => {
                            new_front.borrow_mut().prev.take();
                            self.front = Some(new_front); // 先頭ノードを更新する
                        }
                        None => {
                            self.rear.take();
                        }
                    }
                    self.que_size -= 1; // キューの長さを更新する
                    old_front.borrow().val
                })
            }
            // 末尾からのデキュー操作
            else {
                self.rear.take().map(|old_rear| {
                    match old_rear.borrow_mut().prev.take() {
                        Some(new_rear) => {
                            new_rear.borrow_mut().next.take();
                            self.rear = Some(new_rear); // 末尾ノードを更新する
                        }
                        None => {
                            self.front.take();
                        }
                    }
                    self.que_size -= 1; // キューの長さを更新する
                    old_rear.borrow().val
                })
            }
        }

        /* 先頭からデキューする */
        pub fn pop_first(&mut self) -> Option<T> {
            return self.pop(true);
        }

        /* 末尾からデキューする */
        pub fn pop_last(&mut self) -> Option<T> {
            return self.pop(false);
        }

        /* キューの先頭要素にアクセス */
        pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.front.as_ref()
        }

        /* キューの末尾要素にアクセスする */
        pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.rear.as_ref()
        }

        /* 表示用の配列を返す */
        pub fn to_array(&self, head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
            let mut res: Vec<T> = Vec::new();
            fn recur<T: Copy>(cur: Option<&Rc<RefCell<ListNode<T>>>>, res: &mut Vec<T>) {
                if let Some(cur) = cur {
                    res.push(cur.borrow().val);
                    recur(cur.borrow().next.as_ref(), res);
                }
            }

            recur(head, &mut res);
            res
        }
    }
    ```

=== "C"

    ```c title="linkedlist_deque.c"
    /* 双方向連結リストのノード */
    typedef struct DoublyListNode {
        int val;                     // ノードの値
        struct DoublyListNode *next; // 後続ノード
        struct DoublyListNode *prev; // 前のノード
    } DoublyListNode;

    /* コンストラクタ */
    DoublyListNode *newDoublyListNode(int num) {
        DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
        new->val = num;
        new->next = NULL;
        new->prev = NULL;
        return new;
    }

    /* デストラクタ */
    void delDoublyListNode(DoublyListNode *node) {
        free(node);
    }

    /* 双方向連結リストで実装した両端キュー */
    typedef struct {
        DoublyListNode *front, *rear; // 先頭ノード front 、末尾ノード rear
        int queSize;                  // 両端キューの長さ
    } LinkedListDeque;

    /* コンストラクタ */
    LinkedListDeque *newLinkedListDeque() {
        LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
        deque->front = NULL;
        deque->rear = NULL;
        deque->queSize = 0;
        return deque;
    }

    /* デストラクタ */
    void delLinkedListdeque(LinkedListDeque *deque) {
        // すべてのノードを解放する
        for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
            DoublyListNode *tmp = deque->front;
            deque->front = deque->front->next;
            free(tmp);
        }
        // deque 構造体を解放する
        free(deque);
    }

    /* キューの長さを取得 */
    int size(LinkedListDeque *deque) {
        return deque->queSize;
    }

    /* キューが空か判定 */
    bool empty(LinkedListDeque *deque) {
        return (size(deque) == 0);
    }

    /* エンキュー */
    void push(LinkedListDeque *deque, int num, bool isFront) {
        DoublyListNode *node = newDoublyListNode(num);
        // 連結リストが空の場合、front と rear の両方が node を指すようにする
        if (empty(deque)) {
            deque->front = deque->rear = node;
        }
        // 先頭へのエンキュー操作
        else if (isFront) {
            // node を連結リストの先頭に追加する
            deque->front->prev = node;
            node->next = deque->front;
            deque->front = node; // 先頭ノードを更新する
        }
        // 末尾へのエンキュー操作
        else {
            // node を連結リストの末尾に追加する
            deque->rear->next = node;
            node->prev = deque->rear;
            deque->rear = node;
        }
        deque->queSize++; // キューの長さを更新する
    }

    /* 先頭にエンキューする */
    void pushFirst(LinkedListDeque *deque, int num) {
        push(deque, num, true);
    }

    /* 末尾にエンキューする */
    void pushLast(LinkedListDeque *deque, int num) {
        push(deque, num, false);
    }

    /* キューの先頭要素にアクセス */
    int peekFirst(LinkedListDeque *deque) {
        assert(size(deque) && deque->front);
        return deque->front->val;
    }

    /* キューの末尾要素にアクセスする */
    int peekLast(LinkedListDeque *deque) {
        assert(size(deque) && deque->rear);
        return deque->rear->val;
    }

    /* デキュー */
    int pop(LinkedListDeque *deque, bool isFront) {
        if (empty(deque))
            return -1;
        int val;
        // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if (deque->queSize == 1) {
            val = deque->front->val;
            delDoublyListNode(deque->front); // 同じノードを指しているため、片方を解放すればよい
            deque->front = NULL;
            deque->rear = NULL;
        }
        // 先頭からのデキュー操作
        else if (isFront) {
            val = peekFirst(deque); // 先頭ノードの値を一時保存する
            DoublyListNode *fNext = deque->front->next;
            fNext->prev = NULL;
            deque->front->next = NULL;
            delDoublyListNode(deque->front);
            deque->front = fNext; // 先頭ノードを更新する
        }
        // 末尾からのデキュー操作
        else {
            val = peekLast(deque); // 末尾ノードの値を一時保存する
            DoublyListNode *rPrev = deque->rear->prev;
            rPrev->next = NULL;
            deque->rear->prev = NULL;
            delDoublyListNode(deque->rear);
            deque->rear = rPrev; // 末尾ノードを更新する
        }
        deque->queSize--; // キューの長さを更新する
        return val;
    }

    /* 先頭からデキューする */
    int popFirst(LinkedListDeque *deque) {
        return pop(deque, true);
    }

    /* 末尾からデキューする */
    int popLast(LinkedListDeque *deque) {
        return pop(deque, false);
    }

    /* キューを表示する */
    void printLinkedListDeque(LinkedListDeque *deque) {
        int *arr = malloc(sizeof(int) * deque->queSize);
        // 連結リストのデータを配列にコピーする
        int i;
        DoublyListNode *node;
        for (i = 0, node = deque->front; i < deque->queSize; i++) {
            arr[i] = node->val;
            node = node->next;
        }
        printArray(arr, deque->queSize);
        free(arr);
    }
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_deque.kt"
    /* 双方向連結リストのノード */
    class ListNode(var _val: Int) {
        // ノードの値
        var next: ListNode? = null // 後続ノードへの参照
        var prev: ListNode? = null // 前のノードへの参照
    }

    /* 双方向連結リストで実装した両端キュー */
    class LinkedListDeque {
        private var front: ListNode? = null // 先頭ノード front
        private var rear: ListNode? = null // 末尾ノード rear
        private var queSize: Int = 0 // 両端キューの長さ

        /* 両端キューの長さを取得する */
        fun size(): Int {
            return queSize
        }

        /* 両端キューが空かどうかを判定する */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* エンキュー操作 */
        fun push(num: Int, isFront: Boolean) {
            val node = ListNode(num)
            // 連結リストが空の場合、front と rear の両方が node を指すようにする
            if (isEmpty()) {
                rear = node
                front = rear
                // 先頭へのエンキュー操作
            } else if (isFront) {
                // node を連結リストの先頭に追加する
                front?.prev = node
                node.next = front
                front = node // 先頭ノードを更新する
                // 末尾へのエンキュー操作
            } else {
                // node を連結リストの末尾に追加する
                rear?.next = node
                node.prev = rear
                rear = node // 末尾ノードを更新する
            }
            queSize++ // キューの長さを更新する
        }

        /* 先頭にエンキューする */
        fun pushFirst(num: Int) {
            push(num, true)
        }

        /* 末尾にエンキューする */
        fun pushLast(num: Int) {
            push(num, false)
        }

        /* デキュー操作 */
        fun pop(isFront: Boolean): Int {
            if (isEmpty()) 
                throw IndexOutOfBoundsException()
            val _val: Int
            // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if (queSize == 1) {
                _val = front!!._val
                front = null
                rear = null
            }
            // 先頭からのデキュー操作
            else if (isFront) {
                _val = front!!._val // 先頭ノードの値を一時保存する
                // 先頭ノードを削除する
                val fNext = front!!.next
                fNext!!.prev = null
                front!!.next = null
                front = fNext // 先頭ノードを更新する
                // 末尾からのデキュー操作
            } else {
                _val = rear!!._val // 末尾ノードの値を一時保存する
                // 末尾ノードを削除する
                val rPrev = rear!!.prev
                rPrev!!.next = null
                rear!!.prev = null
                rear = rPrev // 末尾ノードを更新する
            }
            queSize-- // キューの長さを更新する
            return _val
        }

        /* 先頭からデキューする */
        fun popFirst(): Int {
            return pop(true)
        }

        /* 末尾からデキューする */
        fun popLast(): Int {
            return pop(false)
        }

        /* キューの先頭要素にアクセス */
        fun peekFirst(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return front!!._val
        }

        /* キューの末尾要素にアクセスする */
        fun peekLast(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return rear!!._val
        }

        /* 表示用の配列を返す */
        fun toArray(): IntArray {
            var node = front
            val res = IntArray(size())
            for (i in res.indices) {
                res[i] = node!!._val
                node = node.next
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="linkedlist_deque.rb"
    =begin
    File: linkedlist_deque.rb
    Created Time: 2024-04-06
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    ### 双方向連結リストのノード
    class ListNode
      attr_accessor :val
      attr_accessor :next # 後続ノードへの参照
      attr_accessor :prev # 前のノードへの参照

      ### コンストラクタ ###
      def initialize(val)
        @val = val
      end
    end

    ### 双方向連結リストで実装した両端キュー ###
    class LinkedListDeque
      ### 両端キューの長さを取得する ###
      attr_reader :size

      ### コンストラクタ ###
      def initialize
        @front = nil  # 先頭ノード front
        @rear = nil   # 末尾ノード rear
        @size = 0     # 両端キューの長さ
      end

      ### 両端キューが空かどうかを判定する ###
      def is_empty?
        size.zero?
      end

      ### エンキュー操作 ###
      def push(num, is_front)
        node = ListNode.new(num)
        # 連結リストが空の場合、front と rear の両方が node を指すようにする
        if is_empty?
          @front = @rear = node
        # 先頭へのエンキュー操作
        elsif is_front
          # node を連結リストの先頭に追加する
          @front.prev = node
          node.next = @front
          @front = node # 先頭ノードを更新する
        # 末尾へのエンキュー操作
        else
          # node を連結リストの末尾に追加する
          @rear.next = node
          node.prev = @rear
          @rear = node # 末尾ノードを更新する
        end
        @size += 1 # キューの長さを更新する
      end

      ### 先頭にエンキューする ###
      def push_first(num)
        push(num, true)
      end

      ### 末尾にエンキューする ###
      def push_last(num)
        push(num, false)
      end

      ### デキュー操作 ###
      def pop(is_front)
        raise IndexError, '両端キューが空です' if is_empty?

        # キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if @size == 1
          val = @front.val
          @front = nil
          @rear = nil
        # 先頭からのデキュー操作
        elsif is_front
          val = @front.val # 先頭ノードの値を一時保存する
          # 先頭ノードを削除する
          fnext = @front.next
          fnext.prev = nil
          @front.next = nil
          @front = fnext # 先頭ノードを更新する
        # 末尾からのデキュー操作
        else
          val = @rear.val # 末尾ノードの値を一時保存する
          # 末尾ノードを削除する
          rprev = @rear.prev
          rprev.next = nil
          @rear.prev = nil
          @rear = rprev # 末尾ノードを更新する
        end
        @size -= 1 # キューの長さを更新する

        val
      end

      ### 先頭からデキューする ###
      def pop_first
        pop(true)
      end

      ### 先頭からデキューする ###
      def pop_last
        pop(false)
      end

      ### キューの先頭要素にアクセス ###
      def peek_first
        raise IndexError, '両端キューが空です' if is_empty?

        @front.val
      end

      ### キューの末尾要素にアクセスする ###
      def peek_last
        raise IndexError, '両端キューが空です' if is_empty?

        @rear.val
      end

      ### 表示用の配列を返す ###
      def to_array
        node = @front
        res = Array.new(size, 0)
        for i in 0...size
          res[i] = node.val
          node = node.next
        end
        res
      end
    end
    ```

### 2. &nbsp; 配列による実装

図 5-9 のように、配列によるキューと同様、循環配列で両端キューを実装できます。

=== "<1>"
    ![配列による両端キューの追加と削除](deque.assets/array_deque_step1.png){ class="animation-figure" }

=== "<2>"
    ![配列による両端キュー：末尾に追加](deque.assets/array_deque_step2_push_last.png){ class="animation-figure" }

=== "<3>"
    ![配列による両端キュー：先頭に追加](deque.assets/array_deque_step3_push_first.png){ class="animation-figure" }

=== "<4>"
    ![配列による両端キュー：末尾から取り出す](deque.assets/array_deque_step4_pop_last.png){ class="animation-figure" }

=== "<5>"
    ![配列による両端キュー：先頭から取り出す](deque.assets/array_deque_step5_pop_first.png){ class="animation-figure" }

<p align="center"> 図 5-9 &nbsp; 配列による両端キューの追加と削除 </p>

キューの実装に、先頭への追加と末尾からの取り出しのメソッドを加えるだけです。

=== "Python"

    ```python title="array_deque.py"
    class ArrayDeque:
        """循環配列で実装した両端キュー"""

        def __init__(self, capacity: int):
            """コンストラクタ"""
            self._nums: list[int] = [0] * capacity
            self._front: int = 0
            self._size: int = 0

        def capacity(self) -> int:
            """両端キューの容量を取得する"""
            return len(self._nums)

        def size(self) -> int:
            """両端キューの長さを取得する"""
            return self._size

        def is_empty(self) -> bool:
            """両端キューが空かどうかを判定する"""
            return self._size == 0

        def index(self, i: int) -> int:
            """循環配列のインデックスを計算する"""
            # 剰余演算を使い、配列の先頭と末尾をつなぐ
            # i が配列の末尾を越えたら、先頭に戻る
            # i が配列の先頭を越えたら、末尾に戻る
            return (i + self.capacity()) % self.capacity()

        def push_first(self, num: int):
            """先頭にエンキューする"""
            if self._size == self.capacity():
                print("両端キューが満杯です")
                return
            # 先頭ポインタを左に 1 つ移動する
            # 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
            self._front = self.index(self._front - 1)
            # num をキューの先頭に追加する
            self._nums[self._front] = num
            self._size += 1

        def push_last(self, num: int):
            """末尾にエンキューする"""
            if self._size == self.capacity():
                print("両端キューが満杯です")
                return
            # 末尾のインデックス + 1 を指す末尾ポインタを計算する
            rear = self.index(self._front + self._size)
            # num をキューの末尾に追加する
            self._nums[rear] = num
            self._size += 1

        def pop_first(self) -> int:
            """先頭からデキューする"""
            num = self.peek_first()
            # 先頭ポインタを後ろに 1 つ移動する
            self._front = self.index(self._front + 1)
            self._size -= 1
            return num

        def pop_last(self) -> int:
            """末尾からデキューする"""
            num = self.peek_last()
            self._size -= 1
            return num

        def peek_first(self) -> int:
            """キューの先頭要素にアクセス"""
            if self.is_empty():
                raise IndexError("両端キューが空です")
            return self._nums[self._front]

        def peek_last(self) -> int:
            """キューの末尾要素にアクセスする"""
            if self.is_empty():
                raise IndexError("両端キューが空です")
            # 末尾要素のインデックスを計算する
            last = self.index(self._front + self._size - 1)
            return self._nums[last]

        def to_array(self) -> list[int]:
            """表示用の配列を返す"""
            # 有効な長さの範囲内にあるリストの要素だけを変換する
            res = []
            for i in range(self._size):
                res.append(self._nums[self.index(self._front + i)])
            return res
    ```

=== "C++"

    ```cpp title="array_deque.cpp"
    /* 循環配列で実装した両端キュー */
    class ArrayDeque {
      private:
        vector<int> nums; // 両端キューの要素を格納する配列
        int front;        // キューの先頭要素を指す先頭ポインタ
        int queSize;      // 両端キューの長さ

      public:
        /* コンストラクタ */
        ArrayDeque(int capacity) {
            nums.resize(capacity);
            front = queSize = 0;
        }

        /* 両端キューの容量を取得する */
        int capacity() {
            return nums.size();
        }

        /* 両端キューの長さを取得する */
        int size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定する */
        bool isEmpty() {
            return queSize == 0;
        }

        /* 循環配列のインデックスを計算する */
        int index(int i) {
            // 剰余演算を使い、配列の先頭と末尾をつなぐ
            // i が配列の末尾を越えたら、先頭に戻る
            // i が配列の先頭を越えたら、末尾に戻る
            return (i + capacity()) % capacity();
        }

        /* 先頭にエンキューする */
        void pushFirst(int num) {
            if (queSize == capacity()) {
                cout << "両端キューが満杯です" << endl;
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
            front = index(front - 1);
            // num をキューの先頭に追加する
            nums[front] = num;
            queSize++;
        }

        /* 末尾にエンキューする */
        void pushLast(int num) {
            if (queSize == capacity()) {
                cout << "両端キューが満杯です" << endl;
                return;
            }
            // 末尾のインデックス + 1 を指す末尾ポインタを計算する
            int rear = index(front + queSize);
            // num をキューの末尾に追加する
            nums[rear] = num;
            queSize++;
        }

        /* 先頭からデキューする */
        int popFirst() {
            int num = peekFirst();
            // 先頭ポインタを後ろに 1 つ移動する
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* 末尾からデキューする */
        int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* キューの先頭要素にアクセス */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("両端キューが空です");
            return nums[front];
        }

        /* キューの末尾要素にアクセスする */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("両端キューが空です");
            // 末尾要素のインデックスを計算する
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* 表示用の配列を返す */
        vector<int> toVector() {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
            vector<int> res(queSize);
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[index(j)];
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="array_deque.java"
    /* 循環配列で実装した両端キュー */
    class ArrayDeque {
        private int[] nums; // 両端キューの要素を格納する配列
        private int front; // キューの先頭要素を指す先頭ポインタ
        private int queSize; // 両端キューの長さ

        /* コンストラクタ */
        public ArrayDeque(int capacity) {
            this.nums = new int[capacity];
            front = queSize = 0;
        }

        /* 両端キューの容量を取得する */
        public int capacity() {
            return nums.length;
        }

        /* 両端キューの長さを取得する */
        public int size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定する */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* 循環配列のインデックスを計算する */
        private int index(int i) {
            // 剰余演算を使い、配列の先頭と末尾をつなぐ
            // i が配列の末尾を越えたら、先頭に戻る
            // i が配列の先頭を越えたら、末尾に戻る
            return (i + capacity()) % capacity();
        }

        /* 先頭にエンキューする */
        public void pushFirst(int num) {
            if (queSize == capacity()) {
                System.out.println("両端キューが満杯です");
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
            front = index(front - 1);
            // num をキューの先頭に追加する
            nums[front] = num;
            queSize++;
        }

        /* 末尾にエンキューする */
        public void pushLast(int num) {
            if (queSize == capacity()) {
                System.out.println("両端キューが満杯です");
                return;
            }
            // 末尾のインデックス + 1 を指す末尾ポインタを計算する
            int rear = index(front + queSize);
            // num をキューの末尾に追加する
            nums[rear] = num;
            queSize++;
        }

        /* 先頭からデキューする */
        public int popFirst() {
            int num = peekFirst();
            // 先頭ポインタを後ろに 1 つ移動する
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* 末尾からデキューする */
        public int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* キューの先頭要素にアクセス */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* キューの末尾要素にアクセスする */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            // 末尾要素のインデックスを計算する
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* 表示用の配列を返す */
        public int[] toArray() {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[index(j)];
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_deque.cs"
    /* 循環配列で実装した両端キュー */
    class ArrayDeque {
        int[] nums;  // 両端キューの要素を格納する配列
        int front;   // キューの先頭要素を指す先頭ポインタ
        int queSize; // 両端キューの長さ

        /* コンストラクタ */
        public ArrayDeque(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* 両端キューの容量を取得する */
        int Capacity() {
            return nums.Length;
        }

        /* 両端キューの長さを取得する */
        public int Size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定する */
        public bool IsEmpty() {
            return queSize == 0;
        }

        /* 循環配列のインデックスを計算する */
        int Index(int i) {
            // 剰余演算を使い、配列の先頭と末尾をつなぐ
            // i が配列の末尾を越えたら、先頭に戻る
            // i が配列の先頭を越えたら、末尾に戻る
            return (i + Capacity()) % Capacity();
        }

        /* 先頭にエンキューする */
        public void PushFirst(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("両端キューが満杯です");
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
            front = Index(front - 1);
            // num をキューの先頭に追加する
            nums[front] = num;
            queSize++;
        }

        /* 末尾にエンキューする */
        public void PushLast(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("両端キューが満杯です");
                return;
            }
            // 末尾のインデックス + 1 を指す末尾ポインタを計算する
            int rear = Index(front + queSize);
            // num をキューの末尾に追加する
            nums[rear] = num;
            queSize++;
        }

        /* 先頭からデキューする */
        public int PopFirst() {
            int num = PeekFirst();
            // 先頭ポインタを後ろに 1 つ移動する
            front = Index(front + 1);
            queSize--;
            return num;
        }

        /* 末尾からデキューする */
        public int PopLast() {
            int num = PeekLast();
            queSize--;
            return num;
        }

        /* キューの先頭要素にアクセス */
        public int PeekFirst() {
            if (IsEmpty()) {
                throw new InvalidOperationException();
            }
            return nums[front];
        }

        /* キューの末尾要素にアクセスする */
        public int PeekLast() {
            if (IsEmpty()) {
                throw new InvalidOperationException();
            }
            // 末尾要素のインデックスを計算する
            int last = Index(front + queSize - 1);
            return nums[last];
        }

        /* 表示用の配列を返す */
        public int[] ToArray() {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[Index(j)];
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_deque.go"
    /* 循環配列で実装した両端キュー */
    type arrayDeque struct {
        nums        []int // 両端キューの要素を格納する配列
        front       int   // キューの先頭要素を指す先頭ポインタ
        queSize     int   // 両端キューの長さ
        queCapacity int   // キューの容量（格納できる要素数の上限）
    }

    /* キューを初期化する */
    func newArrayDeque(queCapacity int) *arrayDeque {
        return &arrayDeque{
            nums:        make([]int, queCapacity),
            queCapacity: queCapacity,
            front:       0,
            queSize:     0,
        }
    }

    /* 両端キューの長さを取得する */
    func (q *arrayDeque) size() int {
        return q.queSize
    }

    /* 両端キューが空かどうかを判定する */
    func (q *arrayDeque) isEmpty() bool {
        return q.queSize == 0
    }

    /* 循環配列のインデックスを計算する */
    func (q *arrayDeque) index(i int) int {
        // 剰余演算を使い、配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら、先頭に戻る
        // i が配列の先頭を越えたら、末尾に戻る
        return (i + q.queCapacity) % q.queCapacity
    }

    /* 先頭にエンキューする */
    func (q *arrayDeque) pushFirst(num int) {
        if q.queSize == q.queCapacity {
            fmt.Println("両端キューが満杯です")
            return
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        q.front = q.index(q.front - 1)
        // num をキューの先頭に追加する
        q.nums[q.front] = num
        q.queSize++
    }

    /* 末尾にエンキューする */
    func (q *arrayDeque) pushLast(num int) {
        if q.queSize == q.queCapacity {
            fmt.Println("両端キューが満杯です")
            return
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        rear := q.index(q.front + q.queSize)
        // num をキューの末尾に追加する
        q.nums[rear] = num
        q.queSize++
    }

    /* 先頭からデキューする */
    func (q *arrayDeque) popFirst() any {
        num := q.peekFirst()
        if num == nil {
            return nil
        }
        // 先頭ポインタを後ろに 1 つ移動する
        q.front = q.index(q.front + 1)
        q.queSize--
        return num
    }

    /* 末尾からデキューする */
    func (q *arrayDeque) popLast() any {
        num := q.peekLast()
        if num == nil {
            return nil
        }
        q.queSize--
        return num
    }

    /* キューの先頭要素にアクセス */
    func (q *arrayDeque) peekFirst() any {
        if q.isEmpty() {
            return nil
        }
        return q.nums[q.front]
    }

    /* キューの末尾要素にアクセスする */
    func (q *arrayDeque) peekLast() any {
        if q.isEmpty() {
            return nil
        }
        // 末尾要素のインデックスを計算する
        last := q.index(q.front + q.queSize - 1)
        return q.nums[last]
    }

    /* 表示用の Slice を取得する */
    func (q *arrayDeque) toSlice() []int {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        res := make([]int, q.queSize)
        for i, j := 0, q.front; i < q.queSize; i++ {
            res[i] = q.nums[q.index(j)]
            j++
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="array_deque.swift"
    /* 循環配列で実装した両端キュー */
    class ArrayDeque {
        private var nums: [Int] // 両端キューの要素を格納する配列
        private var front: Int // キューの先頭要素を指す先頭ポインタ
        private var _size: Int // 両端キューの長さ

        /* コンストラクタ */
        init(capacity: Int) {
            nums = Array(repeating: 0, count: capacity)
            front = 0
            _size = 0
        }

        /* 両端キューの容量を取得する */
        func capacity() -> Int {
            nums.count
        }

        /* 両端キューの長さを取得する */
        func size() -> Int {
            _size
        }

        /* 両端キューが空かどうかを判定する */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* 循環配列のインデックスを計算する */
        private func index(i: Int) -> Int {
            // 剰余演算を使い、配列の先頭と末尾をつなぐ
            // i が配列の末尾を越えたら、先頭に戻る
            // i が配列の先頭を越えたら、末尾に戻る
            (i + capacity()) % capacity()
        }

        /* 先頭にエンキューする */
        func pushFirst(num: Int) {
            if size() == capacity() {
                print("両端キューが満杯です")
                return
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
            front = index(i: front - 1)
            // num をキューの先頭に追加する
            nums[front] = num
            _size += 1
        }

        /* 末尾にエンキューする */
        func pushLast(num: Int) {
            if size() == capacity() {
                print("両端キューが満杯です")
                return
            }
            // 末尾のインデックス + 1 を指す末尾ポインタを計算する
            let rear = index(i: front + size())
            // num をキューの末尾に追加する
            nums[rear] = num
            _size += 1
        }

        /* 先頭からデキューする */
        func popFirst() -> Int {
            let num = peekFirst()
            // 先頭ポインタを後ろに 1 つ移動する
            front = index(i: front + 1)
            _size -= 1
            return num
        }

        /* 末尾からデキューする */
        func popLast() -> Int {
            let num = peekLast()
            _size -= 1
            return num
        }

        /* キューの先頭要素にアクセス */
        func peekFirst() -> Int {
            if isEmpty() {
                fatalError("両端キューが空です")
            }
            return nums[front]
        }

        /* キューの末尾要素にアクセスする */
        func peekLast() -> Int {
            if isEmpty() {
                fatalError("両端キューが空です")
            }
            // 末尾要素のインデックスを計算する
            let last = index(i: front + size() - 1)
            return nums[last]
        }

        /* 表示用の配列を返す */
        func toArray() -> [Int] {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
            (front ..< front + size()).map { nums[index(i: $0)] }
        }
    }
    ```

=== "JS"

    ```javascript title="array_deque.js"
    /* 循環配列で実装した両端キュー */
    class ArrayDeque {
        #nums; // 両端キューの要素を格納する配列
        #front; // キューの先頭要素を指す先頭ポインタ
        #queSize; // 両端キューの長さ

        /* コンストラクタ */
        constructor(capacity) {
            this.#nums = new Array(capacity);
            this.#front = 0;
            this.#queSize = 0;
        }

        /* 両端キューの容量を取得する */
        capacity() {
            return this.#nums.length;
        }

        /* 両端キューの長さを取得する */
        size() {
            return this.#queSize;
        }

        /* 両端キューが空かどうかを判定する */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* 循環配列のインデックスを計算する */
        index(i) {
            // 剰余演算を使い、配列の先頭と末尾をつなぐ
            // i が配列の末尾を越えたら、先頭に戻る
            // i が配列の先頭を越えたら、末尾に戻る
            return (i + this.capacity()) % this.capacity();
        }

        /* 先頭にエンキューする */
        pushFirst(num) {
            if (this.#queSize === this.capacity()) {
                console.log('両端キューが満杯です');
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
            this.#front = this.index(this.#front - 1);
            // num をキューの先頭に追加する
            this.#nums[this.#front] = num;
            this.#queSize++;
        }

        /* 末尾にエンキューする */
        pushLast(num) {
            if (this.#queSize === this.capacity()) {
                console.log('両端キューが満杯です');
                return;
            }
            // 末尾のインデックス + 1 を指す末尾ポインタを計算する
            const rear = this.index(this.#front + this.#queSize);
            // num をキューの末尾に追加する
            this.#nums[rear] = num;
            this.#queSize++;
        }

        /* 先頭からデキューする */
        popFirst() {
            const num = this.peekFirst();
            // 先頭ポインタを後ろに 1 つ移動する
            this.#front = this.index(this.#front + 1);
            this.#queSize--;
            return num;
        }

        /* 末尾からデキューする */
        popLast() {
            const num = this.peekLast();
            this.#queSize--;
            return num;
        }

        /* キューの先頭要素にアクセス */
        peekFirst() {
            if (this.isEmpty()) throw new Error('両端キューが空です。');
            return this.#nums[this.#front];
        }

        /* キューの末尾要素にアクセスする */
        peekLast() {
            if (this.isEmpty()) throw new Error('両端キューが空です。');
            // 末尾要素のインデックスを計算する
            const last = this.index(this.#front + this.#queSize - 1);
            return this.#nums[last];
        }

        /* 表示用の配列を返す */
        toArray() {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
            const res = [];
            for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
                res[i] = this.#nums[this.index(j)];
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="array_deque.ts"
    /* 循環配列で実装した両端キュー */
    class ArrayDeque {
        private nums: number[]; // 両端キューの要素を格納する配列
        private front: number; // キューの先頭要素を指す先頭ポインタ
        private queSize: number; // 両端キューの長さ

        /* コンストラクタ */
        constructor(capacity: number) {
            this.nums = new Array(capacity);
            this.front = 0;
            this.queSize = 0;
        }

        /* 両端キューの容量を取得する */
        capacity(): number {
            return this.nums.length;
        }

        /* 両端キューの長さを取得する */
        size(): number {
            return this.queSize;
        }

        /* 両端キューが空かどうかを判定する */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* 循環配列のインデックスを計算する */
        index(i: number): number {
            // 剰余演算を使い、配列の先頭と末尾をつなぐ
            // i が配列の末尾を越えたら、先頭に戻る
            // i が配列の先頭を越えたら、末尾に戻る
            return (i + this.capacity()) % this.capacity();
        }

        /* 先頭にエンキューする */
        pushFirst(num: number): void {
            if (this.queSize === this.capacity()) {
                console.log('両端キューが満杯です');
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
            this.front = this.index(this.front - 1);
            // num をキューの先頭に追加する
            this.nums[this.front] = num;
            this.queSize++;
        }

        /* 末尾にエンキューする */
        pushLast(num: number): void {
            if (this.queSize === this.capacity()) {
                console.log('両端キューが満杯です');
                return;
            }
            // 末尾のインデックス + 1 を指す末尾ポインタを計算する
            const rear: number = this.index(this.front + this.queSize);
            // num をキューの末尾に追加する
            this.nums[rear] = num;
            this.queSize++;
        }

        /* 先頭からデキューする */
        popFirst(): number {
            const num: number = this.peekFirst();
            // 先頭ポインタを後ろに 1 つ移動する
            this.front = this.index(this.front + 1);
            this.queSize--;
            return num;
        }

        /* 末尾からデキューする */
        popLast(): number {
            const num: number = this.peekLast();
            this.queSize--;
            return num;
        }

        /* キューの先頭要素にアクセス */
        peekFirst(): number {
            if (this.isEmpty()) throw new Error('両端キューが空です。');
            return this.nums[this.front];
        }

        /* キューの末尾要素にアクセスする */
        peekLast(): number {
            if (this.isEmpty()) throw new Error('両端キューが空です。');
            // 末尾要素のインデックスを計算する
            const last = this.index(this.front + this.queSize - 1);
            return this.nums[last];
        }

        /* 表示用の配列を返す */
        toArray(): number[] {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
            const res: number[] = [];
            for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
                res[i] = this.nums[this.index(j)];
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="array_deque.dart"
    /* 循環配列で実装した両端キュー */
    class ArrayDeque {
      late List<int> _nums; // 両端キューの要素を格納する配列
      late int _front; // キューの先頭要素を指す先頭ポインタ
      late int _queSize; // 両端キューの長さ

      /* コンストラクタ */
      ArrayDeque(int capacity) {
        this._nums = List.filled(capacity, 0);
        this._front = this._queSize = 0;
      }

      /* 両端キューの容量を取得する */
      int capacity() {
        return _nums.length;
      }

      /* 両端キューの長さを取得する */
      int size() {
        return _queSize;
      }

      /* 両端キューが空かどうかを判定する */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* 循環配列のインデックスを計算する */
      int index(int i) {
        // 剰余演算を使い、配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら、先頭に戻る
        // i が配列の先頭を越えたら、末尾に戻る
        return (i + capacity()) % capacity();
      }

      /* 先頭にエンキューする */
      void pushFirst(int _num) {
        if (_queSize == capacity()) {
          throw Exception("両端キューが満杯です");
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、_front が配列の先頭を越えたら末尾に戻るようにする
        _front = index(_front - 1);
        // _num をキューの先頭に追加する
        _nums[_front] = _num;
        _queSize++;
      }

      /* 末尾にエンキューする */
      void pushLast(int _num) {
        if (_queSize == capacity()) {
          throw Exception("両端キューが満杯です");
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        int rear = index(_front + _queSize);
        // _num をキューの末尾に追加する
        _nums[rear] = _num;
        _queSize++;
      }

      /* 先頭からデキューする */
      int popFirst() {
        int _num = peekFirst();
        // 先頭ポインタを右に 1 つ移動する
        _front = index(_front + 1);
        _queSize--;
        return _num;
      }

      /* 末尾からデキューする */
      int popLast() {
        int _num = peekLast();
        _queSize--;
        return _num;
      }

      /* キューの先頭要素にアクセス */
      int peekFirst() {
        if (isEmpty()) {
          throw Exception("両端キューが空です");
        }
        return _nums[_front];
      }

      /* キューの末尾要素にアクセスする */
      int peekLast() {
        if (isEmpty()) {
          throw Exception("両端キューが空です");
        }
        // 末尾要素のインデックスを計算する
        int last = index(_front + _queSize - 1);
        return _nums[last];
      }

      /* 表示用の配列を返す */
      List<int> toArray() {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        List<int> res = List.filled(_queSize, 0);
        for (int i = 0, j = _front; i < _queSize; i++, j++) {
          res[i] = _nums[index(j)];
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_deque.rs"
    /* 循環配列で実装した両端キュー */
    struct ArrayDeque<T> {
        nums: Vec<T>,    // 両端キューの要素を格納する配列
        front: usize,    // キューの先頭要素を指す先頭ポインタ
        que_size: usize, // 両端キューの長さ
    }

    impl<T: Copy + Default> ArrayDeque<T> {
        /* コンストラクタ */
        pub fn new(capacity: usize) -> Self {
            Self {
                nums: vec![T::default(); capacity],
                front: 0,
                que_size: 0,
            }
        }

        /* 両端キューの容量を取得する */
        pub fn capacity(&self) -> usize {
            self.nums.len()
        }

        /* 両端キューの長さを取得する */
        pub fn size(&self) -> usize {
            self.que_size
        }

        /* 両端キューが空かどうかを判定する */
        pub fn is_empty(&self) -> bool {
            self.que_size == 0
        }

        /* 循環配列のインデックスを計算する */
        fn index(&self, i: i32) -> usize {
            // 剰余演算を使い、配列の先頭と末尾をつなぐ
            // i が配列の末尾を越えたら、先頭に戻る
            // i が配列の先頭を越えたら、末尾に戻る
            ((i + self.capacity() as i32) % self.capacity() as i32) as usize
        }

        /* 先頭にエンキューする */
        pub fn push_first(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("両端キューが満杯です");
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
            self.front = self.index(self.front as i32 - 1);
            // num をキューの先頭に追加する
            self.nums[self.front] = num;
            self.que_size += 1;
        }

        /* 末尾にエンキューする */
        pub fn push_last(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("両端キューが満杯です");
                return;
            }
            // 末尾のインデックス + 1 を指す末尾ポインタを計算する
            let rear = self.index(self.front as i32 + self.que_size as i32);
            // num をキューの末尾に追加する
            self.nums[rear] = num;
            self.que_size += 1;
        }

        /* 先頭からデキューする */
        fn pop_first(&mut self) -> T {
            let num = self.peek_first();
            // 先頭ポインタを後ろに 1 つ移動する
            self.front = self.index(self.front as i32 + 1);
            self.que_size -= 1;
            num
        }

        /* 末尾からデキューする */
        fn pop_last(&mut self) -> T {
            let num = self.peek_last();
            self.que_size -= 1;
            num
        }

        /* キューの先頭要素にアクセス */
        fn peek_first(&self) -> T {
            if self.is_empty() {
                panic!("両端キューが空です")
            };
            self.nums[self.front]
        }

        /* キューの末尾要素にアクセスする */
        fn peek_last(&self) -> T {
            if self.is_empty() {
                panic!("両端キューが空です")
            };
            // 末尾要素のインデックスを計算する
            let last = self.index(self.front as i32 + self.que_size as i32 - 1);
            self.nums[last]
        }

        /* 表示用の配列を返す */
        fn to_array(&self) -> Vec<T> {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
            let mut res = vec![T::default(); self.que_size];
            let mut j = self.front;
            for i in 0..self.que_size {
                res[i] = self.nums[self.index(j as i32)];
                j += 1;
            }
            res
        }
    }
    ```

=== "C"

    ```c title="array_deque.c"
    /* 循環配列で実装した両端キュー */
    typedef struct {
        int *nums;       // キューの要素を格納する配列
        int front;       // キューの先頭要素を指す先頭ポインタ
        int queSize;     // キューの末尾 + 1 を指す末尾ポインタ
        int queCapacity; // キューの容量
    } ArrayDeque;

    /* コンストラクタ */
    ArrayDeque *newArrayDeque(int capacity) {
        ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
        // 配列を初期化する
        deque->queCapacity = capacity;
        deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
        deque->front = deque->queSize = 0;
        return deque;
    }

    /* デストラクタ */
    void delArrayDeque(ArrayDeque *deque) {
        free(deque->nums);
        free(deque);
    }

    /* 両端キューの容量を取得する */
    int capacity(ArrayDeque *deque) {
        return deque->queCapacity;
    }

    /* 両端キューの長さを取得する */
    int size(ArrayDeque *deque) {
        return deque->queSize;
    }

    /* 両端キューが空かどうかを判定する */
    bool empty(ArrayDeque *deque) {
        return deque->queSize == 0;
    }

    /* 循環配列のインデックスを計算する */
    int dequeIndex(ArrayDeque *deque, int i) {
        // 剰余演算を使い、配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら、先頭に戻る
        // i が配列の先頭を越えたら、末尾に戻る
        return ((i + capacity(deque)) % capacity(deque));
    }

    /* 先頭にエンキューする */
    void pushFirst(ArrayDeque *deque, int num) {
        if (deque->queSize == capacity(deque)) {
            printf("両端キューが満杯です\r\n");
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        deque->front = dequeIndex(deque, deque->front - 1);
        // num をキューの先頭に追加する
        deque->nums[deque->front] = num;
        deque->queSize++;
    }

    /* 末尾にエンキューする */
    void pushLast(ArrayDeque *deque, int num) {
        if (deque->queSize == capacity(deque)) {
            printf("両端キューが満杯です\r\n");
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        int rear = dequeIndex(deque, deque->front + deque->queSize);
        // num をキューの末尾に追加する
        deque->nums[rear] = num;
        deque->queSize++;
    }

    /* キューの先頭要素にアクセス */
    int peekFirst(ArrayDeque *deque) {
        // アクセス例外：両端キューが空です
        assert(empty(deque) == 0);
        return deque->nums[deque->front];
    }

    /* キューの末尾要素にアクセスする */
    int peekLast(ArrayDeque *deque) {
        // アクセス例外：両端キューが空です
        assert(empty(deque) == 0);
        int last = dequeIndex(deque, deque->front + deque->queSize - 1);
        return deque->nums[last];
    }

    /* 先頭からデキューする */
    int popFirst(ArrayDeque *deque) {
        int num = peekFirst(deque);
        // 先頭ポインタを後ろに 1 つ移動する
        deque->front = dequeIndex(deque, deque->front + 1);
        deque->queSize--;
        return num;
    }

    /* 末尾からデキューする */
    int popLast(ArrayDeque *deque) {
        int num = peekLast(deque);
        deque->queSize--;
        return num;
    }

    /* 表示用の配列を返す */
    int *toArray(ArrayDeque *deque, int *queSize) {
        *queSize = deque->queSize;
        int *res = (int *)calloc(deque->queSize, sizeof(int));
        int j = deque->front;
        for (int i = 0; i < deque->queSize; i++) {
            res[i] = deque->nums[j % deque->queCapacity];
            j++;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_deque.kt"
    /* コンストラクタ */
    class ArrayDeque(capacity: Int) {
        private var nums: IntArray = IntArray(capacity) // 両端キューの要素を格納する配列
        private var front: Int = 0 // キューの先頭要素を指す先頭ポインタ
        private var queSize: Int = 0 // 両端キューの長さ

        /* 両端キューの容量を取得する */
        fun capacity(): Int {
            return nums.size
        }

        /* 両端キューの長さを取得する */
        fun size(): Int {
            return queSize
        }

        /* 両端キューが空かどうかを判定する */
        fun isEmpty(): Boolean {
            return queSize == 0
        }

        /* 循環配列のインデックスを計算する */
        private fun index(i: Int): Int {
            // 剰余演算を使い、配列の先頭と末尾をつなぐ
            // i が配列の末尾を越えたら、先頭に戻る
            // i が配列の先頭を越えたら、末尾に戻る
            return (i + capacity()) % capacity()
        }

        /* 先頭にエンキューする */
        fun pushFirst(num: Int) {
            if (queSize == capacity()) {
                println("両端キューが満杯です")
                return
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
            front = index(front - 1)
            // num をキューの先頭に追加する
            nums[front] = num
            queSize++
        }

        /* 末尾にエンキューする */
        fun pushLast(num: Int) {
            if (queSize == capacity()) {
                println("両端キューが満杯です")
                return
            }
            // 末尾のインデックス + 1 を指す末尾ポインタを計算する
            val rear = index(front + queSize)
            // num をキューの末尾に追加する
            nums[rear] = num
            queSize++
        }

        /* 先頭からデキューする */
        fun popFirst(): Int {
            val num = peekFirst()
            // 先頭ポインタを後ろに 1 つ移動する
            front = index(front + 1)
            queSize--
            return num
        }

        /* 末尾からデキューする */
        fun popLast(): Int {
            val num = peekLast()
            queSize--
            return num
        }

        /* キューの先頭要素にアクセス */
        fun peekFirst(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return nums[front]
        }

        /* キューの末尾要素にアクセスする */
        fun peekLast(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            // 末尾要素のインデックスを計算する
            val last = index(front + queSize - 1)
            return nums[last]
        }

        /* 表示用の配列を返す */
        fun toArray(): IntArray {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
            val res = IntArray(queSize)
            var i = 0
            var j = front
            while (i < queSize) {
                res[i] = nums[index(j)]
                i++
                j++
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_deque.rb"
    ### 循環配列で実装した両端キュー ###
    class ArrayDeque
      ### 両端キューの長さを取得する ###
      attr_reader :size

      ### コンストラクタ ###
      def initialize(capacity)
        @nums = Array.new(capacity, 0)
        @front = 0
        @size = 0
      end

      ### 両端キューの容量を取得する ###
      def capacity
        @nums.length
      end

      ### 両端キューが空かどうかを判定する ###
      def is_empty?
        size.zero?
      end

      ### 先頭にエンキューする ###
      def push_first(num)
        if size == capacity
          puts '両端キューが満杯です'
          return
        end

        # 先頭ポインタを左に 1 つ移動する
        # 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        @front = index(@front - 1)
        # num をキューの先頭に追加する
        @nums[@front] = num
        @size += 1
      end

      ### 末尾にエンキューする ###
      def push_last(num)
        if size == capacity
          puts '両端キューが満杯です'
          return
        end

        # 末尾のインデックス + 1 を指す末尾ポインタを計算する
        rear = index(@front + size)
        # num をキューの末尾に追加する
        @nums[rear] = num
        @size += 1
      end

      ### 先頭からデキューする ###
      def pop_first
        num = peek_first
        # 先頭ポインタを後ろに 1 つ移動する
        @front = index(@front + 1)
        @size -= 1
        num
      end

      ### 末尾からデキューする ###
      def pop_last
        num = peek_last
        @size -= 1
        num
      end

      ### キューの先頭要素にアクセス ###
      def peek_first
        raise IndexError, '両端キューが空です' if is_empty?

        @nums[@front]
      end

      ### キューの末尾要素にアクセスする ###
      def peek_last
        raise IndexError, '両端キューが空です' if is_empty?

        # 末尾要素のインデックスを計算する
        last = index(@front + size - 1)
        @nums[last]
      end

      ### 表示用の配列を返す ###
      def to_array
        # 有効な長さの範囲内にあるリストの要素だけを変換する
        res = []
        for i in 0...size
          res << @nums[index(@front + i)]
        end
        res
      end

      private

      ### 循環配列のインデックスを計算する ###
      def index(i)
        # 剰余演算を使い、配列の先頭と末尾をつなぐ
        # i が配列の末尾を越えたら、先頭に戻る
        # i が配列の先頭を越えたら、末尾に戻る
        (i + capacity) % capacity
      end
    end
    ```

## 5.3.3 &nbsp; 両端キューの用途

両端キューはスタックとキューの両方の論理を持つため、**両者のすべての用途を実現でき、さらに高い自由度も提供します**。

ソフトウェアの「元に戻す」は通常、変更のたびに操作をスタックへ `push` し、`pop` で取り消します。ただし、システム資源の制約から、通常は、保存できる履歴が例えば $50$ 回までに制限されます。長さが $50$ を超えたら、底、つまりキューの先頭から削除する必要があります。**スタックではできないため、両端キューに置き換えます**。「元に戻す」の中心的な論理は依然として先入れ後出しであり、両端キューは追加の処理をより柔軟に実現している点に注意してください。
