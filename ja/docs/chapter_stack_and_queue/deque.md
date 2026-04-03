---
comments: true
---

# 5.3 &nbsp; 両端キュー

キューでは、先頭要素を削除するか末尾に要素を追加することしかできません。次の図に示すように、<u>両端キュー（double-ended queue）</u>はより高い柔軟性を備えており、先頭と末尾の両方で要素の追加や削除を行えます。

![両端キューの操作](deque.assets/deque_operations.png){ class="animation-figure" }

<p align="center"> 図 5-7 &nbsp; 両端キューの操作 </p>

## 5.3.1 &nbsp; 両端キューの基本操作

両端キューの基本操作を次の表に示します。具体的なメソッド名は、使用するプログラミング言語によって異なります。

<p align="center"> 表 5-3 &nbsp; 両端キューの操作効率 </p>

<div class="center-table" markdown>

| メソッド名     | 説明             | 時間計算量 |
| -------------- | ---------------- | ---------- |
| `push_first()` | 先頭に要素を追加 | $O(1)$     |
| `push_last()`  | 末尾に要素を追加 | $O(1)$     |
| `pop_first()`  | 先頭要素を削除   | $O(1)$     |
| `pop_last()`   | 末尾要素を削除   | $O(1)$     |
| `peek_first()` | 先頭要素にアクセス | $O(1)$     |
| `peek_last()`  | 末尾要素にアクセス | $O(1)$     |

</div>

