/**
 * File: list.c
 * Created Time: 2022-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../include/include.h"
#include <assert.h>

typedef int ElemType;

#define MAX_ELEM_SIZE   10
#define CAPACITY_RACTOR 2

// 用数组实现 list
struct list {
    ElemType* nums;
    size_t numsCapacity;
    size_t numsSize;
    bool isInit;
};

typedef struct list List;

void listInit(List* l) {
    if (l->isInit != true) {
        l->numsCapacity = MAX_ELEM_SIZE;
        l->nums = malloc(sizeof(ElemType) * l->numsCapacity);
        l->numsSize = 0;
        l->isInit = true;
    }
}

void listInitWithCapacity(List* l, size_t newCapacity) {
    if (l->isInit != true) {
        l->numsCapacity = newCapacity;
        l->nums = malloc(sizeof(ElemType) * l->numsCapacity);
        l->numsSize = 0;
        l->isInit = true;
    }
}

size_t listSize(List* l) {
    return l->numsSize;
}

size_t listCapacity(List* l) {
    return l->numsCapacity;
}

ElemType listGet(List* l, int idx) {
    if (l->isInit) {
        if (idx < l->numsSize) {
            return l->nums[idx];
        }
    }
    assert("out_of_range");
}

void listSet(List* l, int idx, ElemType elem) {
    if (l->isInit) {
        if (idx < l->numsSize) {
            l->nums[idx] = elem;
        }
    }
    assert("listSet elem assert.");
}

void listExtendCapacity(List* l) {
    // 先分配空间
    size_t newCapacity = listCapacity(l) * CAPACITY_RACTOR;
    ElemType *newData = (ElemType *)malloc(sizeof(ElemType) * newCapacity);
    ElemType *oldData = l->nums;

    // 拷贝旧数据到新数据
    for(size_t i=0; i<listSize(l); i++)
        newData[i] = l->nums[i];

    // 释放旧数据
    free(oldData);

    // 更新新数据
    l->nums = newData;
    l->numsCapacity = newCapacity;
}

void listAdd(List* l, ElemType elem) {
    if (listSize(l) == listCapacity(l)) {
        listExtendCapacity(l); // 扩容
    }
    l->nums[listSize(l)] = elem;
    l->numsSize ++;
}

void listInsert(List* l, size_t idx, ElemType elem) {
    if (l->isInit) {
        if (idx < listSize(l)) {
            for (size_t i=listSize(l); i>idx; --i) {
                l->nums[i] = l->nums[i-1];
            }
            l->nums[idx] = elem;
            l->numsSize++;
        } else {
            // 越界 -- 抛出异常
        }
    } else {
        // 抛出异常
    }
}

ElemType listRemove(List* l, int idx) {
    if (l->isInit) {
        if (idx < listSize(l)) {
            size_t i = idx;
            if ( i != listSize(l)-1) {
                for (; i<listSize(l)-1; i++) {
                    l->nums[i] = l->nums[i+1];
                }
            }
            l->numsSize--;

        } else {
            // 数组越界
        }
    } else {
        // 抛出异常
    }
}

void listClear(List* l) {
    l->numsSize = 0;
}

void printList(List* l) {
    size_t i=0;

    printf("[");
    if (l->numsSize) {
        for (; i<l->numsSize-1; i++) {
            printf("%d, ", l->nums[i]);
        }
        printf("%d", l->nums[i]);
    }
    printf("]\r\n");
}

int main() {
    List list;
    /* 初始化列表 */
    listInit(&list);
    listAdd(&list, 1);
    listAdd(&list, 3);
    listAdd(&list, 2);
    listAdd(&list, 5);
    listAdd(&list, 4);

    printf("列表 list = ");
    printList(&list);


    /* 访问元素 */
    int num = listGet(&list, 1);
    printf("访问索引 1 处的元素，得到 num = %d\r\n", num);

    /* 更新元素 */
    listSet(&list, 1, 0);
    printf("将索引 1 处的元素更新为 0 ，得到 list = ");
    printList(&list);

    /* 清空列表 */
    listClear(&list);
    printf("清空列表后 list = ");
    printList(&list);

    /* 尾部添加元素 */
    listAdd(&list, 1);
    listAdd(&list, 3);
    listAdd(&list, 2);
    listAdd(&list, 5);
    listAdd(&list, 4);
    printf("添加元素后 list = ");
    printList(&list);

    /* 中间插入元素 */
    listInsert(&list, 3, 6);
    printf("在索引 3 处插入数字 6 ，得到 list = ");
    printList(&list);

    /* 删除元素 */
    listRemove(&list, 3);
    printf("删除索引 3 处的元素，得到 list = ");
    printList(&list);    

    /* 尾部添加元素 */
    listAdd(&list, 1);
    listAdd(&list, 3);
    listAdd(&list, 2);
    listAdd(&list, 5);
    listAdd(&list, 4);
    listAdd(&list, 4);

    printf("添加元素后 list = ");
    printList(&list);
}