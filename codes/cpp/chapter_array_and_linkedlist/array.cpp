/**
 * File: array.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

/* 打印数组 */
void printArray(int *nums, int size) {
    cout << "[ ";
    for (int i = 0; i < size; i++) {
        cout << nums[i] << " ";
    }
    cout << "]" << endl;
}

/* 随机访问元素 */
int randomAccess(int *nums, int size) {
    int randomIndex = rand() % size;
    return nums[randomIndex];
}

/* 扩展数组长度 */
int *extend(int *nums, int size, int enlarge) {
    int *res = new int[size + enlarge];
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    delete[] nums;
    return res;
}

/* 在索引 index 处插入元素 num */
void insert(int *nums, int size, int num, int index) {
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    nums[index] = num;
}

/* 删除索引 index 处的元素 */
void remove(int *nums, int size, int index) {
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 遍历数组 */
void traverse(int *nums, int size) {
    int count = 0;
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 在数组中查找指定元素 */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    // 初始化随机种子
    srand((int)time(NULL));

    /* 初始化数组 */
    int size = 5;
    int *arr = new int[size];
    cout << "数组 arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "数组 nums = ";
    printArray(nums, size);

    /* 随机访问 */
    int randomNum = randomAccess(nums, size);
    cout << "在 nums 中获取随机元素: " << randomNum << endl;

    /* 长度扩展 */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "扩展长度至 8，nums = ";
    printArray(nums, size);

    /* 插入元素 */
    insert(nums, size, 6, 3);
    cout << "在索引 3 插入 6，nums = ";
    printArray(nums, size);

    /* 删除元素 */
    remove(nums, size, 2);
    cout << "删除索引 2 的元素，nums = ";
    printArray(nums, size);

    /* 遍历数组 */
    traverse(nums, size);

    /* 查找元素 */
    int index = find(nums, size, 3);
    cout << "元素 3 的索引 = " << index << endl;

    // 释放内存
    delete[] arr;
    delete[] nums;

    return 0;
}
