---
comments: true
---

# 5.3 &nbsp; 両端キュー

キューでは、先頭からの要素の削除や末尾への要素の追加のみが可能です。下図に示すように、<u>両端キュー（deque）</u>はより柔軟性を提供し、先頭と末尾の両方で要素の追加や削除を可能にします。

![両端キューの操作](deque.assets/deque_operations.png){ class="animation-figure" }

<p align="center"> 図 5-7 &nbsp; 両端キューの操作 </p>

## 5.3.1 &nbsp; 両端キューの一般的な操作

両端キューの一般的な操作は以下の通りです。具体的なメソッド名は使用するプログラミング言語によって異なります。

<p align="center"> 表 5-3 &nbsp; 両端キューの操作効率 </p>

<div class="center-table" markdown>

| メソッド名        | 説明                | 時間計算量      |
| ------------- | ------------------ | ------------- |
| `pushFirst()` | 先頭に要素を追加        | $O(1)$        |
| `pushLast()`  | 末尾に要素を追加        | $O(1)$        |
| `popFirst()`  | 先頭要素を削除         | $O(1)$        |
| `popLast()`   | 末尾要素を削除         | $O(1)$        |
| `peekFirst()` | 先頭要素にアクセス      | $O(1)$        |
| `peekLast()`  | 末尾要素にアクセス      | $O(1)$        |

</div>

