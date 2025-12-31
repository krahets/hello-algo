---
comments: true
---

# 5.2 &nbsp; キュー

<u>キュー</u>は、先入先出（FIFO）ルールに従う線形データ構造です。名前が示すように、キューは行列の現象をシミュレートし、新参者は列の後ろに並び、前の人が最初に列を離れます。

下図に示すように、キューの前面を「ヘッド」、後面を「テール」と呼びます。キューの後ろに要素を追加する操作を「エンキュー」、前から要素を削除する操作を「デキュー」と呼びます。

![キューの先入先出ルール](queue.assets/queue_operations.png){ class="animation-figure" }

<p align="center"> 図 5-4 &nbsp; キューの先入先出ルール </p>

## 5.2.1 &nbsp; キューの一般的な操作

キューの一般的な操作を下表に示します。メソッド名はプログラミング言語によって異なる場合があることに注意してください。ここでは、スタックで使用したのと同じ命名規則を使用します。

<p align="center"> 表 5-2 &nbsp; キュー操作の効率 </p>

<div class="center-table" markdown>

| メソッド名 | 説明                            | 時間計算量 |
| ----------- | -------------------------------------- | --------------- |
| `push()`    | 要素をエンキュー、テールに追加 | $O(1)$          |
| `pop()`     | ヘッド要素をデキュー               | $O(1)$          |
| `peek()`    | ヘッド要素にアクセス                | $O(1)$          |

</div>

プログラミング言語で用意されているキュークラスを直接使用できます：

=== "Python"

    ```python title="queue.py"
    from collections import deque

    # キューを初期化
    # Pythonでは、一般的にdequeクラスをキューとして使用します
    # queue.Queue()は純粋なキュークラスですが、使いにくいため推奨されません
    que: deque[int] = deque()

    # 要素をエンキュー
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)

    # 最初の要素にアクセス
    front: int = que[0]

    # 要素をデキュー
    pop: int = que.popleft()

    # キューの長さを取得
    size: int = len(que)

    # キューが空かどうかチェック
    is_empty: bool = len(que) == 0
    ```

=== "C++"

    ```cpp title="queue.cpp"
    /* キューを初期化 */
    queue<int> queue;

    /* 要素をエンキュー */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* 最初の要素にアクセス */
    int front = queue.front();

    /* 要素をデキュー */
    queue.pop();

    /* キューの長さを取得 */
    int size = queue.size();

    /* キューが空かどうかチェック */
    bool empty = queue.empty();
    ```

=== "Java"

    ```java title="queue.java"
    /* キューを初期化 */
    Queue<Integer> queue = new LinkedList<>();

    /* 要素をエンキュー */
    queue.offer(1);
    queue.offer(3);
    queue.offer(2);
    queue.offer(5);
    queue.offer(4);

    /* 最初の要素にアクセス */
    int peek = queue.peek();

    /* 要素をデキュー */
    int pop = queue.poll();

    /* キューの長さを取得 */
    int size = queue.size();

    /* キューが空かどうかチェック */
    boolean isEmpty = queue.isEmpty();
    ```

=== "C#"

    ```csharp title="queue.cs"
    /* キューを初期化 */
    Queue<int> queue = new();

    /* 要素をエンキュー */
    queue.Enqueue(1);
    queue.Enqueue(3);
    queue.Enqueue(2);
    queue.Enqueue(5);
    queue.Enqueue(4);

    /* 最初の要素にアクセス */
    int peek = queue.Peek();

    /* 要素をデキュー */
    int pop = queue.Dequeue();

    /* キューの長さを取得 */
    int size = queue.Count;

    /* キューが空かどうかチェック */
    bool isEmpty = queue.Count == 0;
    ```

=== "Go"

    ```go title="queue_test.go"
    /* キューを初期化 */
    // Goでは、listをキューとして使用
    queue := list.New()

    /* 要素をエンキュー */
    queue.PushBack(1)
    queue.PushBack(3)
    queue.PushBack(2)
    queue.PushBack(5)
    queue.PushBack(4)

    /* 最初の要素にアクセス */
    peek := queue.Front()

    /* 要素をデキュー */
    pop := queue.Front()
    queue.Remove(pop)

    /* キューの長さを取得 */
    size := queue.Len()

    /* キューが空かどうかチェック */
    isEmpty := queue.Len() == 0
    ```

