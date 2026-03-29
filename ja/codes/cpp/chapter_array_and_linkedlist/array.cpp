/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 要素へランダムアクセス */
int randomAccess(int *nums, int size) {
    // 区間 [0, size) からランダムに 1 つの数を選ぶ
    int randomIndex = rand() % size;
    // ランダムな要素を取得して返す
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 配列長を拡張する */
int *extend(int *nums, int size, int enlarge) {
    // 拡張後の長さを持つ配列を初期化する
    int *res = new int[size + enlarge];
    // 元の配列の全要素を新しい配列にコピー
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // メモリを解放する
    delete[] nums;
    // 拡張後の新しい配列を返す
    return res;
}

/* 配列の index 番目に要素 num を挿入 */
void insert(int *nums, int size, int num, int index) {
    // インデックス index 以降の全要素を 1 つ後ろへ移動する
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // index の要素に num を代入する
    nums[index] = num;
}

/* index の要素を削除する */
void remove(int *nums, int size, int index) {
    // インデックス index より後ろの全要素を 1 つ前へ移動する
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 配列を走査 */
void traverse(int *nums, int size) {
    int count = 0;
    // インデックスで配列を走査
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 配列内で指定要素を探す */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    /* 配列を初期化 */
    int size = 5;
    int *arr = new int[size];
    cout << "配列 arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "配列 nums = ";
    printArray(nums, size);

    /* ランダムアクセス */
    int randomNum = randomAccess(nums, size);
    cout << "nums から取得したランダム要素 " << randomNum << endl;

    /* 長さを拡張 */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "配列長を 8 に拡張し、nums = ";
    printArray(nums, size);

    /* 要素を挿入する */
    insert(nums, size, 6, 3);
    cout << "インデックス 3 に数値 6 を挿入し、nums = ";
    printArray(nums, size);

    /* 要素を削除 */
    remove(nums, size, 2);
    cout << "インデックス 2 の要素を削除し、nums = ";
    printArray(nums, size);

    /* 配列を走査 */
    traverse(nums, size);

    /* 要素を探索する */
    int index = find(nums, size, 3);
    cout << "nums 内で要素 3 を検索し、インデックス = " << index << endl;

    // メモリを解放する
    delete[] arr;
    delete[] nums;

    return 0;
}
