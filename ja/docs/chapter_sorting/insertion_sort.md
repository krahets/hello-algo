---
comments: true
---

# 11.4 &nbsp; 挿入ソート

<u>挿入ソート（insertion sort）</u>は単純なソートアルゴリズムで、その仕組みは手作業でトランプを並べる過程によく似ています。

具体的には、未整列区間から基準となる要素を一つ選び、左側の整列済み区間の要素と順に比較して、正しい位置へ挿入します。

図 11-6 は配列に要素を挿入する操作の流れです。基準の要素を `base` とすると、挿入先のインデックスから `base` までの要素をすべて一つ右へ移動し、挿入先のインデックスに `base` を代入します。

![一回の挿入操作](insertion_sort.assets/insertion_operation.png){ class="animation-figure" }

<p align="center"> 図 11-6 &nbsp; 一回の挿入操作 </p>

## 11.4.1 &nbsp; アルゴリズムの流れ

挿入ソート全体の流れを図 11-7 に示します。

1. 初期状態では、配列の 1 番目の要素は整列済みとします。
2. 2 番目の要素を `base` として正しい位置に挿入すると、**先頭の 2 要素が整列済みになります**。
3. 3 番目の要素を `base` として正しい位置に挿入すると、**先頭の 3 要素が整列済みになります**。
4. 同様に繰り返し、最後の要素を `base` として正しい位置に挿入すると、**すべての要素が整列済みになります**。

![挿入ソートの流れ](insertion_sort.assets/insertion_sort_overview.png){ class="animation-figure" }

<p align="center"> 図 11-7 &nbsp; 挿入ソートの流れ </p>

コード例は次のとおりです。

=== "Python"

    ```python title="insertion_sort.py"
    def insertion_sort(nums: list[int]):
        """挿入ソート"""
        # 外側のループ：ソート済み区間は [0, i-1]
        for i in range(1, len(nums)):
            base = nums[i]
            j = i - 1
            # 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while j >= 0 and nums[j] > base:
                nums[j + 1] = nums[j]  # nums[j] を右に 1 つずらす
                j -= 1
            nums[j + 1] = base  # 正しい位置に base を代入する
    ```

=== "C++"

    ```cpp title="insertion_sort.cpp"
    /* 挿入ソート */
    void insertionSort(vector<int> &nums) {
        // 外側のループ：ソート済み区間は [0, i-1]
        for (int i = 1; i < nums.size(); i++) {
            int base = nums[i], j = i - 1;
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // nums[j] を右に 1 つずらす
                j--;
            }
            nums[j + 1] = base; // 正しい位置に base を代入する
        }
    }
    ```

=== "Java"

    ```java title="insertion_sort.java"
    /* 挿入ソート */
    void insertionSort(int[] nums) {
        // 外側のループ：ソート済み区間は [0, i-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // nums[j] を右に 1 つずらす
                j--;
            }
            nums[j + 1] = base;        // 正しい位置に base を代入する
        }
    }
    ```

=== "C#"

    ```csharp title="insertion_sort.cs"
    /* 挿入ソート */
    void InsertionSort(int[] nums) {
        // 外側のループ：ソート済み区間は [0, i-1]
        for (int i = 1; i < nums.Length; i++) {
            int bas = nums[i], j = i - 1;
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while (j >= 0 && nums[j] > bas) {
                nums[j + 1] = nums[j]; // nums[j] を右に 1 つずらす
                j--;
            }
            nums[j + 1] = bas;         // 正しい位置に base を代入する
        }
    }
    ```

=== "Go"

    ```go title="insertion_sort.go"
    /* 挿入ソート */
    func insertionSort(nums []int) {
        // 外側のループ：ソート済み区間は [0, i-1]
        for i := 1; i < len(nums); i++ {
            base := nums[i]
            j := i - 1
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            for j >= 0 && nums[j] > base {
                nums[j+1] = nums[j] // nums[j] を右に 1 つずらす
                j--
            }
            nums[j+1] = base // 正しい位置に base を代入する
        }
    }
    ```

=== "Swift"

    ```swift title="insertion_sort.swift"
    /* 挿入ソート */
    func insertionSort(nums: inout [Int]) {
        // 外側のループ：ソート済み区間は [0, i-1]
        for i in nums.indices.dropFirst() {
            let base = nums[i]
            var j = i - 1
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while j >= 0, nums[j] > base {
                nums[j + 1] = nums[j] // nums[j] を右に 1 つずらす
                j -= 1
            }
            nums[j + 1] = base // 正しい位置に base を代入する
        }
    }
    ```

