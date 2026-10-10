# ヒープ

<u>ヒープ（heap）</u>は、特定の条件を満たす完全二分木であり、主に次の 2 種類に分けられます。

- <u>最小ヒープ（min heap）</u>：任意のノードの値 $\leq$ その子ノードの値。
- <u>最大ヒープ（max heap）</u>：任意のノードの値 $\geq$ その子ノードの値。

![最小ヒープと最大ヒープ](heap.assets/min_heap_and_max_heap.png)

ヒープは完全二分木の特殊な例であり、次の性質を持ちます。

- 最下層のノードは左から順に埋められ、ほかの層のノードはすべて埋まっています。
- 二分木の根ノードを「ヒープ頂点」、最下層で最も右にあるノードを「ヒープ底」と呼びます。
- 最大ヒープ（最小ヒープ）では、ヒープ頂点の要素（根ノード）の値が最大（最小）です。

## ヒープの基本操作

ここで注意したいのは、多くのプログラミング言語が提供しているのは<u>優先度付きキュー（priority queue）</u>であり、これは優先度順に並ぶキューとして定義される抽象データ構造だということです。

実際には、**ヒープは通常、優先度付きキューの実装に用いられ、最大ヒープは要素が大きい順に取り出される優先度付きキューに相当します**。利用の観点では、「優先度付きキュー」と「ヒープ」は等価なデータ構造とみなせます。そのため、本書では両者を特に区別せず、まとめて「ヒープ」と呼びます。

ヒープの基本操作を以下の表に示します。メソッド名はプログラミング言語によって異なります。

<p align="center"> 表 <id> &nbsp; ヒープの操作効率 </p>

| メソッド名  | 説明                                             | 時間計算量  |
| ----------- | ------------------------------------------------ | ----------- |
| `push()`    | 要素をヒープに追加                               | $O(\log n)$ |
| `pop()`     | ヒープ頂点の要素を取り出す                       | $O(\log n)$ |
| `peek()`    | ヒープ頂点の要素にアクセス（最大 / 最小ヒープではそれぞれ最大 / 最小値） | $O(1)$      |
| `size()`    | ヒープ内の要素数を取得                           | $O(1)$      |
| `isEmpty()` | ヒープが空かどうかを判定                         | $O(1)$      |

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

## ヒープの実装

以下では最大ヒープを実装します。最小ヒープに変換したい場合は、すべての大小比較ロジックを反転させるだけです（たとえば、$\geq$ を $\leq$ に置き換えます）。興味のある読者は自分で実装してみてください。

### ヒープの格納と表現

「二分木」の章で述べたように、完全二分木は配列で表現するのに非常に適しています。ヒープはまさに完全二分木の一種なので、**ここでは配列を使ってヒープを格納します**。

配列で二分木を表す場合、要素はノードの値を表し、インデックスは二分木におけるノードの位置を表します。**ノード間の参照関係はインデックスの対応式によって実現できます**。

次の図に示すように、インデックス $i$ に対して、左子ノードのインデックスは $2i + 1$ 、右子ノードのインデックスは $2i + 2$ 、親ノードのインデックスは $(i - 1) / 2$（切り捨て除算）です。インデックスが範囲外であれば、空ノードまたはノードが存在しないことを表します。

![ヒープの表現と格納](heap.assets/representation_of_heap.png)

インデックスの対応式は関数にまとめておくと、後続で使いやすくなります：

```src
[file]{my_heap}-[class]{max_heap}-[func]{parent}
```

### ヒープ頂点の要素にアクセス

ヒープ頂点の要素は二分木の根ノード、すなわちリストの先頭要素です：

```src
[file]{my_heap}-[class]{max_heap}-[func]{peek}
```

### 要素をヒープに追加

与えられた要素 `val` を、まずヒープの底に追加します。追加後、`val` がヒープ内のほかの要素より大きい可能性があるため、ヒープ条件が崩れているかもしれません。**そのため、挿入ノードから根ノードまでの経路上にある各ノードを修復する必要があります**。この操作を<u>ヒープ化（heapify）</u>と呼びます。

ヒープへ追加したノードから始めて、**下から上へヒープ化**を行います。次の図のように、挿入ノードとその親ノードの値を比較し、挿入ノードのほうが大きければそれらを交換します。その後もこの操作を繰り返し、下から上へ各ノードを修復して、根ノードを越えるか交換不要のノードに達した時点で終了します。

