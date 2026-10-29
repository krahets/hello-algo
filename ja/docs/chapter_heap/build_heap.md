---
comments: true
---

# 8.2 &nbsp; ヒープの構築

リストのすべての要素を使ってヒープを作りたい場合があります。この過程を「ヒープの構築」と呼びます。

## 8.2.1 &nbsp; 挿入操作を使う方法

まず空のヒープを作り、リストを走査して各要素を順に挿入します。つまり、要素をヒープの末尾に追加してから、その要素を下から上へヒープ化します。

要素を一つ挿入するたびに、ヒープの長さは一つ増えます。ノードが二分木の上から下へ順に追加されるので、ヒープは「上から下へ」構築されます。

要素数を $n$ とすると、一要素の挿入に $O(\log{n})$ 時間かかるため、この構築方法の時間計算量は $O(n \log n)$ です。

## 8.2.2 &nbsp; 走査しながらヒープ化する方法

実は、次の二つの手順で、より効率よくヒープを構築できます。

1. リストの全要素をそのままヒープへ追加します。この時点では、まだヒープの性質を満たしていません。
2. ヒープを逆順、つまりレベル順走査の逆順に走査し、葉以外の各ノードを順に上から下へヒープ化します。

**一つのノードをヒープ化するたびに、そのノードを根とする部分木が正しい部分ヒープになります**。逆順に走査するため、ヒープは「下から上へ」構築されます。

逆順に走査するのは、現在のノードの下にある部分木がすでに正しい部分ヒープであることを保証し、現在のノードのヒープ化を有効にするためです。

**葉ノードには子がないため、それ自体が正しい部分ヒープであり、ヒープ化は不要です**。次のコードのように、葉以外の最後のノードは最後のノードの親です。そこから逆順に走査してヒープ化します。

