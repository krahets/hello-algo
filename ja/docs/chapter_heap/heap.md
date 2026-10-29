---
comments: true
---

# 8.1 &nbsp; ヒープ

<u>ヒープ（heap）</u>は特定の条件を満たす完全二分木です。図 8-1 のように、主に二種類に分かれます。

- <u>最小ヒープ（min heap）</u>：任意のノードの値が、その子の値以下（$\leq$）です。
- <u>最大ヒープ（max heap）</u>：任意のノードの値が、その子の値以上（$\geq$）です。

![最小ヒープと最大ヒープ](heap.assets/min_heap_and_max_heap.png){ class="animation-figure" }

<p align="center"> 図 8-1 &nbsp; 最小ヒープと最大ヒープ </p>

ヒープは完全二分木の特殊な場合なので、次の特徴を持ちます。

- 最下層のノードは左詰めで、ほかの層はすべて埋まっています。
- 根ノードを「ヒープの先頭」、最下層の一番右のノードを「ヒープの末尾」と呼びます。
- 最大ヒープ（最小ヒープ）では、先頭要素、つまり根ノードの値が最大（最小）です。

## 8.1.1 &nbsp; ヒープの主な操作

多くのプログラミング言語が提供するのは、<u>優先度付きキュー（priority queue）</u>です。これは、優先度に基づいて順序付けられるキューとして定義される抽象データ構造です。

実際には、**ヒープは優先度付きキューの実装によく使われ、最大ヒープは大きい要素から順に取り出す優先度付きキューに相当します**。使う側からは、両者を同等のデータ構造と見なせます。そのため本書では特に区別せず、「ヒープ」と呼びます。

主な操作を表 8-1 に示します。メソッド名は言語によって異なります。

<p align="center"> 表 8-1 &nbsp; ヒープの操作効率 </p>

<div class="center-table" markdown>

| メソッド名      | 説明                                             | 時間計算量  |
| ----------- | ------------------------------------------------ | ----------- |
| `push()`    | 要素をヒープに挿入する                                         | $O(\log n)$ |
| `pop()`     | ヒープの先頭要素を取り出す                                     | $O(\log n)$ |
| `peek()`    | 先頭要素にアクセスする（最大／最小ヒープでは最大値／最小値） | $O(1)$      |
| `size()`    | ヒープの要素数を取得する                                 | $O(1)$      |
| `isEmpty()` | ヒープが空かどうかを判定する                                   | $O(1)$      |

</div>

実際には、言語が提供するヒープクラスや優先度付きキューのクラスをそのまま使えます。

ソートで昇順と降順を切り替えるように、`flag` の設定や `Comparator` の変更によって、最小ヒープと最大ヒープを切り替えられます。コードは次のとおりです。

=== "Python"

    ```python title="heap.py"
    # 最小ヒープを初期化
    min_heap, flag = [], 1
    # 最大ヒープを初期化
    max_heap, flag = [], -1

    # Python の heapq モジュールはデフォルトで最小ヒープを実装する
    # 要素の符号を反転してから挿入すると、大小関係が逆転し最大ヒープを実現できる
    # この例では flag = 1 が最小ヒープ、flag = -1 が最大ヒープに対応する

    # 要素をヒープに挿入
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)

    # ヒープの先頭要素を取得
    peek: int = flag * max_heap[0] # 5

    # ヒープの先頭要素を取り出す
    # 取り出した要素は降順の列になる
    val = flag * heapq.heappop(max_heap) # 5
    val = flag * heapq.heappop(max_heap) # 4
    val = flag * heapq.heappop(max_heap) # 3
    val = flag * heapq.heappop(max_heap) # 2
    val = flag * heapq.heappop(max_heap) # 1

    # ヒープの要素数を取得
    size: int = len(max_heap)

    # ヒープが空かどうかを判定
    is_empty: bool = not max_heap

    # リストを入力してヒープを構築
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    ```

=== "C++"

    ```cpp title="heap.cpp"
    /* ヒープを初期化 */
    // 最小ヒープを初期化
    priority_queue<int, vector<int>, greater<int>> minHeap;
    // 最大ヒープを初期化
    priority_queue<int, vector<int>, less<int>> maxHeap;

    /* 要素をヒープに挿入 */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);

    /* ヒープの先頭要素を取得 */
    int peek = maxHeap.top(); // 5

    /* ヒープの先頭要素を取り出す */
    // 取り出した要素は降順の列になる
    maxHeap.pop(); // 5
    maxHeap.pop(); // 4
    maxHeap.pop(); // 3
    maxHeap.pop(); // 2
    maxHeap.pop(); // 1

    /* ヒープの要素数を取得 */
    int size = maxHeap.size();

    /* ヒープが空かどうかを判定 */
    bool isEmpty = maxHeap.empty();

    /* リストを入力してヒープを構築 */
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    ```

=== "Java"

    ```java title="heap.java"
    /* ヒープを初期化 */
    // 最小ヒープを初期化
    Queue<Integer> minHeap = new PriorityQueue<>();
    // 最大ヒープを初期化（ラムダ式で Comparator を変更する）
    Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

    /* 要素をヒープに挿入 */
    maxHeap.offer(1);
    maxHeap.offer(3);
    maxHeap.offer(2);
    maxHeap.offer(5);
    maxHeap.offer(4);

    /* ヒープの先頭要素を取得 */
    int peek = maxHeap.peek(); // 5

    /* ヒープの先頭要素を取り出す */
    // 取り出した要素は降順の列になる
    peek = maxHeap.poll(); // 5
    peek = maxHeap.poll(); // 4
    peek = maxHeap.poll(); // 3
    peek = maxHeap.poll(); // 2
    peek = maxHeap.poll(); // 1

    /* ヒープの要素数を取得 */
    int size = maxHeap.size();

    /* ヒープが空かどうかを判定 */
    boolean isEmpty = maxHeap.isEmpty();

    /* リストを入力してヒープを構築 */
    minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
    ```

