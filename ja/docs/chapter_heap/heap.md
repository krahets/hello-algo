---
comments: true
---

# 8.1 &nbsp; ヒープ

<u>ヒープ（heap）</u>は、特定の条件を満たす完全二分木であり、主に次の 2 種類に分けられます。

- <u>最小ヒープ（min heap）</u>：任意のノードの値 $\leq$ その子ノードの値。
- <u>最大ヒープ（max heap）</u>：任意のノードの値 $\geq$ その子ノードの値。

![最小ヒープと最大ヒープ](heap.assets/min_heap_and_max_heap.png){ class="animation-figure" }

<p align="center"> 図 8-1 &nbsp; 最小ヒープと最大ヒープ </p>

ヒープは完全二分木の特殊な例であり、次の性質を持ちます。

- 最下層のノードは左から順に埋められ、ほかの層のノードはすべて埋まっています。
- 二分木の根ノードを「ヒープ頂点」、最下層で最も右にあるノードを「ヒープ底」と呼びます。
- 最大ヒープ（最小ヒープ）では、ヒープ頂点の要素（根ノード）の値が最大（最小）です。

## 8.1.1 &nbsp; ヒープの基本操作

ここで注意したいのは、多くのプログラミング言語が提供しているのは<u>優先度付きキュー（priority queue）</u>であり、これは優先度順に並ぶキューとして定義される抽象データ構造だということです。

実際には、**ヒープは通常、優先度付きキューの実装に用いられ、最大ヒープは要素が大きい順に取り出される優先度付きキューに相当します**。利用の観点では、「優先度付きキュー」と「ヒープ」は等価なデータ構造とみなせます。そのため、本書では両者を特に区別せず、まとめて「ヒープ」と呼びます。

ヒープの基本操作を以下の表に示します。メソッド名はプログラミング言語によって異なります。

<p align="center"> 表 8-1 &nbsp; ヒープの操作効率 </p>

<div class="center-table" markdown>

| メソッド名  | 説明                                             | 時間計算量  |
| ----------- | ------------------------------------------------ | ----------- |
| `push()`    | 要素をヒープに追加                               | $O(\log n)$ |
| `pop()`     | ヒープ頂点の要素を取り出す                       | $O(\log n)$ |
| `peek()`    | ヒープ頂点の要素にアクセス（最大 / 最小ヒープではそれぞれ最大 / 最小値） | $O(1)$      |
| `size()`    | ヒープ内の要素数を取得                           | $O(1)$      |
| `isEmpty()` | ヒープが空かどうかを判定                         | $O(1)$      |

</div>

実際の応用では、プログラミング言語が提供するヒープクラス（または優先度付きキュークラス）をそのまま使えます。

ソートアルゴリズムにおける「昇順」と「降順」と同様に、`flag` を設定したり `Comparator` を変更したりすることで、「最小ヒープ」と「最大ヒープ」を切り替えられます。コードは以下のとおりです：

=== "Python"

    ```python title="heap.py"
    # 最小ヒープを初期化
    min_heap, flag = [], 1
    # 最大ヒープを初期化
    max_heap, flag = [], -1

    # Python の heapq モジュールはデフォルトで最小ヒープを実装している
    # 「要素を負にして」からヒープに追加すると、大小関係を反転させて最大ヒープを実現できる
    # この例では、flag = 1 のときは最小ヒープ、flag = -1 のときは最大ヒープに対応する

    # 要素をヒープに追加
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)

    # ヒープ頂点の要素を取得
    peek: int = flag * max_heap[0] # 5

    # ヒープ頂点の要素を取り出す
    # 取り出された要素は大きい順の列になる
    val = flag * heapq.heappop(max_heap) # 5
    val = flag * heapq.heappop(max_heap) # 4
    val = flag * heapq.heappop(max_heap) # 3
    val = flag * heapq.heappop(max_heap) # 2
    val = flag * heapq.heappop(max_heap) # 1

    # ヒープのサイズを取得
    size: int = len(max_heap)

    # ヒープが空かどうかを判定
    is_empty: bool = not max_heap

    # 入力リストからヒープを構築
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

    /* 要素をヒープに追加 */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);

    /* ヒープ頂点の要素を取得 */
    int peek = maxHeap.top(); // 5

    /* ヒープ頂点の要素を取り出す */
    // 取り出された要素は大きい順の列になる
    maxHeap.pop(); // 5
    maxHeap.pop(); // 4
    maxHeap.pop(); // 3
    maxHeap.pop(); // 2
    maxHeap.pop(); // 1

    /* ヒープのサイズを取得 */
    int size = maxHeap.size();

    /* ヒープが空かどうかを判定 */
    bool isEmpty = maxHeap.empty();

    /* 入力リストからヒープを構築 */
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    ```

=== "Java"

    ```java title="heap.java"
    /* ヒープを初期化 */
    // 最小ヒープを初期化
    Queue<Integer> minHeap = new PriorityQueue<>();
    // 最大ヒープを初期化（lambda 式で Comparator を変更すればよい）
    Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

    /* 要素をヒープに追加 */
    maxHeap.offer(1);
    maxHeap.offer(3);
    maxHeap.offer(2);
    maxHeap.offer(5);
    maxHeap.offer(4);

    /* ヒープ頂点の要素を取得 */
    int peek = maxHeap.peek(); // 5

    /* ヒープ頂点の要素を取り出す */
    // 取り出された要素は大きい順の列になる
    peek = maxHeap.poll(); // 5
    peek = maxHeap.poll(); // 4
    peek = maxHeap.poll(); // 3
    peek = maxHeap.poll(); // 2
    peek = maxHeap.poll(); // 1

    /* ヒープのサイズを取得 */
    int size = maxHeap.size();

    /* ヒープが空かどうかを判定 */
    boolean isEmpty = maxHeap.isEmpty();

    /* 入力リストからヒープを構築 */
    minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
    ```