同様に、プログラミング言語で実装された両端キュークラスを直接使用することができます：

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

    # 両端キューが空かどうかを確認
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

    /* 両端キューが空かどうかを確認 */
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

    /* 両端キューが空かどうかを確認 */
    boolean isEmpty = deque.isEmpty();
    ```

=== "C#"

    ```csharp title="deque.cs"
    /* 両端キューを初期化 */
    // C#では、LinkedListを両端キューとして使用
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

    /* 両端キューが空かどうかを確認 */
    bool isEmpty = deque.Count == 0;
    ```

=== "Go"

    ```go title="deque_test.go"
    /* 両端キューを初期化 */
    // Goでは、listを両端キューとして使用
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

    /* 両端キューが空かどうかを確認 */
    isEmpty := deque.Len() == 0
    ```

=== "Swift"

    ```swift title="deque.swift"
    /* 両端キューを初期化 */
    // Swiftには組み込みの両端キュークラスがないため、Arrayを両端キューとして使用
    var deque: [Int] = []

    /* 要素をエンキュー */
    deque.append(2) // 末尾に追加
    deque.append(5)
    deque.append(4)
    deque.insert(3, at: 0) // 先頭に追加
    deque.insert(1, at: 0)

    /* 要素にアクセス */
    let peekFirst = deque.first! // 先頭要素
    let peekLast = deque.last!   // 末尾要素

    /* 要素をデキュー */
    // Arrayを使用する場合、popFirstの計算量はO(n)
    let popFirst = deque.removeFirst() // 先頭要素をデキュー
    let popLast = deque.removeLast()   // 末尾要素をデキュー

    /* 両端キューの長さを取得 */
    let size = deque.count

    /* 両端キューが空かどうかを確認 */
    let isEmpty = deque.isEmpty
    ```

=== "JS"

    ```javascript title="deque.js"
    /* 両端キューを初期化 */
    // JavaScriptには組み込みの両端キューがないため、Arrayを両端キューとして使用
    const deque = [];

    /* 要素をエンキュー */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // 注意：unshift()は配列のため時間計算量がO(n)
    deque.unshift(3);
    deque.unshift(1);

    /* 要素にアクセス */
    const peekFirst = deque[0]; // 先頭要素
    const peekLast = deque[deque.length - 1]; // 末尾要素

    /* 要素をデキュー */
    // 注意：shift()は配列のため時間計算量がO(n)
    const popFront = deque.shift(); // 先頭要素をデキュー
    const popBack = deque.pop();    // 末尾要素をデキュー

    /* 両端キューの長さを取得 */
    const size = deque.length;

    /* 両端キューが空かどうかを確認 */
    const isEmpty = size === 0;
    ```

=== "TS"

    ```typescript title="deque.ts"
    /* 両端キューを初期化 */
    // TypeScriptには組み込みの両端キューがないため、Arrayを両端キューとして使用
    const deque: number[] = [];

    /* 要素をエンキュー */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // 注意：unshift()は配列のため時間計算量がO(n)
    deque.unshift(3);
    deque.unshift(1);

    /* 要素にアクセス */
    const peekFirst: number = deque[0]; // 先頭要素
    const peekLast: number = deque[deque.length - 1]; // 末尾要素

    /* 要素をデキュー */
    // 注意：shift()は配列のため時間計算量がO(n)
    const popFront: number = deque.shift() as number; // 先頭要素をデキュー
    const popBack: number = deque.pop() as number;    // 末尾要素をデキュー

    /* 両端キューの長さを取得 */
    const size: number = deque.length;

    /* 両端キューが空かどうかを確認 */
    const isEmpty: boolean = size === 0;
    ```

=== "Dart"

    ```dart title="deque.dart"
    /* 両端キューを初期化 */
    // Dartでは、Queueが両端キューとして定義される
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

    /* 両端キューが空かどうかを確認 */
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

    /* 両端キューが空かどうかを確認 */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="deque.c"
    // Cには組み込みの両端キューが提供されていません
    ```

=== "Kotlin"

    ```kotlin title="deque.kt"

    ```

## 5.3.2 &nbsp; 両端キューの実装 *

両端キューの実装は通常のキューの実装と似ており、連結リストまたは配列を基盤となるデータ構造として使用できます。

### 1. &nbsp; 双方向連結リストに基づく実装

前節で、通常の単一連結リストを使ってキューを実装したことを思い出してください。これは先頭からの削除（デキュー操作に対応）と末尾への新しい要素の追加（エンキュー操作に対応）を便利に行えるためでした。

両端キューでは、先頭と末尾の両方でエンキューとデキュー操作を実行できます。つまり、両端キューは逆方向の操作も実装する必要があります。このため、両端キューの基盤となるデータ構造として「双方向連結リスト」を使用します。

下図に示すように、双方向連結リストの先頭ノードと末尾ノードをそれぞれ両端キューの前端と後端として扱い、両端でのノードの追加と削除機能を実装します。

=== "LinkedListDeque"
    ![双方向連結リストによる両端キューのエンキューとデキュー操作の実装](deque.assets/linkedlist_deque_step1.png){ class="animation-figure" }

=== "pushLast()"
    ![linkedlist_deque_push_last](deque.assets/linkedlist_deque_step2_push_last.png){ class="animation-figure" }

=== "pushFirst()"
    ![linkedlist_deque_push_first](deque.assets/linkedlist_deque_step3_push_first.png){ class="animation-figure" }

=== "popLast()"
    ![linkedlist_deque_pop_last](deque.assets/linkedlist_deque_step4_pop_last.png){ class="animation-figure" }

=== "popFirst()"
    ![linkedlist_deque_pop_first](deque.assets/linkedlist_deque_step5_pop_first.png){ class="animation-figure" }

<p align="center"> 図 5-8 &nbsp; 双方向連結リストによる両端キューのエンキューとデキュー操作の実装 </p>

実装コードは以下の通りです：

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
        """双方向連結リストベースの双端キュークラス"""

        def __init__(self):
            """コンストラクタ"""
            self._front: ListNode | None = None  # ヘッドノード front
            self._rear: ListNode | None = None  # テールノード rear
            self._size: int = 0  # 双端キューの長さ

        def size(self) -> int:
            """双端キューの長さを取得"""
            return self._size

        def is_empty(self) -> bool:
            """双端キューが空かどうかを判定"""
            return self._size == 0

        def push(self, num: int, is_front: bool):
            """エンキュー操作"""
            node = ListNode(num)
            # リストが空の場合、front と rear の両方を node に向ける
            if self.is_empty():
                self._front = self._rear = node
            # 前端エンキュー操作
            elif is_front:
                # ノードをリストの先頭に追加
                self._front.prev = node
                node.next = self._front
                self._front = node  # ヘッドノードを更新
            # 後端エンキュー操作
            else:
                # ノードをリストの末尾に追加
                self._rear.next = node
                node.prev = self._rear
                self._rear = node  # テールノードを更新
            self._size += 1  # キューの長さを更新

        def push_first(self, num: int):
            """前端エンキュー"""
            self.push(num, True)

        def push_last(self, num: int):
            """後端エンキュー"""
            self.push(num, False)

        def pop(self, is_front: bool) -> int:
            """デキュー操作"""
            if self.is_empty():
                raise IndexError("Double-ended queue is empty")
            # 前端デキュー操作
            if is_front:
                val: int = self._front.val  # ヘッドノードの値を一時的に保存
                # ヘッドノードを削除
                fnext: ListNode | None = self._front.next
                if fnext is not None:
                    fnext.prev = None
                    self._front.next = None
                self._front = fnext  # ヘッドノードを更新
            # 後端デキュー操作
            else:
                val: int = self._rear.val  # テールノードの値を一時的に保存
                # テールノードを削除
                rprev: ListNode | None = self._rear.prev
                if rprev is not None:
                    rprev.next = None
                    self._rear.prev = None
                self._rear = rprev  # テールノードを更新
            self._size -= 1  # キューの長さを更新
            return val

        def pop_first(self) -> int:
            """前端デキュー"""
            return self.pop(True)

        def pop_last(self) -> int:
            """後端デキュー"""
            return self.pop(False)

        def peek_first(self) -> int:
            """前端要素にアクセス"""
            if self.is_empty():
                raise IndexError("Double-ended queue is empty")
            return self._front.val

        def peek_last(self) -> int:
            """後端要素にアクセス"""
            if self.is_empty():
                raise IndexError("Double-ended queue is empty")
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
        int val;              // ノードの値
        DoublyListNode *next; // 後続ノードへのポインタ
        DoublyListNode *prev; // 前続ノードへのポインタ
        DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
        }
    };

    /* 双方向連結リストに基づく両端キュークラス */
    class LinkedListDeque {
      private:
        DoublyListNode *front, *rear; // 先頭ノードfront、末尾ノードrear
        int queSize = 0;              // 両端キューの長さ

      public:
        /* コンストラクタ */
        LinkedListDeque() : front(nullptr), rear(nullptr) {
        }

        /* デストラクタ */
        ~LinkedListDeque() {
            // 連結リストを走査、ノードを削除、メモリを解放
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
            // リストが空の場合、frontとrearの両方をnodeに向ける
            if (isEmpty())
                front = rear = node;
            // 先頭エンキュー操作
            else if (isFront) {
                // ノードをリストの先頭に追加
                front->prev = node;
                node->next = front;
                front = node; // 先頭ノードを更新
            // 末尾エンキュー操作
            } else {
                // ノードをリストの末尾に追加
                rear->next = node;
                node->prev = rear;
                rear = node; // 末尾ノードを更新
            }
            queSize++; // キュー長を更新
        }

        /* 先頭エンキュー */
        void pushFirst(int num) {
            push(num, true);
        }

        /* 末尾エンキュー */
        void pushLast(int num) {
            push(num, false);
        }

        /* デキュー操作 */
        int pop(bool isFront) {
            if (isEmpty())
                throw out_of_range("Queue is empty");
            int val;
            // 先頭デキュー操作
            if (isFront) {
                val = front->val; // 先頭ノードの値を一時保存
                // 先頭ノードを削除
                DoublyListNode *fNext = front->next;
                if (fNext != nullptr) {
                    fNext->prev = nullptr;
                    front->next = nullptr;
                }
                delete front;
                front = fNext; // 先頭ノードを更新
            // 末尾デキュー操作
            } else {
                val = rear->val; // 末尾ノードの値を一時保存
                // 末尾ノードを削除
                DoublyListNode *rPrev = rear->prev;
                if (rPrev != nullptr) {
                    rPrev->next = nullptr;
                    rear->prev = nullptr;
                }
                delete rear;
                rear = rPrev; // 末尾ノードを更新
            }
            queSize--; // キュー長を更新
            return val;
        }

        /* 先頭デキュー */
        int popFirst() {
            return pop(true);
        }

        /* 末尾デキュー */
        int popLast() {
            return pop(false);
        }

        /* 先頭要素にアクセス */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("Double-ended queue is empty");
            return front->val;
        }

        /* 末尾要素にアクセス */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("Double-ended queue is empty");
            return rear->val;
        }

        /* 印刷用に配列を返却 */
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
        ListNode prev; // 前任ノードへの参照

        ListNode(int val) {
            this.val = val;
            prev = next = null;
        }
    }

    /* 双方向連結リストに基づく両端キュークラス */
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
            // リストが空の場合、front と rear の両方を node に指す
            if (isEmpty())
                front = rear = node;
            // 先頭エンキュー操作
            else if (isFront) {
                // node をリストの先頭に追加
                front.prev = node;
                node.next = front;
                front = node; // front を更新
            // 末尾エンキュー操作
            } else {
                // node をリストの末尾に追加
                rear.next = node;
                node.prev = rear;
                rear = node; // rear を更新
            }
            queSize++; // 長さを更新
        }

        /* 先頭エンキュー */
        public void pushFirst(int num) {
            push(num, true);
        }

        /* 末尾エンキュー */
        public void pushLast(int num) {
            push(num, false);
        }

        /* デキュー操作 */
        private int pop(boolean isFront) {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            int val;
            // 先頭デキュー操作
            if (isFront) {
                val = front.val; // 一時的に先頭ノード値を保存
                // 次のノードを削除
                ListNode fNext = front.next;
                if (fNext != null) {
                    fNext.prev = null;
                    front.next = null;
                }
                front = fNext; // front を更新
            // 末尾デキュー操作
            } else {
                val = rear.val; // 一時的に末尾ノード値を保存
                // 前のノードを削除
                ListNode rPrev = rear.prev;
                if (rPrev != null) {
                    rPrev.next = null;
                    rear.prev = null;
                }
                rear = rPrev; // rear を更新
            }
            queSize--; // 長さを更新
            return val;
        }

        /* 先頭デキュー */
        public int popFirst() {
            return pop(true);
        }

        /* 末尾デキュー */
        public int popLast() {
            return pop(false);
        }

        /* 先頭要素にアクセス */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* 末尾要素にアクセス */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return rear.val;
        }

        /* 配列を返す */
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
    [class]{ListNode}-[func]{}

    [class]{LinkedListDeque}-[func]{}
    ```

