/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 串列類別 */
typedef struct {
    int *arr;        // 陣列（儲存串列元素）
    int capacity;    // 串列容量
    int size;        // 串列大小
    int extendRatio; // 串列每次擴容的倍數
} MyList;

void extendCapacity(MyList *nums);

/* 建構子 */
MyList *newMyList() {
    MyList *nums = malloc(sizeof(MyList));
    nums->capacity = 10;
    nums->arr = malloc(sizeof(int) * nums->capacity);
    nums->size = 0;
    nums->extendRatio = 2;
    return nums;
}

/* 析構函式 */
void delMyList(MyList *nums) {
    free(nums->arr);
    free(nums);
}

/* 獲取串列長度 */
int size(MyList *nums) {
    return nums->size;
}

/* 獲取串列容量 */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* 訪問元素 */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* 更新元素 */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* 在尾部新增元素 */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 擴容
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* 在中間插入元素 */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // 元素數量超出容量時，觸發擴容機制
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 擴容
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* 刪除元素 */
// 注意：stdio.h 佔用了 remove 關鍵詞
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* 串列擴容 */
void extendCapacity(MyList *nums) {
    // 先分配空間
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // 複製舊資料到新資料
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // 釋放舊資料
    free(temp);

    // 更新新資料
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* 將串列轉換為 Array 用於列印 */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* Driver Code */
int main() {
    /* 初始化串列 */
    MyList *nums = newMyList();
    /* 在尾部新增元素 */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("串列 nums = ");
    printArray(toArray(nums), size(nums));
    printf("容量 = %d ，長度 = %d\n", capacity(nums), size(nums));

    /* 在中間插入元素 */
    insert(nums, 3, 6);
    printf("在索引 3 處插入數字 6 ，得到 nums = ");
    printArray(toArray(nums), size(nums));

    /* 刪除元素 */
    removeItem(nums, 3);
    printf("刪除索引 3 處的元素，得到 nums = ");
    printArray(toArray(nums), size(nums));

    /* 訪問元素 */
    int num = get(nums, 1);
    printf("訪問索引 1 處的元素，得到 num = %d\n", num);

    /* 更新元素 */
    set(nums, 1, 0);
    printf("將索引 1 處的元素更新為 0 ，得到 nums = ");
    printArray(toArray(nums), size(nums));

    /* 測試擴容機制 */
    for (int i = 0; i < 10; i++) {
        // 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
        add(nums, i);
    }

    printf("擴容後的串列 nums = ");
    printArray(toArray(nums), size(nums));
    printf("容量 = %d ，長度 = %d\n", capacity(nums), size(nums));

    /* 釋放分配記憶體 */
    delMyList(nums);

    return 0;
}
