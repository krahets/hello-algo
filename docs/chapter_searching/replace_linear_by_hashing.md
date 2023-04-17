# 哈希优化策略

在算法题中，**我们时常通过将线性查找替换为哈希查找来降低算法的时间复杂度**。以 LeetCode 全站第一题 [两数之和](https://leetcode.cn/problems/two-sum/) 为例。

!!! question "两数之和"

    给定一个整数数组 `nums` 和一个整数目标值 `target` ，请你在该数组中找出“和”为目标值 `target` 的那两个整数，并返回它们的数组下标。

    你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

    你可以按任意顺序返回答案。

## 线性查找：以时间换空间

考虑直接遍历所有可能的组合。开启一个两层循环，在每轮中判断两个整数的和是否为 `target` ，若是，则返回它们的索引。

（图）

=== "Java"

    ```java title="leetcode_two_sum.java"
    [class]{leetcode_two_sum}-[func]{twoSumBruteForce}
    ```

=== "C++"

    ```cpp title="leetcode_two_sum.cpp"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Python"

    ```python title="leetcode_two_sum.py"
    [class]{}-[func]{two_sum_brute_force}
    ```

=== "Go"

    ```go title="leetcode_two_sum.go"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "JavaScript"

    ```javascript title="leetcode_two_sum.js"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "TypeScript"

    ```typescript title="leetcode_two_sum.ts"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "C"

    ```c title="leetcode_two_sum.c"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "C#"

    ```csharp title="leetcode_two_sum.cs"
    [class]{leetcode_two_sum}-[func]{twoSumBruteForce}
    ```

=== "Swift"

    ```swift title="leetcode_two_sum.swift"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Zig"

    ```zig title="leetcode_two_sum.zig"
    [class]{}-[func]{twoSumBruteForce}
    ```

此方法的时间复杂度为 $O(n^2)$ ，空间复杂度为 $O(1)$ ，在大数据量下非常耗时。

## 哈希查找：以空间换时间

考虑借助一个哈希表，将数组元素和元素索引构建为键值对。循环遍历数组中的每个元素 `num` 并执行：

1. 判断数字 `target - num` 是否在哈希表中，若是则直接返回该两个元素的索引；
2. 将元素 `num` 和其索引添加进哈希表；

（图）

=== "Java"

    ```java title="leetcode_two_sum.java"
    [class]{leetcode_two_sum}-[func]{twoSumHashTable}
    ```

=== "C++"

    ```cpp title="leetcode_two_sum.cpp"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "Python"

    ```python title="leetcode_two_sum.py"
    [class]{}-[func]{two_sum_hash_table}
    ```

=== "Go"

    ```go title="leetcode_two_sum.go"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "JavaScript"

    ```javascript title="leetcode_two_sum.js"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "TypeScript"

    ```typescript title="leetcode_two_sum.ts"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "C"

    ```c title="leetcode_two_sum.c"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "C#"

    ```csharp title="leetcode_two_sum.cs"
    [class]{leetcode_two_sum}-[func]{twoSumHashTable}
    ```

=== "Swift"

    ```swift title="leetcode_two_sum.swift"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "Zig"

    ```zig title="leetcode_two_sum.zig"
    [class]{}-[func]{twoSumHashTable}
    ```

此方法通过哈希查找将时间复杂度从 $O(n^2)$ 降低至 $O(n)$ ，大幅提升运行效率。

由于需要维护一个额外的哈希表，因此空间复杂度为 $O(n)$ 。**尽管如此，该方法的整体时空效率更为均衡，因此它是本题的最优解法**。
