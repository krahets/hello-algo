---
comments: true
---

# 11.8 &nbsp; 桶排序

前述幾種排序演算法都屬於“基於比較的排序演算法”，它們透過比較元素間的大小來實現排序。此類排序演算法的時間複雜度無法超越 $O(n \log n)$ 。接下來，我們將探討幾種“非比較排序演算法”，它們的時間複雜度可以達到線性階。

<u>桶排序（bucket sort）</u>是分治策略的一個典型應用。它透過設定一些具有大小順序的桶，每個桶對應一個數據範圍，將資料平均分配到各個桶中；然後，在每個桶內部分別執行排序；最終按照桶的順序將所有資料合併。

## 11.8.1 &nbsp; 演算法流程

考慮一個長度為 $n$ 的陣列，其元素是範圍 $[0, 1)$ 內的浮點數。桶排序的流程如圖 11-13 所示。

1. 初始化 $k$ 個桶，將 $n$ 個元素分配到 $k$ 個桶中。
2. 對每個桶分別執行排序（這裡採用程式語言的內建排序函式）。
3. 按照桶從小到大的順序合併結果。

![桶排序演算法流程](bucket_sort.assets/bucket_sort_overview.png){ class="animation-figure" }

<p align="center"> 圖 11-13 &nbsp; 桶排序演算法流程 </p>

程式碼如下所示：

