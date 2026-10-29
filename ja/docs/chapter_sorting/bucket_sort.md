---
comments: true
---

# 11.8 &nbsp; バケットソート

ここまでのソートアルゴリズムは、要素の大小を比較する「比較ソート」です。この種類の最悪時間計算量の下界は $\Omega(n \log n)$ です。ここからは、時間計算量を線形にできる「非比較ソート」をいくつか見ていきます。

<u>バケットソート（bucket sort）</u>は、分割統治法の典型的な応用です。大小の順序を持ち、それぞれが一定のデータ範囲に対応するバケットを用意して、データを均等に振り分けます。次に各バケット内でソートし、最後にバケットの順序に従ってすべてのデータを結合します。

## 11.8.1 &nbsp; アルゴリズムの流れ

長さ $n$ の配列で、要素が範囲 $[0, 1)$ の浮動小数点数である場合を考えます。バケットソートの流れは図 11-13 のとおりです。

1. $k$ 個のバケットを初期化し、$n$ 個の要素を $k$ 個のバケットへ振り分けます。
2. 各バケットをそれぞれソートします（ここでは言語の組み込みソート関数を使います）。
3. バケットの小さいほうから順に結果を結合します。

![バケットソートの流れ](bucket_sort.assets/bucket_sort_overview.png){ class="animation-figure" }

<p align="center"> 図 11-13 &nbsp; バケットソートの流れ </p>

コードは次のとおりです。

=== "Python"

    ```python title="bucket_sort.py"
    def bucket_sort(nums: list[float]):
        """バケットソート"""
        # k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
        k = len(nums) // 2
        buckets = [[] for _ in range(k)]
        # 1. 配列の要素を各バケットに振り分ける
        for num in nums:
            # 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
            i = int(num * k)
            # num をバケット i に追加する
            buckets[i].append(num)
        # 2. 各バケットをソートする
        for bucket in buckets:
            # 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
            bucket.sort()
        # 3. バケットを走査して結果を結合する
        i = 0
        for bucket in buckets:
            for num in bucket:
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="bucket_sort.cpp"
    /* バケットソート */
    void bucketSort(vector<float> &nums) {
        // k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
        int k = nums.size() / 2;
        vector<vector<float>> buckets(k);
        // 1. 配列の要素を各バケットに振り分ける
        for (float num : nums) {
            // 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
            int i = num * k;
            // num をバケット bucket_idx に追加する
            buckets[i].push_back(num);
        }
        // 2. 各バケットをソートする
        for (vector<float> &bucket : buckets) {
            // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
            sort(bucket.begin(), bucket.end());
        }
        // 3. バケットを走査して結果を結合する
        int i = 0;
        for (vector<float> &bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }
    ```

=== "Java"

    ```java title="bucket_sort.java"
    /* バケットソート */
    void bucketSort(float[] nums) {
        // k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. 配列の要素を各バケットに振り分ける
        for (float num : nums) {
            // 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
            int i = (int) (num * k);
            // num をバケット i に追加する
            buckets.get(i).add(num);
        }
        // 2. 各バケットをソートする
        for (List<Float> bucket : buckets) {
            // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
            Collections.sort(bucket);
        }
        // 3. バケットを走査して結果を結合する
        int i = 0;
        for (List<Float> bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }
    ```

=== "C#"

    ```csharp title="bucket_sort.cs"
    /* バケットソート */
    void BucketSort(float[] nums) {
        // k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. 配列の要素を各バケットに振り分ける
        foreach (float num in nums) {
            // 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
            int i = (int)(num * k);
            // num をバケット i に追加する
            buckets[i].Add(num);
        }
        // 2. 各バケットをソートする
        foreach (List<float> bucket in buckets) {
            // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
            bucket.Sort();
        }
        // 3. バケットを走査して結果を結合する
        int j = 0;
        foreach (List<float> bucket in buckets) {
            foreach (float num in bucket) {
                nums[j++] = num;
            }
        }
    }
    ```

