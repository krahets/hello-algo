/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* 要素にランダムにアクセスする */
int randomAccess(int *nums, int size) {
    // 区間 [0, size) から数をランダムに選ぶ
    int randomIndex = rand() % size;
    // ランダムに選んだ要素を取得して返す
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 配列の長さを増やす */
int *extend(int *nums, int size, int enlarge) {
    // 長さを増やした配列を初期化する
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // 元の配列の全要素を新しい配列にコピーする
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // 追加した領域を初期化する
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
    // 長さを増やした新しい配列を返す
    return res;
}

/* 配列のインデックス index に要素 num を挿入する */
void insert(int *nums, int size, int num, int index) {
    // インデックス index 以降の全要素を後ろに 1 つずらす
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // インデックス index の要素に num を代入する
    nums[index] = num;
}

/* インデックス index の要素を削除する */
// 注意：stdio.h では remove という名前がすでに使われている
void removeItem(int *nums, int size, int index) {
    // インデックス index より後ろの全要素を前に 1 つずらす
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

/* 配列から指定した要素を探す */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* ドライバコード */
int main() {
    /* 乱数のシードを初期化する（1 回だけ実行） */
    srand((unsigned)time(NULL));

    /* 配列を初期化する */
    int size = 5;
    int arr[5] = {0};
    printf("配列 arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("配列 nums = ");
    printArray(nums, size);

    /* ランダムアクセス */
    int randomNum = randomAccess(nums, size);
    printf("nums からランダムに選んだ要素：%d", randomNum);

    /* 配列の長さを増やす */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("配列の長さを 8 に増やした後の nums = ");
    printArray(res, size);

    /* 要素を挿入する */
    insert(res, size, 6, 3);
    printf("インデックス 3 に 6 を挿入した後の nums = ");
    printArray(res, size);

    /* 要素を削除する */
    removeItem(res, size, 2);
    printf("インデックス 2 の要素を削除した後の nums = ");
    printArray(res, size);

    /* 配列を走査する */
    traverse(res, size);

    /* 要素を探す */
    int index = find(res, size, 3);
    printf("res で要素 3 が見つかったインデックス = %d\n", index);

    /* メモリを解放する */
    free(res);
    return 0;
}
