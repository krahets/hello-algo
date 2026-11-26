---
comments: true
---

# 8.2 &nbsp; ヒープの構築

リストの全要素を使ってヒープを作りたいことがあります。この操作を「ヒープの構築」といいます。

## 8.2.1 &nbsp; 挿入を繰り返す方法

まず空のヒープを作り、リストを走査しながら各要素を順に挿入します。要素をヒープの末尾に追加し、その要素から上に向かってヒープ化します。

要素を 1 個挿入するたびにヒープの長さが 1 増えます。ノードは二分木に上から下の順に追加されるので、ヒープは「上から下へ」構築されます。

要素数を $n$ とすると、各要素の挿入には $O(\log{n})$ 時間かかるので、この方法でのヒープ構築の時間計算量は $O(n \log n)$ です。

## 8.2.2 &nbsp; ノードを順にヒープ化する方法

実は、もっと効率よくヒープを構築できます。手順は次の 2 段階です。

1. リストの全要素を元の順序のままヒープに入れます。この段階ではヒープの条件はまだ保証されていません。
2. ヒープをレベル順の逆順にたどり、葉以外の各ノードから順に下に向かってヒープ化します。

**ノードを 1 つヒープ化するたびに、そのノードを根とする部分木がヒープの条件を満たします**。逆順にたどるので、ヒープは「下から上へ」構築されます。

逆順にたどるのは、現在のノードの下にある部分木がすでにヒープの条件を満たすことを保証するためです。この条件がそろって初めて、現在のノードのヒープ化が有効になります。

**葉には子がないので、それだけですでにヒープの条件を満たし、ヒープ化する必要がありません**。次のコードのように、葉でない最後のノードは、末尾のノードの親です。そこから逆順にたどってヒープ化します。