=== "Go"

    ```go title="bucket_sort.go"
    /* バケットソート */
    func bucketSort(nums []float64) {
        // k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
        k := len(nums) / 2
        buckets := make([][]float64, k)
        for i := 0; i < k; i++ {
            buckets[i] = make([]float64, 0)
        }
        // 1. 配列の要素を各バケットに振り分ける
        for _, num := range nums {
            // 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
            i := int(num * float64(k))
            // num をバケット i に追加する
            buckets[i] = append(buckets[i], num)
        }
        // 2. 各バケットをソートする
        for i := 0; i < k; i++ {
            // 組み込みのスライスのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
            sort.Float64s(buckets[i])
        }
        // 3. バケットを走査して結果を結合する
        i := 0
        for _, bucket := range buckets {
            for _, num := range bucket {
                nums[i] = num
                i++
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bucket_sort.swift"
    /* バケットソート */
    func bucketSort(nums: inout [Double]) {
        // k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
        let k = nums.count / 2
        var buckets = (0 ..< k).map { _ in [Double]() }
        // 1. 配列の要素を各バケットに振り分ける
        for num in nums {
            // 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
            let i = Int(num * Double(k))
            // num をバケット i に追加する
            buckets[i].append(num)
        }
        // 2. 各バケットをソートする
        for i in buckets.indices {
            // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
            buckets[i].sort()
        }
        // 3. バケットを走査して結果を結合する
        var i = nums.startIndex
        for bucket in buckets {
            for num in bucket {
                nums[i] = num
                i += 1
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bucket_sort.js"
    /* バケットソート */
    function bucketSort(nums) {
        // k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
        const k = nums.length / 2;
        const buckets = [];
        for (let i = 0; i < k; i++) {
            buckets.push([]);
        }
        // 1. 配列の要素を各バケットに振り分ける
        for (const num of nums) {
            // 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
            const i = Math.floor(num * k);
            // num をバケット i に追加する
            buckets[i].push(num);
        }
        // 2. 各バケットをソートする
        for (const bucket of buckets) {
            // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
            bucket.sort((a, b) => a - b);
        }
        // 3. バケットを走査して結果を結合する
        let i = 0;
        for (const bucket of buckets) {
            for (const num of bucket) {
                nums[i++] = num;
            }
        }
    }
    ```

=== "TS"

    ```typescript title="bucket_sort.ts"
    /* バケットソート */
    function bucketSort(nums: number[]): void {
        // k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
        const k = nums.length / 2;
        const buckets: number[][] = [];
        for (let i = 0; i < k; i++) {
            buckets.push([]);
        }
        // 1. 配列の要素を各バケットに振り分ける
        for (const num of nums) {
            // 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
            const i = Math.floor(num * k);
            // num をバケット i に追加する
            buckets[i].push(num);
        }
        // 2. 各バケットをソートする
        for (const bucket of buckets) {
            // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
            bucket.sort((a, b) => a - b);
        }
        // 3. バケットを走査して結果を結合する
        let i = 0;
        for (const bucket of buckets) {
            for (const num of bucket) {
                nums[i++] = num;
            }
        }
    }
    ```

=== "Dart"

    ```dart title="bucket_sort.dart"
    /* バケットソート */
    void bucketSort(List<double> nums) {
      // k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
      int k = nums.length ~/ 2;
      List<List<double>> buckets = List.generate(k, (index) => []);

      // 1. 配列の要素を各バケットに振り分ける
      for (double _num in nums) {
        // 入力データの範囲は [0, 1) なので、_num * k によりインデックス範囲 [0, k-1] に対応付ける
        int i = (_num * k).toInt();
        // _num をバケット bucket_idx に追加する
        buckets[i].add(_num);
      }
      // 2. 各バケットをソートする
      for (List<double> bucket in buckets) {
        bucket.sort();
      }
      // 3. バケットを走査して結果を結合する
      int i = 0;
      for (List<double> bucket in buckets) {
        for (double _num in bucket) {
          nums[i++] = _num;
        }
      }
    }
    ```

=== "Rust"

    ```rust title="bucket_sort.rs"
    /* バケットソート */
    fn bucket_sort(nums: &mut [f64]) {
        // k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
        let k = nums.len() / 2;
        let mut buckets = vec![vec![]; k];
        // 1. 配列の要素を各バケットに振り分ける
        for &num in nums.iter() {
            // 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
            let i = (num * k as f64) as usize;
            // num をバケット i に追加する
            buckets[i].push(num);
        }
        // 2. 各バケットをソートする
        for bucket in &mut buckets {
            // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
            bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
        }
        // 3. バケットを走査して結果を結合する
        let mut i = 0;
        for bucket in buckets.iter() {
            for &num in bucket.iter() {
                nums[i] = num;
                i += 1;
            }
        }
    }
    ```

