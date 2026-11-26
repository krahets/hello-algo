---
comments: true
---

# 8.3 &nbsp; Top-k 問題

!!! question "問題"

    長さ $n$ の未整列配列 `nums` が与えられます。配列の中で大きいほうから $k$ 個の要素を返してください。

この問題について、まず考え方の分かりやすい 2 つの解法を紹介し、続いてヒープを使ったより効率的な解法を説明します。

## 8.3.1 &nbsp; 方法 1：走査して選ぶ

図 8-6 のように $k$ 回走査し、各回で $1$ 番目、$2$ 番目、$\dots$、$k$ 番目に大きい要素を順に取り出せます。時間計算量は $O(nk)$ です。

この方法が適しているのは $k \ll n$ の場合だけです。$k$ が $n$ に近づくと時間計算量が $O(n^2)$ に近づき、非常に時間がかかります。

![走査で上位 k 個の要素を求める](top_k.assets/top_k_traversal.svg){ class="animation-figure" }

<p align="center"> 図 8-6 &nbsp; 走査で上位 k 個の要素を求める </p>

!!! tip "ヒント"

    $k = n$ のときには、要素全体が並んだ整列済みの列が得られます。これは「選択ソート」と同等です。

## 8.3.2 &nbsp; 方法 2：ソート

図 8-7 のように、まず配列 `nums` をソートしてから右端の $k$ 個の要素を返せます。時間計算量は $O(n \log n)$ です。

この方法では必要以上の仕事をしています。欲しいのは上位 $k$ 個の要素だけで、それ以外の要素をソートする必要はないからです。

![ソートで上位 k 個の要素を求める](top_k.assets/top_k_sorting.svg){ class="animation-figure" }

<p align="center"> 図 8-7 &nbsp; ソートで上位 k 個の要素を求める </p>

## 8.3.3 &nbsp; 方法 3：ヒープ

ヒープを使うと、Top-k 問題をさらに効率よく解けます。手順を図 8-8 に示します。

1. 最小ヒープを初期化します。根の要素が最小値になります。
2. まず配列の先頭 $k$ 個の要素を順にヒープに入れます。
3. $k + 1$ 番目の要素からは、現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を入れます。
4. 走査が終わると、ヒープに残っているのが上位 $k$ 個の要素です。

=== "<1>"
    ![ヒープで上位 k 個の要素を求める](top_k.assets/top_k_heap_step1.svg){ class="animation-figure" }

=== "<2>"
    ![top_k_heap_step2](top_k.assets/top_k_heap_step2.svg){ class="animation-figure" }

=== "<3>"
    ![top_k_heap_step3](top_k.assets/top_k_heap_step3.svg){ class="animation-figure" }

=== "<4>"
    ![top_k_heap_step4](top_k.assets/top_k_heap_step4.svg){ class="animation-figure" }

=== "<5>"
    ![top_k_heap_step5](top_k.assets/top_k_heap_step5.svg){ class="animation-figure" }

=== "<6>"
    ![top_k_heap_step6](top_k.assets/top_k_heap_step6.svg){ class="animation-figure" }

=== "<7>"
    ![top_k_heap_step7](top_k.assets/top_k_heap_step7.svg){ class="animation-figure" }

=== "<8>"
    ![top_k_heap_step8](top_k.assets/top_k_heap_step8.svg){ class="animation-figure" }

=== "<9>"
    ![top_k_heap_step9](top_k.assets/top_k_heap_step9.svg){ class="animation-figure" }

<p align="center"> 図 8-8 &nbsp; ヒープで上位 k 個の要素を求める </p>

コード例は次のとおりです。

=== "Python"

    ```python title="top_k.py"
    def top_k_heap(nums: list[int], k: int) -> list[int]:
        """ヒープを使って配列の上位 k 個の要素を求める"""
        # 最小ヒープを初期化する
        heap = []
        # 配列の先頭 k 個の要素をヒープに入れる
        for i in range(k):
            heapq.heappush(heap, nums[i])
        # k+1 番目の要素からはヒープのサイズを k に保つ
        for i in range(k, len(nums)):
            # 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if nums[i] > heap[0]:
                heapq.heappop(heap)
                heapq.heappush(heap, nums[i])
        return heap
    ```