同様に、プログラミング言語に組み込み実装されている両端キューのクラスを直接使うこともできます：

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
    pop_front: int = deq.popleft()  # 先頭要素をデキュー
    pop_rear: int = deq.pop()       # 末尾要素をデキュー

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
    deque.pop_front();  // 先頭要素をデキュー
    deque.pop_back();   // 末尾要素をデキュー

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
    int popFirst = deque.pollFirst();  // 先頭要素をデキュー
    int popLast = deque.pollLast();    // 末尾要素をデキュー

    /* 両端キューの長さを取得 */
    int size = deque.size();

    /* 両端キューが空かどうかを判定 */
    boolean isEmpty = deque.isEmpty();
    ```

=== "C#"

    ```csharp title="deque.cs"
    /* 両端キューを初期化 */
    // C# では、連結リスト LinkedList を両端キューとして使用する
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
    deque.RemoveFirst();  // 先頭要素をデキュー
    deque.RemoveLast();   // 末尾要素をデキュー

    /* 両端キューの長さを取得 */
    int size = deque.Count;

    /* 両端キューが空かどうかを判定 */
    bool isEmpty = deque.Count == 0;
    ```

=== "Go"

    ```go title="deque_test.go"
    /* 両端キューを初期化 */
    // Go では、list を両端キューとして使用する
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
    deque.Remove(front)    // 先頭要素をデキュー
    deque.Remove(rear)     // 末尾要素をデキュー

    /* 両端キューの長さを取得 */
    size := deque.Len()

    /* 両端キューが空かどうかを判定 */
    isEmpty := deque.Len() == 0
    ```

=== "Swift"

    ```swift title="deque.swift"
    /* 両端キューを初期化 */
    // Swift には組み込みの両端キュークラスがないため、Array を両端キューとして使用する
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
    // Array で模擬する場合、popFirst の計算量は O(n)
    let popFirst = deque.removeFirst() // 先頭要素をデキュー
    let popLast = deque.removeLast() // 末尾要素をデキュー

    /* 両端キューの長さを取得 */
    let size = deque.count

    /* 両端キューが空かどうかを判定 */
    let isEmpty = deque.isEmpty
    ```

=== "JS"

    ```javascript title="deque.js"
    /* 両端キューを初期化 */
    // JavaScript には組み込みの両端キューがないため、Array を両端キューとして使用するしかない
    const deque = [];

    /* 要素をエンキュー */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // 配列であるため、unshift() メソッドの時間計算量は O(n) です
    deque.unshift(3);
    deque.unshift(1);

    /* 要素にアクセス */
    const peekFirst = deque[0];
    const peekLast = deque[deque.length - 1];

    /* 要素をデキュー */
    // 配列であるため、shift() メソッドの時間計算量は O(n) です
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
    // TypeScript には組み込みの両端キューがないため、Array を両端キューとして使用するしかない
    const deque: number[] = [];

    /* 要素をエンキュー */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // 配列であるため、unshift() メソッドの時間計算量は O(n) です
    deque.unshift(3);
    deque.unshift(1);

    /* 要素にアクセス */
    const peekFirst: number = deque[0];
    const peekLast: number = deque[deque.length - 1];

    /* 要素をデキュー */
    // 配列であるため、shift() メソッドの時間計算量は O(n) です
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
    // Dart では、Queue は両端キューとして定義されています
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
    int popFirst = deque.removeFirst(); // 先頭要素をデキュー
    int popLast = deque.removeLast();   // 末尾要素をデキュー

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
    if let Some(pop_front) = deque.pop_front() { // 先頭要素をデキュー
    }
    if let Some(pop_rear) = deque.pop_back() {   // 末尾要素をデキュー
    }

    /* 両端キューの長さを取得 */
    let size = deque.len();

    /* 両端キューが空かどうかを判定 */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="deque.c"
    // C には組み込みの両端キューがありません
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
    val popFirst = deque.pollFirst() // 先頭要素をデキュー
    val popLast = deque.pollLast()   // 末尾要素をデキュー

    /* 両端キューの長さを取得 */
    val size = deque.size

    /* 両端キューが空かどうかを判定 */
    val isEmpty = deque.isEmpty()
    ```

=== "Ruby"

    ```ruby title="deque.rb"
    # 両端キューを初期化
    # Ruby には組み込みの両端キューがないため、Array を両端キューとして使用するしかありません
    deque = []

    # 要素をエンキュー
    deque << 2
    deque << 5
    deque << 4
    # 配列であるため、Array#unshift メソッドの時間計算量は O(n) です
    deque.unshift(3)
    deque.unshift(1)

    # 要素にアクセス
    peek_first = deque.first
    peek_last = deque.last

    # 要素をデキュー
    # 配列であるため、 Array#shift メソッドの時間計算量は O(n) です
    pop_front = deque.shift
    pop_back = deque.pop

    # 両端キューの長さを取得
    size = deque.length

    # 両端キューが空かどうかを判定
    is_empty = size.zero?
    ```

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E9%98%9F%0A%20%20%20%20deq.append%282%29%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%87%B3%E9%98%9F%E5%B0%BE%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%87%B3%E9%98%9F%E9%A6%96%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22,%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%20rear%20%3D%22,%20rear%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20%20pop_front%20%3D%22,%20pop_front%29%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%87%BA%E9%98%9F%E5%90%8E%20deque%20%3D%22,%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20%20pop_rear%20%3D%22,%20pop_rear%29%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%87%BA%E9%98%9F%E5%90%8E%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 5.3.2 &nbsp; 両端キューの実装 *

両端キューの実装はキューと似ており、連結リストまたは配列を基盤となるデータ構造として選べます。

### 1. &nbsp; 双方向連結リストに基づく実装

前節を振り返ると、通常の単方向連結リストを使ってキューを実装しました。これは、先頭ノードの削除（デキューに対応）と末尾ノードの後ろへの新規ノード追加（エンキューに対応）を容易に行えるためです。

両端キューでは、先頭と末尾のどちらでもエンキューとデキューを行えます。言い換えると、両端キューではもう一方の対称方向の操作も実装する必要があります。そのため、両端キューの基盤データ構造として「双方向連結リスト」を採用します。

次の図に示すように、双方向連結リストの先頭ノードと末尾ノードを両端キューの先頭と末尾と見なし、両端でノードを追加および削除する機能を実現します。

=== "<1>"
    ![連結リストによる両端キューのエンキューとデキュー](deque.assets/linkedlist_deque_step1.png){ class="animation-figure" }

=== "<2>"
    ![linkedlist_deque_push_last](deque.assets/linkedlist_deque_step2_push_last.png){ class="animation-figure" }

=== "<3>"
    ![linkedlist_deque_push_first](deque.assets/linkedlist_deque_step3_push_first.png){ class="animation-figure" }

=== "<4>"
    ![linkedlist_deque_pop_last](deque.assets/linkedlist_deque_step4_pop_last.png){ class="animation-figure" }

=== "<5>"
    ![linkedlist_deque_pop_first](deque.assets/linkedlist_deque_step5_pop_first.png){ class="animation-figure" }

<p align="center"> 図 5-8 &nbsp; 連結リストによる両端キューのエンキューとデキュー </p>

実装コードは次のとおりです：

=== "Python"

    ```python title="linkedlist_deque.py"
    class ListNode:
        """双方向連結リストノード"""

        def __init__(self, val: int):
            """コンストラクタ"""
            self.val: int = val
            self.next: ListNode | None = None  # 後続ノードへの参照
            self.prev: ListNode | None = None  # 前駆ノードへの参照

    class LinkedListDeque:
        """双方向連結リストベースの両端キュー"""

        def __init__(self):
            """コンストラクタ"""
            self._front: ListNode | None = None  # 先頭ノード front
            self._rear: ListNode | None = None  # 末尾ノード rear
            self._size: int = 0  # 両端キューの長さ

        def size(self) -> int:
            """両端キューの長さを取得"""
            return self._size

        def is_empty(self) -> bool:
            """両端キューが空かどうかを判定"""
            return self._size == 0

        def push(self, num: int, is_front: bool):
            """エンキュー操作"""
            node = ListNode(num)
            # 連結リストが空なら、front と rear の両方を node に向ける
            if self.is_empty():
                self._front = self._rear = node
            # 先頭へのエンキュー操作
            elif is_front:
                # node を連結リストの先頭に追加
                self._front.prev = node
                node.next = self._front
                self._front = node  # 先頭ノードを更新する
            # 末尾へのエンキュー操作
            else:
                # node を連結リストの末尾に追加
                self._rear.next = node
                node.prev = self._rear
                self._rear = node  # 末尾ノードを更新する
            self._size += 1  # キューの長さを更新

        def push_first(self, num: int):
            """キュー先頭にエンキュー"""
            self.push(num, True)

        def push_last(self, num: int):
            """キュー末尾にエンキュー"""
            self.push(num, False)

        def pop(self, is_front: bool) -> int:
            """デキュー操作"""
            if self.is_empty():
                raise IndexError("両端キューが空です")
            # キュー先頭からの取り出し
            if is_front:
                val: int = self._front.val  # 先頭ノードの値を一時保存
                # 先頭ノードを削除
                fnext: ListNode | None = self._front.next
                if fnext is not None:
                    fnext.prev = None
                    self._front.next = None
                self._front = fnext  # 先頭ノードを更新する
            # キュー末尾からの取り出し
            else:
                val: int = self._rear.val  # 末尾ノードの値を一時保存
                # 末尾ノードを削除
                rprev: ListNode | None = self._rear.prev
                if rprev is not None:
                    rprev.next = None
                    self._rear.prev = None
                self._rear = rprev  # 末尾ノードを更新する
            self._size -= 1  # キューの長さを更新
            return val

        def pop_first(self) -> int:
            """キュー先頭からデキュー"""
            return self.pop(True)

        def pop_last(self) -> int:
            """キュー末尾からデキュー"""
            return self.pop(False)

        def peek_first(self) -> int:
            """キュー先頭の要素にアクセス"""
            if self.is_empty():
                raise IndexError("両端キューが空です")
            return self._front.val

        def peek_last(self) -> int:
            """キュー末尾の要素にアクセス"""
            if self.is_empty():
                raise IndexError("両端キューが空です")
            return self._rear.val

        def to_array(self) -> list[int]:
            """出力用の配列を返す"""
            node = self._front
            res = [0] * self.size()
            for i in range(self.size()):
                res[i] = node.val
                node = node.next
            return res
    ```

=== "C++"

    ```cpp title="linkedlist_deque.cpp"
    /* 双方向連結リストノード */
    struct DoublyListNode {
        int val;              // ノード値
        DoublyListNode *next; // 後継ノードへのポインタ
        DoublyListNode *prev; // 前駆ノードへのポインタ
        DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
        }
    };

    /* 双方向連結リストベースの両端キュー */
    class LinkedListDeque {
      private:
        DoublyListNode *front, *rear; // 先頭ノード front、末尾ノード rear
        int queSize = 0;              // 両端キューの長さ

      public:
        /* コンストラクタ */
        LinkedListDeque() : front(nullptr), rear(nullptr) {
        }

        /* デストラクタメソッド */
        ~LinkedListDeque() {
            // 連結リストを走査してノードを削除し、メモリを解放する
            DoublyListNode *pre, *cur = front;
            while (cur != nullptr) {
                pre = cur;
                cur = cur->next;
                delete pre;
            }
        }

        /* 両端キューの長さを取得 */
        int size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定 */
        bool isEmpty() {
            return size() == 0;
        }

        /* エンキュー操作 */
        void push(int num, bool isFront) {
            DoublyListNode *node = new DoublyListNode(num);
            // 連結リストが空なら、front と rear の両方を node に向ける
            if (isEmpty())
                front = rear = node;
            // 先頭へのエンキュー操作
            else if (isFront) {
                // node を連結リストの先頭に追加
                front->prev = node;
                node->next = front;
                front = node; // 先頭ノードを更新する
            // 末尾へのエンキュー操作
            } else {
                // node を連結リストの末尾に追加
                rear->next = node;
                node->prev = rear;
                rear = node; // 末尾ノードを更新する
            }
            queSize++; // キューの長さを更新
        }

        /* キュー先頭にエンキュー */
        void pushFirst(int num) {
            push(num, true);
        }

        /* キュー末尾にエンキュー */
        void pushLast(int num) {
            push(num, false);
        }

        /* デキュー操作 */
        int pop(bool isFront) {
            if (isEmpty())
                throw out_of_range("キューが空です");
            int val;
            // キュー先頭からの取り出し
            if (isFront) {
                val = front->val; // 先頭ノードの値を一時保存
                // 先頭ノードを削除
                DoublyListNode *fNext = front->next;
                if (fNext != nullptr) {
                    fNext->prev = nullptr;
                    front->next = nullptr;
                }
                delete front;
                front = fNext; // 先頭ノードを更新する
            // キュー末尾からの取り出し
            } else {
                val = rear->val; // 末尾ノードの値を一時保存
                // 末尾ノードを削除
                DoublyListNode *rPrev = rear->prev;
                if (rPrev != nullptr) {
                    rPrev->next = nullptr;
                    rear->prev = nullptr;
                }
                delete rear;
                rear = rPrev; // 末尾ノードを更新する
            }
            queSize--; // キューの長さを更新
            return val;
        }

        /* キュー先頭からデキュー */
        int popFirst() {
            return pop(true);
        }

        /* キュー末尾からデキュー */
        int popLast() {
            return pop(false);
        }

        /* キュー先頭の要素にアクセス */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("両端キューが空です");
            return front->val;
        }

        /* キュー末尾の要素にアクセス */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("両端キューが空です");
            return rear->val;
        }

        /* 出力用の配列を返す */
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
    /* 双方向連結リストノード */
    class ListNode {
        int val; // ノード値
        ListNode next; // 後続ノードへの参照
        ListNode prev; // 前駆ノードへの参照

        ListNode(int val) {
            this.val = val;
            prev = next = null;
        }
    }

    /* 双方向連結リストベースの両端キュー */
    class LinkedListDeque {
        private ListNode front, rear; // 先頭ノード front、末尾ノード rear
        private int queSize = 0; // 両端キューの長さ

        public LinkedListDeque() {
            front = rear = null;
        }

        /* 両端キューの長さを取得 */
        public int size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* エンキュー操作 */
        private void push(int num, boolean isFront) {
            ListNode node = new ListNode(num);
            // 連結リストが空なら、front と rear の両方を node に向ける
            if (isEmpty())
                front = rear = node;
            // 先頭へのエンキュー操作
            else if (isFront) {
                // node を連結リストの先頭に追加
                front.prev = node;
                node.next = front;
                front = node; // 先頭ノードを更新する
            // 末尾へのエンキュー操作
            } else {
                // node を連結リストの末尾に追加
                rear.next = node;
                node.prev = rear;
                rear = node; // 末尾ノードを更新する
            }
            queSize++; // キューの長さを更新
        }

        /* キュー先頭にエンキュー */
        public void pushFirst(int num) {
            push(num, true);
        }

        /* キュー末尾にエンキュー */
        public void pushLast(int num) {
            push(num, false);
        }

        /* デキュー操作 */
        private int pop(boolean isFront) {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            int val;
            // キュー先頭からの取り出し
            if (isFront) {
                val = front.val; // 先頭ノードの値を一時保存
                // 先頭ノードを削除
                ListNode fNext = front.next;
                if (fNext != null) {
                    fNext.prev = null;
                    front.next = null;
                }
                front = fNext; // 先頭ノードを更新する
            // キュー末尾からの取り出し
            } else {
                val = rear.val; // 末尾ノードの値を一時保存
                // 末尾ノードを削除
                ListNode rPrev = rear.prev;
                if (rPrev != null) {
                    rPrev.next = null;
                    rear.prev = null;
                }
                rear = rPrev; // 末尾ノードを更新する
            }
            queSize--; // キューの長さを更新
            return val;
        }

        /* キュー先頭からデキュー */
        public int popFirst() {
            return pop(true);
        }

        /* キュー末尾からデキュー */
        public int popLast() {
            return pop(false);
        }

        /* キュー先頭の要素にアクセス */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* キュー末尾の要素にアクセス */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return rear.val;
        }

        /* 出力用の配列を返す */
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
    /* 双方向連結リストノード */
    class ListNode(int val) {
        public int val = val;       // ノード値
        public ListNode? next = null; // 後続ノードへの参照
        public ListNode? prev = null; // 前駆ノードへの参照
    }

    /* 双方向連結リストベースの両端キュー */
    class LinkedListDeque {
        ListNode? front, rear; // 先頭ノード front、末尾ノード rear
        int queSize = 0;      // 両端キューの長さ

        public LinkedListDeque() {
            front = null;
            rear = null;
        }

        /* 両端キューの長さを取得 */
        public int Size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定 */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* エンキュー操作 */
        void Push(int num, bool isFront) {
            ListNode node = new(num);
            // 連結リストが空なら、front と rear の両方を node に向ける
            if (IsEmpty()) {
                front = node;
                rear = node;
            }
            // 先頭へのエンキュー操作
            else if (isFront) {
                // node を連結リストの先頭に追加
                front!.prev = node;
                node.next = front;
                front = node; // 先頭ノードを更新する
            }
            // 末尾へのエンキュー操作
            else {
                // node を連結リストの末尾に追加
                rear!.next = node;
                node.prev = rear;
                rear = node;  // 末尾ノードを更新する
            }

            queSize++; // キューの長さを更新
        }

        /* キュー先頭にエンキュー */
        public void PushFirst(int num) {
            Push(num, true);
        }

        /* キュー末尾にエンキュー */
        public void PushLast(int num) {
            Push(num, false);
        }

        /* デキュー操作 */
        int? Pop(bool isFront) {
            if (IsEmpty())
                throw new Exception();
            int? val;
            // キュー先頭からの取り出し
            if (isFront) {
                val = front?.val; // 先頭ノードの値を一時保存
                // 先頭ノードを削除
                ListNode? fNext = front?.next;
                if (fNext != null) {
                    fNext.prev = null;
                    front!.next = null;
                }
                front = fNext;   // 先頭ノードを更新する
            }
            // キュー末尾からの取り出し
            else {
                val = rear?.val;  // 末尾ノードの値を一時保存
                // 末尾ノードを削除
                ListNode? rPrev = rear?.prev;
                if (rPrev != null) {
                    rPrev.next = null;
                    rear!.prev = null;
                }
                rear = rPrev;    // 末尾ノードを更新する
            }

            queSize--; // キューの長さを更新
            return val;
        }

        /* キュー先頭からデキュー */
        public int? PopFirst() {
            return Pop(true);
        }

        /* キュー末尾からデキュー */
        public int? PopLast() {
            return Pop(false);
        }

        /* キュー先頭の要素にアクセス */
        public int? PeekFirst() {
            if (IsEmpty())
                throw new Exception();
            return front?.val;
        }

        /* キュー末尾の要素にアクセス */
        public int? PeekLast() {
            if (IsEmpty())
                throw new Exception();
            return rear?.val;
        }

        /* 出力用の配列を返す */
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
    /* 双方向連結リストベースの両端キュー */
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

    /* キュー先頭に要素を追加する */
    func (s *linkedListDeque) pushFirst(value any) {
        s.data.PushFront(value)
    }

    /* キュー末尾に要素を追加する */
    func (s *linkedListDeque) pushLast(value any) {
        s.data.PushBack(value)
    }

    /* 先頭要素を取り出す */
    func (s *linkedListDeque) popFirst() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        s.data.Remove(e)
        return e.Value
    }

    /* 末尾要素を取り出す */
    func (s *linkedListDeque) popLast() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    /* キュー先頭の要素にアクセス */
    func (s *linkedListDeque) peekFirst() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        return e.Value
    }

    /* キュー末尾の要素にアクセス */
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

    /* キューが空かどうかを判定 */
    func (s *linkedListDeque) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* 表示用に List を取得 */
    func (s *linkedListDeque) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_deque.swift"
    /* 双方向連結リストノード */
    class ListNode {
        var val: Int // ノード値
        var next: ListNode? // 後続ノードへの参照
        weak var prev: ListNode? // 前駆ノードへの参照

        init(val: Int) {
            self.val = val
        }
    }

    /* 双方向連結リストベースの両端キュー */
    class LinkedListDeque {
        private var front: ListNode? // 先頭ノード front
        private var rear: ListNode? // 末尾ノード rear
        private var _size: Int // 両端キューの長さ

        init() {
            _size = 0
        }

        /* 両端キューの長さを取得 */
        func size() -> Int {
            _size
        }

        /* 両端キューが空かどうかを判定 */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* エンキュー操作 */
        private func push(num: Int, isFront: Bool) {
            let node = ListNode(val: num)
            // 連結リストが空なら、front と rear の両方を node に向ける
            if isEmpty() {
                front = node
                rear = node
            }
            // 先頭へのエンキュー操作
            else if isFront {
                // node を連結リストの先頭に追加
                front?.prev = node
                node.next = front
                front = node // 先頭ノードを更新する
            }
            // 末尾へのエンキュー操作
            else {
                // node を連結リストの末尾に追加
                rear?.next = node
                node.prev = rear
                rear = node // 末尾ノードを更新する
            }
            _size += 1 // キューの長さを更新
        }

        /* キュー先頭にエンキュー */
        func pushFirst(num: Int) {
            push(num: num, isFront: true)
        }

        /* キュー末尾にエンキュー */
        func pushLast(num: Int) {
            push(num: num, isFront: false)
        }

        /* デキュー操作 */
        private func pop(isFront: Bool) -> Int {
            if isEmpty() {
                fatalError("両端キューが空です")
            }
            let val: Int
            // キュー先頭からの取り出し
            if isFront {
                val = front!.val // 先頭ノードの値を一時保存
                // 先頭ノードを削除
                let fNext = front?.next
                if fNext != nil {
                    fNext?.prev = nil
                    front?.next = nil
                }
                front = fNext // 先頭ノードを更新する
            }
            // キュー末尾からの取り出し
            else {
                val = rear!.val // 末尾ノードの値を一時保存
                // 末尾ノードを削除
                let rPrev = rear?.prev
                if rPrev != nil {
                    rPrev?.next = nil
                    rear?.prev = nil
                }
                rear = rPrev // 末尾ノードを更新する
            }
            _size -= 1 // キューの長さを更新
            return val
        }

        /* キュー先頭からデキュー */
        func popFirst() -> Int {
            pop(isFront: true)
        }

        /* キュー末尾からデキュー */
        func popLast() -> Int {
            pop(isFront: false)
        }

        /* キュー先頭の要素にアクセス */
        func peekFirst() -> Int {
            if isEmpty() {
                fatalError("両端キューが空です")
            }
            return front!.val
        }

        /* キュー末尾の要素にアクセス */
        func peekLast() -> Int {
            if isEmpty() {
                fatalError("両端キューが空です")
            }
            return rear!.val
        }

        /* 出力用の配列を返す */
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
    /* 双方向連結リストノード */
    class ListNode {
        prev; // 前駆ノードへの参照（ポインタ）
        next; // 後継ノードへの参照（ポインタ）
        val; // ノード値

        constructor(val) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* 双方向連結リストベースの両端キュー */
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
            // 連結リストが空なら、front と rear の両方を node に向ける
            if (this.#queSize === 0) {
                this.#front = node;
                this.#rear = node;
            } else {
                // node を連結リストの末尾に追加
                this.#rear.next = node;
                node.prev = this.#rear;
                this.#rear = node; // 末尾ノードを更新する
            }
            this.#queSize++;
        }

        /* 先頭へのエンキュー操作 */
        pushFirst(val) {
            const node = new ListNode(val);
            // 連結リストが空なら、front と rear の両方を node に向ける
            if (this.#queSize === 0) {
                this.#front = node;
                this.#rear = node;
            } else {
                // node を連結リストの先頭に追加
                this.#front.prev = node;
                node.next = this.#front;
                this.#front = node; // 先頭ノードを更新する
            }
            this.#queSize++;
        }

        /* キュー末尾からの取り出し */
        popLast() {
            if (this.#queSize === 0) {
                return null;
            }
            const value = this.#rear.val; // 末尾ノードの値を保存する
            // 末尾ノードを削除
            let temp = this.#rear.prev;
            if (temp !== null) {
                temp.next = null;
                this.#rear.prev = null;
            }
            this.#rear = temp; // 末尾ノードを更新する
            this.#queSize--;
            return value;
        }

        /* キュー先頭からの取り出し */
        popFirst() {
            if (this.#queSize === 0) {
                return null;
            }
            const value = this.#front.val; // 末尾ノードの値を保存する
            // 先頭ノードを削除
            let temp = this.#front.next;
            if (temp !== null) {
                temp.prev = null;
                this.#front.next = null;
            }
            this.#front = temp; // 先頭ノードを更新する
            this.#queSize--;
            return value;
        }

        /* キュー末尾の要素にアクセス */
        peekLast() {
            return this.#queSize === 0 ? null : this.#rear.val;
        }

        /* キュー先頭の要素にアクセス */
        peekFirst() {
            return this.#queSize === 0 ? null : this.#front.val;
        }

        /* 両端キューの長さを取得 */
        size() {
            return this.#queSize;
        }

        /* 両端キューが空かどうかを判定 */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* 両端キューを出力する */
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
    /* 双方向連結リストノード */
    class ListNode {
        prev: ListNode; // 前駆ノードへの参照（ポインタ）
        next: ListNode; // 後継ノードへの参照（ポインタ）
        val: number; // ノード値

        constructor(val: number) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* 双方向連結リストベースの両端キュー */
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
            // 連結リストが空なら、front と rear の両方を node に向ける
            if (this.queSize === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // node を連結リストの末尾に追加
                this.rear.next = node;
                node.prev = this.rear;
                this.rear = node; // 末尾ノードを更新する
            }
            this.queSize++;
        }

        /* 先頭へのエンキュー操作 */
        pushFirst(val: number): void {
            const node: ListNode = new ListNode(val);
            // 連結リストが空なら、front と rear の両方を node に向ける
            if (this.queSize === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // node を連結リストの先頭に追加
                this.front.prev = node;
                node.next = this.front;
                this.front = node; // 先頭ノードを更新する
            }
            this.queSize++;
        }

        /* キュー末尾からの取り出し */
        popLast(): number {
            if (this.queSize === 0) {
                return null;
            }
            const value: number = this.rear.val; // 末尾ノードの値を保存する
            // 末尾ノードを削除
            let temp: ListNode = this.rear.prev;
            if (temp !== null) {
                temp.next = null;
                this.rear.prev = null;
            }
            this.rear = temp; // 末尾ノードを更新する
            this.queSize--;
            return value;
        }

        /* キュー先頭からの取り出し */
        popFirst(): number {
            if (this.queSize === 0) {
                return null;
            }
            const value: number = this.front.val; // 末尾ノードの値を保存する
            // 先頭ノードを削除
            let temp: ListNode = this.front.next;
            if (temp !== null) {
                temp.prev = null;
                this.front.next = null;
            }
            this.front = temp; // 先頭ノードを更新する
            this.queSize--;
            return value;
        }

        /* キュー末尾の要素にアクセス */
        peekLast(): number {
            return this.queSize === 0 ? null : this.rear.val;
        }

        /* キュー先頭の要素にアクセス */
        peekFirst(): number {
            return this.queSize === 0 ? null : this.front.val;
        }

        /* 両端キューの長さを取得 */
        size(): number {
            return this.queSize;
        }

        /* 両端キューが空かどうかを判定 */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* 両端キューを出力する */
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
    /* 双方向連結リストノード */
    class ListNode {
      int val; // ノード値
      ListNode? next; // 後続ノードへの参照
      ListNode? prev; // 前駆ノードへの参照

      ListNode(this.val, {this.next, this.prev});
    }

    /* 双方向連結リストに基づく双方向キュー */
    class LinkedListDeque {
      late ListNode? _front; // 先頭ノード _front
      late ListNode? _rear; // 末尾ノード _rear
      int _queSize = 0; // 両端キューの長さ

      LinkedListDeque() {
        this._front = null;
        this._rear = null;
      }

      /* 両端キューの長さを取得 */
      int size() {
        return this._queSize;
      }

      /* 両端キューが空かどうかを判定 */
      bool isEmpty() {
        return size() == 0;
      }

      /* エンキュー操作 */
      void push(int _num, bool isFront) {
        final ListNode node = ListNode(_num);
        if (isEmpty()) {
          // 連結リストが空なら、`_front` と `_rear` の両方を `node` に向ける
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
        _queSize++; // キューの長さを更新
      }

      /* キュー先頭にエンキュー */
      void pushFirst(int _num) {
        push(_num, true);
      }

      /* キュー末尾にエンキュー */
      void pushLast(int _num) {
        push(_num, false);
      }

      /* デキュー操作 */
      int? pop(bool isFront) {
        // キューが空なら、そのまま `null` を返す
        if (isEmpty()) {
          return null;
        }
        final int val;
        if (isFront) {
          // キュー先頭からの取り出し
          val = _front!.val; // 先頭ノードの値を一時保存
          // 先頭ノードを削除
          ListNode? fNext = _front!.next;
          if (fNext != null) {
            fNext.prev = null;
            _front!.next = null;
          }
          _front = fNext; // 先頭ノードを更新する
        } else {
          // キュー末尾からの取り出し
          val = _rear!.val; // 末尾ノードの値を一時保存
          // 末尾ノードを削除
          ListNode? rPrev = _rear!.prev;
          if (rPrev != null) {
            rPrev.next = null;
            _rear!.prev = null;
          }
          _rear = rPrev; // 末尾ノードを更新する
        }
        _queSize--; // キューの長さを更新
        return val;
      }

      /* キュー先頭からデキュー */
      int? popFirst() {
        return pop(true);
      }

      /* キュー末尾からデキュー */
      int? popLast() {
        return pop(false);
      }

      /* キュー先頭の要素にアクセス */
      int? peekFirst() {
        return _front?.val;
      }

      /* キュー末尾の要素にアクセス */
      int? peekLast() {
        return _rear?.val;
      }

      /* 出力用の配列を返す */
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
    /* 双方向連結リストノード */
    pub struct ListNode<T> {
        pub val: T,                                 // ノード値
        pub next: Option<Rc<RefCell<ListNode<T>>>>, // 後継ノードへのポインタ
        pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 前駆ノードへのポインタ
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

    /* 双方向連結リストベースの両端キュー */
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

        /* 両端キューの長さを取得 */
        pub fn size(&self) -> usize {
            return self.que_size;
        }

        /* 両端キューが空かどうかを判定 */
        pub fn is_empty(&self) -> bool {
            return self.que_size == 0;
        }

        /* エンキュー操作 */
        fn push(&mut self, num: T, is_front: bool) {
            let node = ListNode::new(num);
            // 先頭へのエンキュー操作
            if is_front {
                match self.front.take() {
                    // 連結リストが空なら、front と rear の両方を node に向ける
                    None => {
                        self.rear = Some(node.clone());
                        self.front = Some(node);
                    }
                    // node を連結リストの先頭に追加
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
                    // 連結リストが空なら、front と rear の両方を node に向ける
                    None => {
                        self.front = Some(node.clone());
                        self.rear = Some(node);
                    }
                    // node を連結リストの末尾に追加
                    Some(old_rear) => {
                        old_rear.borrow_mut().next = Some(node.clone());
                        node.borrow_mut().prev = Some(old_rear);
                        self.rear = Some(node); // 末尾ノードを更新する
                    }
                }
            }
            self.que_size += 1; // キューの長さを更新
        }

        /* キュー先頭にエンキュー */
        pub fn push_first(&mut self, num: T) {
            self.push(num, true);
        }

        /* キュー末尾にエンキュー */
        pub fn push_last(&mut self, num: T) {
            self.push(num, false);
        }

        /* デキュー操作 */
        fn pop(&mut self, is_front: bool) -> Option<T> {
            // キューが空なら、そのまま `None` を返す
            if self.is_empty() {
                return None;
            };
            // キュー先頭からの取り出し
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
                    self.que_size -= 1; // キューの長さを更新
                    old_front.borrow().val
                })
            }
            // キュー末尾からの取り出し
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
                    self.que_size -= 1; // キューの長さを更新
                    old_rear.borrow().val
                })
            }
        }

        /* キュー先頭からデキュー */
        pub fn pop_first(&mut self) -> Option<T> {
            return self.pop(true);
        }

        /* キュー末尾からデキュー */
        pub fn pop_last(&mut self) -> Option<T> {
            return self.pop(false);
        }

        /* キュー先頭の要素にアクセス */
        pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.front.as_ref()
        }

        /* キュー末尾の要素にアクセス */
        pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.rear.as_ref()
        }

        /* 出力用の配列を返す */
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
    /* 双方向連結リストノード */
    typedef struct DoublyListNode {
        int val;                     // ノード値
        struct DoublyListNode *next; // 後続ノード
        struct DoublyListNode *prev; // 前駆ノード
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

    /* 双方向連結リストベースの両端キュー */
    typedef struct {
        DoublyListNode *front, *rear; // 先頭ノード front、末尾ノード rear
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
        // すべてのノードを解放
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

    /* キューが空かどうかを判定 */
    bool empty(LinkedListDeque *deque) {
        return (size(deque) == 0);
    }

    /* エンキュー */
    void push(LinkedListDeque *deque, int num, bool isFront) {
        DoublyListNode *node = newDoublyListNode(num);
        // 連結リストが空なら、`front` と `rear` の両方を `node` に向ける
        if (empty(deque)) {
            deque->front = deque->rear = node;
        }
        // 先頭へのエンキュー操作
        else if (isFront) {
            // node を連結リストの先頭に追加
            deque->front->prev = node;
            node->next = deque->front;
            deque->front = node; // 先頭ノードを更新する
        }
        // 末尾へのエンキュー操作
        else {
            // node を連結リストの末尾に追加
            deque->rear->next = node;
            node->prev = deque->rear;
            deque->rear = node;
        }
        deque->queSize++; // キューの長さを更新
    }

    /* キュー先頭にエンキュー */
    void pushFirst(LinkedListDeque *deque, int num) {
        push(deque, num, true);
    }

    /* キュー末尾にエンキュー */
    void pushLast(LinkedListDeque *deque, int num) {
        push(deque, num, false);
    }

    /* キュー先頭の要素にアクセス */
    int peekFirst(LinkedListDeque *deque) {
        assert(size(deque) && deque->front);
        return deque->front->val;
    }

    /* キュー末尾の要素にアクセス */
    int peekLast(LinkedListDeque *deque) {
        assert(size(deque) && deque->rear);
        return deque->rear->val;
    }

    /* デキュー */
    int pop(LinkedListDeque *deque, bool isFront) {
        if (empty(deque))
            return -1;
        int val;
        // キュー先頭からの取り出し
        if (isFront) {
            val = peekFirst(deque); // 先頭ノードの値を一時保存
            DoublyListNode *fNext = deque->front->next;
            if (fNext) {
                fNext->prev = NULL;
                deque->front->next = NULL;
            }
            delDoublyListNode(deque->front);
            deque->front = fNext; // 先頭ノードを更新する
        }
        // キュー末尾からの取り出し
        else {
            val = peekLast(deque); // 末尾ノードの値を一時保存
            DoublyListNode *rPrev = deque->rear->prev;
            if (rPrev) {
                rPrev->next = NULL;
                deque->rear->prev = NULL;
            }
            delDoublyListNode(deque->rear);
            deque->rear = rPrev; // 末尾ノードを更新する
        }
        deque->queSize--; // キューの長さを更新
        return val;
    }

    /* キュー先頭からデキュー */
    int popFirst(LinkedListDeque *deque) {
        return pop(deque, true);
    }

    /* キュー末尾からデキュー */
    int popLast(LinkedListDeque *deque) {
        return pop(deque, false);
    }

    /* キューを出力する */
    void printLinkedListDeque(LinkedListDeque *deque) {
        int *arr = malloc(sizeof(int) * deque->queSize);
        // 連結リスト内のデータを配列にコピー
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
    /* 双方向連結リストノード */
    class ListNode(var _val: Int) {
        // ノード値
        var next: ListNode? = null // 後続ノードへの参照
        var prev: ListNode? = null // 前駆ノードへの参照
    }

    /* 双方向連結リストベースの両端キュー */
    class LinkedListDeque {
        private var front: ListNode? = null // 先頭ノード front
        private var rear: ListNode? = null // 末尾ノード rear
        private var queSize: Int = 0 // 両端キューの長さ

        /* 両端キューの長さを取得 */
        fun size(): Int {
            return queSize
        }

        /* 両端キューが空かどうかを判定 */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* エンキュー操作 */
        fun push(num: Int, isFront: Boolean) {
            val node = ListNode(num)
            // 連結リストが空なら、front と rear の両方を node に向ける
            if (isEmpty()) {
                rear = node
                front = rear
                // 先頭へのエンキュー操作
            } else if (isFront) {
                // node を連結リストの先頭に追加
                front?.prev = node
                node.next = front
                front = node // 先頭ノードを更新する
                // 末尾へのエンキュー操作
            } else {
                // node を連結リストの末尾に追加
                rear?.next = node
                node.prev = rear
                rear = node // 末尾ノードを更新する
            }
            queSize++ // キューの長さを更新
        }

        /* キュー先頭にエンキュー */
        fun pushFirst(num: Int) {
            push(num, true)
        }

        /* キュー末尾にエンキュー */
        fun pushLast(num: Int) {
            push(num, false)
        }

        /* デキュー操作 */
        fun pop(isFront: Boolean): Int {
            if (isEmpty()) 
                throw IndexOutOfBoundsException()
            val _val: Int
            // キュー先頭からの取り出し
            if (isFront) {
                _val = front!!._val // 先頭ノードの値を一時保存
                // 先頭ノードを削除
                val fNext = front!!.next
                if (fNext != null) {
                    fNext.prev = null
                    front!!.next = null
                }
                front = fNext // 先頭ノードを更新する
                // キュー末尾からの取り出し
            } else {
                _val = rear!!._val // 末尾ノードの値を一時保存
                // 末尾ノードを削除
                val rPrev = rear!!.prev
                if (rPrev != null) {
                    rPrev.next = null
                    rear!!.prev = null
                }
                rear = rPrev // 末尾ノードを更新する
            }
            queSize-- // キューの長さを更新
            return _val
        }

        /* キュー先頭からデキュー */
        fun popFirst(): Int {
            return pop(true)
        }

        /* キュー末尾からデキュー */
        fun popLast(): Int {
            return pop(false)
        }

        /* キュー先頭の要素にアクセス */
        fun peekFirst(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return front!!._val
        }

        /* キュー末尾の要素にアクセス */
        fun peekLast(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return rear!!._val
        }

        /* 出力用の配列を返す */
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

    # ## 双方向連結リストノード
    class ListNode
      attr_accessor :val
      attr_accessor :next # 後続ノードへの参照
      attr_accessor :prev # 前ノードへの参照

      ### コンストラクタ ###
      def initialize(val)
        @val = val
      end
    end

    ### 双方向連結リストで実装した両端キュー ###
    class LinkedListDeque
      ### 両端キューの長さを取得 ###
      attr_reader :size

      ### コンストラクタ ###
      def initialize
        @front = nil  # 先頭ノード front
        @rear = nil   # 末尾ノード rear
        @size = 0     # 両端キューの長さ
      end

      ### 両端キューが空か判定 ###
      def is_empty?
        size.zero?
      end

      ### エンキュー操作 ###
      def push(num, is_front)
        node = ListNode.new(num)
        # 連結リストが空なら、`front` と `rear` の両方を `node` に向ける
        if is_empty?
          @front = @rear = node
        # 先頭へのエンキュー操作
        elsif is_front
          # node を連結リストの先頭に追加
          @front.prev = node
          node.next = @front
          @front = node # 先頭ノードを更新する
        # 末尾へのエンキュー操作
        else
          # node を連結リストの末尾に追加
          @rear.next = node
          node.prev = @rear
          @rear = node # 末尾ノードを更新する
        end
        @size += 1 # キューの長さを更新
      end

      ### キュー先頭に追加 ###
      def push_first(num)
        push(num, true)
      end

      ### キュー末尾に追加 ###
      def push_last(num)
        push(num, false)
      end

      ### デキュー操作 ###
      def pop(is_front)
        raise IndexError, '両端キューは空です' if is_empty?

        # キュー先頭からの取り出し
        if is_front
          val = @front.val # 先頭ノードの値を一時保存
          # 先頭ノードを削除
          fnext = @front.next
          unless fnext.nil?
            fnext.prev = nil
            @front.next = nil
          end
          @front = fnext # 先頭ノードを更新する
        # キュー末尾からの取り出し
        else
          val = @rear.val # 末尾ノードの値を一時保存
          # 末尾ノードを削除
          rprev = @rear.prev
          unless rprev.nil?
            rprev.next = nil
            @rear.prev = nil
          end
          @rear = rprev # 末尾ノードを更新する
        end
        @size -= 1 # キューの長さを更新

        val
      end

      ### キュー先頭から取り出す ###
      def pop_first
        pop(true)
      end

      ### キュー先頭から取り出す ###
      def pop_last
        pop(false)
      end

      ### 先頭要素にアクセス ###
      def peek_first
        raise IndexError, '両端キューは空です' if is_empty?

        @front.val
      end

      ### キュー末尾要素を参照 ###
      def peek_last
        raise IndexError, '両端キューは空です' if is_empty?

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

### 2. &nbsp; 配列に基づく実装

次の図に示すように、配列によるキュー実装と同様に、循環配列を使って両端キューを実装することもできます。

=== "<1>"
    ![配列による両端キューのエンキューとデキュー](deque.assets/array_deque_step1.png){ class="animation-figure" }

=== "<2>"
    ![array_deque_push_last](deque.assets/array_deque_step2_push_last.png){ class="animation-figure" }

=== "<3>"
    ![array_deque_push_first](deque.assets/array_deque_step3_push_first.png){ class="animation-figure" }

=== "<4>"
    ![array_deque_pop_last](deque.assets/array_deque_step4_pop_last.png){ class="animation-figure" }

=== "<5>"
    ![array_deque_pop_first](deque.assets/array_deque_step5_pop_first.png){ class="animation-figure" }

<p align="center"> 図 5-9 &nbsp; 配列による両端キューのエンキューとデキュー </p>

キュー実装を土台として、「先頭へのエンキュー」と「末尾からのデキュー」のメソッドを追加するだけで済みます：

=== "Python"

    ```python title="array_deque.py"
    class ArrayDeque:
        """循環配列ベースの両端キュー"""

        def __init__(self, capacity: int):
            """コンストラクタ"""
            self._nums: list[int] = [0] * capacity
            self._front: int = 0
            self._size: int = 0

        def capacity(self) -> int:
            """両端キューの容量を取得"""
            return len(self._nums)

        def size(self) -> int:
            """両端キューの長さを取得"""
            return self._size

        def is_empty(self) -> bool:
            """両端キューが空かどうかを判定"""
            return self._size == 0

        def index(self, i: int) -> int:
            """循環配列のインデックスを計算"""
            # 剰余演算により配列の先頭と末尾をつなげる
            # i が配列の末尾を越えたら先頭に戻る
            # i が配列の先頭を越えて前に出たら末尾に戻る
            return (i + self.capacity()) % self.capacity()

        def push_first(self, num: int):
            """キュー先頭にエンキュー"""
            if self._size == self.capacity():
                print("両端キューがいっぱいです")
                return
            # 先頭ポインタを左に 1 つ移動する
            # 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
            self._front = self.index(self._front - 1)
            # num をキュー先頭に追加
            self._nums[self._front] = num
            self._size += 1

        def push_last(self, num: int):
            """キュー末尾にエンキュー"""
            if self._size == self.capacity():
                print("両端キューがいっぱいです")
                return
            # キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
            rear = self.index(self._front + self._size)
            # num をキュー末尾に追加
            self._nums[rear] = num
            self._size += 1

        def pop_first(self) -> int:
            """キュー先頭からデキュー"""
            num = self.peek_first()
            # 先頭ポインタを 1 つ後ろへ進める
            self._front = self.index(self._front + 1)
            self._size -= 1
            return num

        def pop_last(self) -> int:
            """キュー末尾からデキュー"""
            num = self.peek_last()
            self._size -= 1
            return num

        def peek_first(self) -> int:
            """キュー先頭の要素にアクセス"""
            if self.is_empty():
                raise IndexError("両端キューが空です")
            return self._nums[self._front]

        def peek_last(self) -> int:
            """キュー末尾の要素にアクセス"""
            if self.is_empty():
                raise IndexError("両端キューが空です")
            # 末尾要素のインデックスを計算
            last = self.index(self._front + self._size - 1)
            return self._nums[last]

        def to_array(self) -> list[int]:
            """出力用の配列を返す"""
            # 有効長の範囲内のリスト要素のみを変換
            res = []
            for i in range(self._size):
                res.append(self._nums[self.index(self._front + i)])
            return res
    ```

=== "C++"

    ```cpp title="array_deque.cpp"
    /* 循環配列ベースの両端キュー */
    class ArrayDeque {
      private:
        vector<int> nums; // 両端キューの要素を格納する配列
        int front;        // 先頭ポインタ。先頭要素を指す
        int queSize;      // 両端キューの長さ

      public:
        /* コンストラクタ */
        ArrayDeque(int capacity) {
            nums.resize(capacity);
            front = queSize = 0;
        }

        /* 両端キューの容量を取得 */
        int capacity() {
            return nums.size();
        }

        /* 両端キューの長さを取得 */
        int size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定 */
        bool isEmpty() {
            return queSize == 0;
        }

        /* 循環配列のインデックスを計算 */
        int index(int i) {
            // 剰余演算により配列の先頭と末尾をつなげる
            // i が配列の末尾を越えたら先頭に戻る
            // i が配列の先頭を越えて前に出たら末尾に戻る
            return (i + capacity()) % capacity();
        }

        /* キュー先頭にエンキュー */
        void pushFirst(int num) {
            if (queSize == capacity()) {
                cout << "両端キューがいっぱいです" << endl;
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
            front = index(front - 1);
            // num をキュー先頭に追加
            nums[front] = num;
            queSize++;
        }

        /* キュー末尾にエンキュー */
        void pushLast(int num) {
            if (queSize == capacity()) {
                cout << "両端キューがいっぱいです" << endl;
                return;
            }
            // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
            int rear = index(front + queSize);
            // num をキュー末尾に追加
            nums[rear] = num;
            queSize++;
        }

        /* キュー先頭からデキュー */
        int popFirst() {
            int num = peekFirst();
            // 先頭ポインタを 1 つ後ろへ進める
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* キュー末尾からデキュー */
        int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* キュー先頭の要素にアクセス */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("両端キューが空です");
            return nums[front];
        }

        /* キュー末尾の要素にアクセス */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("両端キューが空です");
            // 末尾要素のインデックスを計算
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* 出力用の配列を返す */
        vector<int> toVector() {
            // 有効長の範囲内のリスト要素のみを変換
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
    /* 循環配列ベースの両端キュー */
    class ArrayDeque {
        private int[] nums; // 両端キューの要素を格納する配列
        private int front; // 先頭ポインタ。先頭要素を指す
        private int queSize; // 両端キューの長さ

        /* コンストラクタ */
        public ArrayDeque(int capacity) {
            this.nums = new int[capacity];
            front = queSize = 0;
        }

        /* 両端キューの容量を取得 */
        public int capacity() {
            return nums.length;
        }

        /* 両端キューの長さを取得 */
        public int size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定 */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* 循環配列のインデックスを計算 */
        private int index(int i) {
            // 剰余演算により配列の先頭と末尾をつなげる
            // i が配列の末尾を越えたら先頭に戻る
            // i が配列の先頭を越えて前に出たら末尾に戻る
            return (i + capacity()) % capacity();
        }

        /* キュー先頭にエンキュー */
        public void pushFirst(int num) {
            if (queSize == capacity()) {
                System.out.println("双方向キューは満杯です");
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
            front = index(front - 1);
            // num をキュー先頭に追加
            nums[front] = num;
            queSize++;
        }

        /* キュー末尾にエンキュー */
        public void pushLast(int num) {
            if (queSize == capacity()) {
                System.out.println("双方向キューは満杯です");
                return;
            }
            // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
            int rear = index(front + queSize);
            // num をキュー末尾に追加
            nums[rear] = num;
            queSize++;
        }

        /* キュー先頭からデキュー */
        public int popFirst() {
            int num = peekFirst();
            // 先頭ポインタを 1 つ後ろへ進める
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* キュー末尾からデキュー */
        public int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* キュー先頭の要素にアクセス */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* キュー末尾の要素にアクセス */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            // 末尾要素のインデックスを計算
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* 出力用の配列を返す */
        public int[] toArray() {
            // 有効長の範囲内のリスト要素のみを変換
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
    /* 循環配列ベースの両端キュー */
    class ArrayDeque {
        int[] nums;  // 両端キューの要素を格納する配列
        int front;   // 先頭ポインタ。先頭要素を指す
        int queSize; // 両端キューの長さ

        /* コンストラクタ */
        public ArrayDeque(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* 両端キューの容量を取得 */
        int Capacity() {
            return nums.Length;
        }

        /* 両端キューの長さを取得 */
        public int Size() {
            return queSize;
        }

        /* 両端キューが空かどうかを判定 */
        public bool IsEmpty() {
            return queSize == 0;
        }

        /* 循環配列のインデックスを計算 */
        int Index(int i) {
            // 剰余演算により配列の先頭と末尾をつなげる
            // i が配列の末尾を越えたら先頭に戻る
            // i が配列の先頭を越えて前に出たら末尾に戻る
            return (i + Capacity()) % Capacity();
        }

        /* キュー先頭にエンキュー */
        public void PushFirst(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("両端キューは満杯です");
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
            front = Index(front - 1);
            // num をキュー先頭に追加
            nums[front] = num;
            queSize++;
        }

        /* キュー末尾にエンキュー */
        public void PushLast(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("両端キューは満杯です");
                return;
            }
            // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
            int rear = Index(front + queSize);
            // num をキュー末尾に追加
            nums[rear] = num;
            queSize++;
        }

        /* キュー先頭からデキュー */
        public int PopFirst() {
            int num = PeekFirst();
            // 先頭ポインタを 1 つ後ろへ進める
            front = Index(front + 1);
            queSize--;
            return num;
        }

        /* キュー末尾からデキュー */
        public int PopLast() {
            int num = PeekLast();
            queSize--;
            return num;
        }

        /* キュー先頭の要素にアクセス */
        public int PeekFirst() {
            if (IsEmpty()) {
                throw new InvalidOperationException();
            }
            return nums[front];
        }

        /* キュー末尾の要素にアクセス */
        public int PeekLast() {
            if (IsEmpty()) {
                throw new InvalidOperationException();
            }
            // 末尾要素のインデックスを計算
            int last = Index(front + queSize - 1);
            return nums[last];
        }

        /* 出力用の配列を返す */
        public int[] ToArray() {
            // 有効長の範囲内のリスト要素のみを変換
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
    /* 循環配列ベースの両端キュー */
    type arrayDeque struct {
        nums        []int // 両端キューの要素を格納する配列
        front       int   // 先頭ポインタ。先頭要素を指す
        queSize     int   // 両端キューの長さ
        queCapacity int   // キュー容量（格納できる要素数の上限）
    }

    /* キューを初期化 */
    func newArrayDeque(queCapacity int) *arrayDeque {
        return &arrayDeque{
            nums:        make([]int, queCapacity),
            queCapacity: queCapacity,
            front:       0,
            queSize:     0,
        }
    }

    /* 両端キューの長さを取得 */
    func (q *arrayDeque) size() int {
        return q.queSize
    }

    /* 両端キューが空かどうかを判定 */
    func (q *arrayDeque) isEmpty() bool {
        return q.queSize == 0
    }

    /* 循環配列のインデックスを計算 */
    func (q *arrayDeque) index(i int) int {
        // 剰余演算により配列の先頭と末尾をつなげる
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭を越えて前に出たら末尾に戻る
        return (i + q.queCapacity) % q.queCapacity
    }

    /* キュー先頭にエンキュー */
    func (q *arrayDeque) pushFirst(num int) {
        if q.queSize == q.queCapacity {
            fmt.Println("両端キューは満杯です")
            return
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
        q.front = q.index(q.front - 1)
        // num をキュー先頭に追加
        q.nums[q.front] = num
        q.queSize++
    }

    /* キュー末尾にエンキュー */
    func (q *arrayDeque) pushLast(num int) {
        if q.queSize == q.queCapacity {
            fmt.Println("両端キューは満杯です")
            return
        }
        // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        rear := q.index(q.front + q.queSize)
        // num をキュー末尾に追加
        q.nums[rear] = num
        q.queSize++
    }

    /* キュー先頭からデキュー */
    func (q *arrayDeque) popFirst() any {
        num := q.peekFirst()
        if num == nil {
            return nil
        }
        // 先頭ポインタを 1 つ後ろへ進める
        q.front = q.index(q.front + 1)
        q.queSize--
        return num
    }

    /* キュー末尾からデキュー */
    func (q *arrayDeque) popLast() any {
        num := q.peekLast()
        if num == nil {
            return nil
        }
        q.queSize--
        return num
    }

    /* キュー先頭の要素にアクセス */
    func (q *arrayDeque) peekFirst() any {
        if q.isEmpty() {
            return nil
        }
        return q.nums[q.front]
    }

    /* キュー末尾の要素にアクセス */
    func (q *arrayDeque) peekLast() any {
        if q.isEmpty() {
            return nil
        }
        // 末尾要素のインデックスを計算
        last := q.index(q.front + q.queSize - 1)
        return q.nums[last]
    }

    /* 表示用に Slice を取得 */
    func (q *arrayDeque) toSlice() []int {
        // 有効長の範囲内のリスト要素のみを変換
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
    /* 循環配列ベースの両端キュー */
    class ArrayDeque {
        private var nums: [Int] // 両端キューの要素を格納する配列
        private var front: Int // 先頭ポインタ。先頭要素を指す
        private var _size: Int // 両端キューの長さ

        /* コンストラクタ */
        init(capacity: Int) {
            nums = Array(repeating: 0, count: capacity)
            front = 0
            _size = 0
        }

        /* 両端キューの容量を取得 */
        func capacity() -> Int {
            nums.count
        }

        /* 両端キューの長さを取得 */
        func size() -> Int {
            _size
        }

        /* 両端キューが空かどうかを判定 */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* 循環配列のインデックスを計算 */
        private func index(i: Int) -> Int {
            // 剰余演算により配列の先頭と末尾をつなげる
            // i が配列の末尾を越えたら先頭に戻る
            // i が配列の先頭を越えて前に出たら末尾に戻る
            (i + capacity()) % capacity()
        }

        /* キュー先頭にエンキュー */
        func pushFirst(num: Int) {
            if size() == capacity() {
                print("両端キューがいっぱいです")
                return
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
            front = index(i: front - 1)
            // num をキュー先頭に追加
            nums[front] = num
            _size += 1
        }

        /* キュー末尾にエンキュー */
        func pushLast(num: Int) {
            if size() == capacity() {
                print("両端キューがいっぱいです")
                return
            }
            // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
            let rear = index(i: front + size())
            // num をキュー末尾に追加
            nums[rear] = num
            _size += 1
        }

        /* キュー先頭からデキュー */
        func popFirst() -> Int {
            let num = peekFirst()
            // 先頭ポインタを 1 つ後ろへ進める
            front = index(i: front + 1)
            _size -= 1
            return num
        }

        /* キュー末尾からデキュー */
        func popLast() -> Int {
            let num = peekLast()
            _size -= 1
            return num
        }

        /* キュー先頭の要素にアクセス */
        func peekFirst() -> Int {
            if isEmpty() {
                fatalError("両端キューが空です")
            }
            return nums[front]
        }

        /* キュー末尾の要素にアクセス */
        func peekLast() -> Int {
            if isEmpty() {
                fatalError("両端キューが空です")
            }
            // 末尾要素のインデックスを計算
            let last = index(i: front + size() - 1)
            return nums[last]
        }

        /* 出力用の配列を返す */
        func toArray() -> [Int] {
            // 有効長の範囲内のリスト要素のみを変換
            (front ..< front + size()).map { nums[index(i: $0)] }
        }
    }
    ```

=== "JS"

    ```javascript title="array_deque.js"
    /* 循環配列ベースの両端キュー */
    class ArrayDeque {
        #nums; // 両端キューの要素を格納する配列
        #front; // 先頭ポインタ。先頭要素を指す
        #queSize; // 両端キューの長さ

        /* コンストラクタ */
        constructor(capacity) {
            this.#nums = new Array(capacity);
            this.#front = 0;
            this.#queSize = 0;
        }

        /* 両端キューの容量を取得 */
        capacity() {
            return this.#nums.length;
        }

        /* 両端キューの長さを取得 */
        size() {
            return this.#queSize;
        }

        /* 両端キューが空かどうかを判定 */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* 循環配列のインデックスを計算 */
        index(i) {
            // 剰余演算により配列の先頭と末尾をつなげる
            // i が配列の末尾を越えたら先頭に戻る
            // i が配列の先頭を越えて前に出たら末尾に戻る
            return (i + this.capacity()) % this.capacity();
        }

        /* キュー先頭にエンキュー */
        pushFirst(num) {
            if (this.#queSize === this.capacity()) {
                console.log('両端キューがいっぱいです');
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
            this.#front = this.index(this.#front - 1);
            // num をキュー先頭に追加
            this.#nums[this.#front] = num;
            this.#queSize++;
        }

        /* キュー末尾にエンキュー */
        pushLast(num) {
            if (this.#queSize === this.capacity()) {
                console.log('両端キューがいっぱいです');
                return;
            }
            // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
            const rear = this.index(this.#front + this.#queSize);
            // num をキュー末尾に追加
            this.#nums[rear] = num;
            this.#queSize++;
        }

        /* キュー先頭からデキュー */
        popFirst() {
            const num = this.peekFirst();
            // 先頭ポインタを 1 つ後ろへ進める
            this.#front = this.index(this.#front + 1);
            this.#queSize--;
            return num;
        }

        /* キュー末尾からデキュー */
        popLast() {
            const num = this.peekLast();
            this.#queSize--;
            return num;
        }

        /* キュー先頭の要素にアクセス */
        peekFirst() {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            return this.#nums[this.#front];
        }

        /* キュー末尾の要素にアクセス */
        peekLast() {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            // 末尾要素のインデックスを計算
            const last = this.index(this.#front + this.#queSize - 1);
            return this.#nums[last];
        }

        /* 出力用の配列を返す */
        toArray() {
            // 有効長の範囲内のリスト要素のみを変換
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
    /* 循環配列ベースの両端キュー */
    class ArrayDeque {
        private nums: number[]; // 両端キューの要素を格納する配列
        private front: number; // 先頭ポインタ。先頭要素を指す
        private queSize: number; // 両端キューの長さ

        /* コンストラクタ */
        constructor(capacity: number) {
            this.nums = new Array(capacity);
            this.front = 0;
            this.queSize = 0;
        }

        /* 両端キューの容量を取得 */
        capacity(): number {
            return this.nums.length;
        }

        /* 両端キューの長さを取得 */
        size(): number {
            return this.queSize;
        }

        /* 両端キューが空かどうかを判定 */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* 循環配列のインデックスを計算 */
        index(i: number): number {
            // 剰余演算により配列の先頭と末尾をつなげる
            // i が配列の末尾を越えたら先頭に戻る
            // i が配列の先頭を越えて前に出たら末尾に戻る
            return (i + this.capacity()) % this.capacity();
        }

        /* キュー先頭にエンキュー */
        pushFirst(num: number): void {
            if (this.queSize === this.capacity()) {
                console.log('両端キューは満杯です');
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
            this.front = this.index(this.front - 1);
            // num をキュー先頭に追加
            this.nums[this.front] = num;
            this.queSize++;
        }

        /* キュー末尾にエンキュー */
        pushLast(num: number): void {
            if (this.queSize === this.capacity()) {
                console.log('両端キューは満杯です');
                return;
            }
            // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
            const rear: number = this.index(this.front + this.queSize);
            // num をキュー末尾に追加
            this.nums[rear] = num;
            this.queSize++;
        }

        /* キュー先頭からデキュー */
        popFirst(): number {
            const num: number = this.peekFirst();
            // 先頭ポインタを 1 つ後ろへ進める
            this.front = this.index(this.front + 1);
            this.queSize--;
            return num;
        }

        /* キュー末尾からデキュー */
        popLast(): number {
            const num: number = this.peekLast();
            this.queSize--;
            return num;
        }

        /* キュー先頭の要素にアクセス */
        peekFirst(): number {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            return this.nums[this.front];
        }

        /* キュー末尾の要素にアクセス */
        peekLast(): number {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            // 末尾要素のインデックスを計算
            const last = this.index(this.front + this.queSize - 1);
            return this.nums[last];
        }

        /* 出力用の配列を返す */
        toArray(): number[] {
            // 有効長の範囲内のリスト要素のみを変換
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
    /* 循環配列ベースの両端キュー */
    class ArrayDeque {
      late List<int> _nums; // 両端キューの要素を格納する配列
      late int _front; // 先頭ポインタ。先頭要素を指す
      late int _queSize; // 両端キューの長さ

      /* コンストラクタ */
      ArrayDeque(int capacity) {
        this._nums = List.filled(capacity, 0);
        this._front = this._queSize = 0;
      }

      /* 両端キューの容量を取得 */
      int capacity() {
        return _nums.length;
      }

      /* 両端キューの長さを取得 */
      int size() {
        return _queSize;
      }

      /* 両端キューが空かどうかを判定 */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* 循環配列のインデックスを計算 */
      int index(int i) {
        // 剰余演算により配列の先頭と末尾をつなげる
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭を越えて前に出たら末尾に戻る
        return (i + capacity()) % capacity();
      }

      /* キュー先頭にエンキュー */
      void pushFirst(int _num) {
        if (_queSize == capacity()) {
          throw Exception("両端キューがいっぱいです");
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により _front が配列の先頭を越えたあと末尾に戻るようにする
        _front = index(_front - 1);
        // _num をキューの先頭に追加
        _nums[_front] = _num;
        _queSize++;
      }

      /* キュー末尾にエンキュー */
      void pushLast(int _num) {
        if (_queSize == capacity()) {
          throw Exception("両端キューがいっぱいです");
        }
        // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        int rear = index(_front + _queSize);
        // _num をキュー末尾に追加
        _nums[rear] = _num;
        _queSize++;
      }

      /* キュー先頭からデキュー */
      int popFirst() {
        int _num = peekFirst();
        // 先頭ポインタを右に 1 つ移動する
        _front = index(_front + 1);
        _queSize--;
        return _num;
      }

      /* キュー末尾からデキュー */
      int popLast() {
        int _num = peekLast();
        _queSize--;
        return _num;
      }

      /* キュー先頭の要素にアクセス */
      int peekFirst() {
        if (isEmpty()) {
          throw Exception("両端キューが空です");
        }
        return _nums[_front];
      }

      /* キュー末尾の要素にアクセス */
      int peekLast() {
        if (isEmpty()) {
          throw Exception("両端キューが空です");
        }
        // 末尾要素のインデックスを計算
        int last = index(_front + _queSize - 1);
        return _nums[last];
      }

      /* 出力用の配列を返す */
      List<int> toArray() {
        // 有効長の範囲内のリスト要素のみを変換
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
    /* 循環配列ベースの両端キュー */
    struct ArrayDeque<T> {
        nums: Vec<T>,    // 両端キューの要素を格納する配列
        front: usize,    // 先頭ポインタ。先頭要素を指す
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

        /* 両端キューの容量を取得 */
        pub fn capacity(&self) -> usize {
            self.nums.len()
        }

        /* 両端キューの長さを取得 */
        pub fn size(&self) -> usize {
            self.que_size
        }

        /* 両端キューが空かどうかを判定 */
        pub fn is_empty(&self) -> bool {
            self.que_size == 0
        }

        /* 循環配列のインデックスを計算 */
        fn index(&self, i: i32) -> usize {
            // 剰余演算により配列の先頭と末尾をつなげる
            // i が配列の末尾を越えたら先頭に戻る
            // i が配列の先頭を越えて前に出たら末尾に戻る
            ((i + self.capacity() as i32) % self.capacity() as i32) as usize
        }

        /* キュー先頭にエンキュー */
        pub fn push_first(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("両端キューがいっぱいです");
                return;
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
            self.front = self.index(self.front as i32 - 1);
            // num をキュー先頭に追加
            self.nums[self.front] = num;
            self.que_size += 1;
        }

        /* キュー末尾にエンキュー */
        pub fn push_last(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("両端キューがいっぱいです");
                return;
            }
            // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
            let rear = self.index(self.front as i32 + self.que_size as i32);
            // num をキュー末尾に追加
            self.nums[rear] = num;
            self.que_size += 1;
        }

        /* キュー先頭からデキュー */
        fn pop_first(&mut self) -> T {
            let num = self.peek_first();
            // 先頭ポインタを 1 つ後ろへ進める
            self.front = self.index(self.front as i32 + 1);
            self.que_size -= 1;
            num
        }

        /* キュー末尾からデキュー */
        fn pop_last(&mut self) -> T {
            let num = self.peek_last();
            self.que_size -= 1;
            num
        }

        /* キュー先頭の要素にアクセス */
        fn peek_first(&self) -> T {
            if self.is_empty() {
                panic!("両端キューが空です")
            };
            self.nums[self.front]
        }

        /* キュー末尾の要素にアクセス */
        fn peek_last(&self) -> T {
            if self.is_empty() {
                panic!("両端キューが空です")
            };
            // 末尾要素のインデックスを計算
            let last = self.index(self.front as i32 + self.que_size as i32 - 1);
            self.nums[last]
        }

        /* 出力用の配列を返す */
        fn to_array(&self) -> Vec<T> {
            // 有効長の範囲内のリスト要素のみを変換
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
    /* 循環配列ベースの両端キュー */
    typedef struct {
        int *nums;       // キュー要素を格納する配列
        int front;       // 先頭ポインタ。先頭要素を指す
        int queSize;     // 末尾ポインタ。キューの末尾 + 1 を指す
        int queCapacity; // キューの容量
    } ArrayDeque;

    /* コンストラクタ */
    ArrayDeque *newArrayDeque(int capacity) {
        ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
        // 配列を初期化
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

    /* 両端キューの容量を取得 */
    int capacity(ArrayDeque *deque) {
        return deque->queCapacity;
    }

    /* 両端キューの長さを取得 */
    int size(ArrayDeque *deque) {
        return deque->queSize;
    }

    /* 両端キューが空かどうかを判定 */
    bool empty(ArrayDeque *deque) {
        return deque->queSize == 0;
    }

    /* 循環配列のインデックスを計算 */
    int dequeIndex(ArrayDeque *deque, int i) {
        // 剰余演算により配列の先頭と末尾をつなげる
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭を越えたら末尾に戻る
        return ((i + capacity(deque)) % capacity(deque));
    }

    /* キュー先頭にエンキュー */
    void pushFirst(ArrayDeque *deque, int num) {
        if (deque->queSize == capacity(deque)) {
            printf("両端キューがいっぱいです\r\n");
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により front が配列の先頭を越えたあと末尾に戻るようにする
        deque->front = dequeIndex(deque, deque->front - 1);
        // num をキューの先頭に追加
        deque->nums[deque->front] = num;
        deque->queSize++;
    }

    /* キュー末尾にエンキュー */
    void pushLast(ArrayDeque *deque, int num) {
        if (deque->queSize == capacity(deque)) {
            printf("両端キューがいっぱいです\r\n");
            return;
        }
        // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        int rear = dequeIndex(deque, deque->front + deque->queSize);
        // num をキュー末尾に追加
        deque->nums[rear] = num;
        deque->queSize++;
    }

    /* キュー先頭の要素にアクセス */
    int peekFirst(ArrayDeque *deque) {
        // アクセス例外：双方向キューが空です
        assert(empty(deque) == 0);
        return deque->nums[deque->front];
    }

    /* キュー末尾の要素にアクセス */
    int peekLast(ArrayDeque *deque) {
        // アクセス例外：双方向キューが空です
        assert(empty(deque) == 0);
        int last = dequeIndex(deque, deque->front + deque->queSize - 1);
        return deque->nums[last];
    }

    /* キュー先頭からデキュー */
    int popFirst(ArrayDeque *deque) {
        int num = peekFirst(deque);
        // 先頭ポインタを 1 つ後ろへ進める
        deque->front = dequeIndex(deque, deque->front + 1);
        deque->queSize--;
        return num;
    }

    /* キュー末尾からデキュー */
    int popLast(ArrayDeque *deque) {
        int num = peekLast(deque);
        deque->queSize--;
        return num;
    }

    /* 出力用の配列を返す */
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
        private var front: Int = 0 // 先頭ポインタ。先頭要素を指す
        private var queSize: Int = 0 // 両端キューの長さ

        /* 両端キューの容量を取得 */
        fun capacity(): Int {
            return nums.size
        }

        /* 両端キューの長さを取得 */
        fun size(): Int {
            return queSize
        }

        /* 両端キューが空かどうかを判定 */
        fun isEmpty(): Boolean {
            return queSize == 0
        }

        /* 循環配列のインデックスを計算 */
        private fun index(i: Int): Int {
            // 剰余演算により配列の先頭と末尾をつなげる
            // i が配列の末尾を越えたら先頭に戻る
            // i が配列の先頭を越えて前に出たら末尾に戻る
            return (i + capacity()) % capacity()
        }

        /* キュー先頭にエンキュー */
        fun pushFirst(num: Int) {
            if (queSize == capacity()) {
                println("双方向キューは満杯です")
                return
            }
            // 先頭ポインタを左に 1 つ移動する
            // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
            front = index(front - 1)
            // num をキュー先頭に追加
            nums[front] = num
            queSize++
        }

        /* キュー末尾にエンキュー */
        fun pushLast(num: Int) {
            if (queSize == capacity()) {
                println("双方向キューは満杯です")
                return
            }
            // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
            val rear = index(front + queSize)
            // num をキュー末尾に追加
            nums[rear] = num
            queSize++
        }

        /* キュー先頭からデキュー */
        fun popFirst(): Int {
            val num = peekFirst()
            // 先頭ポインタを 1 つ後ろへ進める
            front = index(front + 1)
            queSize--
            return num
        }

        /* キュー末尾からデキュー */
        fun popLast(): Int {
            val num = peekLast()
            queSize--
            return num
        }

        /* キュー先頭の要素にアクセス */
        fun peekFirst(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return nums[front]
        }

        /* キュー末尾の要素にアクセス */
        fun peekLast(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            // 末尾要素のインデックスを計算
            val last = index(front + queSize - 1)
            return nums[last]
        }

        /* 出力用の配列を返す */
        fun toArray(): IntArray {
            // 有効長の範囲内のリスト要素のみを変換
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
      ### 両端キューの長さを取得 ###
      attr_reader :size

      ### コンストラクタ ###
      def initialize(capacity)
        @nums = Array.new(capacity, 0)
        @front = 0
        @size = 0
      end

      ### 両端キューの容量を取得 ###
      def capacity
        @nums.length
      end

      ### 両端キューが空か判定 ###
      def is_empty?
        size.zero?
      end

      ### キュー先頭に追加 ###
      def push_first(num)
        if size == capacity
          puts '両端キューがいっぱいです'
          return
        end

        # 先頭ポインタを左に 1 つ移動する
        # 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
        @front = index(@front - 1)
        # num をキュー先頭に追加
        @nums[@front] = num
        @size += 1
      end

      ### キュー末尾に追加 ###
      def push_last(num)
        if size == capacity
          puts '両端キューがいっぱいです'
          return
        end

        # キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        rear = index(@front + size)
        # num をキュー末尾に追加
        @nums[rear] = num
        @size += 1
      end

      ### キュー先頭から取り出す ###
      def pop_first
        num = peek_first
        # 先頭ポインタを 1 つ後ろへ進める
        @front = index(@front + 1)
        @size -= 1
        num
      end

      ### キューの末尾から取り出す ###
      def pop_last
        num = peek_last
        @size -= 1
        num
      end

      ### 先頭要素にアクセス ###
      def peek_first
        raise IndexError, '両端キューは空です' if is_empty?

        @nums[@front]
      end

      ### キュー末尾要素を参照 ###
      def peek_last
        raise IndexError, '両端キューは空です' if is_empty?

        # 末尾要素のインデックスを計算
        last = index(@front + size - 1)
        @nums[last]
      end

      ### 表示用の配列を返す ###
      def to_array
        # 有効長の範囲内のリスト要素のみを変換
        res = []
        for i in 0...size
          res << @nums[index(@front + i)]
        end
        res
      end

      private

      ### 循環配列のインデックスを計算 ###
      def index(i)
        # 剰余演算により配列の先頭と末尾をつなげる
        # i が配列の末尾を越えたら先頭に戻る
        # i が配列の先頭を越えて前に出たら末尾に戻る
        (i + capacity) % capacity
      end
    end
    ```

## 5.3.3 &nbsp; 両端キューの応用

両端キューはスタックとキューの両方の論理を備えているため、**これら 2 つのすべての応用場面を実現でき、さらに高い自由度を提供します**。

私たちが知っているように、ソフトウェアの「元に戻す」機能は通常スタックを使って実装されます。システムは変更操作を毎回スタックに `push` し、その後 `pop` によって取り消しを実現します。しかし、システム資源の制約を考慮すると、通常ソフトウェアは取り消し可能な手数を制限します（たとえば $50$ 手まで保存可能）。スタックの長さが $50$ を超えると、ソフトウェアはスタックの底部（先頭）で削除操作を行う必要があります。**しかしスタックではこの機能を実現できないため、この場合はスタックの代わりに両端キューを使用する必要があります**。なお、「元に戻す」の中核ロジック自体は依然としてスタックの後入れ先出し原則に従っており、両端キューは追加のロジックをより柔軟に実装できるだけです。