=== "Go"

    ```go title="linkedlist_deque.go"
    [class]{linkedListDeque}-[func]{}
    ```

=== "Swift"

    ```swift title="linkedlist_deque.swift"
    [class]{ListNode}-[func]{}

    [class]{LinkedListDeque}-[func]{}
    ```

=== "JS"

    ```javascript title="linkedlist_deque.js"
    [class]{ListNode}-[func]{}

    [class]{LinkedListDeque}-[func]{}
    ```

=== "TS"

    ```typescript title="linkedlist_deque.ts"
    [class]{ListNode}-[func]{}

    [class]{LinkedListDeque}-[func]{}
    ```

=== "Dart"

    ```dart title="linkedlist_deque.dart"
    [class]{ListNode}-[func]{}

    [class]{LinkedListDeque}-[func]{}
    ```

=== "Rust"

    ```rust title="linkedlist_deque.rs"
    [class]{ListNode}-[func]{}

    [class]{LinkedListDeque}-[func]{}
    ```

=== "C"

    ```c title="linkedlist_deque.c"
    [class]{DoublyListNode}-[func]{}

    [class]{LinkedListDeque}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_deque.kt"
    [class]{ListNode}-[func]{}

    [class]{LinkedListDeque}-[func]{}
    ```

=== "Ruby"

    ```ruby title="linkedlist_deque.rb"
    [class]{ListNode}-[func]{}

    [class]{LinkedListDeque}-[func]{}
    ```

