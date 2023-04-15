# 权衡时间与空间

理想情况下，我们希望算法的时间复杂度和空间复杂度都能达到最优。然而在实际情况中，同时优化时间复杂度和空间复杂度通常是非常困难的。

**降低时间复杂度通常需要以提升空间复杂度为代价，反之亦然**。我们将牺牲内存空间来提升算法运行速度的思路称为「以空间换时间」；反之，则称之为「以时间换空间」。

选择哪种思路取决于我们更看重哪个方面。在大多数情况下，时间比空间更宝贵，因此以空间换时间通常是更常用的策略。当然，在数据量很大的情况下，控制空间复杂度也是非常重要的。

## 示例题目 *

以 LeetCode 全站第一题 [两数之和](https://leetcode.cn/problems/two-sum/) 为例。

!!! question "两数之和"

    给定一个整数数组 `nums` 和一个整数目标值 `target` ，请你在该数组中找出“和”为目标值 `target` 的那两个整数，并返回它们的数组下标。

    你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

    你可以按任意顺序返回答案。

「暴力枚举」和「辅助哈希表」分别对应“空间最优”和“时间最优”的两种解法。遵循时间比空间更宝贵的原则，后者是本题的最佳解法。

### 方法一：暴力枚举

考虑直接遍历所有可能的组合。通过开启一个两层循环，判断两个整数的和是否为 `target` ，若是，则返回它们的索引（即下标）。

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

该方法的时间复杂度为 $O(n^2)$ ，空间复杂度为 $O(1)$ ，**属于以时间换空间**。此方法时间复杂度太高，在大数据量下非常耗时。

### 方法二：辅助哈希表

考虑借助一个哈希表，key-value 分别为数组元素和元素索引。循环遍历数组中的每个元素 num，并执行：

1. 判断数字 `target - num` 是否在哈希表中，若是则直接返回该两个元素的索引；
2. 将元素 `num` 和其索引添加进哈希表；

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

该方法的时间复杂度为 $O(N)$ ，空间复杂度为 $O(N)$ ，**体现了以空间换时间**。尽管此方法引入了额外的空间使用，但在时间和空间的整体效率更为均衡，因此它是本题的最优解法。
