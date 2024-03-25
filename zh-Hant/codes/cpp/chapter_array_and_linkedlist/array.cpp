/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 隨機訪問元素 */
int randomAccess(int *nums, int size) {
    // 在區間 [0, size) 中隨機抽取一個數字
    int randomIndex = rand() % size;
    // 獲取並返回隨機元素
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 擴展陣列長度 */
int *extend(int *nums, int size, int enlarge) {
    // 初始化一個擴展長度後的陣列
    int *res = new int[size + enlarge];
    // 將原陣列中的所有元素複製到新陣列
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // 釋放記憶體
    delete[] nums;
    // 返回擴展後的新陣列
    return res;
}

/* 在陣列的索引 index 處插入元素 num */
void insert(int *nums, int size, int num, int index) {
    // 把索引 index 以及之後的所有元素向後移動一位
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 將 num 賦給 index 處的元素
    nums[index] = num;
}

/* 刪除索引 index 處的元素 */
void remove(int *nums, int size, int index) {
    // 把索引 index 之後的所有元素向前移動一位
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 走訪陣列 */
void traverse(int *nums, int size) {
    int count = 0;
    // 透過索引走訪陣列
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 在陣列中查詢指定元素 */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    /* 初始化陣列 */
    int size = 5;
    int *arr = new int[size];
    cout << "陣列 arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "陣列 nums = ";
    printArray(nums, size);

    /* 隨機訪問 */
    int randomNum = randomAccess(nums, size);
    cout << "在 nums 中獲取隨機元素 " << randomNum << endl;

    /* 長度擴展 */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "將陣列長度擴展至 8 ，得到 nums = ";
    printArray(nums, size);

    /* 插入元素 */
    insert(nums, size, 6, 3);
    cout << "在索引 3 處插入數字 6 ，得到 nums = ";
    printArray(nums, size);

    /* 刪除元素 */
    remove(nums, size, 2);
    cout << "刪除索引 2 處的元素，得到 nums = ";
    printArray(nums, size);

    /* 走訪陣列 */
    traverse(nums, size);

    /* 查詢元素 */
    int index = find(nums, size, 3);
    cout << "在 nums 中查詢元素 3 ，得到索引 = " << index << endl;

    // 釋放記憶體
    delete[] arr;
    delete[] nums;

    return 0;
}
