/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../include/include.h"


// 用数组实现 list
struct mylist {
    int* nums;       // 数组（存储列表元素）
    int capacity;    // 列表容量
    int size;        // 列表大小
    int extendRatio; // 列表每次扩容的倍数
};

typedef struct mylist MyList;
/* 前置声明 */
void extendCapacity(MyList *list);

/* 构造函数 */
void newMyList(MyList *list) {
    list->capacity = 10;
    list->nums = malloc(sizeof(int) * list->capacity);
    list->size = 0;
    list->extendRatio = 2;
}

/* 析构函数 */
void delMyList(MyList *list) {
    list->size = 0;
    free(list->nums);
}

/* 获取列表长度 */
int size(MyList *list) {
    return list->size;
}

/* 获取列表容量 */
int capacity(MyList *list) {
    return list->capacity;
}

/* 访问元素 */
int get(MyList *list, int index) {
    assert(index < list->size);
    return list->nums[index];
}

/* 更新元素 */
void set(MyList *list, int index, int num) {
    assert(index < list->size);
    list->nums[index] = num;
}

/* 尾部添加元素 */
void add(MyList *list, int num) {
    if (size(list) == capacity(list)) {
        extendCapacity(list); // 扩容
    }
    list->nums[size(list)] = num;
    list->size++;
}

/* 中间插入元素 */
void insert(MyList *list, int index, int num) {
    assert(index < size(list));
    for (int i = size(list); i > index; --i) {
      list->nums[i] = list->nums[i-1];
    }
    list->nums[index] = num;
    list->size++;
}

/* 删除元素 */
// 由于引入了 stdio.h ，此处无法使用 remove 关键词
// 详见 https://github.com/krahets/hello-algo/pull/244#discussion_r1067863888
int removeNum(MyList *list, int index) {
    assert(index < size(list));
    int num = list->nums[index];
    for (int i = index; i < size(list) - 1; i++) {
        list->nums[i] = list->nums[i+1];
    }
    list->size--;
    return num;
}

/* 列表扩容 */
void extendCapacity(MyList *list) {
    // 先分配空间
    int newCapacity = capacity(list) * list->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = list->nums;

    // 拷贝旧数据到新数据
    for(int i = 0; i < size(list); i++)
        extend[i] = list->nums[i];

    // 释放旧数据
    free(temp);

    // 更新新数据
    list->nums = extend;
    list->capacity = newCapacity;
}

/* 将列表转换为 Array 用于打印 */
int* toArray(MyList *list) {
    return list->nums;
}

int main() {
    /* 初始化列表 */
    MyList list;
    newMyList(&list);
    /* 尾部添加元素 */
    add(&list, 1);
    add(&list, 3);
    add(&list, 2);
    add(&list, 5);
    add(&list, 4);
    printf("列表 list = ");
    printArray(toArray(&list), size(&list));
    printf("容量 = %d ，长度 = %d\r\n", capacity(&list), size(&list));

    /* 中间插入元素 */
    insert(&list, 3, 6);
    printf("在索引 3 处插入数字 6 ，得到 list = ");
    printArray(toArray(&list), size(&list));

    /* 删除元素 */
    removeNum(&list, 3);
    printf("删除索引 3 处的元素，得到 list = ");
    printArray(toArray(&list), size(&list));  

    /* 访问元素 */
    int num = get(&list, 1);
    printf("访问索引 1 处的元素，得到 num = %d\r\n", num);

    /* 更新元素 */
    set(&list, 1, 0);
    printf("将索引 1 处的元素更新为 0 ，得到 list = ");
    printArray(toArray(&list), size(&list));

    /* 测试扩容机制 */
    for (int i = 0; i < 10; i++) {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        add(&list, i);
    }

    printf("扩容后的列表 list = ");
    printArray(toArray(&list), size(&list));
    printf("容量 = %d ，长度 = %d\r\n", capacity(&list), size(&list));

    /* 析构函数，释放分配内存 */
    delMyList(&list);
}