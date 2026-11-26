---
comments: true
---

# 11.9 &nbsp; カウントソート

<u>カウントソート（counting sort）</u>は要素の出現回数を数えて並べ替える方法で、通常は整数の配列に使います。

## 11.9.1 &nbsp; 簡易版の実装

簡単な例を見てみましょう。長さ $n$ の配列 `nums` があり、要素はすべて非負整数とします。図 11-16 にカウントソートの流れを示します。

1. 配列を走査して最大値 $m$ を求め、長さ $m + 1$ の補助配列 `counter` を作成します。
2. **`counter` を使って `nums` の各数値の出現回数を数えます**。`counter[num]` は数値 `num` の出現回数です。数え方は簡単です。`nums` を走査し（現在の値を `num` とします）、各回で `counter[num]` を $1$ 増やすだけです。
3. **`counter` のインデックスは初めから順に並んでいるため、すべての値はすでに整列したも同然です**。あとは `counter` を走査し、小さい値から順に、出現回数だけ `nums` に書き込みます。

![カウントソートの流れ](counting_sort.assets/counting_sort_overview.svg){ class="animation-figure" }

<p align="center"> 図 11-16 &nbsp; カウントソートの流れ </p>

コードを次に示します。

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort_naive(nums: list[int]):
        """カウントソート"""
        # 簡易版。オブジェクトのソートには使えない
        # 1. 配列の最大値 m を求める
        m = max(nums)
        # 2. 各数値の出現回数を数える
        # counter[num] は num の出現回数を表す
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. counter を走査し、各要素を元の配列 nums に書き込む
        i = 0
        for num in range(m + 1):
            for _ in range(counter[num]):
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    void countingSortNaive(vector<int> &nums) {
        // 1. 配列の最大値 m を求める
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    void countingSortNaive(int[] nums) {
        // 1. 配列の最大値 m を求める
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    void CountingSortNaive(int[] nums) {
        // 1. 配列の最大値 m を求める
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Go"

    ```go title="counting_sort.go"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    func countingSortNaive(nums []int) {
        // 1. 配列の最大値 m を求める
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        for i, num := 0, 0; num < m+1; num++ {
            for j := 0; j < counter[num]; j++ {
                nums[i] = num
                i++
            }
        }
    }
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    func countingSortNaive(nums: inout [Int]) {
        // 1. 配列の最大値 m を求める
        let m = nums.max()!
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        var i = 0
        for num in 0 ..< m + 1 {
            for _ in 0 ..< counter[num] {
                nums[i] = num
                i += 1
            }
        }
    }
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    function countingSortNaive(nums) {
        // 1. 配列の最大値 m を求める
        let m = Math.max(...nums);
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        let i = 0;
        for (let num = 0; num < m + 1; num++) {
            for (let j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    function countingSortNaive(nums: number[]): void {
        // 1. 配列の最大値 m を求める
        let m: number = Math.max(...nums);
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        let i = 0;
        for (let num = 0; num < m + 1; num++) {
            for (let j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    void countingSortNaive(List<int> nums) {
      // 1. 配列の最大値 m を求める
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. 各数値の出現回数を数える
      // counter[_num] は _num の出現回数を表す
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. counter を走査し、各要素を元の配列 nums に書き込む
      int i = 0;
      for (int _num = 0; _num < m + 1; _num++) {
        for (int j = 0; j < counter[_num]; j++, i++) {
          nums[i] = _num;
        }
      }
    }
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    fn counting_sort_naive(nums: &mut [i32]) {
        // 1. 配列の最大値 m を求める
        let m = *nums.iter().max().unwrap();
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        let mut counter = vec![0; m as usize + 1];
        for &num in nums.iter() {
            counter[num as usize] += 1;
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        let mut i = 0;
        for num in 0..m + 1 {
            for _ in 0..counter[num as usize] {
                nums[i] = num;
                i += 1;
            }
        }
    }
    ```

=== "C"

    ```c title="counting_sort.c"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    void countingSortNaive(int nums[], int size) {
        // 1. 配列の最大値 m を求める
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        int *counter = calloc(m + 1, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
        // 4. メモリを解放
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    fun countingSortNaive(nums: IntArray) {
        // 1. 配列の最大値 m を求める
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        var i = 0
        for (num in 0..<m + 1) {
            var j = 0
            while (j < counter[num]) {
                nums[i] = num
                j++
                i++
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    ### カウントソート ###
    def counting_sort_naive(nums)
      # 簡易版。オブジェクトのソートには使えない
      # 1. 配列の最大値 m を求める
      m = 0
      nums.each { |num| m = [m, num].max }
      # 2. 各数値の出現回数を数える
      # counter[num] は num の出現回数を表す
      counter = Array.new(m + 1, 0)
      nums.each { |num| counter[num] += 1 }
      # 3. counter を走査し、各要素を元の配列 nums に書き込む
      i = 0
      for num in 0...(m + 1)
        (0...counter[num]).each do
          nums[i] = num
          i += 1
        end
      end
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20%E7%B0%A1%E6%98%93%E7%89%88%E3%80%82%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AE%E3%82%BD%E3%83%BC%E3%83%88%E3%81%AB%E3%81%AF%E4%BD%BF%E3%81%88%E3%81%AA%E3%81%84%0A%20%20%20%20%23%201.%20%E9%85%8D%E5%88%97%E3%81%AE%E6%9C%80%E5%A4%A7%E5%80%A4%20m%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m,%20num%29%0A%20%20%20%20%23%202.%20%E5%90%84%E6%95%B0%E5%80%A4%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E6%95%B0%E3%81%88%E3%82%8B%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E3%81%AF%20num%20%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E8%A1%A8%E3%81%99%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20counter%20%E3%82%92%E8%B5%B0%E6%9F%BB%E3%81%97%E3%80%81%E5%90%84%E8%A6%81%E7%B4%A0%E3%82%92%E5%85%83%E3%81%AE%E9%85%8D%E5%88%97%20nums%20%E3%81%AB%E6%9B%B8%E3%81%8D%E8%BE%BC%E3%82%80%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%88%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AF%E5%AF%BE%E8%B1%A1%E5%A4%96%EF%BC%89%E5%BE%8C%E3%81%AE%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20%E7%B0%A1%E6%98%93%E7%89%88%E3%80%82%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AE%E3%82%BD%E3%83%BC%E3%83%88%E3%81%AB%E3%81%AF%E4%BD%BF%E3%81%88%E3%81%AA%E3%81%84%0A%20%20%20%20%23%201.%20%E9%85%8D%E5%88%97%E3%81%AE%E6%9C%80%E5%A4%A7%E5%80%A4%20m%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m,%20num%29%0A%20%20%20%20%23%202.%20%E5%90%84%E6%95%B0%E5%80%A4%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E6%95%B0%E3%81%88%E3%82%8B%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E3%81%AF%20num%20%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E8%A1%A8%E3%81%99%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20counter%20%E3%82%92%E8%B5%B0%E6%9F%BB%E3%81%97%E3%80%81%E5%90%84%E8%A6%81%E7%B4%A0%E3%82%92%E5%85%83%E3%81%AE%E9%85%8D%E5%88%97%20nums%20%E3%81%AB%E6%9B%B8%E3%81%8D%E8%BE%BC%E3%82%80%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%88%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AF%E5%AF%BE%E8%B1%A1%E5%A4%96%EF%BC%89%E5%BE%8C%E3%81%AE%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

!!! note "カウントソートとバケットソートの関係"

    バケットソートの観点から見ると、カウント配列 `counter` の各インデックスが 1 個のバケットにあたり、出現回数を数える操作は各要素を対応するバケットに振り分けることにあたります。つまり、カウントソートは整数データに対するバケットソートの特殊な場合です。

## 11.9.2 &nbsp; 完全版の実装

お気づきかもしれませんが、**入力データがオブジェクトの場合、先ほどのステップ `3.` は使えません**。たとえば商品オブジェクトを価格（クラスのメンバー変数）で並べ替えたいとします。先ほどのアルゴリズムで得られるのは、価格だけを並べ替えた結果です。

元のデータそのものを並べ替えるにはどうすればよいでしょうか。まず `counter` の「累積和」を求めます。インデックス `i` の累積和 `prefix[i]` は、配列の先頭から `i + 1` 個の要素を足したものです。

$$
\text{prefix}[i] = \sum_{j=0}^i \text{counter[j]}
$$

**この累積和から、要素 `num` が結果配列 `res` 内で最後に現れるインデックスは `prefix[num] - 1` だとわかります**。これで各要素の書き込み先が決まります。次に元の配列 `nums` の要素 `num` を逆順に走査し、各回で次の 2 つの操作を行います。

1. `num` を配列 `res` のインデックス `prefix[num] - 1` に書き込みます。
2. 累積和 `prefix[num]` を $1$ 減らして、次に `num` を置くインデックスを求めます。

走査が終わると、配列 `res` に整列済みの結果が入っています。最後に `res` で元の配列 `nums` を上書きします。図 11-17 にカウントソートの手順全体を示します。

=== "<1>"
    ![カウントソートの手順](counting_sort.assets/counting_sort_step1.svg){ class="animation-figure" }

=== "<2>"
    ![counting_sort_step2](counting_sort.assets/counting_sort_step2.svg){ class="animation-figure" }

=== "<3>"
    ![counting_sort_step3](counting_sort.assets/counting_sort_step3.svg){ class="animation-figure" }

=== "<4>"
    ![counting_sort_step4](counting_sort.assets/counting_sort_step4.svg){ class="animation-figure" }

=== "<5>"
    ![counting_sort_step5](counting_sort.assets/counting_sort_step5.svg){ class="animation-figure" }

=== "<6>"
    ![counting_sort_step6](counting_sort.assets/counting_sort_step6.svg){ class="animation-figure" }

=== "<7>"
    ![counting_sort_step7](counting_sort.assets/counting_sort_step7.svg){ class="animation-figure" }

=== "<8>"
    ![counting_sort_step8](counting_sort.assets/counting_sort_step8.svg){ class="animation-figure" }

<p align="center"> 図 11-17 &nbsp; カウントソートの手順 </p>

カウントソートの実装を次に示します。

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort(nums: list[int]):
        """カウントソート"""
        # 完全版。オブジェクトもソートでき、安定性を保つ
        # 1. 配列の最大値 m を求める
        m = max(nums)
        # 2. 各数値の出現回数を数える
        # counter[num] は num の出現回数を表す
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        # つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for i in range(m):
            counter[i + 1] += counter[i]
        # 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        # 結果を格納する配列 res を初期化
        n = len(nums)
        res = [0] * n
        for i in range(n - 1, -1, -1):
            num = nums[i]
            res[counter[num] - 1] = num  # num を対応するインデックスに配置
            counter[num] -= 1  # 累積和を 1 減らして、次に num を置く位置を求める
        # 結果配列 res で元の配列 nums を上書き
        for i in range(n):
            nums[i] = res[i]
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    void countingSort(vector<int> &nums) {
        // 1. 配列の最大値 m を求める
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        int n = nums.size();
        vector<int> res(n);
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num を対応するインデックスに配置
            counter[num]--;              // 累積和を 1 減らして、次に num を置く位置を求める
        }
        // 結果配列 res で元の配列 nums を上書き
        nums = res;
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    void countingSort(int[] nums) {
        // 1. 配列の最大値 m を求める
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num を対応するインデックスに配置
            counter[num]--; // 累積和を 1 減らして、次に num を置く位置を求める
        }
        // 結果配列 res で元の配列 nums を上書き
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    void CountingSort(int[] nums) {
        // 1. 配列の最大値 m を求める
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num を対応するインデックスに配置
            counter[num]--; // 累積和を 1 減らして、次に num を置く位置を求める
        }
        // 結果配列 res で元の配列 nums を上書き
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Go"

    ```go title="counting_sort.go"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    func countingSort(nums []int) {
        // 1. 配列の最大値 m を求める
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for i := 0; i < m; i++ {
            counter[i+1] += counter[i]
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        n := len(nums)
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            num := nums[i]
            // num を対応するインデックスに配置
            res[counter[num]-1] = num
            // 累積和を 1 減らして、次に num を置く位置を求める
            counter[num]--
        }
        // 結果配列 res で元の配列 nums を上書き
        copy(nums, res)
    }
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    func countingSort(nums: inout [Int]) {
        // 1. 配列の最大値 m を求める
        let m = nums.max()!
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for i in 0 ..< m {
            counter[i + 1] += counter[i]
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let num = nums[i]
            res[counter[num] - 1] = num // num を対応するインデックスに配置
            counter[num] -= 1 // 累積和を 1 減らして、次に num を置く位置を求める
        }
        // 結果配列 res で元の配列 nums を上書き
        for i in nums.indices {
            nums[i] = res[i]
        }
    }
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    function countingSort(nums) {
        // 1. 配列の最大値 m を求める
        let m = Math.max(...nums);
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        const n = nums.length;
        const res = new Array(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // num を対応するインデックスに配置
            counter[num]--; // 累積和を 1 減らして、次に num を置く位置を求める
        }
        // 結果配列 res で元の配列 nums を上書き
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    function countingSort(nums: number[]): void {
        // 1. 配列の最大値 m を求める
        let m: number = Math.max(...nums);
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        const n = nums.length;
        const res: number[] = new Array<number>(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // num を対応するインデックスに配置
            counter[num]--; // 累積和を 1 減らして、次に num を置く位置を求める
        }
        // 結果配列 res で元の配列 nums を上書き
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    void countingSort(List<int> nums) {
      // 1. 配列の最大値 m を求める
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. 各数値の出現回数を数える
      // counter[_num] は _num の出現回数を表す
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
      // つまり counter[_num]-1 は res 内で _num が最後に現れるインデックス
      for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
      }
      // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
      // 結果を格納する配列 res を初期化
      int n = nums.length;
      List<int> res = List.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int _num = nums[i];
        res[counter[_num] - 1] = _num; // _num を対応するインデックスに配置
        counter[_num]--; // 累積和を 1 減らし、次に _num を置くインデックスを求める
      }
      // 結果配列 res で元の配列 nums を上書き
      nums.setAll(0, res);
    }
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    fn counting_sort(nums: &mut [i32]) {
        // 1. 配列の最大値 m を求める
        let m = *nums.iter().max().unwrap() as usize;
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        let mut counter = vec![0; m + 1];
        for &num in nums.iter() {
            counter[num as usize] += 1;
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for i in 0..m {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        let n = nums.len();
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let num = nums[i];
            res[counter[num as usize] - 1] = num; // num を対応するインデックスに配置
            counter[num as usize] -= 1; // 累積和を 1 減らして、次に num を置く位置を求める
        }
        // 結果配列 res で元の配列 nums を上書き
        nums.copy_from_slice(&res)
    }
    ```

=== "C"

    ```c title="counting_sort.c"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    void countingSort(int nums[], int size) {
        // 1. 配列の最大値 m を求める
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        int *counter = calloc(m + 1, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        int *res = malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num を対応するインデックスに配置
            counter[num]--;              // 累積和を 1 減らして、次に num を置く位置を求める
        }
        // 結果配列 res で元の配列 nums を上書き
        memcpy(nums, res, size * sizeof(int));
        // 5. メモリを解放
        free(res);
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    fun countingSort(nums: IntArray) {
        // 1. 配列の最大値 m を求める
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for (i in 0..<m) {
            counter[i + 1] += counter[i]
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        val n = nums.size
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val num = nums[i]
            res[counter[num] - 1] = num // num を対応するインデックスに配置
            counter[num]-- // 累積和を 1 減らして、次に num を置く位置を求める
        }
        // 結果配列 res で元の配列 nums を上書き
        for (i in 0..<n) {
            nums[i] = res[i]
        }
    }
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    ### カウントソート ###
    def counting_sort(nums)
      # 完全版。オブジェクトもソートでき、安定性を保つ
      # 1. 配列の最大値 m を求める
      m = nums.max
      # 2. 各数値の出現回数を数える
      # counter[num] は num の出現回数を表す
      counter = Array.new(m + 1, 0)
      nums.each { |num| counter[num] += 1 }
      # 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
      # つまり counter[num]-1 は res 内で num が最後に現れるインデックス
      (0...m).each { |i| counter[i + 1] += counter[i] }
      # 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
      # 結果を格納する配列 res を初期化
      n = nums.length
      res = Array.new(n, 0)
      (n - 1).downto(0).each do |i|
        num = nums[i]
        res[counter[num] - 1] = num # num を対応するインデックスに配置
        counter[num] -= 1 # 累積和を 1 減らして、次に num を置く位置を求める
      end
      # 結果配列 res で元の配列 nums を上書き
      (0...n).each { |i| nums[i] = res[i] }
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20%E5%AE%8C%E5%85%A8%E7%89%88%E3%80%82%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%82%82%E3%82%BD%E3%83%BC%E3%83%88%E3%81%A7%E3%81%8D%E3%80%81%E5%AE%89%E5%AE%9A%E6%80%A7%E3%82%92%E4%BF%9D%E3%81%A4%0A%20%20%20%20%23%201.%20%E9%85%8D%E5%88%97%E3%81%AE%E6%9C%80%E5%A4%A7%E5%80%A4%20m%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20%E5%90%84%E6%95%B0%E5%80%A4%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E6%95%B0%E3%81%88%E3%82%8B%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E3%81%AF%20num%20%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E8%A1%A8%E3%81%99%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20counter%20%E3%81%AE%E7%B4%AF%E7%A9%8D%E5%92%8C%E3%82%92%E6%B1%82%E3%82%81%E3%80%81%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%81%8B%E3%82%89%E5%90%84%E5%80%A4%E3%81%AE%E6%9C%AB%E5%B0%BE%E4%BD%8D%E7%BD%AE%E3%82%92%E6%B1%82%E3%82%81%E3%82%89%E3%82%8C%E3%82%8B%E3%82%88%E3%81%86%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%81%A4%E3%81%BE%E3%82%8A%20counter%5Bnum%5D-1%20%E3%81%AF%20res%20%E5%86%85%E3%81%A7%20num%20%E3%81%8C%E6%9C%80%E5%BE%8C%E3%81%AB%E7%8F%BE%E3%82%8C%E3%82%8B%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20nums%20%E3%82%92%E9%80%86%E9%A0%86%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%97%E3%80%81%E5%90%84%E8%A6%81%E7%B4%A0%E3%82%92%E7%B5%90%E6%9E%9C%E9%85%8D%E5%88%97%20res%20%E3%81%AB%E6%9B%B8%E3%81%8D%E8%BE%BC%E3%82%80%0A%20%20%20%20%23%20%E7%B5%90%E6%9E%9C%E3%82%92%E6%A0%BC%E7%B4%8D%E3%81%99%E3%82%8B%E9%85%8D%E5%88%97%20res%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20num%20%E3%82%92%E5%AF%BE%E5%BF%9C%E3%81%99%E3%82%8B%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AB%E9%85%8D%E7%BD%AE%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20%E7%B4%AF%E7%A9%8D%E5%92%8C%E3%82%92%201%20%E6%B8%9B%E3%82%89%E3%81%97%E3%81%A6%E3%80%81%E6%AC%A1%E3%81%AB%20num%20%E3%82%92%E7%BD%AE%E3%81%8F%E4%BD%8D%E7%BD%AE%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20%23%20%E7%B5%90%E6%9E%9C%E9%85%8D%E5%88%97%20res%20%E3%81%A7%E5%85%83%E3%81%AE%E9%85%8D%E5%88%97%20nums%20%E3%82%92%E4%B8%8A%E6%9B%B8%E3%81%8D%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%E5%BE%8C%E3%81%AE%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20%E5%AE%8C%E5%85%A8%E7%89%88%E3%80%82%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%82%82%E3%82%BD%E3%83%BC%E3%83%88%E3%81%A7%E3%81%8D%E3%80%81%E5%AE%89%E5%AE%9A%E6%80%A7%E3%82%92%E4%BF%9D%E3%81%A4%0A%20%20%20%20%23%201.%20%E9%85%8D%E5%88%97%E3%81%AE%E6%9C%80%E5%A4%A7%E5%80%A4%20m%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20%E5%90%84%E6%95%B0%E5%80%A4%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E6%95%B0%E3%81%88%E3%82%8B%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E3%81%AF%20num%20%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E8%A1%A8%E3%81%99%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20counter%20%E3%81%AE%E7%B4%AF%E7%A9%8D%E5%92%8C%E3%82%92%E6%B1%82%E3%82%81%E3%80%81%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%81%8B%E3%82%89%E5%90%84%E5%80%A4%E3%81%AE%E6%9C%AB%E5%B0%BE%E4%BD%8D%E7%BD%AE%E3%82%92%E6%B1%82%E3%82%81%E3%82%89%E3%82%8C%E3%82%8B%E3%82%88%E3%81%86%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%81%A4%E3%81%BE%E3%82%8A%20counter%5Bnum%5D-1%20%E3%81%AF%20res%20%E5%86%85%E3%81%A7%20num%20%E3%81%8C%E6%9C%80%E5%BE%8C%E3%81%AB%E7%8F%BE%E3%82%8C%E3%82%8B%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20nums%20%E3%82%92%E9%80%86%E9%A0%86%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%97%E3%80%81%E5%90%84%E8%A6%81%E7%B4%A0%E3%82%92%E7%B5%90%E6%9E%9C%E9%85%8D%E5%88%97%20res%20%E3%81%AB%E6%9B%B8%E3%81%8D%E8%BE%BC%E3%82%80%0A%20%20%20%20%23%20%E7%B5%90%E6%9E%9C%E3%82%92%E6%A0%BC%E7%B4%8D%E3%81%99%E3%82%8B%E9%85%8D%E5%88%97%20res%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20num%20%E3%82%92%E5%AF%BE%E5%BF%9C%E3%81%99%E3%82%8B%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AB%E9%85%8D%E7%BD%AE%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20%E7%B4%AF%E7%A9%8D%E5%92%8C%E3%82%92%201%20%E6%B8%9B%E3%82%89%E3%81%97%E3%81%A6%E3%80%81%E6%AC%A1%E3%81%AB%20num%20%E3%82%92%E7%BD%AE%E3%81%8F%E4%BD%8D%E7%BD%AE%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20%23%20%E7%B5%90%E6%9E%9C%E9%85%8D%E5%88%97%20res%20%E3%81%A7%E5%85%83%E3%81%AE%E9%85%8D%E5%88%97%20nums%20%E3%82%92%E4%B8%8A%E6%9B%B8%E3%81%8D%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%E5%BE%8C%E3%81%AE%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 11.9.3 &nbsp; アルゴリズムの特性

- **時間計算量は $O(n + m)$、非適応的なソート**。`nums` の走査にも `counter` の走査にも線形時間がかかります。通常は $n \gg m$ なので、時間計算量は $O(n)$ に近づきます。
- **空間計算量は $O(n + m)$、インプレースではないソート**。長さがそれぞれ $n$ と $m$ の配列 `res` と `counter` を使います。
- **安定ソート**。`res` には右から左へ要素を書き込むため、`nums` を逆順に走査すれば値が等しい要素の相対順序を保てます。`nums` を先頭から走査しても値は正しい順に並びますが、その場合は安定性が失われます。

## 11.9.4 &nbsp; 制約

カウントソートでは、出現回数を数えるだけで効率よくソートできます。ただし、利用できる条件は比較的限られています。

**カウントソートを直接適用できるのは非負整数だけです**。他の種類のデータに使うには、要素間の大小関係を変えずに非負整数に変換できることが必要です。たとえば負数を含む整数配列なら、すべての値に同じ定数を加えて正の数にし、ソート後に元に戻せます。

**カウントソートは、データ数が多く、値の範囲が狭い場合に適しています**。先ほどの例では、$m$ が大きすぎると領域を使いすぎます。また $n \ll m$ のときは $O(m)$ の時間がかかり、$O(n \log n)$ のソートアルゴリズムより遅くなることもあります。