### 2. &nbsp; 配列に基づく実装

下図に示すように、配列でキューを実装するのと同様に、循環配列を使って両端キューを実装することもできます。

=== "ArrayDeque"
    ![配列による両端キューのエンキューとデキュー操作の実装](deque.assets/array_deque_step1.png){ class="animation-figure" }

=== "pushLast()"
    ![array_deque_push_last](deque.assets/array_deque_step2_push_last.png){ class="animation-figure" }

=== "pushFirst()"
    ![array_deque_push_first](deque.assets/array_deque_step3_push_first.png){ class="animation-figure" }

=== "popLast()"
    ![array_deque_pop_last](deque.assets/array_deque_step4_pop_last.png){ class="animation-figure" }

=== "popFirst()"
    ![array_deque_pop_first](deque.assets/array_deque_step5_pop_first.png){ class="animation-figure" }

<p align="center"> 図 5-9 &nbsp; 配列による両端キューのエンキューとデキュー操作の実装 </p>

実装では「前端エンキュー」と「後端デキュー」のメソッドを追加するだけです：

=== "Python"

    ```python title="array_deque.py"
    class ArrayDeque:
        """循環配列ベースの双端キュークラス"""

        def __init__(self, capacity: int):
            """コンストラクタ"""
            self._nums: list[int] = [0] * capacity
            self._front: int = 0
            self._size: int = 0

        def capacity(self) -> int:
            """双端キューの容量を取得"""
            return len(self._nums)

        def size(self) -> int:
            """双端キューの長さを取得"""
            return self._size

        def is_empty(self) -> bool:
            """双端キューが空かどうかを判定"""
            return self._size == 0

        def index(self, i: int) -> int:
            """循環配列のインデックスを計算"""
            # モジュロ演算によって循環配列を実装
            # i が配列の末尾を超えた場合、先頭に戻る
            # i が配列の先頭を超えた場合、末尾に戻る
            return (i + self.capacity()) % self.capacity()

        def push_first(self, num: int):
            """前端エンキュー"""
            if self._size == self.capacity():
                print("双端キューが満杯です")
                return
            # フロントポインタを左に1つ移動
            # モジュロ演算によってフロントが配列の先頭を超えて末尾に戻ることを実装
            self._front = self.index(self._front - 1)
            # num を前端に追加
            self._nums[self._front] = num
            self._size += 1

        def push_last(self, num: int):
            """後端エンキュー"""
            if self._size == self.capacity():
                print("双端キューが満杯です")
                return
            # リアポインタを計算、リアインデックス + 1 を指す
            rear = self.index(self._front + self._size)
            # num を後端に追加
            self._nums[rear] = num
            self._size += 1

        def pop_first(self) -> int:
            """前端デキュー"""
            num = self.peek_first()
            # フロントポインタを1つ後ろに移動
            self._front = self.index(self._front + 1)
            self._size -= 1
            return num

        def pop_last(self) -> int:
            """後端デキュー"""
            num = self.peek_last()
            self._size -= 1
            return num

        def peek_first(self) -> int:
            """前端要素にアクセス"""
            if self.is_empty():
                raise IndexError("Double-ended queue is empty")
            return self._nums[self._front]

        def peek_last(self) -> int:
            """後端要素にアクセス"""
            if self.is_empty():
                raise IndexError("Double-ended queue is empty")
            # 後端要素のインデックスを計算
            last = self.index(self._front + self._size - 1)
            return self._nums[last]

        def to_array(self) -> list[int]:
            """出力用の配列を返す"""
            # 有効な長さ範囲内の要素のみを変換
            res = []
            for i in range(self._size):
                res.append(self._nums[self.index(self._front + i)])
            return res
    ```