=== "Python"

    ```python title="my_heap.py"
    def __init__(self, nums: list[int]):
        """コンストラクタ：入力リストからヒープを構築する"""
        # リストの要素をそのままヒープに追加する
        self.max_heap = nums
        # 葉ノード以外の全ノードをヒープ化する
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* コンストラクタ：入力リストからヒープを構築する */
    MaxHeap(vector<int> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = nums;
        // 葉ノード以外の全ノードをヒープ化する
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "Java"

    ```java title="my_heap.java"
    /* コンストラクタ：入力リストからヒープを構築する */
    MaxHeap(List<Integer> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = new ArrayList<>(nums);
        // 葉ノード以外の全ノードをヒープ化する
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* コンストラクタ：入力リストからヒープを構築する */
    MaxHeap(IEnumerable<int> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = new List<int>(nums);
        // 葉ノード以外の全ノードをヒープ化する
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }
    ```

=== "Go"

    ```go title="my_heap.go"
    /* コンストラクタ：スライスからヒープを構築する */
    func newMaxHeap(nums []any) *maxHeap {
        // リストの要素をそのままヒープに追加する
        h := &maxHeap{data: nums}
        for i := h.parent(len(h.data) - 1); i >= 0; i-- {
            // 葉ノード以外の全ノードをヒープ化する
            h.siftDown(i)
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* コンストラクタ：入力リストからヒープを構築する */
    init(nums: [Int]) {
        // リストの要素をそのままヒープに追加する
        maxHeap = nums
        // 葉ノード以外の全ノードをヒープ化する
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }
    ```

=== "JS"

    ```javascript title="my_heap.js"
    /* コンストラクタ：空のヒープを構築するか、入力リストからヒープを構築する */
    constructor(nums) {
        // リストの要素をそのままヒープに追加する
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // 葉ノード以外の全ノードをヒープ化する
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }
    ```

=== "TS"

    ```typescript title="my_heap.ts"
    /* コンストラクタ：空のヒープを構築するか、入力リストからヒープを構築する */
    constructor(nums?: number[]) {
        // リストの要素をそのままヒープに追加する
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 葉ノード以外の全ノードをヒープ化する
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }
    ```

=== "Dart"

    ```dart title="my_heap.dart"
    /* コンストラクタ：入力リストからヒープを構築する */
    MaxHeap(List<int> nums) {
      // リストの要素をそのままヒープに追加する
      _maxHeap = nums;
      // 葉ノード以外の全ノードをヒープ化する
      for (int i = _parent(size() - 1); i >= 0; i--) {
        siftDown(i);
      }
    }
    ```

=== "Rust"

    ```rust title="my_heap.rs"
    /* コンストラクタ：入力リストからヒープを構築する */
    fn new(nums: Vec<i32>) -> Self {
        // リストの要素をそのままヒープに追加する
        let mut heap = MaxHeap { max_heap: nums };
        // 葉ノード以外の全ノードをヒープ化する
        for i in (0..=Self::parent(heap.size() - 1)).rev() {
            heap.sift_down(i);
        }
        heap
    }
    ```

=== "C"

    ```c title="my_heap.c"
    /* コンストラクタ：スライスからヒープを構築する */
    MaxHeap *newMaxHeap(int nums[], int size) {
        // すべての要素をヒープに挿入する
        MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
        maxHeap->size = size;
        memcpy(maxHeap->data, nums, size * sizeof(int));
        for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
            // 葉ノード以外の全ノードをヒープ化する
            siftDown(maxHeap, i);
        }
        return maxHeap;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_heap.kt"
    /* 最大ヒープ */
    class MaxHeap(nums: MutableList<Int>?) {
        // 配列ではなくリストを使うため、容量の拡張を考慮する必要がない
        private val maxHeap = mutableListOf<Int>()

        /* コンストラクタ：入力リストからヒープを構築する */
        init {
            // リストの要素をそのままヒープに追加する
            maxHeap.addAll(nums!!)
            // 葉ノード以外の全ノードをヒープ化する
            for (i in parent(size() - 1) downTo 0) {
                siftDown(i)
            }
        }

        /* 左の子のインデックスを取得 */
        private fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* 右の子のインデックスを取得 */
        private fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* 親のインデックスを取得 */
        private fun parent(i: Int): Int {
            return (i - 1) / 2 // 切り捨て除算
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

        /* ヒープが空か判定 */
        fun isEmpty(): Boolean {
            /* ヒープが空か判定 */
            return size() == 0
        }

        /* ヒープの先頭要素にアクセスする */
        fun peek(): Int {
            return maxHeap[0]
        }

        /* ヒープに要素を挿入する */
        fun push(_val: Int) {
            // ノードを追加する
            maxHeap.add(_val)
            // 下から上へヒープ化する
            siftUp(size() - 1)
        }

        /* ノード i から上向きにヒープ化する */
        private fun siftUp(it: Int) {
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
        private fun siftDown(it: Int) {
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

        /* ヒープ（二分木）を表示する */
        fun print() {
            val queue = PriorityQueue { a: Int, b: Int -> b - a }
            queue.addAll(maxHeap)
            printHeap(queue)
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_heap.rb"
    ### コンストラクタ：入力リストからヒープを構築する ###
    def initialize(nums)
      # リストの要素をそのままヒープに追加する
      @max_heap = nums
      # 葉ノード以外の全ノードをヒープ化する
      parent(size - 1).downto(0) do |i|
        sift_down(i)
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%EF%BC%9A%E5%85%A5%E5%8A%9B%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E4%BB%A5%E5%A4%96%E3%81%AE%E5%85%A8%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8B%E3%82%89%E4%B8%8B%E5%90%91%E3%81%8D%E3%81%AB%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i,%20l,%20r%20%E3%81%AE%E3%81%86%E3%81%A1%E5%80%A4%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%B1%82%E3%82%81%E3%80%81ma%20%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%8B%E6%B7%BB%E5%AD%97%20l,%20r%20%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%80%81%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%AF%E4%B8%8D%E8%A6%81%E3%81%AA%E3%81%AE%E3%81%A7%E7%B5%82%E4%BA%86%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8B%E5%90%91%E3%81%8D%E3%81%AE%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MaxHeap%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%EF%BC%9A%E5%85%A5%E5%8A%9B%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self.max_heap%20%3D%20nums%0A%20%20%20%20%20%20%20%20%23%20%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E4%BB%A5%E5%A4%96%E3%81%AE%E5%85%A8%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.parent%28self.size%28%29%20-%201%29,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.sift_down%28i%29%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B7%A6%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%8F%B3%E3%81%AE%E5%AD%90%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%AA%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8F%96%E5%BE%97%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%20%20%23%20%E5%88%87%E3%82%8A%E6%8D%A8%E3%81%A6%E9%99%A4%E7%AE%97%0A%0A%20%20%20%20def%20swap%28self,%20i%3A%20int,%20j%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20self.max_heap%5Bi%5D,%20self.max_heap%5Bj%5D%20%3D%20self.max_heap%5Bj%5D,%20self.max_heap%5Bi%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self.max_heap%29%0A%0A%20%20%20%20def%20sift_down%28self,%20i%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8B%E3%82%89%E4%B8%8B%E5%90%91%E3%81%8D%E3%81%AB%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20while%20True%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i,%20l,%20r%20%E3%81%AE%E3%81%86%E3%81%A1%E5%80%A4%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%B1%82%E3%82%81%E3%80%81ma%20%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20l,%20r,%20ma%20%3D%20self.left%28i%29,%20self.right%28i%29,%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20l%20%3C%20self.size%28%29%20and%20self.max_heap%5Bl%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20l%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20r%20%3C%20self.size%28%29%20and%20self.max_heap%5Br%5D%20%3E%20self.max_heap%5Bma%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ma%20%3D%20r%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20i%20%E3%81%8C%E6%9C%80%E5%A4%A7%E3%81%8B%E6%B7%BB%E5%AD%97%20l,%20r%20%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%80%81%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%81%AF%E4%B8%8D%E8%A6%81%E3%81%AA%E3%81%AE%E3%81%A7%E7%B5%82%E4%BA%86%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20ma%20%3D%3D%20i%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20self.swap%28i,%20ma%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8B%E5%90%91%E3%81%8D%E3%81%AE%E3%83%92%E3%83%BC%E3%83%97%E5%8C%96%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20ma%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20max_heap%20%3D%20MaxHeap%28%5B1,%202,%203,%204,%205%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 8.2.3 &nbsp; 計算量の解析

二つ目の構築方法の時間計算量を求めてみましょう。

- 完全二分木のノード数を $n$ とすると、葉ノード数は $(n + 1) / 2$ です。ここで $/$ は切り捨ての整数除算です。したがって、ヒープ化が必要なノード数は $n / 2$ です。
- 上から下へのヒープ化では、各ノードは最大でも葉まで移動するため、反復回数の最大値は木の高さ $\log n$ です。

両者を掛けると、構築の時間計算量は $O(n \log n)$ となります。**ただし、この見積もりは正確ではありません。木の下の層には上の層よりはるかに多くのノードがあることを考慮していないためです**。

より正確に計算しましょう。計算を簡単にするため、ノード数 $n$、高さ $h$ のパーフェクト二分木を仮定します。この仮定は結果の正しさに影響しません。

![パーフェクト二分木の各層のノード数](build_heap.assets/heapify_operations_count.png){ class="animation-figure" }

<p align="center"> 図 8-5 &nbsp; パーフェクト二分木の各層のノード数 </p>

図 8-5 のように、上から下へヒープ化するときの最大反復回数は、そのノードから葉までの距離、つまりノードの高さです。各層の「ノード数 $\times$ ノードの高さ」を足せば、**すべてのノードのヒープ化の反復回数の合計**が得られます。

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

この式の整理には、学校で学ぶ数列の知識を使います。まず $T(h)$ を $2$ 倍します。

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^{h}\times1 \newline
\end{aligned}
$$

項をずらして引き算し、下の式 $2 T(h)$ から上の式 $T(h)$ を引くと、次のようになります。

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

この式の $T(h)$ には等比数列が現れるので、和の公式を使うと時間計算量は次のようになります。

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

さらに、高さ $h$ のパーフェクト二分木のノード数は $n = 2^{h+1} - 1$ なので、$O(2^h) = O(n)$ と分かります。したがって、**リストを入力してヒープを構築する時間計算量は $O(n)$ で、非常に効率的です**。
