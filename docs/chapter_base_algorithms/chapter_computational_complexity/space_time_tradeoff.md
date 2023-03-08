# 权衡时间与空间

理想情况下，我们希望算法的时间复杂度和空间复杂度都能够达到最优，而实际上，同时优化时间复杂度和空间复杂度是非常困难的。

**降低时间复杂度，往往是以提升空间复杂度为代价的，反之亦然**。我们把牺牲内存空间来提升算法运行速度的思路称为「以空间换时间」；反之，称之为「以时间换空间」。选择哪种思路取决于我们更看重哪个方面。

大多数情况下，时间都是比空间更宝贵的，只要空间复杂度不要太离谱、能接受就行，**因此以空间换时间最为常用**。

## 示例题目 *

以 LeetCode 全站第一题 [两数之和](https://leetcode.cn/problems/two-sum/) 为例。

!!! question "两数之和"

    给定一个整数数组 `nums` 和一个整数目标值 `target` ，请你在该数组中找出“和”为目标值 `target` 的那两个整数，并返回它们的数组下标。
    
    你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。
    
    你可以按任意顺序返回答案。

「暴力枚举」和「辅助哈希表」分别对应 **空间最优** 和 **时间最优** 的两种解法。本着时间比空间更宝贵的原则，后者是本题的最佳解法。

### 方法一：暴力枚举

考虑直接遍历所有所有可能性。通过开启一个两层循环，判断两个整数的和是否为 `target` ，若是则返回它俩的索引（即下标）即可。

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

该方法的时间复杂度为 $O(N^2)$ ，空间复杂度为 $O(1)$ ，**属于时间换空间**。本方法时间复杂度较高，在大数据量下非常耗时。

### 方法二：辅助哈希表

考虑借助一个哈希表，key 为数组元素、value 为元素索引。循环遍历数组中的每个元素 `num` ，并执行：

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

该方法的时间复杂度为 $O(N)$ ，空间复杂度为 $O(N)$ ，**体现空间换时间**。本方法虽然引入了额外空间使用，但时间和空间使用整体更加均衡，因此为本题最优解法。
