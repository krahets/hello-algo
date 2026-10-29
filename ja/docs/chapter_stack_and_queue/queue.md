# キュー

<u>キュー（queue）</u>は先入れ先出しの規則に従う線形データ構造です。行列に並ぶ様子を模しており、新しく来た人が末尾に加わり、先頭の人から順に離れていきます。

下図のように、前側を「先頭」、後ろ側を「末尾」と呼びます。末尾に要素を加える操作を「エンキュー」、先頭要素を削除する操作を「デキュー」と呼びます。

![キューの先入れ先出しの規則](queue.assets/queue_operations.png)

## キューの主な操作

主な操作を下表に示します。メソッド名は言語ごとに異なる場合がありますが、ここではスタックと同じ名前を使います。

<p align="center"> 表 <id> &nbsp; キューの操作効率 </p>

| メソッド名   | 説明                         | 時間計算量 |
| -------- | ---------------------------- | ---------- |
| `push()` | エンキュー、つまり末尾への要素の追加 | $O(1)$     |
| `pop()`  | 先頭要素のデキュー                 | $O(1)$     |
| `peek()` | 先頭要素へのアクセス                 | $O(1)$     |

言語が用意するキュークラスを、そのまま利用できます。

=== "Python"

    ```python title="queue.py"
    from collections import deque

    # キューを初期化
    # Python では通常、両端キュークラス deque をキューとして使う
    # queue.Queue() は本来のキュークラスだが、使いにくいため推奨しない
    que: deque[int] = deque()

    # 要素をエンキュー
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)

    # 先頭要素にアクセス
    front: int = que[0]

    # 要素をデキュー
    pop: int = que.popleft()

    # キューの長さを取得
    size: int = len(que)

    # キューが空かどうかを判定
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

    /* 先頭要素にアクセス */
    int front = queue.front();

    /* 要素をデキュー */
    queue.pop();

    /* キューの長さを取得 */
    int size = queue.size();

    /* キューが空かどうかを判定 */
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

    /* 先頭要素にアクセス */
    int peek = queue.peek();

    /* 要素をデキュー */
    int pop = queue.poll();

    /* キューの長さを取得 */
    int size = queue.size();

    /* キューが空かどうかを判定 */
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

    /* 先頭要素にアクセス */
    int peek = queue.Peek();

    /* 要素をデキュー */
    int pop = queue.Dequeue();

    /* キューの長さを取得 */
    int size = queue.Count;

    /* キューが空かどうかを判定 */
    bool isEmpty = queue.Count == 0;
    ```

=== "Go"

    ```go title="queue_test.go"
    /* キューを初期化 */
    // Go では list をキューとして使う
    queue := list.New()

    /* 要素をエンキュー */
    queue.PushBack(1)
    queue.PushBack(3)
    queue.PushBack(2)
    queue.PushBack(5)
    queue.PushBack(4)

    /* 先頭要素にアクセス */
    peek := queue.Front()

    /* 要素をデキュー */
    pop := queue.Front()
    queue.Remove(pop)

    /* キューの長さを取得 */
    size := queue.Len()

    /* キューが空かどうかを判定 */
    isEmpty := queue.Len() == 0
    ```

=== "Swift"

    ```swift title="queue.swift"
    /* キューを初期化 */
    // Swift には組み込みのキュークラスがないため、Array をキューとして使える
    var queue: [Int] = []

    /* 要素をエンキュー */
    queue.append(1)
    queue.append(3)
    queue.append(2)
    queue.append(5)
    queue.append(4)

    /* 先頭要素にアクセス */
    let peek = queue.first!

    /* 要素をデキュー */
    // 配列なので removeFirst の計算量は O(n)
    let pop = queue.removeFirst()

    /* キューの長さを取得 */
    let size = queue.count

    /* キューが空かどうかを判定 */
    let isEmpty = queue.isEmpty
    ```