=== "C++"

    ```cpp title="top_k.cpp"
    /* ヒープを使って配列の上位 k 個の要素を求める */
    priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
        // 最小ヒープを初期化する
        priority_queue<int, vector<int>, greater<int>> heap;
        // 配列の先頭 k 個の要素をヒープに入れる
        for (int i = 0; i < k; i++) {
            heap.push(nums[i]);
        }
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for (int i = k; i < nums.size(); i++) {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if (nums[i] > heap.top()) {
                heap.pop();
                heap.push(nums[i]);
            }
        }
        return heap;
    }
    ```

=== "Java"

    ```java title="top_k.java"
    /* ヒープを使って配列の上位 k 個の要素を求める */
    Queue<Integer> topKHeap(int[] nums, int k) {
        // 最小ヒープを初期化する
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // 配列の先頭 k 個の要素をヒープに入れる
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for (int i = k; i < nums.length; i++) {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if (nums[i] > heap.peek()) {
                heap.poll();
                heap.offer(nums[i]);
            }
        }
        return heap;
    }
    ```

=== "C#"

    ```csharp title="top_k.cs"
    /* ヒープを使って配列の上位 k 個の要素を求める */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // 最小ヒープを初期化する
        PriorityQueue<int, int> heap = new();
        // 配列の先頭 k 個の要素をヒープに入れる
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for (int i = k; i < nums.Length; i++) {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if (nums[i] > heap.Peek()) {
                heap.Dequeue();
                heap.Enqueue(nums[i], nums[i]);
            }
        }
        return heap;
    }
    ```

=== "Go"

    ```go title="top_k.go"
    /* ヒープを使って配列の上位 k 個の要素を求める */
    func topKHeap(nums []int, k int) *minHeap {
        // 最小ヒープを初期化する
        h := &minHeap{}
        heap.Init(h)
        // 配列の先頭 k 個の要素をヒープに入れる
        for i := 0; i < k; i++ {
            heap.Push(h, nums[i])
        }
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for i := k; i < len(nums); i++ {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if nums[i] > h.Top().(int) {
                heap.Pop(h)
                heap.Push(h, nums[i])
            }
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="top_k.swift"
    /* ヒープを使って配列の上位 k 個の要素を求める */
    func topKHeap(nums: [Int], k: Int) -> [Int] {
        // 最小ヒープを初期化し、先頭 k 個の要素からヒープを構築する
        var heap = Heap(nums.prefix(k))
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for i in nums.indices.dropFirst(k) {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if nums[i] > heap.min()! {
                _ = heap.removeMin()
                heap.insert(nums[i])
            }
        }
        return heap.unordered
    }
    ```

=== "JS"

    ```javascript title="top_k.js"
    /* 要素をヒープに挿入する */
    function pushMinHeap(maxHeap, val) {
        // 要素の符号を反転する
        maxHeap.push(-val);
    }

    /* 根の要素をヒープから取り出す */
    function popMinHeap(maxHeap) {
        // 要素の符号を反転する
        return -maxHeap.pop();
    }

    /* ヒープの根の要素を参照する */
    function peekMinHeap(maxHeap) {
        // 要素の符号を反転する
        return -maxHeap.peek();
    }

    /* ヒープから要素を取り出す */
    function getMinHeap(maxHeap) {
        // 要素の符号を反転する
        return maxHeap.getMaxHeap().map((num) => -num);
    }

    /* ヒープを使って配列の上位 k 個の要素を求める */
    function topKHeap(nums, k) {
        // 最小ヒープを初期化する
        // すべての要素の符号を反転し、最大ヒープで最小ヒープを模擬する
        const maxHeap = new MaxHeap([]);
        // 配列の先頭 k 個の要素をヒープに入れる
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for (let i = k; i < nums.length; i++) {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // ヒープ内の要素を返す
        return getMinHeap(maxHeap);
    }
    ```

