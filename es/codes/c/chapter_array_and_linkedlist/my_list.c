/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 列表类 */
typedef struct {
    int *arr;        // 数组（存储列表元素）
    int capacity;    // 列表容量
    int size;        // 列表大小
    int extendRatio; // 列表每次扩容的倍数
} MyList;

void extendCapacity(MyList *nums);

/* 构造函数 */
MyList *newMyList() {
    MyList *nums = malloc(sizeof(MyList));
    nums->capacity = 10;
    nums->arr = malloc(sizeof(int) * nums->capacity);
    nums->size = 0;
    nums->extendRatio = 2;
    return nums;
}

/* 析构函数 */
void delMyList(MyList *nums) {
    free(nums->arr);
    free(nums);
}

/* 获取列表长度 */
int size(MyList *nums) {
    return nums->size;
}

/* 获取列表容量 */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* 访问元素 */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* 更新元素 */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* 在尾部添加元素 */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 扩容
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* 在中间插入元素 */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // 元素数量超出容量时，触发扩容机制
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // 扩容
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* 删除元素 */
// 注意：stdio.h 占用了 remove 关键词
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* 列表扩容 */
void extendCapacity(MyList *nums) {
    // 先分配空间
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // 拷贝旧数据到新数据
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // 释放旧数据
    free(temp);

    // 更新新数据
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* 将列表转换为 Array 用于打印 */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* Driver Code */
int main() {
    /* 初始化列表 */
    MyList *nums = newMyList();
    /* 在尾部添加元素 */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("列表 nums = ");
    printArray(toArray(nums), size(nums));
    printf("容量 = %d ，长度 = %d\n", capacity(nums), size(nums));

    /* 在中间插入元素 */
    insert(nums, 3, 6);
    printf("在索引 3 处插入数字 6 ，得到 nums = ");
    printArray(toArray(nums), size(nums));

    /* 删除元素 */
    removeItem(nums, 3);
    printf("删除索引 3 处的元素，得到 nums = ");
    printArray(toArray(nums), size(nums));

    /* 访问元素 */
    int num = get(nums, 1);
    printf("访问索引 1 处的元素，得到 num = %d\n", num);

    /* 更新元素 */
    set(nums, 1, 0);
    printf("将索引 1 处的元素更新为 0 ，得到 nums = ");
    printArray(toArray(nums), size(nums));

    /* 测试扩容机制 */
    for (int i = 0; i < 10; i++) {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        add(nums, i);
    }

    printf("扩容后的列表 nums = ");
    printArray(toArray(nums), size(nums));
    printf("容量 = %d ，长度 = %d\n", capacity(nums), size(nums));

    /* 释放分配内存 */
    delMyList(nums);

    return 0;
}
