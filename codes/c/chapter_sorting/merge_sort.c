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
void merge(int nums[], int left, int mid, int right) {
    // 开辟一个新的数组，将原数组数据片段存进去
    int tmp[right - left + 1]; 
    for (int m = left; m <= right; m++) {
        tmp[m - left] = nums[m];
    }
    // i和j分别指向两个数组开头部分
    int i = left, j = mid + 1; 
    // 通过覆盖原数组 nums 来合并左子数组和右子数组
    for (int k = left; k <= right; k++) {
        // 若“左子数组已全部合并完”，则选取右子数组元素，并且 j++
        if (i > mid) {
            nums[k] = tmp[j - left];
            j++;
        }
        // 若“右子数组已全部合并完”，则选取左子数组元素，并且 i++
        else if (j > right) {
            nums[k] = tmp[i - left];
            i++;
        }
        //若“左子数组元素 <= 右子数组元素”，则选取左子数组元素，并且 i++
        else if (tmp[i - left] < tmp[j - left]) {
            nums[k] = tmp[i - left];
            i++;
        }
        // 否则，若“左右子数组都未全部合并完”且“左子数组元素 > 右子数组元素”，则选取右子数组元素，并且 j++
        else {
            nums[k] = tmp[j - left];
            j++;
        }
    }
}

void mergeSort(int nums[], int left, int right) {
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
int main() {
    /* 归并排序 */
    int nums[8] = {7, 3, 2, 6, 0, 1, 5, 4};
    
    mergeSort(nums, 0, 7);
    printf("归并排序完成后 nums = ");
    printArray(nums, 8);

    return 0;
}
