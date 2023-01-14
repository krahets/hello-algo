/**
 * File: list.c
 * Created Time: 2022-01-12
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
void extendCapacity(MyList* l);

/* 构造函数 */
void newMyList(MyList* l) {
    l->capacity = 10;                    
    l->nums = malloc(sizeof(int) * l->capacity);
    l->size = 0;
    l->extendRatio = 2;
}

/* 获取列表长度 */
int size(MyList* l) {
    return l->size;
}

/* 获取列表容量 */
int capacity(MyList* l) {
    return l->capacity;
}

/* 访问元素 */
int get(MyList* l, int index) {
    assert(index < l->size);
    return l->nums[index];
}

/* 更新元素 */
void set(MyList* l, int index, int num) {
    assert(index < l->size); 
    l->nums[index] = num;
}

/* 尾部添加元素 */
void add(MyList* l, int num) {
    if (size(l) == capacity(l)) {
        extendCapacity(l); // 扩容
    }
    l->nums[size(l)] = num;
    l->size++;
}

/* 中间插入元素 */
void insert(MyList* l, int index, int num) {
    assert(index < size(l));
    for (int i=size(l); i>index; --i) {
        l->nums[i] = l->nums[i-1];
    }
    l->nums[index] = num;
    l->size++;
}

/* 删除元素 */
// 由于引入了 stdio.h ，此处无法使用 remove 关键词
// 详见 https://github.com/krahets/hello-algo/pull/244#discussion_r1067863888
int removeNum(MyList* l, int index) {
    assert(index < size(l));
    int num = l->nums[index];
    for (int i=index; i<size(l)-1; i++) {
        l->nums[i] = l->nums[i+1];
    }
    l->size--;
    return num;
}

/* 列表扩容 */
void extendCapacity(MyList* l) {
    // 先分配空间
    size_t newCapacity = capacity(l) * l->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = l->nums;

    // 拷贝旧数据到新数据
    for(size_t i=0; i<size(l); i++)
        extend[i] = l->nums[i];

    // 释放旧数据
    free(temp);

    // 更新新数据
    l->nums = extend;
    l->capacity = newCapacity;
}

/* 将列表转换为 Array 用于打印 */
int* toArray(MyList* l) {
    return l->nums;
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
}