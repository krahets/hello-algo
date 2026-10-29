/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* リストクラス */
typedef struct {
    int *arr;        // 配列（リストの要素を格納する）
    int capacity;    // リストの容量
    int size;        // リストのサイズ
    int extendRatio; // リストを拡張する際の容量の倍率
} MyList;

void extendCapacity(MyList *nums);

/* コンストラクタ */
MyList *newMyList() {
    MyList *nums = malloc(sizeof(MyList));
    nums->capacity = 10;
    nums->arr = malloc(sizeof(int) * nums->capacity);
    nums->size = 0;
    nums->extendRatio = 2;
    return nums;
}

/* デストラクタ */
void delMyList(MyList *nums) {
    free(nums->arr);
    free(nums);
}

/* リストの長さを取得する */
int size(MyList *nums) {
    return nums->size;
}

/* リストの容量を取得する */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* 要素にアクセスする */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* 要素を更新する */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* 末尾に要素を追加する */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 容量を拡張する
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* 途中に要素を挿入する */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // 要素数が容量を超える場合、容量を拡張する
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 容量を拡張する
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* 要素を削除する */
// 注意：stdio.h で remove という名前が使われている
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* リストの容量を拡張する */
void extendCapacity(MyList *nums) {
    // 先に領域を確保する
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // 古いデータを新しい領域にコピーする
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // 古いデータの領域を解放する
    free(temp);

    // 新しいデータを参照するよう更新する
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* 表示用にリストを Array に変換する */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* 実行用コード */
int main() {
    /* リストを初期化する */
    MyList *nums = newMyList();
    /* 末尾に要素を追加する */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("リスト nums = ");
    printArray(toArray(nums), size(nums));
    printf("容量 = %d 、長さ = %d\n", capacity(nums), size(nums));

    /* 途中に要素を挿入する */
    insert(nums, 3, 6);
    printf("インデックス 3 に数値 6 を挿入した結果 nums = ");
    printArray(toArray(nums), size(nums));

    /* 要素を削除する */
    removeItem(nums, 3);
    printf("インデックス 3 の要素を削除した結果 nums = ");
    printArray(toArray(nums), size(nums));

    /* 要素にアクセスする */
    int num = get(nums, 1);
    printf("インデックス 1 の要素にアクセスした結果 num = %d\n", num);

    /* 要素を更新する */
    set(nums, 1, 0);
    printf("インデックス 1 の要素を 0 に更新した結果 nums = ");
    printArray(toArray(nums), size(nums));

    /* 容量の拡張をテストする */
    for (int i = 0; i < 10; i++) {
        // i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
        add(nums, i);
    }

    printf("容量を拡張した後のリスト nums = ");
    printArray(toArray(nums), size(nums));
    printf("容量 = %d 、長さ = %d\n", capacity(nums), size(nums));

    /* 確保したメモリを解放する */
    delMyList(nums);

    return 0;
}