=== "JS"

    ```javascript title="insertion_sort.js"
    /* 挿入ソート */
    function insertionSort(nums) {
        // 外側のループ：ソート済み区間は [0, i-1]
        for (let i = 1; i < nums.length; i++) {
            let base = nums[i],
                j = i - 1;
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // nums[j] を右に 1 つずらす
                j--;
            }
            nums[j + 1] = base; // 正しい位置に base を代入する
        }
    }
    ```

=== "TS"

    ```typescript title="insertion_sort.ts"
    /* 挿入ソート */
    function insertionSort(nums: number[]): void {
        // 外側のループ：ソート済み区間は [0, i-1]
        for (let i = 1; i < nums.length; i++) {
            const base = nums[i];
            let j = i - 1;
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // nums[j] を右に 1 つずらす
                j--;
            }
            nums[j + 1] = base; // 正しい位置に base を代入する
        }
    }
    ```

=== "Dart"

    ```dart title="insertion_sort.dart"
    /* 挿入ソート */
    void insertionSort(List<int> nums) {
      // 外側のループ：ソート済み区間は [0, i-1]
      for (int i = 1; i < nums.length; i++) {
        int base = nums[i], j = i - 1;
        // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
        while (j >= 0 && nums[j] > base) {
          nums[j + 1] = nums[j]; // nums[j] を右に 1 つずらす
          j--;
        }
        nums[j + 1] = base; // 正しい位置に base を代入する
      }
    }
    ```

=== "Rust"

    ```rust title="insertion_sort.rs"
    /* 挿入ソート */
    fn insertion_sort(nums: &mut [i32]) {
        // 外側のループ：ソート済み区間は [0, i-1]
        for i in 1..nums.len() {
            let (base, mut j) = (nums[i], (i - 1) as i32);
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while j >= 0 && nums[j as usize] > base {
                nums[(j + 1) as usize] = nums[j as usize]; // nums[j] を右に 1 つずらす
                j -= 1;
            }
            nums[(j + 1) as usize] = base; // 正しい位置に base を代入する
        }
    }
    ```

=== "C"

    ```c title="insertion_sort.c"
    /* 挿入ソート */
    void insertionSort(int nums[], int size) {
        // 外側のループ：ソート済み区間は [0, i-1]
        for (int i = 1; i < size; i++) {
            int base = nums[i], j = i - 1;
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while (j >= 0 && nums[j] > base) {
                // nums[j] を右に 1 つずらす
                nums[j + 1] = nums[j];
                j--;
            }
            // 正しい位置に base を代入する
            nums[j + 1] = base;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="insertion_sort.kt"
    /* 挿入ソート */
    fun insertionSort(nums: IntArray) {
        //外側のループ：ソート済みの要素は 1, 2, ..., n
        for (i in nums.indices) {
            val base = nums[i]
            var j = i - 1
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j] // nums[j] を右に 1 つずらす
                j--
            }
            nums[j + 1] = base        // 正しい位置に base を代入する
        }
    }
    ```