=== "C#"

    ```csharp title="heap.cs"
    /* ヒープを初期化 */
    // 最小ヒープを初期化
    PriorityQueue<int, int> minHeap = new();
    // 最大ヒープを初期化（lambda 式で Comparer を変更すればよい）
    PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

    /* 要素をヒープに追加 */
    maxHeap.Enqueue(1, 1);
    maxHeap.Enqueue(3, 3);
    maxHeap.Enqueue(2, 2);
    maxHeap.Enqueue(5, 5);
    maxHeap.Enqueue(4, 4);

    /* ヒープ頂点の要素を取得 */
    int peek = maxHeap.Peek();//5

    /* ヒープ頂点の要素を取り出す */
    // 取り出された要素は大きい順の列になる
    peek = maxHeap.Dequeue();  // 5
    peek = maxHeap.Dequeue();  // 4
    peek = maxHeap.Dequeue();  // 3
    peek = maxHeap.Dequeue();  // 2
    peek = maxHeap.Dequeue();  // 1

    /* ヒープのサイズを取得 */
    int size = maxHeap.Count;

    /* ヒープが空かどうかを判定 */
    bool isEmpty = maxHeap.Count == 0;

    /* 入力リストからヒープを構築 */
    minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
    ```

=== "Go"

    ```go title="heap.go"
    // Go では、heap.Interface を実装することで整数の最大ヒープを構築できる
    // heap.Interface を実装するには、同時に sort.Interface も実装する必要がある
    type intHeap []any

    // Push は heap.Interface のメソッドで、要素をヒープに追加する
    func (h *intHeap) Push(x any) {
        // Push と Pop は pointer receiver を引数に取る
        // スライスの内容を調整するだけでなく、スライスの長さも変更するため。
        *h = append(*h, x.(int))
    }

    // Pop は heap.Interface のメソッドで、ヒープ頂点の要素を取り出す
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
        // 最小ヒープを実装する場合は、不等号を小なりに変更する
        return (*h)[i].(int) > (*h)[j].(int)
    }

    // Swap は sort.Interface のメソッド
    func (h *intHeap) Swap(i, j int) {
        (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
    }

    // Top はヒープ頂点の要素を取得
    func (h *intHeap) Top() any {
        return (*h)[0]
    }

    /* Driver Code */
    func TestHeap(t *testing.T) {
        /* ヒープを初期化 */
        // 最大ヒープを初期化
        maxHeap := &intHeap{}
        heap.Init(maxHeap)
        /* 要素をヒープに追加 */
        // heap.Interface のメソッドを呼び出して要素を追加する
        heap.Push(maxHeap, 1)
        heap.Push(maxHeap, 3)
        heap.Push(maxHeap, 2)
        heap.Push(maxHeap, 4)
        heap.Push(maxHeap, 5)

        /* ヒープ頂点の要素を取得 */
        top := maxHeap.Top()
        fmt.Printf("ヒープ頂点の要素は %d\n", top)

        /* ヒープ頂点の要素を取り出す */
        // heap.Interface のメソッドを呼び出して要素を削除する
        heap.Pop(maxHeap) // 5
        heap.Pop(maxHeap) // 4
        heap.Pop(maxHeap) // 3
        heap.Pop(maxHeap) // 2
        heap.Pop(maxHeap) // 1

        /* ヒープのサイズを取得 */
        size := len(*maxHeap)
        fmt.Printf("ヒープ内の要素数は %d\n", size)

        /* ヒープが空かどうかを判定 */
        isEmpty := len(*maxHeap) == 0
        fmt.Printf("ヒープは空か %t\n", isEmpty)
    }
    ```

=== "Swift"

    ```swift title="heap.swift"
    /* ヒープを初期化 */
    // Swift の Heap 型は最大ヒープと最小ヒープの両方をサポートしており、swift-collections の導入が必要
    var heap = Heap<Int>()

    /* 要素をヒープに追加 */
    heap.insert(1)
    heap.insert(3)
    heap.insert(2)
    heap.insert(5)
    heap.insert(4)

    /* ヒープ頂点の要素を取得 */
    var peek = heap.max()!

    /* ヒープ頂点の要素を取り出す */
    peek = heap.removeMax() // 5
    peek = heap.removeMax() // 4
    peek = heap.removeMax() // 3
    peek = heap.removeMax() // 2
    peek = heap.removeMax() // 1

    /* ヒープのサイズを取得 */
    let size = heap.count

    /* ヒープが空かどうかを判定 */
    let isEmpty = heap.isEmpty

    /* 入力リストからヒープを構築 */
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

    /* 要素をヒープに追加 */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);

    /* ヒープ頂点の要素を取得 */
    let peek = max_heap.peek().unwrap();  // 5

    /* ヒープ頂点の要素を取り出す */
    // 取り出された要素は大きい順の列になる
    let peek = max_heap.pop().unwrap();   // 5
    let peek = max_heap.pop().unwrap();   // 4
    let peek = max_heap.pop().unwrap();   // 3
    let peek = max_heap.pop().unwrap();   // 2
    let peek = max_heap.pop().unwrap();   // 1

    /* ヒープのサイズを取得 */
    let size = max_heap.len();

    /* ヒープが空かどうかを判定 */
    let is_empty = max_heap.is_empty();

    /* 入力リストからヒープを構築 */
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
    // 最大ヒープを初期化（lambda 式で Comparator を変更すればよい）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    /* 要素をヒープに追加 */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)

    /* ヒープ頂点の要素を取得 */
    var peek = maxHeap.peek() // 5

    /* ヒープ頂点の要素を取り出す */
    // 取り出された要素は大きい順の列になる
    peek = maxHeap.poll() // 5
    peek = maxHeap.poll() // 4
    peek = maxHeap.poll() // 3
    peek = maxHeap.poll() // 2
    peek = maxHeap.poll() // 1

    /* ヒープのサイズを取得 */
    val size = maxHeap.size

    /* ヒープが空かどうかを判定 */
    val isEmpty = maxHeap.isEmpty()

    /* 入力リストからヒープを構築 */
    minHeap = PriorityQueue(mutableListOf(1, 3, 2, 5, 4))
    ```

=== "Ruby"

    ```ruby title="heap.rb"
    # Ruby には組み込みの Heap クラスがない
    ```