=== "Python"

    ```python title="my_heap.py"
    def __init__(self, nums: list[int]):
        """入力リストからヒープを構築するコンストラクタ"""
        # リストの要素をそのままヒープに追加する
        self.max_heap = nums
        # 葉以外のすべてのノードをヒープ化する
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 入力リストからヒープを構築するコンストラクタ */
    MaxHeap(vector<int> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = nums;
        // 葉以外のすべてのノードをヒープ化する
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* 入力リストからヒープを構築するコンストラクタ */
    MaxHeap(List<Integer> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = new ArrayList<>(nums);
        // 葉以外のすべてのノードをヒープ化する
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 入力リストからヒープを構築するコンストラクタ */
    MaxHeap(IEnumerable<int> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = new List<int>(nums);
        // 葉以外のすべてのノードをヒープ化する
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* スライスからヒープを構築するコンストラクタ */
    func newMaxHeap(nums []any) *maxHeap {
        // リストの要素をそのままヒープに追加する
        h := &maxHeap{data: nums}
        for i := h.parent(len(h.data) - 1); i >= 0; i-- {
            // 葉以外のすべてのノードをヒープ化する
            h.siftDown(i)
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 入力リストからヒープを構築するコンストラクタ */
    init(nums: [Int]) {
        // リストの要素をそのままヒープに追加する
        maxHeap = nums
        // 葉以外のすべてのノードをヒープ化する
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* 空のヒープを作るか、入力リストからヒープを構築するコンストラクタ */
    constructor(nums) {
        // リストの要素をそのままヒープに追加する
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // 葉以外のすべてのノードをヒープ化する
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* 空のヒープを作るか、入力リストからヒープを構築するコンストラクタ */
    constructor(nums?: number[]) {
        // リストの要素をそのままヒープに追加する
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 葉以外のすべてのノードをヒープ化する
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* 入力リストからヒープを構築するコンストラクタ */
    MaxHeap(List<int> nums) {
      // リストの要素をそのままヒープに追加する
      _maxHeap = nums;
      // 葉以外のすべてのノードをヒープ化する
      for (int i = _parent(size() - 1); i >= 0; i--) {
        siftDown(i);
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* 入力リストからヒープを構築するコンストラクタ */
    fn new(nums: Vec<i32>) -> Self {
        // リストの要素をそのままヒープに追加する
        let mut heap = MaxHeap { max_heap: nums };
        // 葉以外のすべてのノードをヒープ化する
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* スライスからヒープを構築するコンストラクタ */
    MaxHeap *newMaxHeap(int nums[], int size) {
        // すべての要素をヒープに入れる
        MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
        maxHeap->size = size;
        memcpy(maxHeap->data, nums, size * sizeof(int));
        for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
            // 葉以外のすべてのノードをヒープ化する
            siftDown(maxHeap, i);
        }
        return maxHeap;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 最大ヒープ */
    class MaxHeap(nums: MutableList<Int>?) {
        // 配列の代わりにリストを使えば、容量の拡張を自分で扱う必要がない
        private val maxHeap = mutableListOf<Int>()

        /* 入力リストからヒープを構築するコンストラクタ */
        init {
            // リストの要素をそのままヒープに追加する
            maxHeap.addAll(nums!!)
            // 葉以外のすべてのノードをヒープ化する
            for (i in parent(size() - 1) downTo 0) {
                siftDown(i)
            }
        }

        /* 左の子のインデックスを取得する */
        private fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* 右の子のインデックスを取得する */
        private fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* 親のインデックスを取得する */
        private fun parent(i: Int): Int {
            return (i - 1) / 2 // 商を 0 方向に丸める
        }

        /* 要素を交換する */
        private fun swap(i: Int, j: Int) {
            val temp = maxHeap[i]
            maxHeap[i] = maxHeap[j]
            maxHeap[j] = temp
        }

        /* ヒープのサイズを取得する */
        fun size(): Int {
            return maxHeap.size
        }

        /* ヒープが空か判定する */
        fun isEmpty(): Boolean {
            /* ヒープが空か判定する */
            return size() == 0
        }

        /* ヒープの根の要素を参照する */
        fun peek(): Int {
            return maxHeap[0]
        }

        /* 要素をヒープに挿入する */
        fun push(_val: Int) {
            // ノードを追加する
            maxHeap.add(_val)
            // 上に向かってヒープ化する
            siftUp(size() - 1)
        }

        /* ノード i から上に向かってヒープ化する */
        private fun siftUp(it: Int) {
            // Kotlin の関数の引数には再代入できないため、一時変数を作る
            var i = it
            while (true) {
                // ノード i の親を取得する
                val p = parent(i)
                // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
                if (p < 0 || maxHeap[i] <= maxHeap[p]) break
                // 2 つのノードを交換する
                swap(i, p)
                // 上へのヒープ化を繰り返す
                i = p
            }
        }

        /* 根の要素をヒープから取り出す */
        fun pop(): Int {
            // 空の場合の処理
            if (isEmpty()) throw IndexOutOfBoundsException()
            // 根と最も右の葉（先頭要素と末尾要素）を交換する
            swap(0, size() - 1)
            // ノードを削除する
            val _val = maxHeap.removeAt(size() - 1)
            // 下に向かってヒープ化する
            siftDown(0)
            // 根の要素を返す
            return _val
        }

        /* ノード i から下に向かってヒープ化する */
        private fun siftDown(it: Int) {
            // Kotlin の関数の引数には再代入できないため、一時変数を作る
            var i = it
            while (true) {
                // ノード i、l、r のうち値が最大のものを ma とする
                val l = left(i)
                val r = right(i)
                var ma = i
                if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
                if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
                // ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
                if (ma == i) break
                // 2 つのノードを交換する
                swap(i, ma)
                // 下へのヒープ化を繰り返す
                i = ma
            }
        }

        /* ヒープを二分木として表示する */
        fun print() {
            val queue = PriorityQueue { a: Int, b: Int -> b - a }
            queue.addAll(maxHeap)
            printHeap(queue)
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### 入力リストからヒープを構築するコンストラクタ ###
    def initialize(nums)
      # リストの要素をそのままヒープに追加する
      @max_heap = nums
      # 葉以外のすべてのノードをヒープ化する
      parent(size - 1).downto(0) do |i|
        sift_down(i)
      end
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%85%A5%E5%8A%9B%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20%E8%91%89%E4%BB%A5%E5%A4%96%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%95%86%E3%82%92%E8%B2%A0%E3%81%AE%E7%84%A1%E9%99%90%E5%A4%A7%E6%96%B9%E5%90%91%E3%81%AB%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E3%82%8B%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8B%E3%82%89%E4%B8%8B%E3%81%AB%E5%90%91%E3%81%8B%E3%81%A3%E3%81%A6%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i%E3%80%81l%E3%80%81r%20%E3%81%AE%E3%81%86%E3%81%A1%E5%80%A4%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%AE%E3%82%82%E3%81%AE%E3%82%92%20ma%20%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20i%20%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%8B%20l,%20r%20%E3%81%8C%E3%81%A8%E3%82%82%E3%81%AB%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B5%82%E4%BA%86%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8B%E3%81%B8%E3%81%AE%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%85%A5%E5%8A%9B%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20%E8%91%89%E4%BB%A5%E5%A4%96%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%95%86%E3%82%92%E8%B2%A0%E3%81%AE%E7%84%A1%E9%99%90%E5%A4%A7%E6%96%B9%E5%90%91%E3%81%AB%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E3%82%8B%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8B%E3%82%89%E4%B8%8B%E3%81%AB%E5%90%91%E3%81%8B%E3%81%A3%E3%81%A6%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i%E3%80%81l%E3%80%81r%20%E3%81%AE%E3%81%86%E3%81%A1%E5%80%A4%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%AE%E3%82%82%E3%81%AE%E3%82%92%20ma%20%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20i%20%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%8B%20l,%20r%20%E3%81%8C%E3%81%A8%E3%82%82%E3%81%AB%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B5%82%E4%BA%86%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8B%E3%81%B8%E3%81%AE%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 8.2.3 &nbsp; 計算量の分析

ここで、2 番目の構築方法の時間計算量を求めてみましょう。

- 完全二分木のノード数を $n$ とすると、葉の数は $(n + 1) / 2$ です。ここで $/$ は商の小数点以下を切り捨てる除算です。したがって、ヒープ化が必要なノード数は $n / 2$ です。
- 下向きのヒープ化で各ノードが下がれるのは葉までなので、反復回数の最大値は二分木の高さ $\log n$ です。

この 2 つを掛ければ、ヒープ構築の時間計算量は $O(n \log n)$ と見積もれます。**しかし、この見積もりは正確ではありません。二分木では下のレベルほど上のレベルよりノードがはるかに多いことを考慮していないからです**。

そこで、より正確に計算してみましょう。計算を簡単にするため、ノード数 $n$、高さ $h$ で完璧二分木を仮定します。この仮定は計算結果の正しさに影響しません。

![完璧二分木の各レベルのノード数](build_heap.assets/heapify_operations_count.svg){ class="animation-figure" }

<p align="center"> 図 8-5 &nbsp; 完璧二分木の各レベルのノード数 </p>

図 8-5 のように、ノードから下に向かってヒープ化するときの最大反復回数は葉までの距離、すなわち「ノードの高さ」に等しくなります。したがって、各レベルについて「ノード数 $\times$ ノードの高さ」を計算して足すと、**全ノードのヒープ化における反復回数の合計が得られます**。

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

上式の整理には数列の知識を使います。まず $T(h)$ に $2$ を掛けると次の式になります。

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^{h}\times1 \newline
\end{aligned}
$$

項をずらして差を取ります。下の式 $2 T(h)$ から上の式 $T(h)$ を引くと、次のようになります。

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

上式を見ると、$T(h)$ は等比数列の和を使って計算できます。和の公式を適用すると、時間計算量は次のようになります。

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

さらに、高さ $h$ で完璧二分木のノード数は $n = 2^{h+1} - 1$ なので、計算量は $O(2^h) = O(n)$ となります。以上から、**入力リストからのヒープ構築の時間計算量は $O(n)$ で、非常に効率的です**。