=== "C++"

    ```cpp title="array_deque.cpp"
    /* 循環配列に基づく両端キュークラス */
    class ArrayDeque {
      private:
        vector<int> nums; // 両端キューの要素を格納する配列
        int front;        // 先頭ポインタ、先頭要素を指す
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
            // 剰余演算で循環配列を実現
            // iが配列の末尾を超えた場合、先頭に戻る
            // iが配列の先頭を超えた場合、末尾に戻る
            return (i + capacity()) % capacity();
        }

        /* 先頭エンキュー */
        void pushFirst(int num) {
            if (queSize == capacity()) {
                cout << "Double-ended queue is full" << endl;
                return;
            }
            // 先頭ポインタを1つ左に移動
            // 剰余演算でfrontが配列の先頭を越えて末尾に戻ることを実現
            front = index(front - 1);
            // numを先頭に追加
            nums[front] = num;
            queSize++;
        }

        /* 末尾エンキュー */
        void pushLast(int num) {
            if (queSize == capacity()) {
                cout << "Double-ended queue is full" << endl;
                return;
            }
            // 末尾ポインタを計算、末尾インデックス + 1を指す
            int rear = index(front + queSize);
            // numを末尾に追加
            nums[rear] = num;
            queSize++;
        }

        /* 先頭デキュー */
        int popFirst() {
            int num = peekFirst();
            // 先頭ポインタを1つ後ろに移動
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* 末尾デキュー */
        int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* 先頭要素にアクセス */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("Double-ended queue is empty");
            return nums[front];
        }

        /* 末尾要素にアクセス */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("Double-ended queue is empty");
            // 末尾要素のインデックスを計算
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* 印刷用に配列を返却 */
        vector<int> toVector() {
            // 有効な長さ範囲内の要素のみを変換
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
    /* 循環配列に基づく両端キュークラス */
    class ArrayDeque {
        private int[] nums; // 両端キューの要素を格納する配列
        private int front; // 先頭ポインタ、先頭要素を指す
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

        /* 循環配列インデックスを計算 */
        private int index(int i) {
            // モジュロ演算により循環配列を実装
            // i が配列の末尾を超える場合、先頭に戻る
            // i が配列の先頭を超える場合、末尾に戻る
            return (i + capacity()) % capacity();
        }

        /* 先頭エンキュー */
        public void pushFirst(int num) {
            if (queSize == capacity()) {
                System.out.println("両端キューが満杯です");
                return;
            }
            // 先頭ポインタを左に移動し、境界を越える場合は配列の末尾に回る
            front = index(front - 1);
            // 先頭に num を追加
            nums[front] = num;
            queSize++;
        }

        /* 末尾エンキュー */
        public void pushLast(int num) {
            if (queSize == capacity()) {
                System.out.println("両端キューが満杯です");
                return;
            }
            // 末尾ポインタを計算し、末尾に要素を追加
            int rear = index(front + queSize);
            nums[rear] = num;
            queSize++;
        }

        /* 先頭デキュー */
        public int popFirst() {
            int num = peekFirst();
            // 先頭ポインタを右に移動
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* 末尾デキュー */
        public int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* 先頭要素にアクセス */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* 末尾要素にアクセス */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            // 末尾要素のインデックスを計算
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* 配列を返す */
        public int[] toArray() {
            // front から開始して queSize 個の要素のみをコピー
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
    [class]{ArrayDeque}-[func]{}
    ```