??? pythontutor "実行を可視化"

    https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%B0%8F%E9%A1%B6%E5%A0%86%0A%20%20%20%20min_heap,%20flag%20%3D%20%5B%5D,%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A4%A7%E9%A1%B6%E5%A0%86%0A%20%20%20%20max_heap,%20flag%20%3D%20%5B%5D,%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%20%E7%9A%84%20heapq%20%E6%A8%A1%E5%9D%97%E9%BB%98%E8%AE%A4%E5%AE%9E%E7%8E%B0%E5%B0%8F%E9%A1%B6%E5%A0%86%0A%20%20%20%20%23%20%E8%80%83%E8%99%91%E5%B0%86%E2%80%9C%E5%85%83%E7%B4%A0%E5%8F%96%E8%B4%9F%E2%80%9D%E5%90%8E%E5%86%8D%E5%85%A5%E5%A0%86%EF%BC%8C%E8%BF%99%E6%A0%B7%E5%B0%B1%E5%8F%AF%E4%BB%A5%E5%B0%86%E5%A4%A7%E5%B0%8F%E5%85%B3%E7%B3%BB%E9%A2%A0%E5%80%92%EF%BC%8C%E4%BB%8E%E8%80%8C%E5%AE%9E%E7%8E%B0%E5%A4%A7%E9%A1%B6%E5%A0%86%0A%20%20%20%20%23%20%E5%9C%A8%E6%9C%AC%E7%A4%BA%E4%BE%8B%E4%B8%AD%EF%BC%8Cflag%20%3D%201%20%E6%97%B6%E5%AF%B9%E5%BA%94%E5%B0%8F%E9%A1%B6%E5%A0%86%EF%BC%8Cflag%20%3D%20-1%20%E6%97%B6%E5%AF%B9%E5%BA%94%E5%A4%A7%E9%A1%B6%E5%A0%86%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E5%A0%86%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20*%201%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20*%203%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20*%202%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20*%205%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20*%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E5%A0%86%E9%A1%B6%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20flag%20*%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%A0%86%E9%A1%B6%E5%85%83%E7%B4%A0%E5%87%BA%E5%A0%86%0A%20%20%20%20%23%20%E5%87%BA%E5%A0%86%E5%85%83%E7%B4%A0%E4%BC%9A%E5%BD%A2%E6%88%90%E4%B8%80%E4%B8%AA%E4%BB%8E%E5%A4%A7%E5%88%B0%E5%B0%8F%E7%9A%84%E5%BA%8F%E5%88%97%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E5%A0%86%E5%A4%A7%E5%B0%8F%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E5%A0%86%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BE%93%E5%85%A5%E5%88%97%E8%A1%A8%E5%B9%B6%E5%BB%BA%E5%A0%86%0A%20%20%20%20min_heap%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 8.1.2 &nbsp; ヒープの実装

以下では最大ヒープを実装します。最小ヒープに変換したい場合は、すべての大小比較ロジックを反転させるだけです（たとえば、$\geq$ を $\leq$ に置き換えます）。興味のある読者は自分で実装してみてください。

### 1. &nbsp; ヒープの格納と表現

「二分木」の章で述べたように、完全二分木は配列で表現するのに非常に適しています。ヒープはまさに完全二分木の一種なので、**ここでは配列を使ってヒープを格納します**。

配列で二分木を表す場合、要素はノードの値を表し、インデックスは二分木におけるノードの位置を表します。**ノード間の参照関係はインデックスの対応式によって実現できます**。

次の図に示すように、インデックス $i$ に対して、左子ノードのインデックスは $2i + 1$ 、右子ノードのインデックスは $2i + 2$ 、親ノードのインデックスは $(i - 1) / 2$（切り捨て除算）です。インデックスが範囲外であれば、空ノードまたはノードが存在しないことを表します。

![ヒープの表現と格納](heap.assets/representation_of_heap.png){ class="animation-figure" }

<p align="center"> 図 8-2 &nbsp; ヒープの表現と格納 </p>

インデックスの対応式は関数にまとめておくと、後続で使いやすくなります：

=== "Python"

    ```python title="my_heap.py"
    def left(self, i: int) -> int:
        """左子ノードのインデックスを取得"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """右子ノードのインデックスを取得"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """親ノードのインデックスを取得"""
        return (i - 1) // 2  # 切り捨て除算
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 左子ノードのインデックスを取得 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    int parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 左子ノードのインデックスを取得 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    int parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 左子ノードのインデックスを取得 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    int Parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 左子ノードのインデックスを取得 */
    func (h *maxHeap) left(i int) int {
        return 2*i + 1
    }

    /* 右子ノードのインデックスを取得 */
    func (h *maxHeap) right(i int) int {
        return 2*i + 2
    }

    /* 親ノードのインデックスを取得 */
    func (h *maxHeap) parent(i int) int {
        // 切り捨て除算
        return (i - 1) / 2
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 左子ノードのインデックスを取得 */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 右子ノードのインデックスを取得 */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 親ノードのインデックスを取得 */
    func parent(i: Int) -> Int {
        (i - 1) / 2 // 切り捨て除算
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 左子ノードのインデックスを取得 */
    #left(i) {
        return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    #right(i) {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    #parent(i) {
        return Math.floor((i - 1) / 2); // 切り捨て除算
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 左子ノードのインデックスを取得 */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // 切り捨て除算
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 左子ノードのインデックスを取得 */
    int _left(int i) {
      return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    int _right(int i) {
      return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    int _parent(int i) {
      return (i - 1) ~/ 2; // 切り捨て除算
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 左子ノードのインデックスを取得 */
    fn left(i: usize) -> usize {
        2 * i + 1
    }

    /* 右子ノードのインデックスを取得 */
    fn right(i: usize) -> usize {
        2 * i + 2
    }

    /* 親ノードのインデックスを取得 */
    fn parent(i: usize) -> usize {
        (i - 1) / 2 // 切り捨て除算
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 左子ノードのインデックスを取得 */
    int left(MaxHeap *maxHeap, int i) {
        return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    int right(MaxHeap *maxHeap, int i) {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    int parent(MaxHeap *maxHeap, int i) {
        return (i - 1) / 2; // 切り捨て
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 左子ノードのインデックスを取得 */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 右子ノードのインデックスを取得 */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 親ノードのインデックスを取得 */
    fun parent(i: Int): Int {
        return (i - 1) / 2 // 切り捨て除算
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 左子ノードのインデックスを取得 ###
    def left(i)
      2 * i + 1
    end

    ### 右子ノードのインデックスを取得 ###
    def right(i)
      2 * i + 2
    end

    ### 親ノードのインデックスを取得 ###
    def parent(i)
      (i - 1) / 2     # 切り捨て除算
    end
    ```