=== "JS"

    ```javascript title="queue.js"
    /* キューを初期化 */
    // JavaScript には組み込みのキューがないため、Array をキューとして使える
    const queue = [];

    /* 要素をエンキュー */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* 先頭要素にアクセス */
    const peek = queue[0];

    /* 要素をデキュー */
    // 内部が配列なので shift() の時間計算量は O(n)
    const pop = queue.shift();

    /* キューの長さを取得 */
    const size = queue.length;

    /* キューが空かどうかを判定 */
    const empty = queue.length === 0;
    ```

=== "TS"

    ```typescript title="queue.ts"
    /* キューを初期化 */
    // TypeScript には組み込みのキューがないため、Array をキューとして使える
    const queue: number[] = [];

    /* 要素をエンキュー */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* 先頭要素にアクセス */
    const peek = queue[0];

    /* 要素をデキュー */
    // 内部が配列なので shift() の時間計算量は O(n)
    const pop = queue.shift();

    /* キューの長さを取得 */
    const size = queue.length;

    /* キューが空かどうかを判定 */
    const empty = queue.length === 0;
    ```

=== "Dart"

    ```dart title="queue.dart"
    /* キューを初期化 */
    // Dart の Queue は両端キューであり、通常のキューとしても使える
    Queue<int> queue = Queue();

    /* 要素をエンキュー */
    queue.add(1);
    queue.add(3);
    queue.add(2);
    queue.add(5);
    queue.add(4);

    /* 先頭要素にアクセス */
    int peek = queue.first;

    /* 要素をデキュー */
    int pop = queue.removeFirst();

    /* キューの長さを取得 */
    int size = queue.length;

    /* キューが空かどうかを判定 */
    bool isEmpty = queue.isEmpty;
    ```

=== "Rust"

    ```rust title="queue.rs"
    /* 両端キューを初期化 */
    // Rust では両端キューを通常のキューとして使う
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* 要素をエンキュー */
    deque.push_back(1);
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);

    /* 先頭要素にアクセス */
    if let Some(front) = deque.front() {
    }

    /* 要素をデキュー */
    if let Some(pop) = deque.pop_front() {
    }

    /* キューの長さを取得 */
    let size = deque.len();

    /* キューが空かどうかを判定 */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="queue.c"
    // C には組み込みのキューがない
    ```

=== "Kotlin"

    ```kotlin title="queue.kt"
    /* キューを初期化 */
    val queue = LinkedList<Int>()

    /* 要素をエンキュー */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)

    /* 先頭要素にアクセス */
    val peek = queue.peek()

    /* 要素をデキュー */
    val pop = queue.poll()

    /* キューの長さを取得 */
    val size = queue.size

    /* キューが空かどうかを判定 */
    val isEmpty = queue.isEmpty()
    ```

=== "Ruby"

    ```ruby title="queue.rb"
    # キューを初期化
    # Ruby の組み込みキュー（Thread::Queue）には peek や走査のメソッドがないため、Array をキューとして使える
    queue = []

    # 要素をエンキュー
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)

    # キューの要素にアクセス
    peek = queue.first

    # 要素をデキュー
    # 配列なので Array#shift の時間計算量は O(n) であることに注意
    pop = queue.shift

    # キューの長さを取得
    size = queue.length

    # キューが空かどうかを判定
    is_empty = queue.empty?
    ```

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20Python%20%E3%81%A7%E3%81%AF%E9%80%9A%E5%B8%B8%E3%80%81%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%AF%E3%83%A9%E3%82%B9%20deque%20%E3%82%92%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%A8%E3%81%97%E3%81%A6%E4%BD%BF%E3%81%86%0A%20%20%20%20%23%20queue.Queue()%20%E3%81%AF%E6%9C%AC%E6%9D%A5%E3%81%AE%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%A0%E3%81%8C%E3%80%81%E4%BD%BF%E3%81%84%E3%81%AB%E3%81%8F%E3%81%84%0A%20%20%20%20que%20%3D%20deque()%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%82%A8%E3%83%B3%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20que.append(1)%0A%20%20%20%20que.append(3)%0A%20%20%20%20que.append(2)%0A%20%20%20%20que.append(5)%0A%20%20%20%20que.append(4)%0A%20%20%20%20print(%22%E3%82%AD%E3%83%A5%E3%83%BC%20que%20%3D%22%2C%20que)%0A%0A%20%20%20%20%23%20%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20front%20%3D%22%2C%20front)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%87%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20pop%20%3D%20que.popleft()%0A%20%20%20%20print(%22%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22%2C%20pop)%0A%20%20%20%20print(%22%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20que%20%3D%22%2C%20que)%0A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(que)%0A%20%20%20%20print(%22%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size)%0A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len(que)%20%3D%3D%200%0A%20%20%20%20print(%22%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22%2C%20is_empty)&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## キューの実装