=== "<1>"
    ![要素をヒープに追加する手順](heap.assets/heap_push_step1.png)

=== "<2>"
    ![heap_push_step2](heap.assets/heap_push_step2.png)

=== "<3>"
    ![heap_push_step3](heap.assets/heap_push_step3.png)

=== "<4>"
    ![heap_push_step4](heap.assets/heap_push_step4.png)

=== "<5>"
    ![heap_push_step5](heap.assets/heap_push_step5.png)

=== "<6>"
    ![heap_push_step6](heap.assets/heap_push_step6.png)

=== "<7>"
    ![heap_push_step7](heap.assets/heap_push_step7.png)

=== "<8>"
    ![heap_push_step8](heap.assets/heap_push_step8.png)

=== "<9>"
    ![heap_push_step9](heap.assets/heap_push_step9.png)

ノード総数を $n$ とすると、木の高さは $O(\log n)$ です。したがって、ヒープ化操作のループ回数は高々 $O(\log n)$ であり、**要素をヒープに追加する操作の時間計算量は $O(\log n)$** です。コードは以下のとおりです：

```src
[file]{my_heap}-[class]{max_heap}-[func]{sift_up}
```

### ヒープ頂点の要素を取り出す

ヒープ頂点の要素は二分木の根ノード、すなわちリストの先頭要素です。もし先頭要素をそのまま削除すると、二分木内のすべてのノードのインデックスが変化してしまい、その後のヒープ化による修復が困難になります。要素インデックスの変動をできるだけ小さくするため、次の手順を取ります。

1. ヒープ頂点の要素とヒープ底の要素を交換する（根ノードと最も右の葉ノードを交換する）。
2. 交換後、ヒープ底をリストから削除する（すでに交換済みであるため、実際に削除されるのは元のヒープ頂点の要素であることに注意）。
3. 根ノードから開始し、**上から下へヒープ化**を行う。

次の図のように、**「上から下へのヒープ化」の方向は「下から上へのヒープ化」と逆**です。根ノードの値を 2 つの子ノードと比較し、最大の子ノードと根ノードを交換します。その後、この操作を繰り返し、葉ノードを越えるか交換不要のノードに達した時点で終了します。

=== "<1>"
    ![ヒープ頂点の要素を取り出す手順](heap.assets/heap_pop_step1.png)

=== "<2>"
    ![heap_pop_step2](heap.assets/heap_pop_step2.png)

=== "<3>"
    ![heap_pop_step3](heap.assets/heap_pop_step3.png)

=== "<4>"
    ![heap_pop_step4](heap.assets/heap_pop_step4.png)

=== "<5>"
    ![heap_pop_step5](heap.assets/heap_pop_step5.png)

=== "<6>"
    ![heap_pop_step6](heap.assets/heap_pop_step6.png)

=== "<7>"
    ![heap_pop_step7](heap.assets/heap_pop_step7.png)

=== "<8>"
    ![heap_pop_step8](heap.assets/heap_pop_step8.png)

=== "<9>"
    ![heap_pop_step9](heap.assets/heap_pop_step9.png)

=== "<10>"
    ![heap_pop_step10](heap.assets/heap_pop_step10.png)

要素をヒープに追加する操作と同様に、ヒープ頂点の要素を取り出す操作の時間計算量も $O(\log n)$ です。コードは以下のとおりです：

```src
[file]{my_heap}-[class]{max_heap}-[func]{sift_down}
```

## ヒープの代表的な応用

- **優先度付きキュー**：ヒープは、優先度付きキューを実装するための代表的なデータ構造です。キューへの追加と取り出しの時間計算量はいずれも $O(\log n)$ で、ヒープ構築は $O(n)$ であり、これらの操作はいずれも非常に効率的です。
- **ヒープソート**：与えられたデータ群からヒープを構築し、要素の取り出しを繰り返すことで整列済みデータを得られます。ただし、通常はより洗練された方法でヒープソートを実装します。詳しくは「ヒープソート」の章を参照してください。
- **最大の $k$ 個の要素を取得**：これは古典的なアルゴリズム問題であると同時に、典型的な応用でもあります。たとえば、人気上位 10 件のニュースをホットトピックとして選んだり、売上上位 10 件の商品を選んだりする場面です。