=== "TS"

    ```typescript title="top_k.ts"
    /* 要素をヒープに挿入する */
    function pushMinHeap(maxHeap: MaxHeap, val: number): void {
        // 要素の符号を反転する
        maxHeap.push(-val);
    }

    /* 根の要素をヒープから取り出す */
    function popMinHeap(maxHeap: MaxHeap): number {
        // 要素の符号を反転する
        return -maxHeap.pop();
    }

    /* ヒープの根の要素を参照する */
    function peekMinHeap(maxHeap: MaxHeap): number {
        // 要素の符号を反転する
        return -maxHeap.peek();
    }

    /* ヒープから要素を取り出す */
    function getMinHeap(maxHeap: MaxHeap): number[] {
        // 要素の符号を反転する
        return maxHeap.getMaxHeap().map((num: number) => -num);
    }

    /* ヒープを使って配列の上位 k 個の要素を求める */
    function topKHeap(nums: number[], k: number): number[] {
        // 最小ヒープを初期化する
        // すべての要素の符号を反転し、最大ヒープで最小ヒープを模擬する
        const maxHeap = new MaxHeap([]);
        // 配列の先頭 k 個の要素をヒープに入れる
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for (let i = k; i < nums.length; i++) {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // ヒープ内の要素を返す
        return getMinHeap(maxHeap);
    }
    ```

=== "Dart"

    ```dart title="top_k.dart"
    /* ヒープを使って配列の上位 k 個の要素を求める */
    MinHeap topKHeap(List<int> nums, int k) {
      // 最小ヒープを初期化し、配列の先頭 k 個の要素を挿入する
      MinHeap heap = MinHeap(nums.sublist(0, k));
      // k+1 番目の要素からはヒープのサイズを k に保つ
      for (int i = k; i < nums.length; i++) {
        // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
        if (nums[i] > heap.peek()) {
          heap.pop();
          heap.push(nums[i]);
        }
      }
      return heap;
    }
    ```

=== "Rust"

    ```rust title="top_k.rs"
    /* ヒープを使って配列の上位 k 個の要素を求める */
    fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
        // BinaryHeap は最大ヒープなので、Reverse で要素の大小関係を反転して最小ヒープを実現する
        let mut heap = BinaryHeap::<Reverse<i32>>::new();
        // 配列の先頭 k 個の要素をヒープに入れる
        for &num in nums.iter().take(k) {
            heap.push(Reverse(num));
        }
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for &num in nums.iter().skip(k) {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if num > heap.peek().unwrap().0 {
                heap.pop();
                heap.push(Reverse(num));
            }
        }
        heap
    }
    ```

=== "C"

    ```c title="top_k.c"
    /* 要素をヒープに挿入する */
    void pushMinHeap(MaxHeap *maxHeap, int val) {
        // 要素の符号を反転する
        push(maxHeap, -val);
    }

    /* 根の要素をヒープから取り出す */
    int popMinHeap(MaxHeap *maxHeap) {
        // 要素の符号を反転する
        return -pop(maxHeap);
    }

    /* ヒープの根の要素を参照する */
    int peekMinHeap(MaxHeap *maxHeap) {
        // 要素の符号を反転する
        return -peek(maxHeap);
    }

    /* ヒープから要素を取り出す */
    int *getMinHeap(MaxHeap *maxHeap) {
        // ヒープの全要素の符号を反転し、配列 res に格納する
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    /* ヒープを使って配列の上位 k 個の要素を求める関数 */
    int *topKHeap(int *nums, int sizeNums, int k) {
        // 最小ヒープを初期化する
        // すべての要素の符号を反転し、最大ヒープで最小ヒープを模擬する
        int *empty = (int *)malloc(0);
        MaxHeap *maxHeap = newMaxHeap(empty, 0);
        // 配列の先頭 k 個の要素をヒープに入れる
        for (int i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for (int i = k; i < sizeNums; i++) {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        int *res = getMinHeap(maxHeap);
        // メモリを解放する
        delMaxHeap(maxHeap);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="top_k.kt"
    /* ヒープを使って配列の上位 k 個の要素を求める */
    fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
        // 最小ヒープを初期化する
        val heap = PriorityQueue<Int>()
        // 配列の先頭 k 個の要素をヒープに入れる
        for (i in 0..<k) {
            heap.offer(nums[i])
        }
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for (i in k..<nums.size) {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
            if (nums[i] > heap.peek()) {
                heap.poll()
                heap.offer(nums[i])
            }
        }
        return heap
    }
    ```

