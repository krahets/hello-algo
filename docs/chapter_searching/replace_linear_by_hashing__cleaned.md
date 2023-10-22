# 哈希优化策略

在算法题中，**我们常通过将线性查找替换为哈希查找来降低算法的时间复杂度**。我们借助一个算法题来加深理解。

!!! question

    给定一个整数数组 `nums` 和一个目标元素 `target` ，请在数组中搜索“和”为 `target` 的两个元素，并返回它们的数组索引。返回任意一个解即可。

## 线性查找：以时间换空间

考虑直接遍历所有可能的组合。如下图所示，我们开启一个两层循环，在每轮中判断两个整数的和是否为 `target` ，若是则返回它们的索引。

![线性查找求解两数之和](replace_linear_by_hashing.assets/two_sum_brute_force.png)

```src
[file]{two_sum}-[class]{}-[func]{two_sum_brute_force}
```

此方法的时间复杂度为 $O(n^2)$ ，空间复杂度为 $O(1)$ ，在大数据量下非常耗时。

## 哈希查找：以空间换时间

考虑借助一个哈希表，键值对分别为数组元素和元素索引。循环遍历数组，每轮执行下图所示的步骤。

1. 判断数字 `target - nums[i]` 是否在哈希表中，若是则直接返回这两个元素的索引。
2. 将键值对 `nums[i]` 和索引 `i` 添加进哈希表。

=== "<1>"
    ![辅助哈希表求解两数之和](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png)

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png)

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png)

实现代码如下所示，仅需单层循环即可。

```src
[file]{two_sum}-[class]{}-[func]{two_sum_hash_table}
```

此方法通过哈希查找将时间复杂度从 $O(n^2)$ 降低至 $O(n)$ ，大幅提升运行效率。

由于需要维护一个额外的哈希表，因此空间复杂度为 $O(n)$ 。**尽管如此，该方法的整体时空效率更为均衡，因此它是本题的最优解法**。



-----------------------------------------------------------------

## TWO_SUM
Python: `two_sum.py`
```python


def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
    """方法一：暴力枚举"""
    # 两层循环，时间复杂度 O(n^2)
    for i in range(len(nums) - 1):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]
    return []


def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
    """方法二：辅助哈希表"""
    # 辅助哈希表，空间复杂度 O(n)
    dic = {}
    # 单层循环，时间复杂度 O(n)
    for i in range(len(nums)):
        if target - nums[i] in dic:
            return [dic[target - nums[i]], i]
        dic[nums[i]] = i
    return []


"""Driver Code"""
if __name__ == "__main__":
    # ======= Test Case =======
    nums = [2, 7, 11, 15]
    target = 13

    # ====== Driver Code ======
    # 方法一
    res: list[int] = two_sum_brute_force(nums, target)
    print("方法一 res =", res)
    # 方法二
    res: list[int] = two_sum_hash_table(nums, target)
    print("方法二 res =", res)
```

Java: `two_sum.java`
```java

package chapter_searching;

import java.util.*;

public class two_sum {
    /* 方法一：暴力枚举 */
    static int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // 两层循环，时间复杂度 O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[0];
    }

    /* 方法二：辅助哈希表 */
    static int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // 辅助哈希表，空间复杂度 O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // 单层循环，时间复杂度 O(n)
        for (int i = 0; i < size; i++) {
            if (dic.containsKey(target - nums[i])) {
                return new int[] { dic.get(target - nums[i]), i };
            }
            dic.put(nums[i], i);
        }
        return new int[0];
    }

    public static void main(String[] args) {
        // ======= Test Case =======
        int[] nums = { 2, 7, 11, 15 };
        int target = 13;

        // ====== Driver Code ======
        // 方法一
        int[] res = twoSumBruteForce(nums, target);
        System.out.println("方法一 res = " + Arrays.toString(res));
        // 方法二
        res = twoSumHashTable(nums, target);
        System.out.println("方法二 res = " + Arrays.toString(res));
    }
}
```




-----------------------------------------------------------------

