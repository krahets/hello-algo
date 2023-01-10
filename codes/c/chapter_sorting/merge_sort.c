/*
 * File: merge_sort.cpp
 * Created Time: 2023-01-10
 * Author: L-Super (https://github.com/L-Super)
 */

#include "../include/include.h"

/**
 * 合并左子数组和右子数组
 * 左子数组区间 [left, mid]
 * 右子数组区间 [mid + 1, right]
 */
void merge(int arr[], int left, int mid, int right)
{
    int aux[right - left + 1]; // 开辟一个新的数组，将原数组数据片段存进去
    for (int m = left; m <= right; m++)
    {
        aux[m - left] = arr[m];
    }

    int i = left, j = mid + 1; // i和j分别指向两个数组开头部分

    for (int k = left; k <= right; k++)
    {
        if (i > mid)
        {
            arr[k] = aux[j - left];
            j++;
        }
        else if (j > right)
        {
            arr[k] = aux[i - left];
            i++;
        }
        else if (aux[i - left] < aux[j - left])
        {
            arr[k] = aux[i - left];
            i++;
        }
        else
        {
            arr[k] = aux[j - left];
            j++;
        }
    }
}

void mergeSort(int nums[], int left, int right)
{
    // 终止条件
    if (left >= right)
        return; // 当子数组长度为 1 时终止递归
    // 划分阶段
    int mid = (left + right) / 2;    // 计算中点
    mergeSort(nums, left, mid);      // 递归左子数组
    mergeSort(nums, mid + 1, right); // 递归右子数组
    // 合并阶段
    merge(nums, left, mid, right);
}

/* Driver Code */
int main()
{
    /* 归并排序 */
    int nums[8] = {7, 3, 2, 6, 0, 1, 5, 4};
    
    mergeSort(nums, 0, 7);

    printArray(nums, 8);

    return 0;
}
