---
comments: true
---

# 权衡时间与空间

理想情况下，我们希望算法的时间复杂度和空间复杂度都能够达到最优，而实际上，同时优化时间复杂度和空间复杂度是非常困难的。

**降低时间复杂度，往往是以提升空间复杂度为代价的，反之亦然。** 我们把牺牲内存空间来提升算法运行速度的思路称为「以空间换时间」；反之，称之为「以时间换空间」。选择哪种思路取决于我们更看重哪个方面。大多数情况下，内存空间不会成为算法瓶颈，因此以空间换时间更加常用。

## 示例题目 *

以 LeetCode 全站第一题 [两数之和](https://leetcode.cn/problems/two-sum/) 为例，「暴力枚举」和「辅助哈希表」分别为 **空间最优** 和 **时间最优** 的两种解法。本着时间比空间更宝贵的原则，后者是本题的最佳解法。

### 方法一：暴力枚举

时间复杂度 $O(N^2)$ ，空间复杂度 $O(1)$ ，属于「时间换空间」。

虽然仅使用常数大小的额外空间，但运行速度过慢。

=== "Java"

    ```java title="" title="leetcode_two_sum.java"
    class SolutionBruteForce {
        public int[] twoSum(int[] nums, int target) {
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
    }
    ```

=== "C++"

    ```cpp title="leetcode_two_sum.cpp"
    class SolutionBruteForce {
    public:
        vector<int> twoSum(vector<int>& nums, int target) {
            int size = nums.size();
            // 两层循环，时间复杂度 O(n^2)
            for (int i = 0; i < size - 1; i++) {
                for (int j = i + 1; j < size; j++) {
                    if (nums[i] + nums[j] == target)
                        return { i, j };
                }
            }
            return {};
        }
    };
    ```

=== "Python"

    ```python title="leetcode_two_sum.py"
    class SolutionBruteForce:
        def twoSum(self, nums: List[int], target: int) -> List[int]:
            # 两层循环，时间复杂度 O(n^2)
            for i in range(len(nums) - 1):
                for j in range(i + 1, len(nums)):
                    if nums[i] + nums[j] == target:
                        return i, j
            return []
    ```

=== "Go"

    ```go title="leetcode_two_sum.go"
    func twoSumBruteForce(nums []int, target int) []int {
        size := len(nums)
        // 两层循环，时间复杂度 O(n^2)
        for i := 0; i < size-1; i++ {
            for j := i + 1; i < size; j++ {
                if nums[i]+nums[j] == target {
                    return []int{i, j}
                }
            }
        }
        return nil
    }
    ```

### 方法二：辅助哈希表

时间复杂度 $O(N)$ ，空间复杂度 $O(N)$ ，属于「空间换时间」。

借助辅助哈希表 dic ，通过保存数组元素与索引的映射来提升算法运行速度。

=== "Java"

    ```java title="" title="leetcode_two_sum.java"
    class SolutionHashMap {
        public int[] twoSum(int[] nums, int target) {
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
    }
    ```

=== "C++"

    ```cpp title="leetcode_two_sum.cpp"
    class SolutionHashMap {
    public:
        vector<int> twoSum(vector<int>& nums, int target) {
            int size = nums.size();
            // 辅助哈希表，空间复杂度 O(n)
            unordered_map<int, int> dic;
            // 单层循环，时间复杂度 O(n)
            for (int i = 0; i < size; i++) {
                if (dic.find(target - nums[i]) != dic.end()) {
                    return { dic[target - nums[i]], i };
                }
                dic.emplace(nums[i], i);
            }
            return {};
        }
    };
    ```

=== "Python"

    ```python title="leetcode_two_sum.py"
    class SolutionHashMap:
        def twoSum(self, nums: List[int], target: int) -> List[int]:
            # 辅助哈希表，空间复杂度 O(n)
            dic = {}
            # 单层循环，时间复杂度 O(n)
            for i in range(len(nums)):
                if target - nums[i] in dic:
                    return dic[target - nums[i]], i
                dic[nums[i]] = i
            return []
    ```

=== "Go"

    ```go title="leetcode_two_sum.go"
    func twoSumHashTable(nums []int, target int) []int {
        // 辅助哈希表，空间复杂度 O(n)
        hashTable := map[int]int{}
        // 单层循环，时间复杂度 O(n)
        for idx, val := range nums {
            if preIdx, ok := hashTable[target-val]; ok {
                return []int{preIdx, idx}
            }
            hashTable[val] = idx
        }
        return nil
    }
    ```