キューを実装するには、一方の端で追加し、もう一方の端で削除できるデータ構造が必要です。連結リストも配列も、この条件を満たします。

### 連結リストによる実装

下図のように、連結リストの先頭ノードと末尾ノードを、キューの先頭と末尾に対応させます。末尾では追加だけ、先頭では削除だけを行います。

=== "<1>"
    ![連結リストによるキューのエンキューとデキュー](queue.assets/linkedlist_queue_step1.png)

=== "<2>"
    ![連結リストによるキュー：要素の挿入](queue.assets/linkedlist_queue_step2_push.png)

=== "<3>"
    ![連結リストによるキュー：要素の取り出し](queue.assets/linkedlist_queue_step3_pop.png)

連結リストを使うコードは次のとおりです。

```src
[file]{linkedlist_queue}-[class]{linked_list_queue}-[func]{}
```

### 配列による実装

配列の先頭要素の削除は時間計算量が $O(n)$ なので、デキューの効率が低くなります。ただし、次の工夫で避けられます。

変数 `front` で先頭要素のインデックスを示し、変数 `size` でキューの長さを記録します。`rear = front + size` と定義すると、`rear` は末尾要素の次の位置を指します。

この設計では、**要素を含む有効区間は `[front, rear - 1]`** です。各操作の実装を下図に示します。

- エンキュー：インデックス `rear` に入力要素を代入し、`size` を 1 増やします。
- デキュー：`front` を 1 増やし、`size` を 1 減らすだけです。

どちらも一度の操作で済み、時間計算量はともに $O(1)$ です。

=== "<1>"
    ![配列によるキューのエンキューとデキュー](queue.assets/array_queue_step1.png)

=== "<2>"
    ![配列によるキュー：要素の挿入](queue.assets/array_queue_step2_push.png)

=== "<3>"
    ![配列によるキュー：要素の取り出し](queue.assets/array_queue_step3_pop.png)

一つ問題があります。追加と削除を続けると `front` と `rear` が右へ移動し、**配列の末尾に達すると、それ以上進めなくなります**。これを解決するため、配列の両端がつながった「循環配列」と見なします。

循環配列では、`front` や `rear` が末尾を越えたら先頭に戻って走査を続けます。この周期性は剰余演算で実現できます。コードは次のとおりです。

```src
[file]{array_queue}-[class]{array_queue}-[func]{}
```

この実装には、長さを変更できないという制約がまだあります。ただし、配列を動的配列に置き換え、容量拡張を導入すれば解決できます。興味があれば実装してみてください。

二つの実装の比較結果はスタックと同じなので、ここでは繰り返しません。

## キューの代表的な用途

- **淘宝の注文**。購入者が注文するとキューに追加され、システムが順に処理します。11 月 11 日のセールでは短時間に膨大な注文が発生するため、多数の同時処理がエンジニアにとって重要な課題となります。
- **さまざまな待機タスク**。プリンターの印刷待ちや飲食店の料理の提供待ちなど、到着順の処理が必要な場面で、キューは処理順を効果的に維持できます。
