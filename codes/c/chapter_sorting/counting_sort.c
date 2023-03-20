/**
 * File: counting_sort.c
 * Created Time: 2023-03-20
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../include/include.h"

/* 计数排序 */
// 简单实现，无法用于排序对象
static void countingSortNaive(int *nums, int len) {
    int i;
    // 1. 统计数组最大元素 m
    int m = 0;
    for (i = 0; i < len; i++) {
        m = m > nums[i] ? m : nums[i];
    }
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    int counter[m + 1];
    for (i = 0; i < m+1; i++) {
        counter[i] = 0;
    }
    for (i = 0; i < len; i++) {
        counter[nums[i]]++;
    }

    // 3. 遍历 counter ，将各元素填入原数组 nums
    i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* 计数排序 */
// 完整实现，可排序对象，并且是稳定排序
static void countingSort(int *nums, int len) {
    int i;
    // 1. 统计数组最大元素 m
    int m = 0;
    for (i = 0; i < len; i++) {
        m = m > nums[i] ? m : nums[i];
    }
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    int counter[m + 1];
    for (i = 0; i < m+1; i++) {
        counter[i] = 0;
    }
    for (i = 0; i < len; i++) {
        counter[nums[i]]++;
    }
    // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
    // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. 倒序遍历 nums ，将各元素填入结果数组 res
    // 初始化数组 res 用于记录结果
    int res[len];
    for (int i = len - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // 将 num 放置到对应索引处
        counter[num]--; // 令前缀和自减 1 ，得到下次放置 num 的索引
    }
    // 使用结果数组 res 覆盖原数组 nums
    for (int i = 0; i < len; i++) {
        nums[i] = res[i];
    }
}

static void printArr(int *nums, int len) {
    int i;
    for (i = 0; i < len; i++) {
        printf("%d ", nums[i]);
    }
    printf("\n");
}

int main()
{
    int nums[10] = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };

    countingSortNaive(nums, 10);
    printf("计数排序（无法排序对象）完成后 nums = ");
    printArr(nums, 10);

    countingSort(nums, 10);
    printf("计数排序完成后 nums = ");
    printArr(nums, 10);
    return 0;
}