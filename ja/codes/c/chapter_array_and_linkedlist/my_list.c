/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* リストクラス */
typedef struct {
    int *arr;        // 配列（リスト要素を格納）
    int capacity;    // リスト容量
    int size;        // リストのサイズ
    int extendRatio; // リストが拡張されるたびの倍率
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

/* リストの長さを取得 */
int size(MyList *nums) {
    return nums->size;
}

/* リスト容量を取得する */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* 要素にアクセス */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* 要素を更新 */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* 末尾に要素を追加 */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 容量を拡張
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* 中間に要素を挿入 */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // 要素数が容量を超えると、拡張機構が発動する
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 容量を拡張
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* 要素を削除 */
// 注意: stdio.h が remove 識別子を使用している
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* リストの拡張 */
void extendCapacity(MyList *nums) {
    // 先に領域を確保する
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // 古いデータを新しいデータにコピー
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // 古いデータを解放する
    free(temp);

    // 新しいデータに更新
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* 出力用にリストを Array に変換 */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* Driver Code */
int main() {
    /* リストを初期化 */
    MyList *nums = newMyList();
    /* 末尾に要素を追加 */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("リスト nums = ");
    printArray(toArray(nums), size(nums));
    printf("容量 = %d ，長さ = %d\n", capacity(nums), size(nums));

    /* 中間に要素を挿入 */
    insert(nums, 3, 6);
    printf("インデックス 3 に数字 6 を挿入し、nums = ");
    printArray(toArray(nums), size(nums));

    /* 要素を削除 */
    removeItem(nums, 3);
    printf("インデックス 3 の要素を削除し、nums = ");
    printArray(toArray(nums), size(nums));

    /* 要素にアクセス */
    int num = get(nums, 1);
    printf("インデックス 1 の要素にアクセスし、num = %d\n", num);

    /* 要素を更新 */
    set(nums, 1, 0);
    printf("インデックス 1 の要素を 0 に更新し、nums = ");
    printArray(toArray(nums), size(nums));

    /* 拡張機構をテストする */
    for (int i = 0; i < 10; i++) {
        // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
        add(nums, i);
    }

    printf("拡張後のリスト nums = ");
    printArray(toArray(nums), size(nums));
    printf("容量 = %d ，長さ = %d\n", capacity(nums), size(nums));

    /* 確保したメモリを解放する */
    delMyList(nums);

    return 0;
}
