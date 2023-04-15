/**
 * File: bucket_sort.c
 * Created Time: 2023-03-27
 * Author: Reanon (793584285@qq.com)
 */

#include "../include/include.h"

/* 冒泡排序 */
void bucketSort(double nums[], int size)
{
    // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
    int k = size / 2;
    // 1. 将数组元素分配到各个桶中
    // 输入数据范围 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
    // 将 num 添加进桶 i

    // 2. 对各个桶执行排序

    // 使用内置切片排序函数，也可以替换成其他排序算法

    // 3. 遍历桶合并结果
}

/* Driver Code */
int main()
{
    // 设输入数据为浮点数，范围为 [0, 1)
    double nums[] = {0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37};
    int size = sizeof(nums) / sizeof(double);
    bucketSort(nums, size);

    printf("桶排序完成后 nums = ");
    printf("[");
    for (int i = 0; i < size - 1; i++)
    {
        printf("%g, ", nums[i]);
    }
    printf("]");
}