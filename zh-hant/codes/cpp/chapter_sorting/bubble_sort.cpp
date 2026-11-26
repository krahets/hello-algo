/**
 * File: bubble_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 氣泡排序 */
void bubbleSort(vector<int> &nums) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                // 這裡使用 std::swap() 函式
                swap(nums[j], nums[j + 1]);
            }
        }
    }
}

/* 氣泡排序（以旗標最佳化）*/
void bubbleSortWithFlag(vector<int> &nums) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        bool flag = false; // 初始化旗標
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                // 這裡使用 std::swap() 函式
                swap(nums[j], nums[j + 1]);
                flag = true; // 記錄本輪曾交換元素
            }
        }
        if (!flag)
            break; // 這一輪「冒泡」未交換任何元素，直接跳出迴圈
    }
}

/* 主程式 */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    bubbleSort(nums);
    cout << "氣泡排序完成後 nums = ";
    printVector(nums);

    vector<int> nums1 = {4, 1, 3, 1, 5, 2};
    bubbleSortWithFlag(nums1);
    cout << "氣泡排序完成後 nums1 = ";
    printVector(nums1);

    return 0;
}