=== "Swift"

    ```swift title="queue.swift"
    /* キューを初期化 */
    // Swiftには組み込みのキュークラスがないため、Arrayをキューとして使用
    var queue: [Int] = []

    /* 要素をエンキュー */
    queue.append(1)
    queue.append(3)
    queue.append(2)
    queue.append(5)
    queue.append(4)

    /* 最初の要素にアクセス */
    let peek = queue.first!

    /* 要素をデキュー */
    // 配列なので、removeFirstの計算量はO(n)
    let pool = queue.removeFirst()

    /* キューの長さを取得 */
    let size = queue.count

    /* キューが空かどうかチェック */
    let isEmpty = queue.isEmpty
    ```

=== "JS"

    ```javascript title="queue.js"
    /* キューを初期化 */
    // JavaScriptには組み込みのキューがないため、Arrayをキューとして使用
    const queue = [];

    /* 要素をエンキュー */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* 最初の要素にアクセス */
    const peek = queue[0];

    /* 要素をデキュー */
    // 基礎構造が配列なので、shift()メソッドの時間計算量はO(n)
    const pop = queue.shift();

    /* キューの長さを取得 */
    const size = queue.length;

    /* キューが空かどうかチェック */
    const empty = queue.length === 0;
    ```

=== "TS"

    ```typescript title="queue.ts"
    /* キューを初期化 */
    // TypeScriptには組み込みのキューがないため、Arrayをキューとして使用
    const queue: number[] = [];

    /* 要素をエンキュー */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* 最初の要素にアクセス */
    const peek = queue[0];

    /* 要素をデキュー */
    // 基礎構造が配列なので、shift()メソッドの時間計算量はO(n)
    const pop = queue.shift();

    /* キューの長さを取得 */
    const size = queue.length;

    /* キューが空かどうかチェック */
    const empty = queue.length === 0;
    ```

=== "Dart"

    ```dart title="queue.dart"
    /* キューを初期化 */
    // DartのQueueクラスは双方向キューですが、キューとして使用できます
    Queue<int> queue = Queue();

    /* 要素をエンキュー */
    queue.add(1);
    queue.add(3);
    queue.add(2);
    queue.add(5);
    queue.add(4);

    /* 最初の要素にアクセス */
    int peek = queue.first;

    /* 要素をデキュー */
    int pop = queue.removeFirst();

    /* キューの長さを取得 */
    int size = queue.length;

    /* キューが空かどうかチェック */
    bool isEmpty = queue.isEmpty;
    ```

=== "Rust"

    ```rust title="queue.rs"
    /* 双方向キューを初期化 */
    // Rustでは、双方向キューを通常のキューとして使用
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* 要素をエンキュー */
    deque.push_back(1);
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);

    /* 最初の要素にアクセス */
    if let Some(front) = deque.front() {
    }

    /* 要素をデキュー */
    if let Some(pop) = deque.pop_front() {
    }

    /* キューの長さを取得 */
    let size = deque.len();

    /* キューが空かどうかチェック */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="queue.c"
    // Cは組み込みのキューを提供していません
    ```

=== "Kotlin"

    ```kotlin title="queue.kt"

    ```

## 5.2.2 &nbsp; キューの実装

キューを実装するには、一方の端で要素を追加し、もう一方の端で要素を削除できるデータ構造が必要です。連結リストと配列の両方がこの要件を満たします。

### 1. &nbsp; 連結リストベースの実装

下図に示すように、連結リストの「ヘッドノード」と「テールノード」をそれぞれキューの「フロント」と「リア」と考えることができます。ノードは後ろでのみ追加でき、前でのみ削除できるように規定されています。

=== "LinkedListQueue"
    ![連結リストによるキュー実装のエンキューとデキュー操作](queue.assets/linkedlist_queue_step1.png){ class="animation-figure" }

=== "push()"
    ![linkedlist_queue_push](queue.assets/linkedlist_queue_step2_push.png){ class="animation-figure" }

=== "pop()"
    ![linkedlist_queue_pop](queue.assets/linkedlist_queue_step3_pop.png){ class="animation-figure" }

<p align="center"> 図 5-5 &nbsp; 連結リストによるキュー実装のエンキューとデキュー操作 </p>

以下は、連結リストを使用してキューを実装するコードです：

