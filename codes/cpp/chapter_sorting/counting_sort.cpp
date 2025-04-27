/**
 * File: counting_sort.cpp
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 计数排序 */
// 简单实现，无法用于排序对象
void countingSortNaive(vector<int> &nums) {
    // 1. 统计数组最大元素 m
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. 遍历 counter ，将各元素填入原数组 nums
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* 计数排序 */
// 完整实现，可排序对象，并且是稳定排序
void countingSort(vector<int> &nums) {
    // 1. 统计数组最大元素 m
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
    // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. 倒序遍历 nums ，将各元素填入结果数组 res
    // 初始化数组 res 用于记录结果
    int n = nums.size();
    vector<int> res(n);
    for (int i = n - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // 将 num 放置到对应索引处
        counter[num]--;              // 令前缀和自减 1 ，得到下次放置 num 的索引
    }
    // 使用结果数组 res 覆盖原数组 nums
    nums = res;
}

/* Driver Code */
int main() {
    vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    cout << "计数排序（无法排序对象）完成后 nums = ";
    printVector(nums);

    vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    cout << "计数排序完成后 nums1 = ";
    printVector(nums1);

    return 0;
}