=== "Ruby"

    ```ruby title="insertion_sort.rb"
    ### 挿入ソート ###
    def insertion_sort(nums)
      n = nums.length
      # 外側のループ：ソート済み区間は [0, i-1]
      for i in 1...n
        base = nums[i]
        j = i - 1
        # 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
        while j >= 0 && nums[j] > base
          nums[j + 1] = nums[j] # nums[j] を右に 1 つずらす
          j -= 1
        end
        nums[j + 1] = base # 正しい位置に base を代入する
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 513px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20insertion_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%8C%BF%E5%85%A5%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20%E5%A4%96%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E3%82%BD%E3%83%BC%E3%83%88%E6%B8%88%E3%81%BF%E5%8C%BA%E9%96%93%E3%81%AF%20%5B0,%20i-1%5D%0A%20%20%20%20for%20i%20in%20range%281,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20base%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E3%82%BD%E3%83%BC%E3%83%88%E6%B8%88%E3%81%BF%E5%8C%BA%E9%96%93%20%5B0,%20i-1%5D%20%E3%81%AE%E6%AD%A3%E3%81%97%E3%81%84%E4%BD%8D%E7%BD%AE%E3%81%AB%20base%20%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20while%20j%20%3E%3D%200%20and%20nums%5Bj%5D%20%3E%20base%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%5D%20%20%23%20nums%5Bj%5D%20%E3%82%92%E5%8F%B3%E3%81%AB%201%20%E3%81%A4%E3%81%9A%E3%82%89%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20base%20%20%23%20%E6%AD%A3%E3%81%97%E3%81%84%E4%BD%8D%E7%BD%AE%E3%81%AB%20base%20%E3%82%92%E4%BB%A3%E5%85%A5%E3%81%99%E3%82%8B%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20insertion_sort%28nums%29%0A%20%20%20%20print%28%22%E6%8C%BF%E5%85%A5%E3%82%BD%E3%83%BC%E3%83%88%E5%AE%8C%E4%BA%86%E5%BE%8C%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20insertion_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E6%8C%BF%E5%85%A5%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20%E5%A4%96%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E3%82%BD%E3%83%BC%E3%83%88%E6%B8%88%E3%81%BF%E5%8C%BA%E9%96%93%E3%81%AF%20%5B0,%20i-1%5D%0A%20%20%20%20for%20i%20in%20range%281,%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20base%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E3%82%BD%E3%83%BC%E3%83%88%E6%B8%88%E3%81%BF%E5%8C%BA%E9%96%93%20%5B0,%20i-1%5D%20%E3%81%AE%E6%AD%A3%E3%81%97%E3%81%84%E4%BD%8D%E7%BD%AE%E3%81%AB%20base%20%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20while%20j%20%3E%3D%200%20and%20nums%5Bj%5D%20%3E%20base%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%5D%20%20%23%20nums%5Bj%5D%20%E3%82%92%E5%8F%B3%E3%81%AB%201%20%E3%81%A4%E3%81%9A%E3%82%89%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20%20%20%20%20nums%5Bj%20%2B%201%5D%20%3D%20base%20%20%23%20%E6%AD%A3%E3%81%97%E3%81%84%E4%BD%8D%E7%BD%AE%E3%81%AB%20base%20%E3%82%92%E4%BB%A3%E5%85%A5%E3%81%99%E3%82%8B%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20insertion_sort%28nums%29%0A%20%20%20%20print%28%22%E6%8C%BF%E5%85%A5%E3%82%BD%E3%83%BC%E3%83%88%E5%AE%8C%E4%BA%86%E5%BE%8C%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 11.4.2 &nbsp; アルゴリズムの特徴

- **時間計算量は $O(n^2)$、適応的ソート**：最悪の場合、各挿入操作で必要な反復は $n - 1$、$n-2$、$\dots$、$2$、$1$ 回となり、合計は $(n - 1) n / 2$ なので、時間計算量は $O(n^2)$ です。整列済みのデータでは挿入操作が早く終了します。入力配列が完全に整列済みなら、最良時間計算量 $O(n)$ となります。
- **空間計算量は $O(1)$、インプレースソート**：ポインタ $i$ と $j$ は定数サイズの追加領域を使います。
- **安定ソート**：挿入操作では等しい要素の右側に挿入するため、それらの順序は変わりません。

## 11.4.3 &nbsp; 挿入ソートの利点

挿入ソートの時間計算量は $O(n^2)$ で、これから学ぶクイックソートは $O(n \log n)$ です。挿入ソートのほうが時間計算量は大きいものの、**データが少ない場合は、通常、挿入ソートのほうが速くなります**。

これは、線形探索と二分探索の適した状況についての結論と似ています。クイックソートのような $O(n \log n)$ のアルゴリズムは分割統治法に基づき、基本的な計算操作を多く含む傾向があります。データが少ないと $n^2$ と $n \log n$ の値は近く、計算量よりも各反復の基本操作数が決定的な役割を果たします。

実際、Java など多くのプログラミング言語の組み込みソート関数は挿入ソートを採用しています。おおむね、長い配列にはクイックソートなど分割統治法に基づく方法を使い、短い配列には挿入ソートを直接使います。

バブルソート、選択ソート、挿入ソートはいずれも時間計算量が $O(n^2)$ ですが、実際には**挿入ソートがほかの二つよりはるかによく使われます**。主な理由は次のとおりです。

- バブルソートは要素の交換を使うため、一時変数が必要で、基本操作を 3 回行います。一方、挿入ソートは要素への代入を使うため、基本操作は 1 回だけです。したがって、**通常、バブルソートの計算負荷は挿入ソートより大きくなります**。
- 選択ソートの時間計算量は、どのような場合も $O(n^2)$ です。**一部が整列済みのデータでは、通常、挿入ソートのほうが選択ソートより効率的です**。
- 選択ソートは不安定なので、複数の基準で段階的にソートする用途には使えません。
