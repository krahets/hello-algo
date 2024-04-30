---
comments: true
---

# 11.8 &nbsp; Bucket sort

The previously mentioned sorting algorithms are all "comparison-based sorting algorithms," which sort by comparing the size of elements. Such sorting algorithms cannot surpass a time complexity of $O(n \log n)$. Next, we will discuss several "non-comparison sorting algorithms" that can achieve linear time complexity.

<u>Bucket sort</u> is a typical application of the divide-and-conquer strategy. It involves setting up a series of ordered buckets, each corresponding to a range of data, and then distributing the data evenly among these buckets; each bucket is then sorted individually; finally, all the data are merged in the order of the buckets.

## 11.8.1 &nbsp; Algorithm process

Consider an array of length $n$, with elements in the range $[0, 1)$. The bucket sort process is illustrated in the Figure 11-13 .

1. Initialize $k$ buckets and distribute $n$ elements into these $k$ buckets.
2. Sort each bucket individually (using the built-in sorting function of the programming language).
3. Merge the results in the order from the smallest to the largest bucket.

![Bucket sort algorithm process](bucket_sort.assets/bucket_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-13 &nbsp; Bucket sort algorithm process </p>

The code is shown as follows:

=== "Python"

    ```python title="bucket_sort.py"
    def bucket_sort(nums: list[float]):
        """桶排序"""
        # 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        k = len(nums) // 2
        buckets = [[] for _ in range(k)]
        # 1. 将数组元素分配到各个桶中
        for num in nums:
            # 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            i = int(num * k)
            # 将 num 添加进桶 i
            buckets[i].append(num)
        # 2. 对各个桶执行排序
        for bucket in buckets:
            # 使用内置排序函数，也可以替换成其他排序算法
            bucket.sort()
        # 3. 遍历桶合并结果
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
        // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        int k = nums.size() / 2;
        vector<vector<float>> buckets(k);
        // 1. 将数组元素分配到各个桶中
        for (float num : nums) {
            // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            int i = num * k;
            // 将 num 添加进桶 bucket_idx
            buckets[i].push_back(num);
        }
        // 2. 对各个桶执行排序
        for (vector<float> &bucket : buckets) {
            // 使用内置排序函数，也可以替换成其他排序算法
            sort(bucket.begin(), bucket.end());
        }
        // 3. 遍历桶合并结果
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
        // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. 将数组元素分配到各个桶中
        for (float num : nums) {
            // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            int i = (int) (num * k);
            // 将 num 添加进桶 i
            buckets.get(i).add(num);
        }
        // 2. 对各个桶执行排序
        for (List<Float> bucket : buckets) {
            // 使用内置排序函数，也可以替换成其他排序算法
            Collections.sort(bucket);
        }
        // 3. 遍历桶合并结果
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
        // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. 将数组元素分配到各个桶中
        foreach (float num in nums) {
            // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            int i = (int)(num * k);
            // 将 num 添加进桶 i
            buckets[i].Add(num);
        }
        // 2. 对各个桶执行排序
        foreach (List<float> bucket in buckets) {
            // 使用内置排序函数，也可以替换成其他排序算法
            bucket.Sort();
        }
        // 3. 遍历桶合并结果
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
        // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        k := len(nums) / 2
        buckets := make([][]float64, k)
        for i := 0; i < k; i++ {
            buckets[i] = make([]float64, 0)
        }
        // 1. 将数组元素分配到各个桶中
        for _, num := range nums {
            // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            i := int(num * float64(k))
            // 将 num 添加进桶 i
            buckets[i] = append(buckets[i], num)
        }
        // 2. 对各个桶执行排序
        for i := 0; i < k; i++ {
            // 使用内置切片排序函数，也可以替换成其他排序算法
            sort.Float64s(buckets[i])
        }
        // 3. 遍历桶合并结果
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
        // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        let k = nums.count / 2
        var buckets = (0 ..< k).map { _ in [Double]() }
        // 1. 将数组元素分配到各个桶中
        for num in nums {
            // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            let i = Int(num * Double(k))
            // 将 num 添加进桶 i
            buckets[i].append(num)
        }
        // 2. 对各个桶执行排序
        for i in buckets.indices {
            // 使用内置排序函数，也可以替换成其他排序算法
            buckets[i].sort()
        }
        // 3. 遍历桶合并结果
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
        // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        const k = nums.length / 2;
        const buckets = [];
        for (let i = 0; i < k; i++) {
            buckets.push([]);
        }
        // 1. 将数组元素分配到各个桶中
        for (const num of nums) {
            // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            const i = Math.floor(num * k);
            // 将 num 添加进桶 i
            buckets[i].push(num);
        }
        // 2. 对各个桶执行排序
        for (const bucket of buckets) {
            // 使用内置排序函数，也可以替换成其他排序算法
            bucket.sort((a, b) => a - b);
        }
        // 3. 遍历桶合并结果
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
        // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        const k = nums.length / 2;
        const buckets: number[][] = [];
        for (let i = 0; i < k; i++) {
            buckets.push([]);
        }
        // 1. 将数组元素分配到各个桶中
        for (const num of nums) {
            // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            const i = Math.floor(num * k);
            // 将 num 添加进桶 i
            buckets[i].push(num);
        }
        // 2. 对各个桶执行排序
        for (const bucket of buckets) {
            // 使用内置排序函数，也可以替换成其他排序算法
            bucket.sort((a, b) => a - b);
        }
        // 3. 遍历桶合并结果
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
      // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
      int k = nums.length ~/ 2;
      List<List<double>> buckets = List.generate(k, (index) => []);

      // 1. 将数组元素分配到各个桶中
      for (double _num in nums) {
        // 输入数据范围为 [0, 1)，使用 _num * k 映射到索引范围 [0, k-1]
        int i = (_num * k).toInt();
        // 将 _num 添加进桶 bucket_idx
        buckets[i].add(_num);
      }
      // 2. 对各个桶执行排序
      for (List<double> bucket in buckets) {
        bucket.sort();
      }
      // 3. 遍历桶合并结果
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
        // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        let k = nums.len() / 2;
        let mut buckets = vec![vec![]; k];
        // 1. 将数组元素分配到各个桶中
        for &mut num in &mut *nums {
            // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            let i = (num * k as f64) as usize;
            // 将 num 添加进桶 i
            buckets[i].push(num);
        }
        // 2. 对各个桶执行排序
        for bucket in &mut buckets {
            // 使用内置排序函数，也可以替换成其他排序算法
            bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
        }
        // 3. 遍历桶合并结果
        let mut i = 0;
        for bucket in &mut buckets {
            for &mut num in bucket {
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
        int k = n / 2;                                 // 初始化 k = n/2 个桶
        int *sizes = malloc(k * sizeof(int));          // 记录每个桶的大小
        float **buckets = malloc(k * sizeof(float *)); // 动态数组的数组（桶）
        // 为每个桶预分配足够的空间
        for (int i = 0; i < k; ++i) {
            buckets[i] = (float *)malloc(n * sizeof(float));
            sizes[i] = 0;
        }
        // 1. 将数组元素分配到各个桶中
        for (int i = 0; i < n; ++i) {
            int idx = (int)(nums[i] * k);
            buckets[idx][sizes[idx]++] = nums[i];
        }
        // 2. 对各个桶执行排序
        for (int i = 0; i < k; ++i) {
            qsort(buckets[i], sizes[i], sizeof(float), compare);
        }
        // 3. 合并排序后的桶
        int idx = 0;
        for (int i = 0; i < k; ++i) {
            for (int j = 0; j < sizes[i]; ++j) {
                nums[idx++] = buckets[i][j];
            }
            // 释放内存
            free(buckets[i]);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bucket_sort.kt"
    /* 桶排序 */
    fun bucketSort(nums: FloatArray) {
        // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        val k = nums.size / 2
        val buckets = mutableListOf<MutableList<Float>>()
        for (i in 0..<k) {
            buckets.add(mutableListOf())
        }
        // 1. 将数组元素分配到各个桶中
        for (num in nums) {
            // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            val i = (num * k).toInt()
            // 将 num 添加进桶 i
            buckets[i].add(num)
        }
        // 2. 对各个桶执行排序
        for (bucket in buckets) {
            // 使用内置排序函数，也可以替换成其他排序算法
            bucket.sort()
        }
        // 3. 遍历桶合并结果
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
      # 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
      k = nums.length / 2
      buckets = Array.new(k) { [] }
      
      # 1. 将数组元素分配到各个桶中
      nums.each do |num|
        # 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
        i = (num * k).to_i
        # 将 num 添加进桶 i
        buckets[i] << num
      end

      # 2. 对各个桶执行排序
      buckets.each do |bucket|
        # 使用内置排序函数，也可以替换成其他排序算法
        bucket.sort!
      end

      # 3. 遍历桶合并结果
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

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bucket_sort%28nums%3A%20list%5Bfloat%5D%29%3A%0A%20%20%20%20%22%22%22%E6%A1%B6%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20k%20%3D%20n/2%20%E4%B8%AA%E6%A1%B6%EF%BC%8C%E9%A2%84%E6%9C%9F%E5%90%91%E6%AF%8F%E4%B8%AA%E6%A1%B6%E5%88%86%E9%85%8D%202%20%E4%B8%AA%E5%85%83%E7%B4%A0%0A%20%20%20%20k%20%3D%20len%28nums%29%20//%202%0A%20%20%20%20buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28k%29%5D%0A%20%20%20%20%23%201.%20%E5%B0%86%E6%95%B0%E7%BB%84%E5%85%83%E7%B4%A0%E5%88%86%E9%85%8D%E5%88%B0%E5%90%84%E4%B8%AA%E6%A1%B6%E4%B8%AD%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E8%8C%83%E5%9B%B4%E4%B8%BA%20%5B0,%201%29%EF%BC%8C%E4%BD%BF%E7%94%A8%20num%20*%20k%20%E6%98%A0%E5%B0%84%E5%88%B0%E7%B4%A2%E5%BC%95%E8%8C%83%E5%9B%B4%20%5B0,%20k-1%5D%0A%20%20%20%20%20%20%20%20i%20%3D%20int%28num%20*%20k%29%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%86%20num%20%E6%B7%BB%E5%8A%A0%E8%BF%9B%E6%A1%B6%20i%0A%20%20%20%20%20%20%20%20buckets%5Bi%5D.append%28num%29%0A%20%20%20%20%23%202.%20%E5%AF%B9%E5%90%84%E4%B8%AA%E6%A1%B6%E6%89%A7%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E5%86%85%E7%BD%AE%E6%8E%92%E5%BA%8F%E5%87%BD%E6%95%B0%EF%BC%8C%E4%B9%9F%E5%8F%AF%E4%BB%A5%E6%9B%BF%E6%8D%A2%E6%88%90%E5%85%B6%E4%BB%96%E6%8E%92%E5%BA%8F%E7%AE%97%E6%B3%95%0A%20%20%20%20%20%20%20%20bucket.sort%28%29%0A%20%20%20%20%23%203.%20%E9%81%8D%E5%8E%86%E6%A1%B6%E5%90%88%E5%B9%B6%E7%BB%93%E6%9E%9C%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20for%20num%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E8%AE%BE%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E4%B8%BA%E6%B5%AE%E7%82%B9%E6%95%B0%EF%BC%8C%E8%8C%83%E5%9B%B4%E4%B8%BA%20%5B0,%201%29%0A%20%20%20%20nums%20%3D%20%5B0.49,%200.96,%200.82,%200.09,%200.57,%200.43,%200.91,%200.75,%200.15,%200.37%5D%0A%20%20%20%20bucket_sort%28nums%29%0A%20%20%20%20print%28%22%E6%A1%B6%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bucket_sort%28nums%3A%20list%5Bfloat%5D%29%3A%0A%20%20%20%20%22%22%22%E6%A1%B6%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20k%20%3D%20n/2%20%E4%B8%AA%E6%A1%B6%EF%BC%8C%E9%A2%84%E6%9C%9F%E5%90%91%E6%AF%8F%E4%B8%AA%E6%A1%B6%E5%88%86%E9%85%8D%202%20%E4%B8%AA%E5%85%83%E7%B4%A0%0A%20%20%20%20k%20%3D%20len%28nums%29%20//%202%0A%20%20%20%20buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28k%29%5D%0A%20%20%20%20%23%201.%20%E5%B0%86%E6%95%B0%E7%BB%84%E5%85%83%E7%B4%A0%E5%88%86%E9%85%8D%E5%88%B0%E5%90%84%E4%B8%AA%E6%A1%B6%E4%B8%AD%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E8%8C%83%E5%9B%B4%E4%B8%BA%20%5B0,%201%29%EF%BC%8C%E4%BD%BF%E7%94%A8%20num%20*%20k%20%E6%98%A0%E5%B0%84%E5%88%B0%E7%B4%A2%E5%BC%95%E8%8C%83%E5%9B%B4%20%5B0,%20k-1%5D%0A%20%20%20%20%20%20%20%20i%20%3D%20int%28num%20*%20k%29%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%86%20num%20%E6%B7%BB%E5%8A%A0%E8%BF%9B%E6%A1%B6%20i%0A%20%20%20%20%20%20%20%20buckets%5Bi%5D.append%28num%29%0A%20%20%20%20%23%202.%20%E5%AF%B9%E5%90%84%E4%B8%AA%E6%A1%B6%E6%89%A7%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E5%86%85%E7%BD%AE%E6%8E%92%E5%BA%8F%E5%87%BD%E6%95%B0%EF%BC%8C%E4%B9%9F%E5%8F%AF%E4%BB%A5%E6%9B%BF%E6%8D%A2%E6%88%90%E5%85%B6%E4%BB%96%E6%8E%92%E5%BA%8F%E7%AE%97%E6%B3%95%0A%20%20%20%20%20%20%20%20bucket.sort%28%29%0A%20%20%20%20%23%203.%20%E9%81%8D%E5%8E%86%E6%A1%B6%E5%90%88%E5%B9%B6%E7%BB%93%E6%9E%9C%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20for%20num%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E8%AE%BE%E8%BE%93%E5%85%A5%E6%95%B0%E6%8D%AE%E4%B8%BA%E6%B5%AE%E7%82%B9%E6%95%B0%EF%BC%8C%E8%8C%83%E5%9B%B4%E4%B8%BA%20%5B0,%201%29%0A%20%20%20%20nums%20%3D%20%5B0.49,%200.96,%200.82,%200.09,%200.57,%200.43,%200.91,%200.75,%200.15,%200.37%5D%0A%20%20%20%20bucket_sort%28nums%29%0A%20%20%20%20print%28%22%E6%A1%B6%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 11.8.2 &nbsp; Algorithm characteristics

Bucket sort is suitable for handling very large data sets. For example, if the input data includes 1 million elements, and system memory limitations prevent loading all the data at once, you can divide the data into 1,000 buckets and sort each bucket separately before merging the results.

- **Time complexity is $O(n + k)$**: Assuming the elements are evenly distributed across the buckets, the number of elements in each bucket is $n/k$. Assuming sorting a single bucket takes $O(n/k \log(n/k))$ time, sorting all buckets takes $O(n \log(n/k))$ time. **When the number of buckets $k$ is relatively large, the time complexity tends towards $O(n)$**. Merging the results requires traversing all buckets and elements, taking $O(n + k)$ time.
- **Adaptive sorting**: In the worst case, all data is distributed into a single bucket, and sorting that bucket takes $O(n^2)$ time.
- **Space complexity is $O(n + k)$, non-in-place sorting**: It requires additional space for $k$ buckets and a total of $n$ elements.
- Whether bucket sort is stable depends on whether the algorithm used to sort elements within the buckets is stable.

## 11.8.3 &nbsp; How to achieve even distribution

The theoretical time complexity of bucket sort can reach $O(n)$, **the key is to evenly distribute the elements across all buckets**, as real data is often not uniformly distributed. For example, if we want to evenly distribute all products on Taobao by price range into 10 buckets, but the distribution of product prices is uneven, with many under 100 yuan and few over 1000 yuan. If the price range is evenly divided into 10, the difference in the number of products in each bucket will be very large.

To achieve even distribution, we can initially set a rough dividing line, roughly dividing the data into 3 buckets. **After the distribution is complete, the buckets with more products can be further divided into 3 buckets, until the number of elements in all buckets is roughly equal**.

As shown in the Figure 11-14 , this method essentially creates a recursive tree, aiming to make the leaf node values as even as possible. Of course, you don't have to divide the data into 3 buckets each round; the specific division method can be flexibly chosen based on data characteristics.

![Recursive division of buckets](bucket_sort.assets/scatter_in_buckets_recursively.png){ class="animation-figure" }

<p align="center"> Figure 11-14 &nbsp; Recursive division of buckets </p>

If we know the probability distribution of product prices in advance, **we can set the price dividing line for each bucket based on the data probability distribution**. It is worth noting that it is not necessarily required to specifically calculate the data distribution; it can also be approximated based on data characteristics using some probability model.

As shown in the Figure 11-15 , we assume that product prices follow a normal distribution, allowing us to reasonably set the price intervals, thereby evenly distributing the products into the respective buckets.

![Dividing buckets based on probability distribution](bucket_sort.assets/scatter_in_buckets_distribution.png){ class="animation-figure" }

<p align="center"> Figure 11-15 &nbsp; Dividing buckets based on probability distribution </p>