=== "C#"

    ```csharp title="heap.cs"
    /* ヒープを初期化 */
    // 最小ヒープを初期化
    PriorityQueue<int, int> minHeap = new();
    // 最大ヒープを初期化（ラムダ式で Comparer を変更する）
    PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

    /* 要素をヒープに挿入 */
    maxHeap.Enqueue(1, 1);
    maxHeap.Enqueue(3, 3);
    maxHeap.Enqueue(2, 2);
    maxHeap.Enqueue(5, 5);
    maxHeap.Enqueue(4, 4);

    /* ヒープの先頭要素を取得 */
    int peek = maxHeap.Peek();//5

    /* ヒープの先頭要素を取り出す */
    // 取り出した要素は降順の列になる
    peek = maxHeap.Dequeue();  // 5
    peek = maxHeap.Dequeue();  // 4
    peek = maxHeap.Dequeue();  // 3
    peek = maxHeap.Dequeue();  // 2
    peek = maxHeap.Dequeue();  // 1

    /* ヒープの要素数を取得 */
    int size = maxHeap.Count;

    /* ヒープが空かどうかを判定 */
    bool isEmpty = maxHeap.Count == 0;

    /* リストを入力してヒープを構築 */
    minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
    ```

=== "Go"

    ```go title="heap.go"
    // Go では heap.Interface を実装して整数の最大ヒープを構築できる
    // heap.Interface の実装には sort.Interface の実装も必要
    type intHeap []any

    // Push は heap.Interface のメソッドで、ヒープへの挿入を実装する
    func (h *intHeap) Push(x any) {
        // Push と Pop はポインタレシーバーを引数として使う
        // スライスの内容だけでなく長さも変更するため
        *h = append(*h, x.(int))
    }

    // Pop は heap.Interface のメソッドで、先頭要素の取り出しを実装する
    func (h *intHeap) Pop() any {
        // 取り出す要素は末尾に格納されている
        last := (*h)[len(*h)-1]
        *h = (*h)[:len(*h)-1]
        return last
    }

    // Len は sort.Interface のメソッド
    func (h *intHeap) Len() int {
        return len(*h)
    }

    // Less は sort.Interface のメソッド
    func (h *intHeap) Less(i, j int) bool {
        // 最小ヒープを実装する場合は、小なり記号に変更する
        return (*h)[i].(int) > (*h)[j].(int)
    }

    // Swap は sort.Interface のメソッド
    func (h *intHeap) Swap(i, j int) {
        (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
    }

    // Top ヒープの先頭要素を取得
    func (h *intHeap) Top() any {
        return (*h)[0]
    }

    /* 実行用コード */
    func TestHeap(t *testing.T) {
        /* ヒープを初期化 */
        // 最大ヒープを初期化
        maxHeap := &intHeap{}
        heap.Init(maxHeap)
        /* 要素をヒープに挿入 */
        // heap.Interface のメソッドを呼んで要素を追加
        heap.Push(maxHeap, 1)
        heap.Push(maxHeap, 3)
        heap.Push(maxHeap, 2)
        heap.Push(maxHeap, 4)
        heap.Push(maxHeap, 5)

        /* ヒープの先頭要素を取得 */
        top := maxHeap.Top()
        fmt.Printf("ヒープの先頭要素は %d\n", top)

        /* ヒープの先頭要素を取り出す */
        // heap.Interface のメソッドを呼んで要素を削除
        heap.Pop(maxHeap) // 5
        heap.Pop(maxHeap) // 4
        heap.Pop(maxHeap) // 3
        heap.Pop(maxHeap) // 2
        heap.Pop(maxHeap) // 1

        /* ヒープの要素数を取得 */
        size := len(*maxHeap)
        fmt.Printf("ヒープの要素数は %d\n", size)

        /* ヒープが空かどうかを判定 */
        isEmpty := len(*maxHeap) == 0
        fmt.Printf("ヒープは空か %t\n", isEmpty)
    }
    ```

=== "Swift"

    ```swift title="heap.swift"
    /* ヒープを初期化 */
    // Swift の Heap 型は最大ヒープと最小ヒープの両方に対応し、swift-collections の導入が必要
    var heap = Heap<Int>()

    /* 要素をヒープに挿入 */
    heap.insert(1)
    heap.insert(3)
    heap.insert(2)
    heap.insert(5)
    heap.insert(4)

    /* ヒープの先頭要素を取得 */
    var peek = heap.max()!

    /* ヒープの先頭要素を取り出す */
    peek = heap.removeMax() // 5
    peek = heap.removeMax() // 4
    peek = heap.removeMax() // 3
    peek = heap.removeMax() // 2
    peek = heap.removeMax() // 1

    /* ヒープの要素数を取得 */
    let size = heap.count

    /* ヒープが空かどうかを判定 */
    let isEmpty = heap.isEmpty

    /* リストを入力してヒープを構築 */
    let heap2 = Heap([1, 3, 2, 5, 4])
    ```

=== "JS"

    ```javascript title="heap.js"
    // JavaScript には組み込みの Heap クラスがない
    ```

=== "TS"

    ```typescript title="heap.ts"
    // TypeScript には組み込みの Heap クラスがない
    ```

=== "Dart"

    ```dart title="heap.dart"
    // Dart には組み込みの Heap クラスがない
    ```

=== "Rust"

    ```rust title="heap.rs"
    use std::collections::BinaryHeap;
    use std::cmp::Reverse;

    /* ヒープを初期化 */
    // 最小ヒープを初期化
    let mut min_heap = BinaryHeap::<Reverse<i32>>::new();
    // 最大ヒープを初期化
    let mut max_heap = BinaryHeap::new();

    /* 要素をヒープに挿入 */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);

    /* ヒープの先頭要素を取得 */
    let peek = max_heap.peek().unwrap();  // 5

    /* ヒープの先頭要素を取り出す */
    // 取り出した要素は降順の列になる
    let peek = max_heap.pop().unwrap();   // 5
    let peek = max_heap.pop().unwrap();   // 4
    let peek = max_heap.pop().unwrap();   // 3
    let peek = max_heap.pop().unwrap();   // 2
    let peek = max_heap.pop().unwrap();   // 1

    /* ヒープの要素数を取得 */
    let size = max_heap.len();

    /* ヒープが空かどうかを判定 */
    let is_empty = max_heap.is_empty();

    /* リストを入力してヒープを構築 */
    let min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    ```

=== "C"

    ```c title="heap.c"
    // C には組み込みの Heap クラスがない
    ```

