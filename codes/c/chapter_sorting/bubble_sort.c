/**
 * File: bubble_sort.c
 * Created Time: 2022-12-26
 * Author: Listening (https://github.com/L-Super)
 */

#include "../include/include.h"

/* 冒泡排序 */
void bubbleSort(int nums[], int size) {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for (int i = 0; i < size - 1; i++)
    {
        // 内循环：冒泡操作
        for (int j = 0; j < size - 1 - i; j++)
        {
            if (nums[j] > nums[j + 1])
            {
                int temp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = temp;
            }
        }
    }
}

/* 冒泡排序（标志优化）*/
void bubbleSortWithFlag(int nums[], int size) {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for (int i = 0; i < size - 1; i++)
    {
        bool flag = false;
        // 内循环：冒泡操作
        for (int j = 0; j < size - 1 - i; j++)
        {
            if (nums[j] > nums[j + 1])
            {
                int temp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = temp;
                flag = true;
            }
        }
        if (!flag)
            break;
    }
}


/* Driver Code */
int main() {
    int nums[6] = {4, 1, 3, 1, 5, 2};
    printf("冒泡排序后: ");
    bubbleSort(nums, 6);
    for (int i = 0; i < 6; i++)
    {
        printf("%d ", nums[i]);
    }

    printf("\n优化版冒泡排序后: ");
    bubbleSortWithFlag(nums, 6);
    for (int i = 0; i < 6; i++)
    {
        printf("%d ", nums[i]);
    }
    printf("\n");

    return 0;
}
