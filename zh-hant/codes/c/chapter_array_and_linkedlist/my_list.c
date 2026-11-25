/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 列表類別 */
typedef struct {
    int *arr;        // 陣列（用來儲存列表元素）
    int capacity;    // 列表容量
    int size;        // 列表大小
    int extendRatio; // 列表每次擴充容量的倍數
} MyList;

void extendCapacity(MyList *nums);

/* 建構函式 */
MyList *newMyList() {
    MyList *nums = malloc(sizeof(MyList));
    nums->capacity = 10;
    nums->arr = malloc(sizeof(int) * nums->capacity);
    nums->size = 0;
    nums->extendRatio = 2;
    return nums;
}

/* 解構函式 */
void delMyList(MyList *nums) {
    free(nums->arr);
    free(nums);
}

/* 取得列表長度 */
int size(MyList *nums) {
    return nums->size;
}

/* 取得列表容量 */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* 存取元素 */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* 更新元素 */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* 在尾端加入元素 */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 擴充容量
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* 在中間插入元素 */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // 若加入元素後數量將超過容量，就觸發擴充機制
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 擴充容量
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* 刪除元素 */
// 注意：stdio.h 已使用 remove 這個名稱
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* 擴充列表容量 */
void extendCapacity(MyList *nums) {
    // 先配置空間
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // 將舊資料複製到新空間
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // 釋放舊資料
    free(temp);

    // 改用新資料
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* 將列表轉為 Array 以便印出 */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* 範例主程式 */
int main() {
    /* 初始化列表 */
    MyList *nums = newMyList();
    /* 在尾端加入元素 */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("列表 nums = ");
    printArray(toArray(nums), size(nums));
    printf("容量 = %d，長度 = %d\n", capacity(nums), size(nums));

    /* 在中間插入元素 */
    insert(nums, 3, 6);
    printf("在索引 3 處插入數字 6，得到 nums = ");
    printArray(toArray(nums), size(nums));

    /* 刪除元素 */
    removeItem(nums, 3);
    printf("刪除索引 3 處的元素，得到 nums = ");
    printArray(toArray(nums), size(nums));

    /* 存取元素 */
    int num = get(nums, 1);
    printf("存取索引 1 處的元素，得到 num = %d\n", num);

    /* 更新元素 */
    set(nums, 1, 0);
    printf("將索引 1 處的元素更新為 0，得到 nums = ");
    printArray(toArray(nums), size(nums));

    /* 測試容量擴充機制 */
    for (int i = 0; i < 10; i++) {
        // 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
        add(nums, i);
    }

    printf("擴充後的列表 nums = ");
    printArray(toArray(nums), size(nums));
    printf("容量 = %d，長度 = %d\n", capacity(nums), size(nums));

    /* 釋放已配置的記憶體 */
    delMyList(nums);

    return 0;
}
