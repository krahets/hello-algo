/*
 * File: PrintUtil.h
 * Created Time: 2022-12-21
 * Author: MolDum (moldum@163.com)
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// #include "ListNode.h"
// #include "TreeNode.h"

/**
 * @brief Print an Array
 * 
 * @param arr 
 * @param n 
 */

static void printArray(int* arr, int n)
{
    printf("[");
    for (int i = 0; i < n - 1; i++) {
        printf("%d, ", arr[i]);
    }
    printf("%d]\n", arr[n-1]);
}


