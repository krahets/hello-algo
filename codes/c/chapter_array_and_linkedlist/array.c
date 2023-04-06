/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../include/include.h"

/* 随机返回一个数组元素 */
int randomAccess(int* nums, int size) {
    // 在区间 [0, size) 中随机抽取一个数字
    int randomIndex = rand() % size;
    // 获取并返回随机元素
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 扩展数组长度 */
int* extend(int* nums, int *size, int enlarge) {
    Assert(enlarge >= 0, "INVALID EXTEND");
    // 初始化一个扩展长度后的数组
    // nums is not allocated by malloc()-like function -> don't use realloc() to extend!
    int* res = (int *)malloc(sizeof(int) * ((*size) + enlarge));
    // 将原数组中的所有元素复制到新数组
    for (int i = 0; i < *size; i++) {
        res[i] = nums[i];
    }
    // 初始化扩展后的空间
    for (int i = *size; i < (*size) + enlarge; i++) {
        res[i] = 0;
    }
    *size += enlarge; 
    // 返回扩展后的新数组
    return res;
}

/* 在数组的索引 index 处插入元素 num */
int* insert(int* nums, int *size, int num, int index) {
    // 0 <= 插入索引 <= size
    Assert(index >= 0 && index <= *size, "INVALID INDEX");
    // 插入后需要先加一个位置
    nums = extend(nums, size , 1);
    // 把索引 index 以及之后的所有元素向后移动一位
    for (int i = *size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 将 num 赋给 index 处元素
    nums[index] = num;

    return nums;
}

/* 删除索引 index 处元素 */
void removeItem(int* nums, int *size, int index) {
    Assert(index >= 0 && index <= ((*size) - 1), "INVALID INDEX");
    // 把索引 index 之后的所有元素向前移动一位
    for (int i = index; i < *size - 1; i++) {
        nums[i] = nums[i + 1];
    }
    *size -= 1;
}

int compare(int a, int b) { return a == b; }

/* 在数组中查找指定元素 */
int* find(int* nums, int size, int target, 
        int (* compare)(int, int) ) {
    bool flag = false; // denotes if target is found or not
    int *ret = (int *)malloc(sizeof(int)); // where index stores(in case of multiple occurs)
    int count = 0;
    for (int i = 0; i < size; i++) {
        if (compare(nums[i], target)){
            flag = true;
            ret[count] = i;  
            int *newBase = (int *)realloc(ret, sizeof(int) * (count + 1));
            Assert(newBase, "ALLOCATE FAILED!");
            ret = newBase;
            count++;
        }         
    }
    if(!flag) _Log("NOT FOUND!\n");
    ret[count] = 42;  
    
    return ret;
}


/* Driver Code */
int main() {
    /* 初始化数组 */
    int size = 5;
    int arr[5];
    printf("数组 arr = ");
    printArray(arr, size);

    int nums[5] = { 1, 3, 3, 5, 4 };
    printf("数组 nums = ");
    printArray(nums, size);
    
    /* 随机访问 */
    int randomNum = randomAccess(nums, size);
    printf("在 nums 中获取随机元素 %d\n", randomNum);
    
    /* 长度扩展 */
    int enlarge = 3;
    int* res = extend(nums, &size, enlarge);
    printf("将数组长度扩展至 8 ，得到 nums = ");
    printArray(res, size);
    
    /* 插入元素 */
    res = insert(res, &size, 6, 8);
    printf("在索引 8 处插入数字 6 ，得到 res = ");
    printArray(res, size);

    /* 删除元素 */
    removeItem(res, &size, 0);
    printf("删除索引 0 处的元素，得到 res = ");
    printArray(res, size);
    
    /* 遍历数组(直接通过下标) */
    
    /* 查找元素 */
    int *index = find(res, size, 3, compare);
    printf("在 res 中查找元素 3 ，得到索引 = ");
    // ultimate answer 🤪
    while(*index != 42){
        printf("%d ", *index); 
        index++;
    }
    printf("\n");

    return 0;
}
