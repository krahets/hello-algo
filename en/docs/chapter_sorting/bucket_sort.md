---
comments: true
---

# 11.8 &nbsp; Bucket sort

The previously mentioned sorting algorithms are all "comparison-based sorting algorithms," which sort elements by comparing their values. Such sorting algorithms cannot have better time complexity of $O(n \log n)$. Next, we will discuss several "non-comparison sorting algorithms" that could achieve linear time complexity.

<u>Bucket sort</u> is a typical application of the divide-and-conquer strategy. It works by setting up a series of ordered buckets, each containing a range of data, and distributing the input data evenly across these buckets. And then, the data in each bucket is sorted individually. Finally, the sorted data from all the buckets is merged in sequence to produce the final result.

## 11.8.1 &nbsp; Algorithm process

Consider an array of length $n$, with float numbers in the range $[0, 1)$. The bucket sort process is illustrated in Figure 11-13.

1. Initialize $k$ buckets and distribute $n$ elements into these $k$ buckets.
2. Sort each bucket individually (using the built-in sorting function of the programming language).
3. Merge the results in the order from the smallest to the largest bucket.

![Bucket sort algorithm process](bucket_sort.assets/bucket_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-13 &nbsp; Bucket sort algorithm process </p>

The code is shown as follows:

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
            // Add number to bucket_idx
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
    [class]{bucket_sort}-[func]{BucketSort}
    ```

=== "Go"

    ```go title="bucket_sort.go"
    [class]{}-[func]{bucketSort}
    ```

=== "Swift"

    ```swift title="bucket_sort.swift"
    [class]{}-[func]{bucketSort}
    ```

=== "JS"

    ```javascript title="bucket_sort.js"
    [class]{}-[func]{bucketSort}
    ```

=== "TS"

    ```typescript title="bucket_sort.ts"
    [class]{}-[func]{bucketSort}
    ```

=== "Dart"

    ```dart title="bucket_sort.dart"
    [class]{}-[func]{bucketSort}
    ```

=== "Rust"

    ```rust title="bucket_sort.rs"
    [class]{}-[func]{bucket_sort}
    ```

=== "C"

    ```c title="bucket_sort.c"
    [class]{}-[func]{bucketSort}
    ```

=== "Kotlin"

    ```kotlin title="bucket_sort.kt"
    [class]{}-[func]{bucketSort}
    ```

=== "Ruby"

    ```ruby title="bucket_sort.rb"
    [class]{}-[func]{bucket_sort}
    ```

=== "Zig"

    ```zig title="bucket_sort.zig"
    [class]{}-[func]{bucketSort}
    ```

## 11.8.2 &nbsp; Algorithm characteristics

Bucket sort is suitable for handling very large data sets. For example, if the input data includes 1 million elements, and system memory limitations prevent loading all the data at the same time, you can divide the data into 1,000 buckets and sort each bucket separately before merging the results.

- **Time complexity is $O(n + k)$**: Assuming the elements are evenly distributed across the buckets, the number of elements in each bucket is $n/k$. Assuming sorting a single bucket takes $O(n/k \log(n/k))$ time, sorting all buckets takes $O(n \log(n/k))$ time. **When the number of buckets $k$ is relatively large, the time complexity approaches $O(n)$**. Merging the results requires traversing all buckets and elements, taking $O(n + k)$ time. In the worst case, all data is distributed into a single bucket, and sorting that bucket takes $O(n^2)$ time.
- **Space complexity is $O(n + k)$, non-in-place sorting**: It requires additional space for $k$ buckets and a total of $n$ elements.
- Whether bucket sort is stable depends on whether the sorting algorithm used within each bucket is stable.

## 11.8.3 &nbsp; How to achieve even distribution

The theoretical time complexity of bucket sort can reach $O(n)$. **The key is to evenly distribute the elements across all buckets** as real-world data is often not uniformly distributed. For example, we may want to evenly distribute all products on eBay by price range into 10 buckets. However, the distribution of product prices may not be even, with many under $100 and few over $500. If the price range is evenly divided into 10, the difference in the number of products in each bucket will be significant.

To achieve even distribution, we can initially set an approximate boundary to roughly divide the data into 3 buckets. **After the distribution is complete, the buckets with more items can be further divided into 3 buckets, until the number of elements in all buckets is roughly equal**.

As shown in Figure 11-14, this method essentially constructs a recursive tree, aiming to ensure the element counts in leaf nodes are as even as possible. Of course, you don't have to divide the data into 3 buckets each round - the partitioning strategy can be adaptively tailored to the data's unique characteristics.

![Recursive division of buckets](bucket_sort.assets/scatter_in_buckets_recursively.png){ class="animation-figure" }

<p align="center"> Figure 11-14 &nbsp; Recursive division of buckets </p>

If we know the probability distribution of product prices in advance, **we can set the price boundaries for each bucket based on the data probability distribution**. It is worth noting that it is not necessarily required to specifically calculate the data distribution; instead, it can be approximated based on data characteristics using a probability model.

As shown in Figure 11-15, assuming that product prices follow a normal distribution, we can define reasonable price intervals to balance the distribution of items across the buckets.

![Dividing buckets based on probability distribution](bucket_sort.assets/scatter_in_buckets_distribution.png){ class="animation-figure" }

<p align="center"> Figure 11-15 &nbsp; Dividing buckets based on probability distribution </p>