=== "Ruby"

    ```ruby title="top_k.rb"
    ### ヒープを使って配列の上位 k 個の要素を求める ###
    def top_k_heap(nums, k)
      # 最小ヒープを初期化する
      # すべての要素の符号を反転し、最大ヒープで最小ヒープを模擬する
      max_heap = MaxHeap.new([])

      # 配列の先頭 k 個の要素をヒープに入れる
      for i in 0...k
        push_min_heap(max_heap, nums[i])
      end

      # k+1 番目の要素からはヒープのサイズを k に保つ
      for i in k...nums.length
        # 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
        if nums[i] > peek_min_heap(max_heap)
          pop_min_heap(max_heap)
          push_min_heap(max_heap, nums[i])
        end
      end

      get_min_heap(max_heap)
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0Adef%20top_k_heap%28nums%3A%20list%5Bint%5D,%20k%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E9%85%8D%E5%88%97%E3%81%AE%E4%B8%8A%E4%BD%8D%20k%20%E5%80%8B%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%22%22%22%0A%20%20%20%20%23%20%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20heap%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%20k%20%E5%80%8B%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E5%85%A5%E3%82%8C%E3%82%8B%0A%20%20%20%20for%20i%20in%20range%28k%29%3A%0A%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20%23%20k%2B1%20%E7%95%AA%E7%9B%AE%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8B%E3%82%89%E3%81%AF%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%20k%20%E3%81%AB%E4%BF%9D%E3%81%A4%0A%20%20%20%20for%20i%20in%20range%28k,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E6%A0%B9%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%88%E3%82%8A%E5%A4%A7%E3%81%8D%E3%81%91%E3%82%8C%E3%81%B0%E3%80%81%E6%A0%B9%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%A6%E7%8F%BE%E5%9C%A8%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3E%20heap%5B0%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappop%28heap%29%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20return%20heap%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%207,%206,%203,%202%5D%0A%20%20%20%20k%20%3D%203%0A%0A%20%20%20%20res%20%3D%20top_k_heap%28nums,%20k%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0Adef%20top_k_heap%28nums%3A%20list%5Bint%5D,%20k%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E9%85%8D%E5%88%97%E3%81%AE%E4%B8%8A%E4%BD%8D%20k%20%E5%80%8B%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%22%22%22%0A%20%20%20%20%23%20%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20heap%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%E3%81%AE%E5%85%88%E9%A0%AD%20k%20%E5%80%8B%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E5%85%A5%E3%82%8C%E3%82%8B%0A%20%20%20%20for%20i%20in%20range%28k%29%3A%0A%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20%23%20k%2B1%20%E7%95%AA%E7%9B%AE%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8B%E3%82%89%E3%81%AF%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E3%82%B5%E3%82%A4%E3%82%BA%E3%82%92%20k%20%E3%81%AB%E4%BF%9D%E3%81%A4%0A%20%20%20%20for%20i%20in%20range%28k,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E6%A0%B9%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%88%E3%82%8A%E5%A4%A7%E3%81%8D%E3%81%91%E3%82%8C%E3%81%B0%E3%80%81%E6%A0%B9%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%A6%E7%8F%BE%E5%9C%A8%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3E%20heap%5B0%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappop%28heap%29%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappush%28heap,%20nums%5Bi%5D%29%0A%20%20%20%20return%20heap%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%207,%206,%203,%202%5D%0A%20%20%20%20k%20%3D%203%0A%0A%20%20%20%20res%20%3D%20top_k_heap%28nums,%20k%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

挿入と取り出しを扱う反復は合計 $n$ 回で、ヒープの長さは最大 $k$ なので、時間計算量は $O(n \log k)$ です。この方法は効率がよく、$k$ が小さいときは時間計算量が $O(n)$ に近づきます。$k$ が大きいときも $O(n \log n)$ を超えません。

また、この方法はデータが次々に届くストリームにも適しています。新しいデータが加わるたびにヒープの中身を調整することで、上位 $k$ 個の要素を動的に更新できます。
