---
comments: true
---

# 11.8 &nbsp; Bucket Sort

The several sorting algorithms mentioned earlier all belong to "comparison-based sorting algorithms", which achieve sorting by comparing the size of elements. The time complexity of such sorting algorithms cannot exceed $O(n \log n)$. Next, we will explore several "non-comparison sorting algorithms", whose time complexity can reach linear order.

<u>Bucket sort (bucket sort)</u> is a typical application of the divide-and-conquer strategy. It works by setting up buckets with size order, each bucket corresponding to a data range, evenly distributing data to each bucket; then, sorting within each bucket separately; finally, merging all data in the order of the buckets.

## 11.8.1 &nbsp; Algorithm Flow

Consider an array of length $n$, whose elements are floating-point numbers in the range $[0, 1)$. The flow of bucket sort is shown in Figure 11-13.

1. Initialize $k$ buckets and distribute the $n$ elements into the $k$ buckets.
2. Sort each bucket separately (here we use the built-in sorting function of the programming language).
3. Merge the results in order from smallest to largest bucket.

![Bucket sort algorithm flow](bucket_sort.assets/bucket_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-13 &nbsp; Bucket sort algorithm flow </p>

The code is as follows:

=== "Python"

    ```python title="bucket_sort.py"
    def bucket_sort(nums: list[float]):
        """Bucket sort"""
        # Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        k = len(nums) // 2
        buckets = [[] for _ in range(k)]
        # 1. Distribute array elements into various buckets
        for num in nums:
            # Input data range is [0, 1), use num * k to map to index range [0, k-1]
            i = int(num * k)
            # Add num to bucket i
            buckets[i].append(num)
        # 2. Sort each bucket
        for bucket in buckets:
            # Use built-in sorting function, can also replace with other sorting algorithms
            bucket.sort()
        # 3. Traverse buckets to merge results
        i = 0
        for bucket in buckets:
            for num in bucket:
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="bucket_sort.cpp"
    /* Bucket sort */
    void bucketSort(vector<float> &nums) {
        // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        int k = nums.size() / 2;
        vector<vector<float>> buckets(k);
        // 1. Distribute array elements into various buckets
        for (float num : nums) {
            // Input data range is [0, 1), use num * k to map to index range [0, k-1]
            int i = num * k;
            // Add num to bucket bucket_idx
            buckets[i].push_back(num);
        }
        // 2. Sort each bucket
        for (vector<float> &bucket : buckets) {
            // Use built-in sorting function, can also replace with other sorting algorithms
            sort(bucket.begin(), bucket.end());
        }
        // 3. Traverse buckets to merge results
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
    /* Bucket sort */
    void bucketSort(float[] nums) {
        // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. Distribute array elements into various buckets
        for (float num : nums) {
            // Input data range is [0, 1), use num * k to map to index range [0, k-1]
            int i = (int) (num * k);
            // Add num to bucket i
            buckets.get(i).add(num);
        }
        // 2. Sort each bucket
        for (List<Float> bucket : buckets) {
            // Use built-in sorting function, can also replace with other sorting algorithms
            Collections.sort(bucket);
        }
        // 3. Traverse buckets to merge results
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
    /* Bucket sort */
    void BucketSort(float[] nums) {
        // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. Distribute array elements into various buckets
        foreach (float num in nums) {
            // Input data range is [0, 1), use num * k to map to index range [0, k-1]
            int i = (int)(num * k);
            // Add num to bucket i
            buckets[i].Add(num);
        }
        // 2. Sort each bucket
        foreach (List<float> bucket in buckets) {
            // Use built-in sorting function, can also replace with other sorting algorithms
            bucket.Sort();
        }
        // 3. Traverse buckets to merge results
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
    /* Bucket sort */
    func bucketSort(nums []float64) {
        // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        k := len(nums) / 2
        buckets := make([][]float64, k)
        for i := 0; i < k; i++ {
            buckets[i] = make([]float64, 0)
        }
        // 1. Distribute array elements into various buckets
        for _, num := range nums {
            // Input data range is [0, 1), use num * k to map to index range [0, k-1]
            i := int(num * float64(k))
            // Add num to bucket i
            buckets[i] = append(buckets[i], num)
        }
        // 2. Sort each bucket
        for i := 0; i < k; i++ {
            // Use built-in slice sorting function, can also be replaced with other sorting algorithms
            sort.Float64s(buckets[i])
        }
        // 3. Traverse buckets to merge results
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
    /* Bucket sort */
    func bucketSort(nums: inout [Double]) {
        // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        let k = nums.count / 2
        var buckets = (0 ..< k).map { _ in [Double]() }
        // 1. Distribute array elements into various buckets
        for num in nums {
            // Input data range is [0, 1), use num * k to map to index range [0, k-1]
            let i = Int(num * Double(k))
            // Add num to bucket i
            buckets[i].append(num)
        }
        // 2. Sort each bucket
        for i in buckets.indices {
            // Use built-in sorting function, can also replace with other sorting algorithms
            buckets[i].sort()
        }
        // 3. Traverse buckets to merge results
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
    /* Bucket sort */
    function bucketSort(nums) {
        // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        const k = nums.length / 2;
        const buckets = [];
        for (let i = 0; i < k; i++) {
            buckets.push([]);
        }
        // 1. Distribute array elements into various buckets
        for (const num of nums) {
            // Input data range is [0, 1), use num * k to map to index range [0, k-1]
            const i = Math.floor(num * k);
            // Add num to bucket i
            buckets[i].push(num);
        }
        // 2. Sort each bucket
        for (const bucket of buckets) {
            // Use built-in sorting function, can also replace with other sorting algorithms
            bucket.sort((a, b) => a - b);
        }
        // 3. Traverse buckets to merge results
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
    /* Bucket sort */
    function bucketSort(nums: number[]): void {
        // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        const k = nums.length / 2;
        const buckets: number[][] = [];
        for (let i = 0; i < k; i++) {
            buckets.push([]);
        }
        // 1. Distribute array elements into various buckets
        for (const num of nums) {
            // Input data range is [0, 1), use num * k to map to index range [0, k-1]
            const i = Math.floor(num * k);
            // Add num to bucket i
            buckets[i].push(num);
        }
        // 2. Sort each bucket
        for (const bucket of buckets) {
            // Use built-in sorting function, can also replace with other sorting algorithms
            bucket.sort((a, b) => a - b);
        }
        // 3. Traverse buckets to merge results
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
    /* Bucket sort */
    void bucketSort(List<double> nums) {
      // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
      int k = nums.length ~/ 2;
      List<List<double>> buckets = List.generate(k, (index) => []);

      // 1. Distribute array elements into various buckets
      for (double _num in nums) {
        // Input data range is [0, 1), use _num * k to map to index range [0, k-1]
        int i = (_num * k).toInt();
        // Add _num to bucket bucket_idx
        buckets[i].add(_num);
      }
      // 2. Sort each bucket
      for (List<double> bucket in buckets) {
        bucket.sort();
      }
      // 3. Traverse buckets to merge results
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
    /* Bucket sort */
    fn bucket_sort(nums: &mut [f64]) {
        // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        let k = nums.len() / 2;
        let mut buckets = vec![vec![]; k];
        // 1. Distribute array elements into various buckets
        for &num in nums.iter() {
            // Input data range is [0, 1), use num * k to map to index range [0, k-1]
            let i = (num * k as f64) as usize;
            // Add num to bucket i
            buckets[i].push(num);
        }
        // 2. Sort each bucket
        for bucket in &mut buckets {
            // Use built-in sorting function, can also replace with other sorting algorithms
            bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
        }
        // 3. Traverse buckets to merge results
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
    /* Bucket sort */
    void bucketSort(float nums[], int n) {
        int k = n / 2;                                 // Initialize k = n/2 buckets
        int *sizes = malloc(k * sizeof(int));          // Record each bucket's size
        float **buckets = malloc(k * sizeof(float *)); // Array of dynamic arrays (buckets)
        // Pre-allocate sufficient space for each bucket
        for (int i = 0; i < k; ++i) {
            buckets[i] = (float *)malloc(n * sizeof(float));
            sizes[i] = 0;
        }
        // 1. Distribute array elements into various buckets
        for (int i = 0; i < n; ++i) {
            int idx = (int)(nums[i] * k);
            buckets[idx][sizes[idx]++] = nums[i];
        }
        // 2. Sort each bucket
        for (int i = 0; i < k; ++i) {
            qsort(buckets[i], sizes[i], sizeof(float), compare);
        }
        // 3. Merge sorted buckets
        int idx = 0;
        for (int i = 0; i < k; ++i) {
            for (int j = 0; j < sizes[i]; ++j) {
                nums[idx++] = buckets[i][j];
            }
            // Free memory
            free(buckets[i]);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bucket_sort.kt"
    /* Bucket sort */
    fun bucketSort(nums: FloatArray) {
        // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        val k = nums.size / 2
        val buckets = mutableListOf<MutableList<Float>>()
        for (i in 0..<k) {
            buckets.add(mutableListOf())
        }
        // 1. Distribute array elements into various buckets
        for (num in nums) {
            // Input data range is [0, 1), use num * k to map to index range [0, k-1]
            val i = (num * k).toInt()
            // Add num to bucket i
            buckets[i].add(num)
        }
        // 2. Sort each bucket
        for (bucket in buckets) {
            // Use built-in sorting function, can also replace with other sorting algorithms
            bucket.sort()
        }
        // 3. Traverse buckets to merge results
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
    ### Bucket sort ###
    def bucket_sort(nums)
      # Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
      k = nums.length / 2
      buckets = Array.new(k) { [] }
      
      # 1. Distribute array elements into various buckets
      nums.each do |num|
        # Input data range is [0, 1), use num * k to map to index range [0, k-1]
        i = (num * k).to_i
        # Add num to bucket i
        buckets[i] << num
      end

      # 2. Sort each bucket
      buckets.each do |bucket|
        # Use built-in sorting function, can also replace with other sorting algorithms
        bucket.sort!
      end

      # 3. Traverse buckets to merge results
      i = 0
      buckets.each do |bucket|
        bucket.each do |num|
          nums[i] = num
          i += 1
        end
      end
    end
    ```

## 11.8.2 &nbsp; Algorithm Characteristics

Bucket sort is suitable for processing very large data volumes. For example, if the input data contains 1 million elements and system memory cannot load all the data at once, the data can be divided into 1000 buckets, each bucket sorted separately, and then the results merged.

- **Time complexity of $O(n + k)$**: Assuming the elements are evenly distributed among the buckets, then the number of elements in each bucket is $\frac{n}{k}$. Assuming sorting a single bucket uses $O(\frac{n}{k} \log\frac{n}{k})$ time, then sorting all buckets uses $O(n \log\frac{n}{k})$ time. **When the number of buckets $k$ is relatively large, the time complexity approaches $O(n)$**. Merging results requires traversing all buckets and elements, taking $O(n + k)$ time. In the worst case, all data is distributed into one bucket, and sorting that bucket uses $O(n^2)$ time.
- **Space complexity of $O(n + k)$, non-in-place sorting**: Additional space is required for $k$ buckets and a total of $n$ elements.
- Whether bucket sort is stable depends on whether the algorithm for sorting elements within buckets is stable.

## 11.8.3 &nbsp; How to Achieve Even Distribution

Theoretically, bucket sort can achieve $O(n)$ time complexity. **The key is to evenly distribute elements to each bucket**, because real data is often not evenly distributed. For example, if we want to evenly distribute all products on Taobao into 10 buckets by price range, there may be very many products below 100 yuan and very few above 1000 yuan. If the price intervals are evenly divided into 10, the difference in the number of products in each bucket will be very large.

To achieve even distribution, we can first set an approximate dividing line to roughly divide the data into 3 buckets. **After distribution is complete, continue dividing buckets with more products into 3 buckets until the number of elements in all buckets is roughly equal**.

As shown in Figure 11-14, this method essentially creates a recursion tree, with the goal of making the values of leaf nodes as even as possible. Of course, it is not necessary to divide the data into 3 buckets every round; the specific division method can be flexibly chosen according to data characteristics.

![Recursively dividing buckets](bucket_sort.assets/scatter_in_buckets_recursively.png){ class="animation-figure" }

<p align="center"> Figure 11-14 &nbsp; Recursively dividing buckets </p>

If we know the probability distribution of product prices in advance, **we can set the price dividing line for each bucket based on the data probability distribution**. It is worth noting that the data distribution does not necessarily need to be specifically calculated, but can also be approximated using a certain probability model based on data characteristics.

As shown in Figure 11-15, we assume that product prices follow a normal distribution, which allows us to reasonably set price intervals to evenly distribute products to each bucket.

![Dividing buckets based on probability distribution](bucket_sort.assets/scatter_in_buckets_distribution.png){ class="animation-figure" }

<p align="center"> Figure 11-15 &nbsp; Dividing buckets based on probability distribution </p>