=== "Python"

    ```python title="linkedlist_queue.py"
    class LinkedListQueue:
        """連結リストベースのキュークラス"""

        def __init__(self):
            """コンストラクタ"""
            self._front: ListNode | None = None  # ヘッドノード front
            self._rear: ListNode | None = None  # テールノード rear
            self._size: int = 0

        def size(self) -> int:
            """キューの長さを取得"""
            return self._size

        def is_empty(self) -> bool:
            """キューが空かどうかを判定"""
            return self._size == 0

        def push(self, num: int):
            """エンキュー"""
            # テールノードの後ろに num を追加
            node = ListNode(num)
            # キューが空の場合、ヘッドとテールノードの両方をそのノードに向ける
            if self._front is None:
                self._front = node
                self._rear = node
            # キューが空でない場合、そのノードをテールノードの後ろに追加
            else:
                self._rear.next = node
                self._rear = node
            self._size += 1

        def pop(self) -> int:
            """デキュー"""
            num = self.peek()
            # ヘッドノードを削除
            self._front = self._front.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """フロント要素にアクセス"""
            if self.is_empty():
                raise IndexError("Queue is empty")
            return self._front.val

        def to_list(self) -> list[int]:
            """出力用のリストに変換"""
            queue = []
            temp = self._front
            while temp:
                queue.append(temp.val)
                temp = temp.next
            return queue
    ```

