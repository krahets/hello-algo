/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 要素への乱数アクセス */
int randomAccess(int *nums, int size) {
    // [0, size)の範囲で乱数を選択
    int randomIndex = rand() % size;
    // 乱数要素を取得して返却
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 配列長の拡張 */
int *extend(int *nums, int size, int enlarge) {
    // 拡張された長さの配列を初期化
    int *res = new int[size + enlarge];
    // 元の配列の全要素を新しい配列にコピー
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // メモリを解放
    delete[] nums;
    // 拡張後の新しい配列を返却
    return res;
}

/* `index`に要素numを挿入 */
void insert(int *nums, int size, int num, int index) {
    // `index`より後のすべての要素を1つ後ろに移動
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // indexの位置にnumを代入
    nums[index] = num;
}

/* `index`の要素を削除 */
void remove(int *nums, int size, int index) {
    // `index`より後のすべての要素を1つ前に移動
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 配列の走査 */
void traverse(int *nums, int size) {
    int count = 0;
    // インデックスによる配列の走査
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 配列内の指定要素を検索 */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* ドライバーコード */
int main() {
    /* 配列を初期化 */
    int size = 5;
    int *arr = new int[size];
    cout << "Array arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "Array nums = ";
    printArray(nums, size);

    /* 乱数アクセス */
    int randomNum = randomAccess(nums, size);
    cout << "Get a random element from nums = " << randomNum << endl;

    /* 長さの拡張 */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "Extend the array length to 8, resulting in nums = ";
    printArray(nums, size);

    /* 要素の挿入 */
    insert(nums, size, 6, 3);
    cout << "Insert the number 6 at index 3, resulting in nums = ";
    printArray(nums, size);

    /* 要素の削除 */
    remove(nums, size, 2);
    cout << "Remove the element at index 2, resulting in nums = ";
    printArray(nums, size);

    /* 配列の走査 */
    traverse(nums, size);

    /* 要素の検索 */
    int index = find(nums, size, 3);
    cout << "Find element 3 in nums, index = " << index << endl;

    // メモリを解放
    delete[] arr;
    delete[] nums;

    return 0;
}