=== "C"

    ```c title="bucket_sort.c"
    /* バケットソート */
    void bucketSort(float nums[], int n) {
        int k = n / 2;                                 // k = n/2 個のバケットを初期化する
        int *sizes = malloc(k * sizeof(int));          // 各バケットのサイズを記録する
        float **buckets = malloc(k * sizeof(float *)); // 動的配列の配列（バケット）
        // 各バケットに十分な領域をあらかじめ確保する
        for (int i = 0; i < k; ++i) {
            buckets[i] = (float *)malloc(n * sizeof(float));
            sizes[i] = 0;
        }
        // 1. 配列の要素を各バケットに振り分ける
        for (int i = 0; i < n; ++i) {
            int idx = (int)(nums[i] * k);
            buckets[idx][sizes[idx]++] = nums[i];
        }
        // 2. 各バケットをソートする
        for (int i = 0; i < k; ++i) {
            qsort(buckets[i], sizes[i], sizeof(float), compare);
        }
        // 3. ソートしたバケットを結合する
        int idx = 0;
        for (int i = 0; i < k; ++i) {
            for (int j = 0; j < sizes[i]; ++j) {
                nums[idx++] = buckets[i][j];
            }
            // メモリを解放する
            free(buckets[i]);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bucket_sort.kt"
    /* バケットソート */
    fun bucketSort(nums: FloatArray) {
        // k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
        val k = nums.size / 2
        val buckets = mutableListOf<MutableList<Float>>()
        for (i in 0..<k) {
            buckets.add(mutableListOf())
        }
        // 1. 配列の要素を各バケットに振り分ける
        for (num in nums) {
            // 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
            val i = (num * k).toInt()
            // num をバケット i に追加する
            buckets[i].add(num)
        }
        // 2. 各バケットをソートする
        for (bucket in buckets) {
            // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
            bucket.sort()
        }
        // 3. バケットを走査して結果を結合する
        var i = 0
        for (bucket in buckets) {
            for (num in bucket) {
                nums[i++] = num
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="bucket_sort.rb"
    ### バケットソート ###
    def bucket_sort(nums)
      # k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
      k = nums.length / 2
      buckets = Array.new(k) { [] }
      
      # 1. 配列の要素を各バケットに振り分ける
      nums.each do |num|
        # 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
        i = (num * k).to_i
        # num をバケット i に追加する
        buckets[i] << num
      end

      # 2. 各バケットをソートする
      buckets.each do |bucket|
        # 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
        bucket.sort!
      end

      # 3. バケットを走査して結果を結合する
      i = 0
      buckets.each do |bucket|
        bucket.each do |num|
          nums[i] = num
          i += 1
        end
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20bucket_sort%28nums%3A%20list%5Bfloat%5D%29%3A%0A%20%20%20%20%22%22%22%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20k%20%3D%20n/2%20%E5%80%8B%E3%81%AE%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%97%E3%80%81%E5%90%84%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%81%AB%E5%B9%B3%E5%9D%87%202%20%E5%80%8B%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%B2%E3%82%8A%E5%BD%93%E3%81%A6%E3%82%8B%E3%81%93%E3%81%A8%E3%82%92%E6%83%B3%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20k%20%3D%20len%28nums%29%20//%202%0A%20%20%20%20buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28k%29%5D%0A%20%20%20%20%23%201.%20%E9%85%8D%E5%88%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%84%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%81%AB%E6%8C%AF%E3%82%8A%E5%88%86%E3%81%91%E3%82%8B%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E7%AF%84%E5%9B%B2%E3%81%AF%20%5B0,%201%29%20%E3%81%AA%E3%81%AE%E3%81%A7%E3%80%81num%20%2A%20k%20%E3%81%AB%E3%82%88%E3%82%8A%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E7%AF%84%E5%9B%B2%20%5B0,%20k-1%5D%20%E3%81%AB%E5%AF%BE%E5%BF%9C%E4%BB%98%E3%81%91%E3%82%8B%0A%20%20%20%20%20%20%20%20i%20%3D%20int%28num%20%2A%20k%29%0A%20%20%20%20%20%20%20%20%23%20num%20%E3%82%92%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%20i%20%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20buckets%5Bi%5D.append%28num%29%0A%20%20%20%20%23%202.%20%E5%90%84%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%82%92%E3%82%BD%E3%83%BC%E3%83%88%E3%81%99%E3%82%8B%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%B5%84%E3%81%BF%E8%BE%BC%E3%81%BF%E3%81%AE%E3%82%BD%E3%83%BC%E3%83%88%E9%96%A2%E6%95%B0%E3%82%92%E4%BD%BF%E3%81%86%E3%80%82%E4%BB%96%E3%81%AE%E3%82%BD%E3%83%BC%E3%83%88%E3%82%A2%E3%83%AB%E3%82%B4%E3%83%AA%E3%82%BA%E3%83%A0%E3%81%AB%E7%BD%AE%E3%81%8D%E6%8F%9B%E3%81%88%E3%81%A6%E3%82%82%E3%82%88%E3%81%84%0A%20%20%20%20%20%20%20%20bucket.sort%28%29%0A%20%20%20%20%23%203.%20%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%82%92%E8%B5%B0%E6%9F%BB%E3%81%97%E3%81%A6%E7%B5%90%E6%9E%9C%E3%82%92%E7%B5%90%E5%90%88%E3%81%99%E3%82%8B%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20for%20num%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AF%20%5B0,%201%29%20%E3%81%AE%E7%AF%84%E5%9B%B2%E3%81%AE%E6%B5%AE%E5%8B%95%E5%B0%8F%E6%95%B0%E7%82%B9%E6%95%B0%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20%20nums%20%3D%20%5B0.49,%200.96,%200.82,%200.09,%200.57,%200.43,%200.91,%200.75,%200.15,%200.37%5D%0A%20%20%20%20bucket_sort%28nums%29%0A%20%20%20%20print%28%22%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%E5%AE%8C%E4%BA%86%E5%BE%8C%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bucket_sort%28nums%3A%20list%5Bfloat%5D%29%3A%0A%20%20%20%20%22%22%22%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20k%20%3D%20n/2%20%E5%80%8B%E3%81%AE%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%97%E3%80%81%E5%90%84%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%81%AB%E5%B9%B3%E5%9D%87%202%20%E5%80%8B%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%B2%E3%82%8A%E5%BD%93%E3%81%A6%E3%82%8B%E3%81%93%E3%81%A8%E3%82%92%E6%83%B3%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20k%20%3D%20len%28nums%29%20//%202%0A%20%20%20%20buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28k%29%5D%0A%20%20%20%20%23%201.%20%E9%85%8D%E5%88%97%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%90%84%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%81%AB%E6%8C%AF%E3%82%8A%E5%88%86%E3%81%91%E3%82%8B%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E7%AF%84%E5%9B%B2%E3%81%AF%20%5B0,%201%29%20%E3%81%AA%E3%81%AE%E3%81%A7%E3%80%81num%20%2A%20k%20%E3%81%AB%E3%82%88%E3%82%8A%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E7%AF%84%E5%9B%B2%20%5B0,%20k-1%5D%20%E3%81%AB%E5%AF%BE%E5%BF%9C%E4%BB%98%E3%81%91%E3%82%8B%0A%20%20%20%20%20%20%20%20i%20%3D%20int%28num%20%2A%20k%29%0A%20%20%20%20%20%20%20%20%23%20num%20%E3%82%92%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%20i%20%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20buckets%5Bi%5D.append%28num%29%0A%20%20%20%20%23%202.%20%E5%90%84%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%82%92%E3%82%BD%E3%83%BC%E3%83%88%E3%81%99%E3%82%8B%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%B5%84%E3%81%BF%E8%BE%BC%E3%81%BF%E3%81%AE%E3%82%BD%E3%83%BC%E3%83%88%E9%96%A2%E6%95%B0%E3%82%92%E4%BD%BF%E3%81%86%E3%80%82%E4%BB%96%E3%81%AE%E3%82%BD%E3%83%BC%E3%83%88%E3%82%A2%E3%83%AB%E3%82%B4%E3%83%AA%E3%82%BA%E3%83%A0%E3%81%AB%E7%BD%AE%E3%81%8D%E6%8F%9B%E3%81%88%E3%81%A6%E3%82%82%E3%82%88%E3%81%84%0A%20%20%20%20%20%20%20%20bucket.sort%28%29%0A%20%20%20%20%23%203.%20%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%82%92%E8%B5%B0%E6%9F%BB%E3%81%97%E3%81%A6%E7%B5%90%E6%9E%9C%E3%82%92%E7%B5%90%E5%90%88%E3%81%99%E3%82%8B%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20for%20num%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%85%A5%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AF%20%5B0,%201%29%20%E3%81%AE%E7%AF%84%E5%9B%B2%E3%81%AE%E6%B5%AE%E5%8B%95%E5%B0%8F%E6%95%B0%E7%82%B9%E6%95%B0%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20%20nums%20%3D%20%5B0.49,%200.96,%200.82,%200.09,%200.57,%200.43,%200.91,%200.75,%200.15,%200.37%5D%0A%20%20%20%20bucket_sort%28nums%29%0A%20%20%20%20print%28%22%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%E5%AE%8C%E4%BA%86%E5%BE%8C%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 11.8.2 &nbsp; アルゴリズムの特徴

バケットソートは大量のデータを扱うのに適しています。例えば、100 万個の入力要素があり、容量の制約で一度にすべてをメモリに読み込めないとします。この場合、1000 個のバケットに分けて個別にソートし、最後に結果を結合できます。

- **時間計算量は $O(n + k)$**：要素が各バケットに均等に分かれるとすると、一つのバケットの要素数は $\frac{n}{k}$ です。一つをソートする時間を $O(\frac{n}{k} \log\frac{n}{k})$ とすると、すべてのソートには $O(n \log\frac{n}{k})$ 時間かかります。**バケット数 $k$ が十分大きいと、時間計算量は $O(n)$ に近づきます**。結果の結合ではすべてのバケットと要素を走査するため、$O(n + k)$ 時間かかります。最悪の場合、すべてのデータが一つのバケットに入り、そのソートに $O(n^2)$ 時間かかります。
- **空間計算量は $O(n + k)$、非インプレースソート**：$k$ 個のバケットと、合計 $n$ 個の要素を格納する追加領域が必要です。
- バケットソートの安定性は、各バケット内で使うソートアルゴリズムの安定性に依存します。

## 11.8.3 &nbsp; 均等に振り分けるには

バケットソートの時間計算量は理論上 $O(n)$ にできますが、**要素を各バケットへ均等に振り分けることが鍵です**。実際のデータは均等に分布しているとは限らないためです。例えば、淘宝の全商品を価格帯で 10 個のバケットに均等に分けたいとしても、100 元未満の商品は多く、1000 元超は少ないなど、価格分布には偏りがあります。価格帯を等間隔に 10 分割すると、バケットごとの商品数は大きく異なります。

均等に振り分けるには、まずおおよその境界を決め、データを大まかに 3 個のバケットへ分けます。**その後、商品が多いバケットをさらに 3 分割し、すべてのバケットの要素数がおおむね等しくなるまで続けます**。

図 11-14 のように、この方法は本質的に再帰木を作っており、葉ノードの値をできるだけ均等にすることを目指しています。毎回 3 個に分ける必要はなく、データの特徴に応じて柔軟に選べます。

![バケットの再帰的な分割](bucket_sort.assets/scatter_in_buckets_recursively.png){ class="animation-figure" }

<p align="center"> 図 11-14 &nbsp; バケットの再帰的な分割 </p>

商品価格の確率分布があらかじめ分かっていれば、**その分布に合わせてバケットごとの価格の境界を設定できます**。分布は必ずしも実測する必要はなく、データの特徴に応じた確率モデルで近似することもできます。

図 11-15 では、商品価格が正規分布に従うと仮定しています。これにより価格帯を適切に設定し、商品を各バケットへ均等に振り分けられます。

![確率分布に基づくバケットの分割](bucket_sort.assets/scatter_in_buckets_distribution.png){ class="animation-figure" }

<p align="center"> 図 11-15 &nbsp; 確率分布に基づくバケットの分割 </p>
