/**
 * File: list.c
 * Update Time: 2023-02-12
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../include/include.h"

/* C 语言中没有 list，用数组实现 list */ 
struct myList {
    int *items;       // 数组（存储列表元素）
    int capacity;    // 列表容量
    int size;        // 列表大小
    int extendRatio; // 列表每次扩容的倍数
};

typedef struct myList myList;

/* 前置声明 */
void extendCapacity(myList *list);

/* 构造方法 */
myList *newMyList() {
    myList *list = malloc(sizeof(myList));
    list->capacity = 10;
    list->items = malloc(sizeof(int) * list->capacity);
    list->size = 0;
    list->extendRatio = 2;
    return list;
}

/* 析构方法 */
void delmyList(myList *list) {
    free(list->items);
    free(list);
}

/* 访问元素 */
int get(myList *list, int index) {
    assert(index >= 0 && index < list->size);
    return list->items[index];
}

/* 更新元素 */
void set(myList *list, int index, int num) {
    assert(index >= 0 && index < list->size);
    list->items[index] = num;
}

/* 尾部添加元素 */
void add(myList *list, int num) {
    if (list->size == list->capacity) {
        extendCapacity(list); // 扩容
    }
    list->items[list->size] = num;
    list->size++;
}

/* 中间插入元素 */
void insert(myList *list, int index, int num) {
    assert(index >= 0 && index < list->size);
    for (int i = list->size; i > index; --i) {
        list->items[i] = list->items[i - 1];
    }
    list->items[index] = num;
    list->size++;
}

/* 删除元素 */
// 由于引入了 stdio.h ，此处无法使用 remove 关键词
// 详见 https://github.com/krahets/hello-algo/pull/244#discussion_r1067863888
int removeItem(myList *list, int index) {
    assert(index >= 0 && index < list->size);
    int num = list->items[index];
    for (int i = index; i < list->size - 1; i++) {
        list->items[i] = list->items[i + 1];
    }
    list->size--;
    return num;
}

/* 列表扩容 */
void extendCapacity(myList *list) {
    // 先分配空间
    int newCapacity = list->capacity * list->extendRatio;
    int *extend = (int *) malloc(sizeof(int) * newCapacity);
    int *temp = list->items;

    // 拷贝旧数据到新数据
    for (int i = 0; i < list->size; i++)
        extend[i] = list->items[i];

    // 释放旧数据
    free(temp);

    // 更新新数据
    list->items = extend;
    list->capacity = newCapacity;
}

/* 拼接列表 */
myList *append(myList *listA, myList *listB) {
    myList *ret = newMyList();
    for (int i = 0; i < listA->size; i++)
    {
        add(ret, listA->items[i]);
    }
    for (int i = 0; i < listB->size; i++)
    {
        add(ret, listB->items[i]);
    }
    return ret;
}

/* 排序比较函数 */
int cmp(const void *a,const void *b) {
    return *(int*)a > *(int*)b;
}

int main() {
    /* 初始化列表 */
    myList *list = newMyList();
    /* 尾部添加元素 */
    add(list, 1);
    add(list, 3);
    add(list, 2);
    add(list, 5);
    add(list, 4);
    printf("列表 list = ");
    printArray(list->items, list->size);
    printf("容量 = %d ，长度 = %d\n", list->capacity, list->size);

    /* 访问元素 */
    int num = get(list, 1);
    printf("访问索引 1 处的元素，得到 num = %d\n", num);

    /* 更新元素 */
    set(list, 1, 0);
    printf("将索引 1 处的元素更新为 0 ，得到 list = ");
    printArray(list->items, list->size);

    /* 中间插入元素 */
    insert(list, 3, 6);
    printf("在索引 3 处插入数字 6 ，得到 list = ");
    printArray(list->items, list->size);

    /* 删除元素 */
    removeItem(list, 3);
    printf("删除索引 3 处的元素，得到 list = ");
    printArray(list->items, list->size);

    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < list->size; i++)
    {
        count++;
    }

    /* 拼接两个列表 */
    myList *list1 = newMyList();
    add(list1, 1);
    add(list1, 3);
    add(list1, 2);
    add(list1, 5);
    add(list1, 4);
    list = append(list, list1);
    printf("拼接两个列表，得到 list = ");
    printArray(list->items, list->size);

    /* 排序列表 */
    qsort(list->items, list->size, sizeof(int), cmp);
    printf("排序之后列表得到，得到 list = ");
    printArray(list->items, list->size);

    /* 测试扩容机制 */
    for (int i = 0; i < 10; i++) {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        add(list, i);
    }

    printf("扩容后的列表 list = ");
    printArray(list->items, list->size);
    printf("容量 = %d ，长度 = %d\n", list->capacity, list->size);

    /* 释放分配内存 */
    delmyList(list);
}