=== "C++"

    ```cpp title="linkedlist_queue.cpp"
    /* 連結リストに基づくキュークラス */
    class LinkedListQueue {
      private:
        ListNode *front, *rear; // 先頭ノードfront、末尾ノードrear
        int queSize;

      public:
        LinkedListQueue() {
            front = nullptr;
            rear = nullptr;
            queSize = 0;
        }

        ~LinkedListQueue() {
            // 連結リストを走査、ノードを削除、メモリを解放
            freeMemoryLinkedList(front);
        }

        /* キューの長さを取得 */
        int size() {
            return queSize;
        }

        /* キューが空かどうかを判定 */
        bool isEmpty() {
            return queSize == 0;
        }

        /* エンキュー */
        void push(int num) {
            // 末尾ノードの後ろにnumを追加
            ListNode *node = new ListNode(num);
            // キューが空の場合、先頭と末尾ノードの両方をそのノードに向ける
            if (front == nullptr) {
                front = node;
                rear = node;
            }
            // キューが空でない場合、そのノードを末尾ノードの後ろに追加
            else {
                rear->next = node;
                rear = node;
            }
            queSize++;
        }

        /* デキュー */
        int pop() {
            int num = peek();
            // 先頭ノードを削除
            ListNode *tmp = front;
            front = front->next;
            // メモリを解放
            delete tmp;
            queSize--;
            return num;
        }

        /* 先頭要素にアクセス */
        int peek() {
            if (size() == 0)
                throw out_of_range("Queue is empty");
            return front->val;
        }

        /* 連結リストをVectorに変換して返却 */
        vector<int> toVector() {
            ListNode *node = front;
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

    ```java title="linkedlist_queue.java"
    /* 連結リストに基づくキュークラス */
    class LinkedListQueue {
        private ListNode front, rear; // 先頭ノード front、末尾ノード rear
        private int queSize = 0;

        public LinkedListQueue() {
            front = null;
            rear = null;
        }

        /* キューの長さを取得 */
        public int size() {
            return queSize;
        }

        /* キューが空かどうかを判定 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* エンキュー */
        public void push(int num) {
            // 末尾ノードの後ろに num を追加
            ListNode node = new ListNode(num);
            // キューが空の場合、先頭と末尾ノードの両方をそのノードにポイント
            if (front == null) {
                front = node;
                rear = node;
            // キューが空でない場合、そのノードを末尾ノードの後ろに追加
            } else {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }

        /* デキュー */
        public int pop() {
            int num = peek();
            // 先頭ノードを削除
            front = front.next;
            queSize--;
            return num;
        }

        /* 先頭要素にアクセス */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* 連結リストを配列に変換して返す */
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

    ```csharp title="linkedlist_queue.cs"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Go"

    ```go title="linkedlist_queue.go"
    [class]{linkedListQueue}-[func]{}
    ```

=== "Swift"

    ```swift title="linkedlist_queue.swift"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "JS"

    ```javascript title="linkedlist_queue.js"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "TS"

    ```typescript title="linkedlist_queue.ts"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Dart"

    ```dart title="linkedlist_queue.dart"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Rust"

    ```rust title="linkedlist_queue.rs"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "C"

    ```c title="linkedlist_queue.c"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_queue.kt"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Ruby"

    ```ruby title="linkedlist_queue.rb"
    [class]{LinkedListQueue}-[func]{}
    ```

### 2. &nbsp; 配列ベースの実装

配列の最初の要素を削除する時間計算量は$O(n)$で、デキュー操作が非効率になります。しかし、この問題は以下のように巧妙に回避できます。

変数`front`を使用してフロント要素のインデックスを示し、変数`size`を維持してキューの長さを記録します。`rear = front + size`を定義し、これはテール要素の直後の位置を指します。

この設計により、**配列内の要素の有効な間隔は`[front, rear - 1]`です**。各操作の実装方法を下図に示します。

- エンキュー操作：入力要素を`rear`インデックスに割り当て、`size`を1増加させます。
- デキュー操作：単に`front`を1増加させ、`size`を1減少させます。

エンキューとデキュー操作は両方とも単一の操作のみを必要とし、それぞれの時間計算量は$O(1)$です。

=== "ArrayQueue"
    ![配列によるキュー実装のエンキューとデキュー操作](queue.assets/array_queue_step1.png){ class="animation-figure" }

=== "push()"
    ![array_queue_push](queue.assets/array_queue_step2_push.png){ class="animation-figure" }

=== "pop()"
    ![array_queue_pop](queue.assets/array_queue_step3_pop.png){ class="animation-figure" }

<p align="center"> 図 5-6 &nbsp; 配列によるキュー実装のエンキューとデキュー操作 </p>

問題に気づくかもしれません：エンキューとデキュー操作が継続的に実行されると、`front`と`rear`の両方が右に移動し、**最終的に配列の末尾に到達してそれ以上移動できなくなります**。これを解決するために、配列を「循環配列」として扱い、配列の末尾を先頭に接続します。

循環配列では、`front`または`rear`が末尾に到達すると、配列の先頭にループバックする必要があります。この循環パターンは、以下のコードに示すように「剰余演算」で実現できます：

=== "Python"

    ```python title="array_queue.py"
    class ArrayQueue:
        """循環配列ベースのキュークラス"""

        def __init__(self, size: int):
            """コンストラクタ"""
            self._nums: list[int] = [0] * size  # キュー要素を格納する配列
            self._front: int = 0  # フロントポインタ、フロント要素を指す
            self._size: int = 0  # キューの長さ

        def capacity(self) -> int:
            """キューの容量を取得"""
            return len(self._nums)

        def size(self) -> int:
            """キューの長さを取得"""
            return self._size

        def is_empty(self) -> bool:
            """キューが空かどうかを判定"""
            return self._size == 0

        def push(self, num: int):
            """エンキュー"""
            if self._size == self.capacity():
                raise IndexError("Queue is full")
            # リアポインタを計算、リアインデックス + 1 を指す
            # モジュロ演算を使用してリアポインタを配列の末尾から先頭に戻す
            rear: int = (self._front + self._size) % self.capacity()
            # num をリアに追加
            self._nums[rear] = num
            self._size += 1

        def pop(self) -> int:
            """デキュー"""
            num: int = self.peek()
            # フロントポインタを1つ後ろに移動、末尾を超えた場合は配列の先頭に戻る
            self._front = (self._front + 1) % self.capacity()
            self._size -= 1
            return num

        def peek(self) -> int:
            """フロント要素にアクセス"""
            if self.is_empty():
                raise IndexError("Queue is empty")
            return self._nums[self._front]

        def to_list(self) -> list[int]:
            """出力用の配列を返す"""
            res = [0] * self.size()
            j: int = self._front
            for i in range(self.size()):
                res[i] = self._nums[(j % self.capacity())]
                j += 1
            return res
    ```

=== "C++"

    ```cpp title="array_queue.cpp"
    /* 循環配列に基づくキュークラス */
    class ArrayQueue {
      private:
        int *nums;       // キュー要素を格納する配列
        int front;       // 先頭ポインタ、先頭要素を指す
        int queSize;     // キューの長さ
        int queCapacity; // キューの容量

      public:
        ArrayQueue(int capacity) {
            // 配列を初期化
            nums = new int[capacity];
            queCapacity = capacity;
            front = queSize = 0;
        }

        ~ArrayQueue() {
            delete[] nums;
        }

        /* キューの容量を取得 */
        int capacity() {
            return queCapacity;
        }

        /* キューの長さを取得 */
        int size() {
            return queSize;
        }

        /* キューが空かどうかを判定 */
        bool isEmpty() {
            return size() == 0;
        }

        /* エンキュー */
        void push(int num) {
            if (queSize == queCapacity) {
                cout << "Queue is full" << endl;
                return;
            }
            // 末尾ポインタを計算、末尾インデックス + 1を指す
            // 剰余演算を使用して末尾ポインタが配列の末尾から先頭に戻るようにラップ
            int rear = (front + queSize) % queCapacity;
            // numを末尾に追加
            nums[rear] = num;
            queSize++;
        }

        /* デキュー */
        int pop() {
            int num = peek();
            // 先頭ポインタを1つ後ろに移動、末尾を超えた場合は配列の先頭に戻る
            front = (front + 1) % queCapacity;
            queSize--;
            return num;
        }

        /* 先頭要素にアクセス */
        int peek() {
            if (isEmpty())
                throw out_of_range("Queue is empty");
            return nums[front];
        }

        /* 配列をVectorに変換して返却 */
        vector<int> toVector() {
            // 有効な長さ範囲内の要素のみを変換
            vector<int> arr(queSize);
            for (int i = 0, j = front; i < queSize; i++, j++) {
                arr[i] = nums[j % queCapacity];
            }
            return arr;
        }
    };
    ```

=== "Java"

    ```java title="array_queue.java"
    /* 配列に基づくキュークラス */
    class ArrayQueue {
        private int[] nums; // 要素を格納する配列
        private int front; // キューヘッドポインタ、最初の要素を指す
        private int queSize; // キューの長さ

        public ArrayQueue(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* キューの容量を取得 */
        public int capacity() {
            return nums.length;
        }

        /* キューの長さを取得 */
        public int size() {
            return queSize;
        }

        /* キューが空かどうかを判定 */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* エンキュー */
        public void push(int num) {
            if (queSize == capacity()) {
                System.out.println("キューが満杯です");
                return;
            }
            // リアポインタを計算：front + queSize
            // モジュロ操作により rear が配列の長さを超えることを回避
            int rear = (front + queSize) % capacity();
            // 要素をキューリアに追加
            nums[rear] = num;
            queSize++;
        }

        /* デキュー */
        public int pop() {
            int num = peek();
            // キューヘッドポインタを後ろに1つ移動、モジュロ操作により範囲を超えることを回避
            front = (front + 1) % capacity();
            queSize--;
            return num;
        }

        /* キューヘッド要素にアクセス */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* 配列を返す */
        public int[] toArray() {
            // front から開始して queSize 個の要素のみをコピー
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[j % capacity()];
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_queue.cs"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Go"

    ```go title="array_queue.go"
    [class]{arrayQueue}-[func]{}
    ```

=== "Swift"

    ```swift title="array_queue.swift"
    [class]{ArrayQueue}-[func]{}
    ```

=== "JS"

    ```javascript title="array_queue.js"
    [class]{ArrayQueue}-[func]{}
    ```

=== "TS"

    ```typescript title="array_queue.ts"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Dart"

    ```dart title="array_queue.dart"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Rust"

    ```rust title="array_queue.rs"
    [class]{ArrayQueue}-[func]{}
    ```

=== "C"

    ```c title="array_queue.c"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="array_queue.kt"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Ruby"

    ```ruby title="array_queue.rb"
    [class]{ArrayQueue}-[func]{}
    ```

上記のキュー実装にはまだ制限があります：長さが固定されています。しかし、この問題は解決が困難ではありません。配列を必要に応じて自動拡張できる動的配列に置き換えることができます。興味のある読者は自分で実装してみてください。

2つの実装の比較はスタックの場合と一貫しており、ここでは繰り返しません。

## 5.2.3 &nbsp; キューの典型的な応用

- **Amazonの注文**：買い物客が注文を行った後、これらの注文はキューに参加し、システムは順番に処理します。独身の日などのイベント中は、短時間で大量の注文が生成され、高い同時実行性がエンジニアにとって重要な課題となります。
- **様々なToDoリスト**：「先着順」機能が必要なシナリオ、例えばプリンターのタスクキューやレストランの配達キューなど、キューで処理順序を効果的に維持できます。