=== "Python"

    ```python title="bucket_sort.py"
    def bucket_sort(nums: list[float]):
        """桶排序"""
        # 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        k = len(nums) // 2
        buckets = [[] for _ in range(k)]
        # 1. 將陣列元素分配到各個桶中
        for num in nums:
            # 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            i = int(num * k)
            # 將 num 新增進桶 i
            buckets[i].append(num)
        # 2. 對各個桶執行排序
        for bucket in buckets:
            # 使用內建排序函式，也可以替換成其他排序演算法
            bucket.sort()
        # 3. 走訪桶合併結果
        i = 0
        for bucket in buckets:
            for num in bucket:
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="bucket_sort.cpp"
    /* 桶排序 */
    void bucketSort(vector<float> &nums) {
        // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        int k = nums.size() / 2;
        vector<vector<float>> buckets(k);
        // 1. 將陣列元素分配到各個桶中
        for (float num : nums) {
            // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            int i = num * k;
            // 將 num 新增進桶 bucket_idx
            buckets[i].push_back(num);
        }
        // 2. 對各個桶執行排序
        for (vector<float> &bucket : buckets) {
            // 使用內建排序函式，也可以替換成其他排序演算法
            sort(bucket.begin(), bucket.end());
        }
        // 3. 走訪桶合併結果
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
    /* 桶排序 */
    void bucketSort(float[] nums) {
        // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. 將陣列元素分配到各個桶中
        for (float num : nums) {
            // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            int i = (int) (num * k);
            // 將 num 新增進桶 i
            buckets.get(i).add(num);
        }
        // 2. 對各個桶執行排序
        for (List<Float> bucket : buckets) {
            // 使用內建排序函式，也可以替換成其他排序演算法
            Collections.sort(bucket);
        }
        // 3. 走訪桶合併結果
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
    /* 桶排序 */
    void BucketSort(float[] nums) {
        // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. 將陣列元素分配到各個桶中
        foreach (float num in nums) {
            // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            int i = (int)(num * k);
            // 將 num 新增進桶 i
            buckets[i].Add(num);
        }
        // 2. 對各個桶執行排序
        foreach (List<float> bucket in buckets) {
            // 使用內建排序函式，也可以替換成其他排序演算法
            bucket.Sort();
        }
        // 3. 走訪桶合併結果
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
    /* 桶排序 */
    func bucketSort(nums []float64) {
        // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        k := len(nums) / 2
        buckets := make([][]float64, k)
        for i := 0; i < k; i++ {
            buckets[i] = make([]float64, 0)
        }
        // 1. 將陣列元素分配到各個桶中
        for _, num := range nums {
            // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            i := int(num * float64(k))
            // 將 num 新增進桶 i
            buckets[i] = append(buckets[i], num)
        }
        // 2. 對各個桶執行排序
        for i := 0; i < k; i++ {
            // 使用內建切片排序函式，也可以替換成其他排序演算法
            sort.Float64s(buckets[i])
        }
        // 3. 走訪桶合併結果
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
    /* 桶排序 */
    func bucketSort(nums: inout [Double]) {
        // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        let k = nums.count / 2
        var buckets = (0 ..< k).map { _ in [Double]() }
        // 1. 將陣列元素分配到各個桶中
        for num in nums {
            // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            let i = Int(num * Double(k))
            // 將 num 新增進桶 i
            buckets[i].append(num)
        }
        // 2. 對各個桶執行排序
        for i in buckets.indices {
            // 使用內建排序函式，也可以替換成其他排序演算法
            buckets[i].sort()
        }
        // 3. 走訪桶合併結果
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
    /* 桶排序 */
    function bucketSort(nums) {
        // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        const k = nums.length / 2;
        const buckets = [];
        for (let i = 0; i < k; i++) {
            buckets.push([]);
        }
        // 1. 將陣列元素分配到各個桶中
        for (const num of nums) {
            // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            const i = Math.floor(num * k);
            // 將 num 新增進桶 i
            buckets[i].push(num);
        }
        // 2. 對各個桶執行排序
        for (const bucket of buckets) {
            // 使用內建排序函式，也可以替換成其他排序演算法
            bucket.sort((a, b) => a - b);
        }
        // 3. 走訪桶合併結果
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
    /* 桶排序 */
    function bucketSort(nums: number[]): void {
        // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        const k = nums.length / 2;
        const buckets: number[][] = [];
        for (let i = 0; i < k; i++) {
            buckets.push([]);
        }
        // 1. 將陣列元素分配到各個桶中
        for (const num of nums) {
            // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            const i = Math.floor(num * k);
            // 將 num 新增進桶 i
            buckets[i].push(num);
        }
        // 2. 對各個桶執行排序
        for (const bucket of buckets) {
            // 使用內建排序函式，也可以替換成其他排序演算法
            bucket.sort((a, b) => a - b);
        }
        // 3. 走訪桶合併結果
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
    /* 桶排序 */
    void bucketSort(List<double> nums) {
      // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
      int k = nums.length ~/ 2;
      List<List<double>> buckets = List.generate(k, (index) => []);

      // 1. 將陣列元素分配到各個桶中
      for (double _num in nums) {
        // 輸入資料範圍為 [0, 1)，使用 _num * k 對映到索引範圍 [0, k-1]
        int i = (_num * k).toInt();
        // 將 _num 新增進桶 bucket_idx
        buckets[i].add(_num);
      }
      // 2. 對各個桶執行排序
      for (List<double> bucket in buckets) {
        bucket.sort();
      }
      // 3. 走訪桶合併結果
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
    /* 桶排序 */
    fn bucket_sort(nums: &mut [f64]) {
        // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        let k = nums.len() / 2;
        let mut buckets = vec![vec![]; k];
        // 1. 將陣列元素分配到各個桶中
        for &num in nums.iter() {
            // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            let i = (num * k as f64) as usize;
            // 將 num 新增進桶 i
            buckets[i].push(num);
        }
        // 2. 對各個桶執行排序
        for bucket in &mut buckets {
            // 使用內建排序函式，也可以替換成其他排序演算法
            bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
        }
        // 3. 走訪桶合併結果
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
    /* 桶排序 */
    void bucketSort(float nums[], int n) {
        int k = n / 2;                                 // 初始化 k = n/2 個桶
        int *sizes = malloc(k * sizeof(int));          // 記錄每個桶的大小
        float **buckets = malloc(k * sizeof(float *)); // 動態陣列的陣列（桶）
        // 為每個桶預分配足夠的空間
        for (int i = 0; i < k; ++i) {
            buckets[i] = (float *)malloc(n * sizeof(float));
            sizes[i] = 0;
        }
        // 1. 將陣列元素分配到各個桶中
        for (int i = 0; i < n; ++i) {
            int idx = (int)(nums[i] * k);
            buckets[idx][sizes[idx]++] = nums[i];
        }
        // 2. 對各個桶執行排序
        for (int i = 0; i < k; ++i) {
            qsort(buckets[i], sizes[i], sizeof(float), compare);
        }
        // 3. 合併排序後的桶
        int idx = 0;
        for (int i = 0; i < k; ++i) {
            for (int j = 0; j < sizes[i]; ++j) {
                nums[idx++] = buckets[i][j];
            }
            // 釋放記憶體
            free(buckets[i]);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bucket_sort.kt"
    /* 桶排序 */
    fun bucketSort(nums: FloatArray) {
        // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        val k = nums.size / 2
        val buckets = mutableListOf<MutableList<Float>>()
        for (i in 0..<k) {
            buckets.add(mutableListOf())
        }
        // 1. 將陣列元素分配到各個桶中
        for (num in nums) {
            // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            val i = (num * k).toInt()
            // 將 num 新增進桶 i
            buckets[i].add(num)
        }
        // 2. 對各個桶執行排序
        for (bucket in buckets) {
            // 使用內建排序函式，也可以替換成其他排序演算法
            bucket.sort()
        }
        // 3. 走訪桶合併結果
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
    ### 桶排序 ###
    def bucket_sort(nums)
      # 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
      k = nums.length / 2
      buckets = Array.new(k) { [] }
      
      # 1. 將陣列元素分配到各個桶中
      nums.each do |num|
        # 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
        i = (num * k).to_i
        # 將 num 新增進桶 i
        buckets[i] << num
      end

      # 2. 對各個桶執行排序
      buckets.each do |bucket|
        # 使用內建排序函式，也可以替換成其他排序演算法
        bucket.sort!
      end

      # 3. 走訪桶合併結果
      i = 0
      buckets.each do |bucket|
        bucket.each do |num|
          nums[i] = num
          i += 1
        end
      end
    end
    ```