=== "Go"

    ```go title="array_deque.go"
    [class]{arrayDeque}-[func]{}
    ```

=== "Swift"

    ```swift title="array_deque.swift"
    [class]{ArrayDeque}-[func]{}
    ```

=== "JS"

    ```javascript title="array_deque.js"
    [class]{ArrayDeque}-[func]{}
    ```

=== "TS"

    ```typescript title="array_deque.ts"
    [class]{ArrayDeque}-[func]{}
    ```

=== "Dart"

    ```dart title="array_deque.dart"
    [class]{ArrayDeque}-[func]{}
    ```

=== "Rust"

    ```rust title="array_deque.rs"
    [class]{ArrayDeque}-[func]{}
    ```

=== "C"

    ```c title="array_deque.c"
    [class]{ArrayDeque}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="array_deque.kt"
    [class]{ArrayDeque}-[func]{}
    ```

=== "Ruby"

    ```ruby title="array_deque.rb"
    [class]{ArrayDeque}-[func]{}
    ```

## 5.3.3 &nbsp; 両端キューの応用

両端キューはスタックとキューの両方のロジックを組み合わせているため、**それぞれのすべてのユースケースを実装でき、より大きな柔軟性を提供します**。

ソフトウェアの「元に戻す」機能は通常スタックを使って実装されることを知っています：システムは各変更操作をスタックに`push`し、次に`pop`して元に戻すことを実装します。しかし、システムリソースの制限を考慮して、ソフトウェアは元に戻すステップの数を制限することがよくあります（例えば、最後の50ステップのみを許可）。スタックの長さが50を超えた場合、ソフトウェアはスタックの底部（キューの前端）で削除操作を実行する必要があります。**しかし、通常のスタックではこの機能を実行できないため、両端キューが必要になります**。「元に戻す」のコアロジックは依然としてスタックの後入れ先出し原則に従いますが、両端キューはより柔軟にいくつかの追加ロジックを実装できることに注意してください。