=== "Kotlin"

    ```kotlin title="heap.kt"
    /* ヒープを初期化 */
    // 最小ヒープを初期化
    var minHeap = PriorityQueue<Int>()
    // 最大ヒープを初期化（ラムダ式で Comparator を変更する）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    /* 要素をヒープに挿入 */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)

    /* ヒープの先頭要素を取得 */
    var peek = maxHeap.peek() // 5

    /* ヒープの先頭要素を取り出す */
    // 取り出した要素は降順の列になる
    peek = maxHeap.poll() // 5
    peek = maxHeap.poll() // 4
    peek = maxHeap.poll() // 3
    peek = maxHeap.poll() // 2
    peek = maxHeap.poll() // 1

    /* ヒープの要素数を取得 */
    val size = maxHeap.size

    /* ヒープが空かどうかを判定 */
    val isEmpty = maxHeap.isEmpty()

    /* リストを入力してヒープを構築 */
    minHeap = PriorityQueue(mutableListOf(1, 3, 2, 5, 4))
    ```

=== "Ruby"

    ```ruby title="heap.rb"
    # Ruby には組み込みの Heap クラスがない
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%20%E3%81%AE%20heapq%20%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E3%81%AF%E3%83%87%E3%83%95%E3%82%A9%E3%83%AB%E3%83%88%E3%81%A7%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%AE%9F%E8%A3%85%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AE%E7%AC%A6%E5%8F%B7%E3%82%92%E5%8F%8D%E8%BB%A2%E3%81%97%E3%81%A6%E3%81%8B%E3%82%89%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%E3%81%A8%E3%80%81%E5%A4%A7%E5%B0%8F%E9%96%A2%E4%BF%82%E3%81%8C%E9%80%86%E8%BB%A2%E3%81%97%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%AE%9F%E7%8F%BE%E3%81%A7%E3%81%8D%E3%82%8B%0A%20%20%20%20%23%20%E3%81%93%E3%81%AE%E4%BE%8B%E3%81%A7%E3%81%AF%20flag%20%3D%201%20%E3%81%8C%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%80%81flag%20%3D%20-1%20%E3%81%8C%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E5%AF%BE%E5%BF%9C%E3%81%99%E3%82%8B%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E6%8C%BF%E5%85%A5%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%201)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%203)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%202)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%205)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%204)%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20peek%20%3D%20flag%20*%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20%23%20%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%E3%81%AF%E9%99%8D%E9%A0%86%E3%81%AE%E5%88%97%E3%81%AB%E3%81%AA%E3%82%8B%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%205%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%204%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%203%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%202%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E6%95%B0%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(max_heap)%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%A6%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E6%A7%8B%E7%AF%89%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify(min_heap)&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%20%E3%81%AE%20heapq%20%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E3%81%AF%E3%83%87%E3%83%95%E3%82%A9%E3%83%AB%E3%83%88%E3%81%A7%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%AE%9F%E8%A3%85%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AE%E7%AC%A6%E5%8F%B7%E3%82%92%E5%8F%8D%E8%BB%A2%E3%81%97%E3%81%A6%E3%81%8B%E3%82%89%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%E3%81%A8%E3%80%81%E5%A4%A7%E5%B0%8F%E9%96%A2%E4%BF%82%E3%81%8C%E9%80%86%E8%BB%A2%E3%81%97%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%AE%9F%E7%8F%BE%E3%81%A7%E3%81%8D%E3%82%8B%0A%20%20%20%20%23%20%E3%81%93%E3%81%AE%E4%BE%8B%E3%81%A7%E3%81%AF%20flag%20%3D%201%20%E3%81%8C%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%80%81flag%20%3D%20-1%20%E3%81%8C%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E5%AF%BE%E5%BF%9C%E3%81%99%E3%82%8B%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E6%8C%BF%E5%85%A5%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%201)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%203)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%202)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%205)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%204)%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20peek%20%3D%20flag%20*%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20%23%20%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%E3%81%AF%E9%99%8D%E9%A0%86%E3%81%AE%E5%88%97%E3%81%AB%E3%81%AA%E3%82%8B%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%205%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%204%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%203%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%202%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E6%95%B0%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(max_heap)%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%A6%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E6%A7%8B%E7%AF%89%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify(min_heap)&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 8.1.2 &nbsp; ヒープの実装

以下では最大ヒープを実装します。最小ヒープにするには、大小の判定をすべて逆にするだけです（例えば、$\geq$ を $\leq$ に置き換えます）。興味があれば実装してみてください。

### 1. &nbsp; ヒープの格納と表現

「二分木」の章で、完全二分木は配列で表すのに適していると学びました。ヒープも完全二分木なので、**配列に格納します**。

配列で二分木を表すとき、要素はノードの値、インデックスは木の中での位置を表します。**ノードのポインタは、インデックスの対応式で実現します**。

図 8-2 のように、インデックス $i$ の左の子は $2i + 1$、右の子は $2i + 2$、親は $(i - 1) / 2$（切り捨ての整数除算）です。インデックスが範囲外なら、空のノード、またはノードが存在しないことを表します。

![ヒープの表現と格納](heap.assets/representation_of_heap.png){ class="animation-figure" }

<p align="center"> 図 8-2 &nbsp; ヒープの表現と格納 </p>

この対応式を関数にまとめておくと、後で使いやすくなります。

=== "Python"

    ```python title="my_heap.py"
    def left(self, i: int) -> int:
        """左の子のインデックスを取得"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """右の子のインデックスを取得"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """親のインデックスを取得"""
        return (i - 1) // 2  # 切り捨て除算
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 左の子のインデックスを取得 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    int parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 左の子のインデックスを取得 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    int parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 左の子のインデックスを取得 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    int Parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 左の子のインデックスを取得 */
    func (h *maxHeap) left(i int) int {
        return 2*i + 1
    }

    /* 右の子のインデックスを取得 */
    func (h *maxHeap) right(i int) int {
        return 2*i + 2
    }

    /* 親のインデックスを取得 */
    func (h *maxHeap) parent(i int) int {
        // 切り捨て除算
        return (i - 1) / 2
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 左の子のインデックスを取得 */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 右の子のインデックスを取得 */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 親のインデックスを取得 */
    func parent(i: Int) -> Int {
        (i - 1) / 2 // 切り捨て除算
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 左の子のインデックスを取得 */
    #left(i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    #right(i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    #parent(i) {
        return Math.floor((i - 1) / 2); // 切り捨て除算
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 左の子のインデックスを取得 */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // 切り捨て除算
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 左の子のインデックスを取得 */
    int _left(int i) {
      return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    int _right(int i) {
      return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    int _parent(int i) {
      return (i - 1) ~/ 2; // 切り捨て除算
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 左の子のインデックスを取得 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 右の子のインデックスを取得 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 親のインデックスを取得 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 切り捨て除算
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 左の子のインデックスを取得 */
    int left(MaxHeap *maxHeap, int i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    int right(MaxHeap *maxHeap, int i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    int parent(MaxHeap *maxHeap, int i) {
        return (i - 1) / 2; // 小数点以下を切り捨てる
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 左の子のインデックスを取得 */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 右の子のインデックスを取得 */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 親のインデックスを取得 */
    fun parent(i: Int): Int {
        return (i - 1) / 2 // 切り捨て除算
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 左の子のインデックスを取得 ###
    def left(i)
      2 * i + 1
    end

    ### 右の子のインデックスを取得 ###
    def right(i)
      2 * i + 2
    end

    ### 親のインデックスを取得 ###
    def parent(i)
      (i - 1) / 2     # 切り捨て除算
    end
    ```

### 2. &nbsp; 先頭要素へのアクセス

先頭要素は二分木の根ノード、つまりリストの最初の要素です。

=== "Python"

    ```python title="my_heap.py"
    def peek(self) -> int:
        """ヒープの先頭要素にアクセスする"""
        return self.max_heap[0]
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* ヒープの先頭要素にアクセスする */
    int peek() {
        return maxHeap[0];
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* ヒープの先頭要素にアクセスする */
    int peek() {
        return maxHeap.get(0);
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* ヒープの先頭要素にアクセスする */
    int Peek() {
        return maxHeap[0];
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* ヒープの先頭要素にアクセスする */
    func (h *maxHeap) peek() any {
        return h.data[0]
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* ヒープの先頭要素にアクセスする */
    func peek() -> Int {
        maxHeap[0]
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* ヒープの先頭要素にアクセスする */
    peek() {
        return this.#maxHeap[0];
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* ヒープの先頭要素にアクセスする */
    peek(): number {
        return this.maxHeap[0];
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* ヒープの先頭要素にアクセスする */
    int peek() {
      return _maxHeap[0];
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* ヒープの先頭要素にアクセスする */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* ヒープの先頭要素にアクセスする */
    int peek(MaxHeap *maxHeap) {
        return maxHeap->data[0];
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* ヒープの先頭要素にアクセスする */
    fun peek(): Int {
        return maxHeap[0]
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### ヒープの先頭要素にアクセスする ###
    def peek
      @max_heap[0]
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.max_heap%5B0%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E9%85%8D%E5%88%97%E3%81%AF%E3%81%99%E3%81%A7%E3%81%AB%E6%9C%89%E5%8A%B9%E3%81%AA%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E3%81%93%E3%81%A8%E3%81%AB%E6%B3%A8%E6%84%8F%20%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%0A%20%20%20%20peek%20%3D%20max_heap.peek%28%29%0A%20%20%20%20print%28f%22%5Cn%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AF%20%7Bpeek%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.max_heap%5B0%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E9%85%8D%E5%88%97%E3%81%AF%E3%81%99%E3%81%A7%E3%81%AB%E6%9C%89%E5%8A%B9%E3%81%AA%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E3%81%93%E3%81%A8%E3%81%AB%E6%B3%A8%E6%84%8F%20%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%0A%20%20%20%20peek%20%3D%20max_heap.peek%28%29%0A%20%20%20%20print%28f%22%5Cn%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AF%20%7Bpeek%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 3. &nbsp; 要素の挿入

要素 `val` をまずヒープの末尾に追加します。`val` がほかの要素より大きい場合、ヒープの条件が崩れている可能性があるため、**挿入したノードから根までの経路上の各ノードを修復する必要があります**。この操作を<u>ヒープ化（heapify）</u>と呼びます。

挿入したノードから、**下から上へヒープ化します**。図 8-3 のように、挿入したノードと親の値を比較し、挿入したノードのほうが大きければ交換します。同じ操作を繰り返して下から上へ修復し、根を越えるか、交換が不要なノードに達したら終了します。

=== "<1>"
    ![ヒープへの挿入の手順](heap.assets/heap_push_step1.png){ class="animation-figure" }

=== "<2>"
    ![ヒープへの挿入の手順 2](heap.assets/heap_push_step2.png){ class="animation-figure" }

=== "<3>"
    ![ヒープへの挿入の手順 3](heap.assets/heap_push_step3.png){ class="animation-figure" }

=== "<4>"
    ![ヒープへの挿入の手順 4](heap.assets/heap_push_step4.png){ class="animation-figure" }

=== "<5>"
    ![ヒープへの挿入の手順 5](heap.assets/heap_push_step5.png){ class="animation-figure" }

=== "<6>"
    ![ヒープへの挿入の手順 6](heap.assets/heap_push_step6.png){ class="animation-figure" }

=== "<7>"
    ![ヒープへの挿入の手順 7](heap.assets/heap_push_step7.png){ class="animation-figure" }

=== "<8>"
    ![ヒープへの挿入の手順 8](heap.assets/heap_push_step8.png){ class="animation-figure" }

=== "<9>"
    ![ヒープへの挿入の手順 9](heap.assets/heap_push_step9.png){ class="animation-figure" }

<p align="center"> 図 8-3 &nbsp; ヒープへの挿入の手順 </p>

ノード総数を $n$ とすると、木の高さは $O(\log n)$ です。したがって、ヒープ化の反復は最大 $O(\log n)$ 回で、**挿入の時間計算量は $O(\log n)$** です。コードは次のとおりです。

=== "Python"

    ```python title="my_heap.py"
    def push(self, val: int):
        """ヒープに要素を挿入する"""
        # ノードを追加する
        self.max_heap.append(val)
        # 下から上へヒープ化する
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """ノード i から上向きにヒープ化する"""
        while True:
            # ノード i の親ノードを取得する
            p = self.parent(i)
            # 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 2 つのノードを交換する
            self.swap(i, p)
            # 上向きのヒープ化を繰り返す
            i = p
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* ヒープに要素を挿入する */
    void push(int val) {
        // ノードを追加する
        maxHeap.push_back(val);
        // 下から上へヒープ化する
        siftUp(size() - 1);
    }

    /* ノード i から上向きにヒープ化する */
    void siftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得する
            int p = parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2 つのノードを交換する
            swap(maxHeap[i], maxHeap[p]);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* ヒープに要素を挿入する */
    void push(int val) {
        // ノードを追加する
        maxHeap.add(val);
        // 下から上へヒープ化する
        siftUp(size() - 1);
    }

    /* ノード i から上向きにヒープ化する */
    void siftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得する
            int p = parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 2 つのノードを交換する
            swap(i, p);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* ヒープに要素を挿入する */
    void Push(int val) {
        // ノードを追加する
        maxHeap.Add(val);
        // 下から上へヒープ化する
        SiftUp(Size() - 1);
    }

    /* ノード i から上向きにヒープ化する */
    void SiftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得する
            int p = Parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2 つのノードを交換する
            Swap(i, p);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* ヒープに要素を挿入する */
    func (h *maxHeap) push(val any) {
        // ノードを追加する
        h.data = append(h.data, val)
        // 下から上へヒープ化する
        h.siftUp(len(h.data) - 1)
    }

    /* ノード i から上向きにヒープ化する */
    func (h *maxHeap) siftUp(i int) {
        for true {
            // ノード i の親ノードを取得する
            p := h.parent(i)
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if p < 0 || h.data[i].(int) <= h.data[p].(int) {
                break
            }
            // 2 つのノードを交換する
            h.swap(i, p)
            // 上向きのヒープ化を繰り返す
            i = p
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* ヒープに要素を挿入する */
    func push(val: Int) {
        // ノードを追加する
        maxHeap.append(val)
        // 下から上へヒープ化する
        siftUp(i: size() - 1)
    }

    /* ノード i から上向きにヒープ化する */
    func siftUp(i: Int) {
        var i = i
        while true {
            // ノード i の親ノードを取得する
            let p = parent(i: i)
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 2 つのノードを交換する
            swap(i: i, j: p)
            // 上向きのヒープ化を繰り返す
            i = p
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* ヒープに要素を挿入する */
    push(val) {
        // ノードを追加する
        this.#maxHeap.push(val);
        // 下から上へヒープ化する
        this.#siftUp(this.size() - 1);
    }

    /* ノード i から上向きにヒープ化する */
    #siftUp(i) {
        while (true) {
            // ノード i の親ノードを取得する
            const p = this.#parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // 2 つのノードを交換する
            this.#swap(i, p);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* ヒープに要素を挿入する */
    push(val: number): void {
        // ノードを追加する
        this.maxHeap.push(val);
        // 下から上へヒープ化する
        this.siftUp(this.size() - 1);
    }

    /* ノード i から上向きにヒープ化する */
    siftUp(i: number): void {
        while (true) {
            // ノード i の親ノードを取得する
            const p = this.parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 2 つのノードを交換する
            this.swap(i, p);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* ヒープに要素を挿入する */
    void push(int val) {
      // ノードを追加する
      _maxHeap.add(val);
      // 下から上へヒープ化する
      siftUp(size() - 1);
    }

    /* ノード i から上向きにヒープ化する */
    void siftUp(int i) {
      while (true) {
        // ノード i の親ノードを取得する
        int p = _parent(i);
        // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
        if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
          break;
        }
        // 2 つのノードを交換する
        _swap(i, p);
        // 上向きのヒープ化を繰り返す
        i = p;
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* ヒープに要素を挿入する */
    fn push(&mut self, val: i32) {
        // ノードを追加する
        self.max_heap.push(val);
        // 下から上へヒープ化する
        self.sift_up(self.size() - 1);
    }

    /* ノード i から上向きにヒープ化する */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // ノード i はすでにヒープの先頭なので、ヒープ化を終了する
            if i == 0 {
                break;
            }
            // ノード i の親ノードを取得する
            let p = Self::parent(i);
            // 「ノードの修復が不要」の場合、ヒープ化を終了する
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 2 つのノードを交換する
            self.swap(i, p);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* ヒープに要素を挿入する */
    void push(MaxHeap *maxHeap, int val) {
        // 既定の設定では、これほど多くのノードを追加してはならない
        if (maxHeap->size == MAX_SIZE) {
            printf("ヒープが満杯です！");
            return;
        }
        // ノードを追加する
        maxHeap->data[maxHeap->size] = val;
        maxHeap->size++;

        // 下から上へヒープ化する
        siftUp(maxHeap, maxHeap->size - 1);
    }

    /* ノード i から上向きにヒープ化する */
    void siftUp(MaxHeap *maxHeap, int i) {
        while (true) {
            // ノード i の親ノードを取得する
            int p = parent(maxHeap, i);
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
                break;
            }
            // 2 つのノードを交換する
            swap(maxHeap, i, p);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* ヒープに要素を挿入する */
    fun push(_val: Int) {
        // ノードを追加する
        maxHeap.add(_val)
        // 下から上へヒープ化する
        siftUp(size() - 1)
    }

    /* ノード i から上向きにヒープ化する */
    fun siftUp(it: Int) {
        // Kotlin の関数の引数は変更できないため、一時変数を作成する
        var i = it
        while (true) {
            // ノード i の親ノードを取得する
            val p = parent(i)
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 2 つのノードを交換する
            swap(i, p)
            // 上向きのヒープ化を繰り返す
            i = p
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### ヒープに要素を挿入する ###
    def push(val)
      # ノードを追加する
      @max_heap << val
      # 下から上へヒープ化する
      sift_up(size - 1)
    end

    ### ノード i から上向きにヒープ化する ###
    def sift_up(i)
      loop do
        # ノード i の親ノードを取得する
        p = parent(i)
        # 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
        break if p < 0 || @max_heap[i] <= @max_heap[p]
        # 2 つのノードを交換する
        swap(i, p)
        # 上向きのヒープ化を繰り返す
        i = p
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.max_heap.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E4%B8%8B%E3%81%8B%E3%82%89%E4%B8%8A%E3%81%B8%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.sift_up%28self.size%28%29%20-%201%29%0A%0A%20%20%20%20def%20sift_up%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8B%E3%82%89%E4%B8%8A%E5%90%91%E3%81%8D%E3%81%AB%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%AE%E8%A6%AA%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20p%20%3D%20self.parent%28i%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%80%8C%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%80%8D%E3%81%BE%E3%81%9F%E3%81%AF%E3%80%8C%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E4%BF%AE%E5%BE%A9%E3%81%8C%E4%B8%8D%E8%A6%81%E3%80%8D%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20p%20%3C%200%20or%20self.max_heap%5Bi%5D%20%3C%3D%20self.max_heap%5Bp%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20p%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8A%E5%90%91%E3%81%8D%E3%81%AE%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20p%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E9%85%8D%E5%88%97%E3%81%AF%E3%81%99%E3%81%A7%E3%81%AB%E6%9C%89%E5%8A%B9%E3%81%AA%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E3%81%93%E3%81%A8%E3%81%AB%E6%B3%A8%E6%84%8F%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20val%20%3D%207%0A%20%20%20%20max_heap.push%28val%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.max_heap.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E4%B8%8B%E3%81%8B%E3%82%89%E4%B8%8A%E3%81%B8%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.sift_up%28self.size%28%29%20-%201%29%0A%0A%20%20%20%20def%20sift_up%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8B%E3%82%89%E4%B8%8A%E5%90%91%E3%81%8D%E3%81%AB%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%AE%E8%A6%AA%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20p%20%3D%20self.parent%28i%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%80%8C%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%80%8D%E3%81%BE%E3%81%9F%E3%81%AF%E3%80%8C%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E4%BF%AE%E5%BE%A9%E3%81%8C%E4%B8%8D%E8%A6%81%E3%80%8D%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20p%20%3C%200%20or%20self.max_heap%5Bi%5D%20%3C%3D%20self.max_heap%5Bp%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20p%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8A%E5%90%91%E3%81%8D%E3%81%AE%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20p%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E9%85%8D%E5%88%97%E3%81%AF%E3%81%99%E3%81%A7%E3%81%AB%E6%9C%89%E5%8A%B9%E3%81%AA%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E3%81%93%E3%81%A8%E3%81%AB%E6%B3%A8%E6%84%8F%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%206,%206,%207,%205,%202,%201,%204,%203,%206,%202%5D%29%0A%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20val%20%3D%207%0A%20%20%20%20max_heap.push%28val%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 4. &nbsp; 先頭要素の取り出し

先頭要素は二分木の根ノード、つまりリストの最初の要素です。これをリストから直接削除すると、すべてのノードのインデックスが変わり、その後のヒープ化による修復が難しくなります。インデックスの変化をできるだけ少なくするため、次の手順を使います。

1. ヒープの先頭と末尾、つまり根ノードと一番右の葉を交換します。
2. 交換後、末尾をリストから削除します（交換済みなので、実際に削除するのは元の先頭要素です）。
3. 根ノードから、**上から下へヒープ化します**。

図 8-4 のように、**上から下へのヒープ化は、下から上へのヒープ化とは逆方向の操作です**。根の値と二つの子の値を比較し、最大の子と根を交換します。これを繰り返し、葉を越えるか交換が不要なノードに達したら終了します。

=== "<1>"
    ![ヒープの先頭要素を取り出す手順](heap.assets/heap_pop_step1.png){ class="animation-figure" }

=== "<2>"
    ![ヒープからの取り出しの手順 2](heap.assets/heap_pop_step2.png){ class="animation-figure" }

=== "<3>"
    ![ヒープからの取り出しの手順 3](heap.assets/heap_pop_step3.png){ class="animation-figure" }

=== "<4>"
    ![ヒープからの取り出しの手順 4](heap.assets/heap_pop_step4.png){ class="animation-figure" }

=== "<5>"
    ![ヒープからの取り出しの手順 5](heap.assets/heap_pop_step5.png){ class="animation-figure" }

=== "<6>"
    ![ヒープからの取り出しの手順 6](heap.assets/heap_pop_step6.png){ class="animation-figure" }

=== "<7>"
    ![ヒープからの取り出しの手順 7](heap.assets/heap_pop_step7.png){ class="animation-figure" }

=== "<8>"
    ![ヒープからの取り出しの手順 8](heap.assets/heap_pop_step8.png){ class="animation-figure" }

=== "<9>"
    ![ヒープからの取り出しの手順 9](heap.assets/heap_pop_step9.png){ class="animation-figure" }

=== "<10>"
    ![ヒープからの取り出しの手順 10](heap.assets/heap_pop_step10.png){ class="animation-figure" }

<p align="center"> 図 8-4 &nbsp; ヒープの先頭要素を取り出す手順 </p>

挿入と同様に、先頭要素の取り出しの時間計算量も $O(\log n)$ です。コードは次のとおりです。

=== "Python"

    ```python title="my_heap.py"
    def pop(self) -> int:
        """ヒープから要素を取り出す"""
        # 空かどうかを確認する
        if self.is_empty():
            raise IndexError("ヒープが空です")
        # 根と最右の葉を交換（先頭要素と末尾要素を交換）
        self.swap(0, self.size() - 1)
        # ノードを削除する
        val = self.max_heap.pop()
        # 上から下へヒープ化する
        self.sift_down(0)
        # ヒープの先頭要素を返す
        return val

    def sift_down(self, i: int):
        """ノード i から下向きにヒープ化する"""
        while True:
            # ノード i, l, r のうち値が最大のノードを求め、ma とする
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if ma == i:
                break
            # 2 つのノードを交換する
            self.swap(i, ma)
            # 下向きのヒープ化を繰り返す
            i = ma
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* ヒープから要素を取り出す */
    void pop() {
        // 空かどうかを確認する
        if (isEmpty()) {
            throw out_of_range("ヒープが空です");
        }
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        swap(maxHeap[0], maxHeap[size() - 1]);
        // ノードを削除する
        maxHeap.pop_back();
        // 上から下へヒープ化する
        siftDown(0);
    }

    /* ノード i から下向きにヒープ化する */
    void siftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* ヒープから要素を取り出す */
    int pop() {
        // 空かどうかを確認する
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        swap(0, size() - 1);
        // ノードを削除する
        int val = maxHeap.remove(size() - 1);
        // 上から下へヒープ化する
        siftDown(0);
        // ヒープの先頭要素を返す
        return val;
    }

    /* ノード i から下向きにヒープ化する */
    void siftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if (ma == i)
                break;
            // 2 つのノードを交換する
            swap(i, ma);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* ヒープから要素を取り出す */
    int Pop() {
        // 空かどうかを確認する
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        Swap(0, Size() - 1);
        // ノードを削除する
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 上から下へヒープ化する
        SiftDown(0);
        // ヒープの先頭要素を返す
        return val;
    }

    /* ノード i から下向きにヒープ化する */
    void SiftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 「ノード i の値が最大」または「葉ノードを越えた」場合、ヒープ化を終了する
            if (ma == i) break;
            // 2 つのノードを交換する
            Swap(i, ma);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* ヒープから要素を取り出す */
    func (h *maxHeap) pop() any {
        // 空かどうかを確認する
        if h.isEmpty() {
            fmt.Println("エラー")
            return nil
        }
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        h.swap(0, h.size()-1)
        // ノードを削除する
        val := h.data[len(h.data)-1]
        h.data = h.data[:len(h.data)-1]
        // 上から下へヒープ化する
        h.siftDown(0)

        // ヒープの先頭要素を返す
        return val
    }

    /* ノード i から下向きにヒープ化する */
    func (h *maxHeap) siftDown(i int) {
        for true {
            // ノード i, l, r のうち値が最大のノードを求め、max とする
            l, r, max := h.left(i), h.right(i), i
            if l < h.size() && h.data[l].(int) > h.data[max].(int) {
                max = l
            }
            if r < h.size() && h.data[r].(int) > h.data[max].(int) {
                max = r
            }
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if max == i {
                break
            }
            // 2 つのノードを交換する
            h.swap(i, max)
            // 下向きのヒープ化を繰り返す
            i = max
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* ヒープから要素を取り出す */
    func pop() -> Int {
        // 空かどうかを確認する
        if isEmpty() {
            fatalError("ヒープが空です")
        }
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        swap(i: 0, j: size() - 1)
        // ノードを削除する
        let val = maxHeap.remove(at: size() - 1)
        // 上から下へヒープ化する
        siftDown(i: 0)
        // ヒープの先頭要素を返す
        return val
    }

    /* ノード i から下向きにヒープ化する */
    func siftDown(i: Int) {
        var i = i
        while true {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if ma == i {
                break
            }
            // 2 つのノードを交換する
            swap(i: i, j: ma)
            // 下向きのヒープ化を繰り返す
            i = ma
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* ヒープから要素を取り出す */
    pop() {
        // 空かどうかを確認する
        if (this.isEmpty()) throw new Error('ヒープが空です');
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        this.#swap(0, this.size() - 1);
        // ノードを削除する
        const val = this.#maxHeap.pop();
        // 上から下へヒープ化する
        this.#siftDown(0);
        // ヒープの先頭要素を返す
        return val;
    }

    /* ノード i から下向きにヒープ化する */
    #siftDown(i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if (ma === i) break;
            // 2 つのノードを交換する
            this.#swap(i, ma);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* ヒープから要素を取り出す */
    pop(): number {
        // 空かどうかを確認する
        if (this.isEmpty()) throw new RangeError('ヒープが空です。');
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        this.swap(0, this.size() - 1);
        // ノードを削除する
        const val = this.maxHeap.pop();
        // 上から下へヒープ化する
        this.siftDown(0);
        // ヒープの先頭要素を返す
        return val;
    }

    /* ノード i から下向きにヒープ化する */
    siftDown(i: number): void {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if (ma === i) break;
            // 2 つのノードを交換する
            this.swap(i, ma);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* ヒープから要素を取り出す */
    int pop() {
      // 空かどうかを確認する
      if (isEmpty()) throw Exception('ヒープが空です');
      // 根と最右の葉を交換（先頭要素と末尾要素を交換）
      _swap(0, size() - 1);
      // ノードを削除する
      int val = _maxHeap.removeLast();
      // 上から下へヒープ化する
      siftDown(0);
      // ヒープの先頭要素を返す
      return val;
    }

    /* ノード i から下向きにヒープ化する */
    void siftDown(int i) {
      while (true) {
        // ノード i, l, r のうち値が最大のノードを求め、ma とする
        int l = _left(i);
        int r = _right(i);
        int ma = i;
        if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
        if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
        // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
        if (ma == i) break;
        // 2 つのノードを交換する
        _swap(i, ma);
        // 下向きのヒープ化を繰り返す
        i = ma;
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* ヒープから要素を取り出す */
    fn pop(&mut self) -> i32 {
        // 空かどうかを確認する
        if self.is_empty() {
            panic!("インデックスが範囲外です");
        }
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        self.swap(0, self.size() - 1);
        // ノードを削除する
        let val = self.max_heap.pop().unwrap();
        // 上から下へヒープ化する
        self.sift_down(0);
        // ヒープの先頭要素を返す
        val
    }

    /* ノード i から下向きにヒープ化する */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if ma == i {
                break;
            }
            // 2 つのノードを交換する
            self.swap(i, ma);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* ヒープから要素を取り出す */
    int pop(MaxHeap *maxHeap) {
        // 空かどうかを確認する
        if (isEmpty(maxHeap)) {
            printf("ヒープが空です！");
            return INT_MAX;
        }
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        swap(maxHeap, 0, size(maxHeap) - 1);
        // ノードを削除する
        int val = maxHeap->data[maxHeap->size - 1];
        maxHeap->size--;
        // 上から下へヒープ化する
        siftDown(maxHeap, 0);

        // ヒープの先頭要素を返す
        return val;
    }

    /* ノード i から下向きにヒープ化する */
    void siftDown(MaxHeap *maxHeap, int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、max とする
            int l = left(maxHeap, i);
            int r = right(maxHeap, i);
            int max = i;
            if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
                max = l;
            }
            if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
                max = r;
            }
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if (max == i) {
                break;
            }
            // 2 つのノードを交換する
            swap(maxHeap, i, max);
            // 下向きのヒープ化を繰り返す
            i = max;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* ヒープから要素を取り出す */
    fun pop(): Int {
        // 空かどうかを確認する
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        swap(0, size() - 1)
        // ノードを削除する
        val _val = maxHeap.removeAt(size() - 1)
        // 上から下へヒープ化する
        siftDown(0)
        // ヒープの先頭要素を返す
        return _val
    }

    /* ノード i から下向きにヒープ化する */
    fun siftDown(it: Int) {
        // Kotlin の関数の引数は変更できないため、一時変数を作成する
        var i = it
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if (ma == i) break
            // 2 つのノードを交換する
            swap(i, ma)
            // 下向きのヒープ化を繰り返す
            i = ma
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### ヒープから要素を取り出す ###
    def pop
      # 空かどうかを確認する
      raise IndexError, "ヒープが空です" if is_empty?
      # 根と最右の葉を交換（先頭要素と末尾要素を交換）
      swap(0, size - 1)
      # ノードを削除する
      val = @max_heap.pop
      # 上から下へヒープ化する
      sift_down(0)
      # ヒープの先頭要素を返す
      val
    end

    ### ノード i から下向きにヒープ化する ###
    def sift_down(i)
      loop do
        # ノード i, l, r のうち値が最大のノードを求め、ma とする
        l, r, ma = left(i), right(i), i
        ma = l if l < size && @max_heap[l] > @max_heap[ma]
        ma = r if r < size && @max_heap[r] > @max_heap[ma]

        # ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
        break if ma == i

        # 2 つのノードを交換する
        swap(i, ma)
        # 下向きのヒープ化を繰り返す
        i = ma
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20self.max_heap%20%3D%20nums%0A%0A%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%E8%A6%AA%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%22%22%22%0A%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20return%20len%28self.max_heap%29%0A%0A%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8B%E3%82%89%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%22%22%22%0A%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E7%A2%BA%E8%AA%8D%E3%81%99%E3%82%8B%0A%20%20if%20self.is_empty%28%29%3A%0A%20%20%20raise%20IndexError%28%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%23%20%E6%A0%B9%E3%81%A8%E6%9C%80%E5%8F%B3%E3%81%AE%E8%91%89%E3%82%92%E4%BA%A4%E6%8F%9B%EF%BC%88%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%A8%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%EF%BC%89%0A%20%20self.swap%280,%20self.size%28%29%20-%201%29%0A%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20%20val%20%3D%20self.max_heap.pop%28%29%0A%20%20%23%20%E4%B8%8A%E3%81%8B%E3%82%89%E4%B8%8B%E3%81%B8%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20self.sift_down%280%29%0A%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%94%E3%81%99%0A%20%20return%20val%0A%0A%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8B%E3%82%89%E4%B8%8B%E5%90%91%E3%81%8D%E3%81%AB%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%22%22%22%0A%20%20while%20True%3A%0A%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i,%20l,%20r%20%E3%81%AE%E3%81%86%E3%81%A1%E5%80%A4%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%B1%82%E3%82%81%E3%80%81ma%20%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20ma%20%3D%20l%0A%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20ma%20%3D%20r%0A%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%8B%E6%B7%BB%E5%AD%97%20l,%20r%20%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%80%81%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%AF%E4%B8%8D%E8%A6%81%E3%81%AA%E3%81%AE%E3%81%A7%E7%B5%82%E4%BA%86%0A%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20break%0A%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%23%20%E4%B8%8B%E5%90%91%E3%81%8D%E3%81%AE%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%23%20%E5%85%A5%E5%8A%9B%E9%85%8D%E5%88%97%E3%81%AF%E3%81%99%E3%81%A7%E3%81%AB%E6%9C%89%E5%8A%B9%E3%81%AA%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E3%81%93%E3%81%A8%E3%81%AB%E6%B3%A8%E6%84%8F%0A%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%207,%206,%207,%206,%202,%201,%204,%203,%206,%202,%205%5D%29%0A%0A%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20peek%20%3D%20max_heap.pop%28%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20self.max_heap%20%3D%20nums%0A%0A%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%E8%A6%AA%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%22%22%22%0A%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20return%20len%28self.max_heap%29%0A%0A%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8B%E3%82%89%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%22%22%22%0A%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E7%A2%BA%E8%AA%8D%E3%81%99%E3%82%8B%0A%20%20if%20self.is_empty%28%29%3A%0A%20%20%20raise%20IndexError%28%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%22%29%0A%20%20%23%20%E6%A0%B9%E3%81%A8%E6%9C%80%E5%8F%B3%E3%81%AE%E8%91%89%E3%82%92%E4%BA%A4%E6%8F%9B%EF%BC%88%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%A8%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%EF%BC%89%0A%20%20self.swap%280,%20self.size%28%29%20-%201%29%0A%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20%20val%20%3D%20self.max_heap.pop%28%29%0A%20%20%23%20%E4%B8%8A%E3%81%8B%E3%82%89%E4%B8%8B%E3%81%B8%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20self.sift_down%280%29%0A%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%94%E3%81%99%0A%20%20return%20val%0A%0A%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8B%E3%82%89%E4%B8%8B%E5%90%91%E3%81%8D%E3%81%AB%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%22%22%22%0A%20%20while%20True%3A%0A%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i,%20l,%20r%20%E3%81%AE%E3%81%86%E3%81%A1%E5%80%A4%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%B1%82%E3%82%81%E3%80%81ma%20%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20ma%20%3D%20l%0A%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20ma%20%3D%20r%0A%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%8B%E6%B7%BB%E5%AD%97%20l,%20r%20%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%80%81%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%AF%E4%B8%8D%E8%A6%81%E3%81%AA%E3%81%AE%E3%81%A7%E7%B5%82%E4%BA%86%0A%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20break%0A%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%23%20%E4%B8%8B%E5%90%91%E3%81%8D%E3%81%AE%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%23%20%E5%85%A5%E5%8A%9B%E9%85%8D%E5%88%97%E3%81%AF%E3%81%99%E3%81%A7%E3%81%AB%E6%9C%89%E5%8A%B9%E3%81%AA%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E3%81%93%E3%81%A8%E3%81%AB%E6%B3%A8%E6%84%8F%0A%20max_heap%20%3D%20MaxHeap%28%5B9,%208,%207,%206,%207,%206,%202,%201,%204,%203,%206,%202,%205%5D%29%0A%0A%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20peek%20%3D%20max_heap.pop%28%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 8.1.3 &nbsp; ヒープの主な用途

- **優先度付きキュー**：ヒープは、優先度付きキューの実装で通常最初に選ばれるデータ構造です。エンキューとデキューはともに $O(\log n)$、構築は $O(n)$ と、いずれも非常に効率的です。
- **ヒープソート**：データからヒープを作り、要素を取り出し続けると整列済みのデータを得られます。ただし、通常はさらにすっきりした方法で実装します。詳しくは「ヒープソート」の節を参照してください。
- **大きいほうから $k$ 個の要素の取得**：古典的なアルゴリズムの問題であり、代表的な用途でもあります。例えば、話題のニュース上位 10 件を微博のトレンドに選んだり、販売数上位 10 商品を選んだりします。
