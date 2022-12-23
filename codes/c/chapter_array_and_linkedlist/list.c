/*
 * File: list.c
 * Created Time: 2022-12-23
 * Author: huawuque404 (huawuque404@163.com)
 */

#include <stdio.h>

#include <stdbool.h>

#define Maxsize 20 /* 存储空间初始分配量 */

/*给int类型取个别名 ElemType*/
typedef int ElemType;

/* 列表定义 */
typedef struct
{
    /* ElemType为元素类型,需要什么类型就写类型 */
    ElemType data[Maxsize]; /* data为一维数组 */
    int length;             /* 线性表的当前长度 */
} SqList;                   /* 用typedef将结构体等价于类型名SqList */

/* 初始化列表 */
bool InitList(SqList *L)
{
    L->length = 0;
    return true;
}

/* 若L为空表，则返回true，否则返回false */
bool ListEmpty(SqList L)
{
    if (L.length == 0)
        return true;
    else
        return false;
}

/* 将L重置为空表 */
bool ClearList(SqList *L)
{
    L->length = 0;
    return true;
}

/* 返回L中数据元素个数 */
int ListLength(SqList L)
{
    return L.length;
}

// 列表初始化
bool CreateList(SqList *L) // 创建一个列表 L
{
    int x, i = 0;
    scanf("%d", &x);
    while (x != -1) /* 输入-1 时结束，也可以设置其他的结束条件 */
    {
        if (L->length == Maxsize)
        {
            printf("列表已满！");
            return false;
        }
        scanf("%d", &x);  /*输入一个数据元素,只有此处的输入会存储进线性表,其他地方输入的x都是判断是否继续进行循环的条件*/
        L->data[i++] = x; /* 将数据存入第 i 个位置，然后 i++*/
        L->length++;      /* 列表长度加 1*/
        scanf("%d", &x);  /* 输入一个数据以判断是否继续进行数据的输入*/
    }
    return true;
}

/* 用e返回L中第i个数据元素的值,注意i是指位置，第1个位置的数组是从0开始 */
bool GetElem(SqList L, int i, ElemType *e)
{
    if (L.length == 0 || i < 1 || i > L.length)
        return false;
    *e = L.data[i - 1];

    return true;
}

/* 元素查找,返回L中第1个与e相等的数据元素的位序。 */
/* 若这样的数据元素不存在，则返回值为0 */
int LocateElem(SqList L, ElemType e)
{
    int i;
    if (L.length == 0)
        return 0;
    for (i = 0; i < L.length; i++)
    {
        if (L.data[i] == e)
            break;
    }
    if (i >= L.length)
        return 0;

    return i + 1;
}

/* 在L中第i个位置之前插入新的数据元素e，L的长度加1 */
bool ListInsert(SqList *L, int i, ElemType e)
{
    int k;
    if (L->length == Maxsize) /* 列表已满 */
        return false;
    if (i < 1 || i > L->length + 1) /* 当i比第一位置小或者比最后一位置后一位置还要大时 */
        return false;

    if (i <= L->length) /* 若插入数据位置不在表尾 */
    {
        for (k = L->length - 1; k >= i - 1; k--) /* 将要插入位置之后的数据元素向后移动一位 */
            L->data[k + 1] = L->data[k];
    }
    L->data[i - 1] = e; /* 将新元素插入 */
    L->length++;

    return true;
}

/* 删除L的第i个数据元素，并用e返回其值，L的长度减1 */
bool ListDelete(SqList *L, int i, ElemType *e)
{
    int k;
    if (L->length == 0) /* 列表为空 */
        return false;
    if (i < 1 || i > L->length) /* 删除位置不正确 */
        return false;
    *e = L->data[i - 1];
    if (i < L->length) /* 如果删除不是最后位置 */
    {
        for (k = i; k < L->length; k++) /* 将删除位置后继元素前移 */
            L->data[k - 1] = L->data[k];
    }
    L->length--;
    return true;
}

/* 依次对L的每个数据元素输出 */
bool ListTraverse(SqList L)
{
    int i;
    for (i = 0; i < L.length; i++)
        printf("%d\n", L.data[i]);
    return true;
}

/*将所有的在列表Lb中但不在La中的数据元素插入到La中*/
void unionL(SqList *La, SqList Lb)
{
    int La_len, Lb_len, i;
    ElemType e;               /*声明与La和Lb相同的数据元素e*/
    La_len = ListLength(*La); /*求线性表的长度 */
    Lb_len = ListLength(Lb);
    for (i = 1; i <= Lb_len; i++)
    {
        GetElem(Lb, i, &e);              /*取Lb中第i个数据元素赋给e*/
        if (!LocateElem(*La, e))         /*La中不存在和e相同数据元素*/
            ListInsert(La, ++La_len, e); /*插入*/
    }
}

int main()
{
    ElemType e = 0;

    ElemType r = 22;

    int i = 2;

    /* 新建一个列表list*/
    SqList list;

    /* 无初值初始化列表list*/
    InitList(&list);

    /* 返回list的长度*/
    printf("list长度为%d\n", ListLength(list));

    /* 有值初始化列表*/
    CreateList(&list);

    // 查找第2个元素并赋值给e
    GetElem(list, i, &e);

    printf("第%d个元素为%d\n", i, e);

    printf("与%d相等的元素是第%d个\n", r, LocateElem(list, r));

    /* 在列表的第3个位置处插入e */
    ListInsert(&list, 3, e);

    /* 输出所有列表list中的所有元素*/
    ListTraverse(list);

    /* 删除列表中的第3个元素,并将删除的元素存入e中 */
    ListDelete(&list, 3, &e);

    return 0;
}