=== "Zig"

    ```zig title="bucket_sort.zig"
    [class]{}-[func]{bucketSort}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bucket_sort%28nums%3A%20list%5Bfloat%5D%29%3A%0A%20%20%20%20%22%22%22%E6%A1%B6%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20k%20%3D%20n/2%20%E5%80%8B%E6%A1%B6%EF%BC%8C%E9%A0%90%E6%9C%9F%E5%90%91%E6%AF%8F%E5%80%8B%E6%A1%B6%E5%88%86%E9%85%8D%202%20%E5%80%8B%E5%85%83%E7%B4%A0%0A%20%20%20%20k%20%3D%20len%28nums%29%20//%202%0A%20%20%20%20buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28k%29%5D%0A%20%20%20%20%23%201.%20%E5%B0%87%E9%99%A3%E5%88%97%E5%85%83%E7%B4%A0%E5%88%86%E9%85%8D%E5%88%B0%E5%90%84%E5%80%8B%E6%A1%B6%E4%B8%AD%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%BC%B8%E5%85%A5%E8%B3%87%E6%96%99%E7%AF%84%E5%9C%8D%E7%82%BA%20%5B0%2C%201%29%EF%BC%8C%E4%BD%BF%E7%94%A8%20num%20%2A%20k%20%E5%B0%8D%E6%98%A0%E5%88%B0%E7%B4%A2%E5%BC%95%E7%AF%84%E5%9C%8D%20%5B0%2C%20k-1%5D%0A%20%20%20%20%20%20%20%20i%20%3D%20int%28num%20%2A%20k%29%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%87%20num%20%E6%96%B0%E5%A2%9E%E9%80%B2%E6%A1%B6%20i%0A%20%20%20%20%20%20%20%20buckets%5Bi%5D.append%28num%29%0A%20%20%20%20%23%202.%20%E5%B0%8D%E5%90%84%E5%80%8B%E6%A1%B6%E5%9F%B7%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E5%85%A7%E5%BB%BA%E6%8E%92%E5%BA%8F%E5%87%BD%E5%BC%8F%EF%BC%8C%E4%B9%9F%E5%8F%AF%E4%BB%A5%E6%9B%BF%E6%8F%9B%E6%88%90%E5%85%B6%E4%BB%96%E6%8E%92%E5%BA%8F%E6%BC%94%E7%AE%97%E6%B3%95%0A%20%20%20%20%20%20%20%20bucket.sort%28%29%0A%20%20%20%20%23%203.%20%E8%B5%B0%E8%A8%AA%E6%A1%B6%E5%90%88%E4%BD%B5%E7%B5%90%E6%9E%9C%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20for%20num%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E8%A8%AD%E8%BC%B8%E5%85%A5%E8%B3%87%E6%96%99%E7%82%BA%E6%B5%AE%E9%BB%9E%E6%95%B8%EF%BC%8C%E7%AF%84%E5%9C%8D%E7%82%BA%20%5B0%2C%201%29%0A%20%20%20%20nums%20%3D%20%5B0.49%2C%200.96%2C%200.82%2C%200.09%2C%200.57%2C%200.43%2C%200.91%2C%200.75%2C%200.15%2C%200.37%5D%0A%20%20%20%20bucket_sort%28nums%29%0A%20%20%20%20print%28%22%E6%A1%B6%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%BE%8C%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bucket_sort%28nums%3A%20list%5Bfloat%5D%29%3A%0A%20%20%20%20%22%22%22%E6%A1%B6%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20k%20%3D%20n/2%20%E5%80%8B%E6%A1%B6%EF%BC%8C%E9%A0%90%E6%9C%9F%E5%90%91%E6%AF%8F%E5%80%8B%E6%A1%B6%E5%88%86%E9%85%8D%202%20%E5%80%8B%E5%85%83%E7%B4%A0%0A%20%20%20%20k%20%3D%20len%28nums%29%20//%202%0A%20%20%20%20buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28k%29%5D%0A%20%20%20%20%23%201.%20%E5%B0%87%E9%99%A3%E5%88%97%E5%85%83%E7%B4%A0%E5%88%86%E9%85%8D%E5%88%B0%E5%90%84%E5%80%8B%E6%A1%B6%E4%B8%AD%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%BC%B8%E5%85%A5%E8%B3%87%E6%96%99%E7%AF%84%E5%9C%8D%E7%82%BA%20%5B0%2C%201%29%EF%BC%8C%E4%BD%BF%E7%94%A8%20num%20%2A%20k%20%E5%B0%8D%E6%98%A0%E5%88%B0%E7%B4%A2%E5%BC%95%E7%AF%84%E5%9C%8D%20%5B0%2C%20k-1%5D%0A%20%20%20%20%20%20%20%20i%20%3D%20int%28num%20%2A%20k%29%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%87%20num%20%E6%96%B0%E5%A2%9E%E9%80%B2%E6%A1%B6%20i%0A%20%20%20%20%20%20%20%20buckets%5Bi%5D.append%28num%29%0A%20%20%20%20%23%202.%20%E5%B0%8D%E5%90%84%E5%80%8B%E6%A1%B6%E5%9F%B7%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E5%85%A7%E5%BB%BA%E6%8E%92%E5%BA%8F%E5%87%BD%E5%BC%8F%EF%BC%8C%E4%B9%9F%E5%8F%AF%E4%BB%A5%E6%9B%BF%E6%8F%9B%E6%88%90%E5%85%B6%E4%BB%96%E6%8E%92%E5%BA%8F%E6%BC%94%E7%AE%97%E6%B3%95%0A%20%20%20%20%20%20%20%20bucket.sort%28%29%0A%20%20%20%20%23%203.%20%E8%B5%B0%E8%A8%AA%E6%A1%B6%E5%90%88%E4%BD%B5%E7%B5%90%E6%9E%9C%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20for%20num%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E8%A8%AD%E8%BC%B8%E5%85%A5%E8%B3%87%E6%96%99%E7%82%BA%E6%B5%AE%E9%BB%9E%E6%95%B8%EF%BC%8C%E7%AF%84%E5%9C%8D%E7%82%BA%20%5B0%2C%201%29%0A%20%20%20%20nums%20%3D%20%5B0.49%2C%200.96%2C%200.82%2C%200.09%2C%200.57%2C%200.43%2C%200.91%2C%200.75%2C%200.15%2C%200.37%5D%0A%20%20%20%20bucket_sort%28nums%29%0A%20%20%20%20print%28%22%E6%A1%B6%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%BE%8C%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 11.8.2 &nbsp; 演算法特性

桶排序適用於處理體量很大的資料。例如，輸入資料包含 100 萬個元素，由於空間限制，系統記憶體無法一次性載入所有資料。此時，可以將資料分成 1000 個桶，然後分別對每個桶進行排序，最後將結果合併。

- **時間複雜度為 $O(n + k)$** ：假設元素在各個桶內平均分佈，那麼每個桶內的元素數量為 $\frac{n}{k}$ 。假設排序單個桶使用 $O(\frac{n}{k} \log\frac{n}{k})$ 時間，則排序所有桶使用 $O(n \log\frac{n}{k})$ 時間。**當桶數量 $k$ 比較大時，時間複雜度則趨向於 $O(n)$** 。合併結果時需要走訪所有桶和元素，花費 $O(n + k)$ 時間。在最差情況下，所有資料被分配到一個桶中，且排序該桶使用 $O(n^2)$ 時間。
- **空間複雜度為 $O(n + k)$、非原地排序**：需要藉助 $k$ 個桶和總共 $n$ 個元素的額外空間。
- 桶排序是否穩定取決於排序桶內元素的演算法是否穩定。

## 11.8.3 &nbsp; 如何實現平均分配

桶排序的時間複雜度理論上可以達到 $O(n)$ ，**關鍵在於將元素均勻分配到各個桶中**，因為實際資料往往不是均勻分佈的。例如，我們想要將淘寶上的所有商品按價格範圍平均分配到 10 個桶中，但商品價格分佈不均，低於 100 元的非常多，高於 1000 元的非常少。若將價格區間平均劃分為 10 個，各個桶中的商品數量差距會非常大。

為實現平均分配，我們可以先設定一條大致的分界線，將資料粗略地分到 3 個桶中。**分配完畢後，再將商品較多的桶繼續劃分為 3 個桶，直至所有桶中的元素數量大致相等**。

如圖 11-14 所示，這種方法本質上是建立一棵遞迴樹，目標是讓葉節點的值儘可能平均。當然，不一定要每輪將資料劃分為 3 個桶，具體劃分方式可根據資料特點靈活選擇。

![遞迴劃分桶](bucket_sort.assets/scatter_in_buckets_recursively.png){ class="animation-figure" }

<p align="center"> 圖 11-14 &nbsp; 遞迴劃分桶 </p>

如果我們提前知道商品價格的機率分佈，**則可以根據資料機率分佈設定每個桶的價格分界線**。值得注意的是，資料分佈並不一定需要特意統計，也可以根據資料特點採用某種機率模型進行近似。

如圖 11-15 所示，我們假設商品價格服從正態分佈，這樣就可以合理地設定價格區間，從而將商品平均分配到各個桶中。

![根據機率分佈劃分桶](bucket_sort.assets/scatter_in_buckets_distribution.png){ class="animation-figure" }

<p align="center"> 圖 11-15 &nbsp; 根據機率分佈劃分桶 </p>