### 2. &nbsp; ヒープ頂点の要素にアクセス

ヒープ頂点の要素は二分木の根ノード、すなわちリストの先頭要素です：

=== "Python"

    ```python title="my_heap.py"
    def peek(self) -> int:
        """ヒープ先頭要素にアクセス"""
        return self.max_heap[0]
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* ヒープ先頭要素にアクセス */
    int peek() {
        return maxHeap[0];
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* ヒープ先頭要素にアクセス */
    int peek() {
        return maxHeap.get(0);
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* ヒープ先頭要素にアクセス */
    int Peek() {
        return maxHeap[0];
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* ヒープ先頭要素にアクセス */
    func (h *maxHeap) peek() any {
        return h.data[0]
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* ヒープ先頭要素にアクセス */
    func peek() -> Int {
        maxHeap[0]
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* ヒープ先頭要素にアクセス */
    peek() {
        return this.#maxHeap[0];
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* ヒープ先頭要素にアクセス */
    peek(): number {
        return this.maxHeap[0];
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* ヒープ先頭要素にアクセス */
    int peek() {
      return _maxHeap[0];
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* ヒープ先頭要素にアクセス */
    fn peek(&self) -> Option<i32> {
        self.max_heap.first().copied()
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* ヒープ先頭要素にアクセス */
    int peek(MaxHeap *maxHeap) {
        return maxHeap->data[0];
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* ヒープ先頭要素にアクセス */
    fun peek(): Int {
        return maxHeap[0]
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### ヒープ先頭要素を参照 ###
    def peek
      @max_heap[0]
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20%2F%2F%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.max_heap%5B0%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E9%85%8D%E5%88%97%E3%81%AF%E3%81%99%E3%81%A7%E3%81%AB%E6%AD%A3%E5%BD%93%E3%81%AA%E3%83%92%E3%83%BC%E3%83%97%E3%81%A7%E3%81%82%E3%82%8B%E7%82%B9%E3%81%AB%E6%B3%A8%E6%84%8F%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9%2C%208%2C%206%2C%206%2C%207%2C%205%2C%202%2C%201%2C%204%2C%203%2C%206%2C%202%5D%29%0A%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E9%A0%82%E7%82%B9%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20peek%20%3D%20max_heap.peek%28%29%0A%20%20%20%20print%28f%22%5Cn%E3%83%92%E3%83%BC%E3%83%97%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AF%20%7Bpeek%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20%2F%2F%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.max_heap%5B0%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E9%85%8D%E5%88%97%E3%81%AF%E3%81%99%E3%81%A7%E3%81%AB%E6%AD%A3%E5%BD%93%E3%81%AA%E3%83%92%E3%83%BC%E3%83%97%E3%81%A7%E3%81%82%E3%82%8B%E7%82%B9%E3%81%AB%E6%B3%A8%E6%84%8F%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9%2C%208%2C%206%2C%206%2C%207%2C%205%2C%202%2C%201%2C%204%2C%203%2C%206%2C%202%5D%29%0A%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E9%A0%82%E7%82%B9%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20peek%20%3D%20max_heap.peek%28%29%0A%20%20%20%20print%28f%22%5Cn%E3%83%92%E3%83%BC%E3%83%97%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AF%20%7Bpeek%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

### 3. &nbsp; 要素をヒープに追加

与えられた要素 `val` を、まずヒープの底に追加します。追加後、`val` がヒープ内のほかの要素より大きい可能性があるため、ヒープ条件が崩れているかもしれません。**そのため、挿入ノードから根ノードまでの経路上にある各ノードを修復する必要があります**。この操作を<u>ヒープ化（heapify）</u>と呼びます。

ヒープへ追加したノードから始めて、**下から上へヒープ化**を行います。次の図のように、挿入ノードとその親ノードの値を比較し、挿入ノードのほうが大きければそれらを交換します。その後もこの操作を繰り返し、下から上へ各ノードを修復して、根ノードを越えるか交換不要のノードに達した時点で終了します。

=== "<1>"
    ![要素をヒープに追加する手順](heap.assets/heap_push_step1.png){ class="animation-figure" }

=== "<2>"
    ![heap_push_step2](heap.assets/heap_push_step2.png){ class="animation-figure" }

=== "<3>"
    ![heap_push_step3](heap.assets/heap_push_step3.png){ class="animation-figure" }

=== "<4>"
    ![heap_push_step4](heap.assets/heap_push_step4.png){ class="animation-figure" }

=== "<5>"
    ![heap_push_step5](heap.assets/heap_push_step5.png){ class="animation-figure" }

=== "<6>"
    ![heap_push_step6](heap.assets/heap_push_step6.png){ class="animation-figure" }

=== "<7>"
    ![heap_push_step7](heap.assets/heap_push_step7.png){ class="animation-figure" }

=== "<8>"
    ![heap_push_step8](heap.assets/heap_push_step8.png){ class="animation-figure" }

=== "<9>"
    ![heap_push_step9](heap.assets/heap_push_step9.png){ class="animation-figure" }

<p align="center"> 図 8-3 &nbsp; 要素をヒープに追加する手順 </p>

ノード総数を $n$ とすると、木の高さは $O(\log n)$ です。したがって、ヒープ化操作のループ回数は高々 $O(\log n)$ であり、**要素をヒープに追加する操作の時間計算量は $O(\log n)$** です。コードは以下のとおりです：

=== "Python"

    ```python title="my_heap.py"
    def push(self, val: int):
        """要素をヒープに追加"""
        # ノードを追加
        self.max_heap.append(val)
        # 下から上へヒープ化
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """ノード i から始めて、下から上へヒープ化"""
        while True:
            # ノード i の親ノードを取得
            p = self.parent(i)
            # 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 2 つのノードを交換
            self.swap(i, p)
            # ループで下から上へヒープ化
            i = p
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 要素をヒープに追加 */
    void push(int val) {
        // ノードを追加
        maxHeap.push_back(val);
        // 下から上へヒープ化
        siftUp(size() - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    void siftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得
            int p = parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2 つのノードを交換
            swap(maxHeap[i], maxHeap[p]);
            // ループで下から上へヒープ化
            i = p;
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 要素をヒープに追加 */
    void push(int val) {
        // ノードを追加
        maxHeap.add(val);
        // 下から上へヒープ化
        siftUp(size() - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    void siftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得
            int p = parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 2 つのノードを交換
            swap(i, p);
            // ループで下から上へヒープ化
            i = p;
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 要素をヒープに追加 */
    void Push(int val) {
        // ノードを追加
        maxHeap.Add(val);
        // 下から上へヒープ化
        SiftUp(Size() - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    void SiftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得
            int p = Parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」な場合は、ヒープ化を終了する
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2 つのノードを交換
            Swap(i, p);
            // ループで下から上へヒープ化
            i = p;
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 要素をヒープに追加 */
    func (h *maxHeap) push(val any) {
        // ノードを追加
        h.data = append(h.data, val)
        // 下から上へヒープ化
        h.siftUp(len(h.data) - 1)
    }

    /* ノード i から始めて、下から上へヒープ化 */
    func (h *maxHeap) siftUp(i int) {
        for true {
            // ノード i の親ノードを取得
            p := h.parent(i)
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if p < 0 || h.data[i].(int) <= h.data[p].(int) {
                break
            }
            // 2 つのノードを交換
            h.swap(i, p)
            // ループで下から上へヒープ化
            i = p
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 要素をヒープに追加 */
    func push(val: Int) {
        // ノードを追加
        maxHeap.append(val)
        // 下から上へヒープ化
        siftUp(i: size() - 1)
    }

    /* ノード i から始めて、下から上へヒープ化 */
    func siftUp(i: Int) {
        var i = i
        while true {
            // ノード i の親ノードを取得
            let p = parent(i: i)
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 2 つのノードを交換
            swap(i: i, j: p)
            // ループで下から上へヒープ化
            i = p
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 要素をヒープに追加 */
    push(val) {
        // ノードを追加
        this.#maxHeap.push(val);
        // 下から上へヒープ化
        this.#siftUp(this.size() - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    #siftUp(i) {
        while (true) {
            // ノード i の親ノードを取得
            const p = this.#parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // 2 つのノードを交換
            this.#swap(i, p);
            // ループで下から上へヒープ化
            i = p;
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 要素をヒープに追加 */
    push(val: number): void {
        // ノードを追加
        this.maxHeap.push(val);
        // 下から上へヒープ化
        this.siftUp(this.size() - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    siftUp(i: number): void {
        while (true) {
            // ノード i の親ノードを取得
            const p = this.parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 2 つのノードを交換
            this.swap(i, p);
            // ループで下から上へヒープ化
            i = p;
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 要素をヒープに追加 */
    void push(int val) {
      // ノードを追加
      _maxHeap.add(val);
      // 下から上へヒープ化
      siftUp(size() - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    void siftUp(int i) {
      while (true) {
        // ノード i の親ノードを取得
        int p = _parent(i);
        // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
        if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
          break;
        }
        // 2 つのノードを交換
        _swap(i, p);
        // ループで下から上へヒープ化
        i = p;
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 要素をヒープに追加 */
    fn push(&mut self, val: i32) {
        // ノードを追加
        self.max_heap.push(val);
        // 下から上へヒープ化
        self.sift_up(self.size() - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    fn sift_up(&mut self, mut i: usize) {
        loop {
            // ノード i はすでにヒープの先頭ノードなので、ヒープ化を終了する
            if i == 0 {
                break;
            }
            // ノード i の親ノードを取得
            let p = Self::parent(i);
            // 「ノードの修復が不要」になったら、ヒープ化を終了
            if self.max_heap[i] <= self.max_heap[p] {
                break;
            }
            // 2 つのノードを交換
            self.swap(i, p);
            // ループで下から上へヒープ化
            i = p;
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 要素をヒープに追加 */
    void push(MaxHeap *maxHeap, int val) {
        // 通常は、これほど多くのノードを追加すべきではない
        if (maxHeap->size == MAX_SIZE) {
            printf("heap is full!");
            return;
        }
        // ノードを追加
        maxHeap->data[maxHeap->size] = val;
        maxHeap->size++;

        // 下から上へヒープ化
        siftUp(maxHeap, maxHeap->size - 1);
    }

    /* ノード i から始めて、下から上へヒープ化 */
    void siftUp(MaxHeap *maxHeap, int i) {
        while (true) {
            // ノード i の親ノードを取得
            int p = parent(maxHeap, i);
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
                break;
            }
            // 2 つのノードを交換
            swap(maxHeap, i, p);
            // ループで下から上へヒープ化
            i = p;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 要素をヒープに追加 */
    fun push(_val: Int) {
        // ノードを追加
        maxHeap.add(_val)
        // 下から上へヒープ化
        siftUp(size() - 1)
    }

    /* ノード i から始めて、下から上へヒープ化 */
    fun siftUp(it: Int) {
        // Kotlin の関数引数は不変のため、一時変数を作成する
        var i = it
        while (true) {
            // ノード i の親ノードを取得
            val p = parent(i)
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 2 つのノードを交換
            swap(i, p)
            // ループで下から上へヒープ化
            i = p
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 要素をヒープに挿入 ###
    def push(val)
      # ノードを追加
      @max_heap << val
      # 下から上へヒープ化
      sift_up(size - 1)
    end

    ### ノード i から下から上へヒープ化 ###
    def sift_up(i)
      loop do
        # ノード i の親ノードを取得
        p = parent(i)
        # 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
        break if p < 0 || @max_heap[i] <= @max_heap[p]
        # 2 つのノードを交換
        swap(i, p)
        # ループで下から上へヒープ化
        i = p
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20%2F%2F%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20%20%20%20def%20swap%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D%2C%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D%2C%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20%20%20%20%20self.max_heap.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E4%B8%8B%E3%81%8B%E3%82%89%E4%B8%8A%E3%81%B8%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%0A%20%20%20%20%20%20%20%20self.sift_up%28self.size%28%29%20-%201%29%0A%0A%20%20%20%20def%20sift_up%28self%2C%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8B%E3%82%89%E5%A7%8B%E3%82%81%E3%81%A6%E3%80%81%E4%B8%8B%E3%81%8B%E3%82%89%E4%B8%8A%E3%81%B8%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%AE%E8%A6%AA%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20%20%20%20%20%20%20%20%20p%20%3D%20self.parent%28i%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%80%8C%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%80%8D%E3%81%BE%E3%81%9F%E3%81%AF%E3%80%8C%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E4%BF%AE%E5%BE%A9%E3%81%8C%E4%B8%8D%E8%A6%81%E3%80%8D%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9F%E3%82%89%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B5%82%E4%BA%86%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20p%20%3C%200%20or%20self.max_heap%5Bi%5D%20%3C%3D%20self.max_heap%5Bp%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i%2C%20p%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E4%B8%8B%E3%81%8B%E3%82%89%E4%B8%8A%E3%81%B8%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20p%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E9%85%8D%E5%88%97%E3%81%AF%E3%81%99%E3%81%A7%E3%81%AB%E6%AD%A3%E5%BD%93%E3%81%AA%E3%83%92%E3%83%BC%E3%83%97%E3%81%A7%E3%81%82%E3%82%8B%E7%82%B9%E3%81%AB%E6%B3%A8%E6%84%8F%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9%2C%208%2C%206%2C%206%2C%207%2C%205%2C%202%2C%201%2C%204%2C%203%2C%206%2C%202%5D%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20val%20%3D%207%0A%20%20%20%20max_heap.push%28val%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20%2F%2F%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20%20%20%20def%20swap%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D%2C%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D%2C%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%22%22%22%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20%20%20%20%20self.max_heap.append%28val%29%0A%20%20%20%20%20%20%20%20%23%20%E4%B8%8B%E3%81%8B%E3%82%89%E4%B8%8A%E3%81%B8%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%0A%20%20%20%20%20%20%20%20self.sift_up%28self.size%28%29%20-%201%29%0A%0A%20%20%20%20def%20sift_up%28self%2C%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8B%E3%82%89%E5%A7%8B%E3%82%81%E3%81%A6%E3%80%81%E4%B8%8B%E3%81%8B%E3%82%89%E4%B8%8A%E3%81%B8%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%AE%E8%A6%AA%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20%20%20%20%20%20%20%20%20p%20%3D%20self.parent%28i%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%80%8C%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%80%8D%E3%81%BE%E3%81%9F%E3%81%AF%E3%80%8C%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E4%BF%AE%E5%BE%A9%E3%81%8C%E4%B8%8D%E8%A6%81%E3%80%8D%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9F%E3%82%89%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B5%82%E4%BA%86%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20p%20%3C%200%20or%20self.max_heap%5Bi%5D%20%3C%3D%20self.max_heap%5Bp%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i%2C%20p%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E4%B8%8B%E3%81%8B%E3%82%89%E4%B8%8A%E3%81%B8%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20p%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E9%85%8D%E5%88%97%E3%81%AF%E3%81%99%E3%81%A7%E3%81%AB%E6%AD%A3%E5%BD%93%E3%81%AA%E3%83%92%E3%83%BC%E3%83%97%E3%81%A7%E3%81%82%E3%82%8B%E7%82%B9%E3%81%AB%E6%B3%A8%E6%84%8F%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9%2C%208%2C%206%2C%206%2C%207%2C%205%2C%202%2C%201%2C%204%2C%203%2C%206%2C%202%5D%29%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20val%20%3D%207%0A%20%20%20%20max_heap.push%28val%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

### 4. &nbsp; ヒープ頂点の要素を取り出す

ヒープ頂点の要素は二分木の根ノード、すなわちリストの先頭要素です。もし先頭要素をそのまま削除すると、二分木内のすべてのノードのインデックスが変化してしまい、その後のヒープ化による修復が困難になります。要素インデックスの変動をできるだけ小さくするため、次の手順を取ります。

1. ヒープ頂点の要素とヒープ底の要素を交換する（根ノードと最も右の葉ノードを交換する）。
2. 交換後、ヒープ底をリストから削除する（すでに交換済みであるため、実際に削除されるのは元のヒープ頂点の要素であることに注意）。
3. 根ノードから開始し、**上から下へヒープ化**を行う。

次の図のように、**「上から下へのヒープ化」の方向は「下から上へのヒープ化」と逆**です。根ノードの値を 2 つの子ノードと比較し、最大の子ノードと根ノードを交換します。その後、この操作を繰り返し、葉ノードを越えるか交換不要のノードに達した時点で終了します。

=== "<1>"
    ![ヒープ頂点の要素を取り出す手順](heap.assets/heap_pop_step1.png){ class="animation-figure" }

=== "<2>"
    ![heap_pop_step2](heap.assets/heap_pop_step2.png){ class="animation-figure" }

=== "<3>"
    ![heap_pop_step3](heap.assets/heap_pop_step3.png){ class="animation-figure" }

=== "<4>"
    ![heap_pop_step4](heap.assets/heap_pop_step4.png){ class="animation-figure" }

=== "<5>"
    ![heap_pop_step5](heap.assets/heap_pop_step5.png){ class="animation-figure" }

=== "<6>"
    ![heap_pop_step6](heap.assets/heap_pop_step6.png){ class="animation-figure" }

=== "<7>"
    ![heap_pop_step7](heap.assets/heap_pop_step7.png){ class="animation-figure" }

=== "<8>"
    ![heap_pop_step8](heap.assets/heap_pop_step8.png){ class="animation-figure" }

=== "<9>"
    ![heap_pop_step9](heap.assets/heap_pop_step9.png){ class="animation-figure" }

=== "<10>"
    ![heap_pop_step10](heap.assets/heap_pop_step10.png){ class="animation-figure" }

<p align="center"> 図 8-4 &nbsp; ヒープ頂点の要素を取り出す手順 </p>

要素をヒープに追加する操作と同様に、ヒープ頂点の要素を取り出す操作の時間計算量も $O(\log n)$ です。コードは以下のとおりです：

=== "Python"

    ```python title="my_heap.py"
    def pop(self) -> int:
        """要素をヒープから取り出す"""
        # 空判定の処理
        if self.is_empty():
            raise IndexError("ヒープが空です")
        # 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        self.swap(0, self.size() - 1)
        # ノードを削除
        val = self.max_heap.pop()
        # 上から下へヒープ化
        self.sift_down(0)
        # ヒープ先頭要素を返す
        return val

    def sift_down(self, i: int):
        """ノード i から始めて、上から下へヒープ化"""
        while True:
            # ノード i, l, r のうち値が最大のノードを ma とする
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if ma == i:
                break
            # 2 つのノードを交換
            self.swap(i, ma)
            # ループで上から下へヒープ化
            i = ma
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 要素をヒープから取り出す */
    void pop() {
        // 空判定の処理
        if (isEmpty()) {
            throw out_of_range("ヒープが空です");
        }
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        swap(maxHeap[0], maxHeap[size() - 1]);
        // ノードを削除
        maxHeap.pop_back();
        // 上から下へヒープ化
        siftDown(0);
    }

    /* ノード i から始めて、上から下へヒープ化 */
    void siftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // ループで上から下へヒープ化
            i = ma;
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 要素をヒープから取り出す */
    int pop() {
        // 空判定の処理
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        swap(0, size() - 1);
        // ノードを削除
        int val = maxHeap.remove(size() - 1);
        // 上から下へヒープ化
        siftDown(0);
        // ヒープ先頭要素を返す
        return val;
    }

    /* ノード i から始めて、上から下へヒープ化 */
    void siftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (ma == i)
                break;
            // 2 つのノードを交換
            swap(i, ma);
            // ループで上から下へヒープ化
            i = ma;
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 要素をヒープから取り出す */
    int Pop() {
        // 空判定の処理
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        Swap(0, Size() - 1);
        // ノードを削除
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 上から下へヒープ化
        SiftDown(0);
        // ヒープ先頭要素を返す
        return val;
    }

    /* ノード i から始めて、上から下へヒープ化 */
    void SiftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 「ノード i が最大」または「葉ノードを越えた」場合は、ヒープ化を終了する
            if (ma == i) break;
            // 2 つのノードを交換
            Swap(i, ma);
            // ループで上から下へヒープ化
            i = ma;
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 要素をヒープから取り出す */
    func (h *maxHeap) pop() any {
        // 空判定の処理
        if h.isEmpty() {
            fmt.Println("error")
            return nil
        }
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        h.swap(0, h.size()-1)
        // ノードを削除
        val := h.data[len(h.data)-1]
        h.data = h.data[:len(h.data)-1]
        // 上から下へヒープ化
        h.siftDown(0)

        // ヒープ先頭要素を返す
        return val
    }

    /* ノード i から始めて、上から下へヒープ化 */
    func (h *maxHeap) siftDown(i int) {
        for true {
            // ノード i, l, r のうち値が最大のノードを max とする
            l, r, max := h.left(i), h.right(i), i
            if l < h.size() && h.data[l].(int) > h.data[max].(int) {
                max = l
            }
            if r < h.size() && h.data[r].(int) > h.data[max].(int) {
                max = r
            }
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if max == i {
                break
            }
            // 2 つのノードを交換
            h.swap(i, max)
            // ループで上から下へヒープ化
            i = max
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 要素をヒープから取り出す */
    func pop() -> Int {
        // 空判定の処理
        if isEmpty() {
            fatalError("ヒープが空です")
        }
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        swap(i: 0, j: size() - 1)
        // ノードを削除
        let val = maxHeap.remove(at: size() - 1)
        // 上から下へヒープ化
        siftDown(i: 0)
        // ヒープ先頭要素を返す
        return val
    }

    /* ノード i から始めて、上から下へヒープ化 */
    func siftDown(i: Int) {
        var i = i
        while true {
            // ノード i, l, r のうち値が最大のノードを ma とする
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if ma == i {
                break
            }
            // 2 つのノードを交換
            swap(i: i, j: ma)
            // ループで上から下へヒープ化
            i = ma
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 要素をヒープから取り出す */
    pop() {
        // 空判定の処理
        if (this.isEmpty()) throw new Error('ヒープが空です');
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        this.#swap(0, this.size() - 1);
        // ノードを削除
        const val = this.#maxHeap.pop();
        // 上から下へヒープ化
        this.#siftDown(0);
        // ヒープ先頭要素を返す
        return val;
    }

    /* ノード i から始めて、上から下へヒープ化 */
    #siftDown(i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (ma === i) break;
            // 2 つのノードを交換
            this.#swap(i, ma);
            // ループで上から下へヒープ化
            i = ma;
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 要素をヒープから取り出す */
    pop(): number {
        // 空判定の処理
        if (this.isEmpty()) throw new RangeError('Heap is empty.');
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        this.swap(0, this.size() - 1);
        // ノードを削除
        const val = this.maxHeap.pop();
        // 上から下へヒープ化
        this.siftDown(0);
        // ヒープ先頭要素を返す
        return val;
    }

    /* ノード i から始めて、上から下へヒープ化 */
    siftDown(i: number): void {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (ma === i) break;
            // 2 つのノードを交換
            this.swap(i, ma);
            // ループで上から下へヒープ化
            i = ma;
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 要素をヒープから取り出す */
    int pop() {
      // 空判定の処理
      if (isEmpty()) throw Exception('ヒープが空です');
      // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
      _swap(0, size() - 1);
      // ノードを削除
      int val = _maxHeap.removeLast();
      // 上から下へヒープ化
      siftDown(0);
      // ヒープ先頭要素を返す
      return val;
    }

    /* ノード i から始めて、上から下へヒープ化 */
    void siftDown(int i) {
      while (true) {
        // ノード i, l, r のうち値が最大のノードを ma とする
        int l = _left(i);
        int r = _right(i);
        int ma = i;
        if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
        if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
        // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
        if (ma == i) break;
        // 2 つのノードを交換
        _swap(i, ma);
        // ループで上から下へヒープ化
        i = ma;
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 要素をヒープから取り出す */
    fn pop(&mut self) -> i32 {
        // 空判定の処理
        if self.is_empty() {
            panic!("index out of bounds");
        }
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        self.swap(0, self.size() - 1);
        // ノードを削除
        let val = self.max_heap.pop().unwrap();
        // 上から下へヒープ化
        self.sift_down(0);
        // ヒープ先頭要素を返す
        val
    }

    /* ノード i から始めて、上から下へヒープ化 */
    fn sift_down(&mut self, mut i: usize) {
        loop {
            // ノード i, l, r のうち値が最大のノードを ma とする
            let (l, r, mut ma) = (Self::left(i), Self::right(i), i);
            if l < self.size() && self.max_heap[l] > self.max_heap[ma] {
                ma = l;
            }
            if r < self.size() && self.max_heap[r] > self.max_heap[ma] {
                ma = r;
            }
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if ma == i {
                break;
            }
            // 2 つのノードを交換
            self.swap(i, ma);
            // ループで上から下へヒープ化
            i = ma;
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* 要素をヒープから取り出す */
    int pop(MaxHeap *maxHeap) {
        // 空判定の処理
        if (isEmpty(maxHeap)) {
            printf("heap is empty!");
            return INT_MAX;
        }
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        swap(maxHeap, 0, size(maxHeap) - 1);
        // ノードを削除
        int val = maxHeap->data[maxHeap->size - 1];
        maxHeap->size--;
        // 上から下へヒープ化
        siftDown(maxHeap, 0);

        // ヒープ先頭要素を返す
        return val;
    }

    /* ノード i から始めて、上から下へヒープ化 */
    void siftDown(MaxHeap *maxHeap, int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを max とする
            int l = left(maxHeap, i);
            int r = right(maxHeap, i);
            int max = i;
            if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
                max = l;
            }
            if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
                max = r;
            }
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (max == i) {
                break;
            }
            // 2 つのノードを交換
            swap(maxHeap, i, max);
            // ループで上から下へヒープ化
            i = max;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 要素をヒープから取り出す */
    fun pop(): Int {
        // 空判定の処理
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        swap(0, size() - 1)
        // ノードを削除
        val _val = maxHeap.removeAt(size() - 1)
        // 上から下へヒープ化
        siftDown(0)
        // ヒープ先頭要素を返す
        return _val
    }

    /* ノード i から始めて、上から下へヒープ化 */
    fun siftDown(it: Int) {
        // Kotlin の関数引数は不変のため、一時変数を作成する
        var i = it
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (ma == i) break
            // 2 つのノードを交換
            swap(i, ma)
            // ループで上から下へヒープ化
            i = ma
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 要素をヒープから取り出す ###
    def pop
      # 空判定の処理
      raise IndexError, "ヒープが空です" if is_empty?
      # 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
      swap(0, size - 1)
      # ノードを削除
      val = @max_heap.pop
      # 上から下へヒープ化
      sift_down(0)
      # ヒープ先頭要素を返す
      val
    end

    ### ノード i から上から下へヒープ化 ###
    def sift_down(i)
      loop do
        # ノード i, l, r のうち値が最大のノードを ma とする
        l, r, ma = left(i), right(i), i
        ma = l if l < size && @max_heap[l] > @max_heap[ma]
        ma = r if r < size && @max_heap[r] > @max_heap[ma]

        # ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
        break if ma == i

        # 2 つのノードを交換
        swap(i, ma)
        # ループで上から下へヒープ化
        i = ma
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20%2F%2F%202%0A%0A%20%20%20%20def%20swap%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D%2C%20self.max_heap%5Bj%5D%20%3D%20%28self.max_heap%5Bj%5D%2C%20self.max_heap%5Bi%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%27%29%0A%20%20%20%20%20%20%20%20self.swap%280%2C%20self.size%28%29%20-%201%29%0A%20%20%20%20%20%20%20%20val%20%3D%20self.max_heap.pop%28%29%0A%20%20%20%20%20%20%20%20self.sift_down%280%29%0A%20%20%20%20%20%20%20%20return%20val%0A%0A%20%20%20%20def%20sift_down%28self%2C%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20l%2C%20r%2C%20ma%20%3D%20%28self.left%28i%29%2C%20self.right%28i%29%2C%20i%29%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i%2C%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9%2C%208%2C%207%2C%206%2C%207%2C%206%2C%202%2C%201%2C%204%2C%203%2C%206%2C%202%2C%205%5D%29%0A%20%20%20%20peek%20%3D%20max_heap.pop%28%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%0A%20%20%20%20def%20left%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20%2F%2F%202%0A%0A%20%20%20%20def%20swap%28self%2C%20i%3A%20int%2C%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D%2C%20self.max_heap%5Bj%5D%20%3D%20%28self.max_heap%5Bj%5D%2C%20self.max_heap%5Bi%5D%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20return%20self.size%28%29%20%3D%3D%200%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%A7%E3%81%99%27%29%0A%20%20%20%20%20%20%20%20self.swap%280%2C%20self.size%28%29%20-%201%29%0A%20%20%20%20%20%20%20%20val%20%3D%20self.max_heap.pop%28%29%0A%20%20%20%20%20%20%20%20self.sift_down%280%29%0A%20%20%20%20%20%20%20%20return%20val%0A%0A%20%20%20%20def%20sift_down%28self%2C%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20l%2C%20r%2C%20ma%20%3D%20%28self.left%28i%29%2C%20self.right%28i%29%2C%20i%29%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i%2C%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B9%2C%208%2C%207%2C%206%2C%207%2C%206%2C%202%2C%201%2C%204%2C%203%2C%206%2C%202%2C%205%5D%29%0A%20%20%20%20peek%20%3D%20max_heap.pop%28%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

## 8.1.3 &nbsp; ヒープの代表的な応用

- **優先度付きキュー**：ヒープは、優先度付きキューを実装するための代表的なデータ構造です。キューへの追加と取り出しの時間計算量はいずれも $O(\log n)$ で、ヒープ構築は $O(n)$ であり、これらの操作はいずれも非常に効率的です。
- **ヒープソート**：与えられたデータ群からヒープを構築し、要素の取り出しを繰り返すことで整列済みデータを得られます。ただし、通常はより洗練された方法でヒープソートを実装します。詳しくは「ヒープソート」の章を参照してください。
- **最大の $k$ 個の要素を取得**：これは古典的なアルゴリズム問題であると同時に、典型的な応用でもあります。たとえば、人気上位 10 件のニュースをホットトピックとして選んだり、売上上位 10 件の商品を選んだりする場面です。
