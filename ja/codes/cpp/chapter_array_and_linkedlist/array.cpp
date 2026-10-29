/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 要素にランダムアクセスする */
int randomAccess(int *nums, int size) {
    // 区間 [0, size) から数値をランダムに 1 つ選ぶ
    int randomIndex = rand() % size;
    // ランダムに選んだ要素を取得して返す
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 配列の長さを拡張する */
int *extend(int *nums, int size, int enlarge) {
    // 拡張後の長さの配列を初期化する
    int *res = new int[size + enlarge];
    // 元の配列の全要素を新しい配列にコピーする
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // メモリを解放する
    delete[] nums;
    // 拡張後の新しい配列を返す
    return res;
}

/* 配列のインデックス index に要素 num を挿入する */
void insert(int *nums, int size, int num, int index) {
    // インデックス index 以降の全要素を 1 つ後ろにずらす
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // インデックス index の要素に num を代入する
    nums[index] = num;
}

/* インデックス index の要素を削除する */
void remove(int *nums, int size, int index) {
    // インデックス index より後の全要素を 1 つ前にずらす
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 配列を走査する */
void traverse(int *nums, int size) {
    int count = 0;
    // インデックスを使って配列を走査する
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 配列から指定した要素を探索する */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* 実行用コード */
int main() {
    /* 配列を初期化する */
    int size = 5;
    int *arr = new int[size];
    cout << "配列 arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "配列 nums = ";
    printArray(nums, size);

    /* ランダムアクセス */
    int randomNum = randomAccess(nums, size);
    cout << "nums からランダムに取得した要素 " << randomNum << endl;

    /* 長さの拡張 */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "配列の長さを 8 に拡張した結果 nums = ";
    printArray(nums, size);

    /* 要素を挿入する */
    insert(nums, size, 6, 3);
    cout << "インデックス 3 に数値 6 を挿入した結果 nums = ";
    printArray(nums, size);

    /* 要素を削除する */
    remove(nums, size, 2);
    cout << "インデックス 2 の要素を削除した結果 nums = ";
    printArray(nums, size);

    /* 配列を走査する */
    traverse(nums, size);

    /* 要素を探索する */
    int index = find(nums, size, 3);
    cout << "nums から要素 3 を探索した結果のインデックス = " << index << endl;

    // メモリを解放する
    delete[] arr;
    delete[] nums;

    return 0;
}
