/*
 * File: bubble_sort.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../include/include.hpp"

/* 冒泡排序 */
void bubbleSort(vector<int>& nums) {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for (int i = nums.size() - 1; i > 0; i--) {
        // 内循环：冒泡操作
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

/* 冒泡排序（标志优化）*/
void bubbleSortWithFlag(vector<int>& nums) {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for (int i = nums.size() - 1; i > 0; i--) {
        bool flag = false; // 初始化标志位
        // 内循环：冒泡操作
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true;  // 记录交换元素
            }
        }
        if (!flag) break;     // 此轮冒泡未交换任何元素，直接跳出
    }
}


/* Driver Code */
int main() {
    vector<int> nums = { 4, 1, 3, 1, 5, 2 };
    bubbleSort(nums);
    cout << "冒泡排序完成后 nums = ";
    PrintUtil::printVector(nums);

    vector<int> nums1 = { 4, 1, 3, 1, 5, 2 };
    bubbleSortWithFlag(nums1);
    cout << "冒泡排序完成后 nums1 = ";
    PrintUtil::printVector(nums1);

    return 0;
}
