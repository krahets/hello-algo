/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* Добавление элемента в кучу */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // Инвертировать знак элемента
    push(maxHeap, -val);
}

/* Извлечение элемента из кучи */
int popMinHeap(MaxHeap *maxHeap) {
    // Инвертировать знак элемента
    return -pop(maxHeap);
}

/* Доступ к элементу на вершине кучи */
int peekMinHeap(MaxHeap *maxHeap) {
    // Инвертировать знак элемента
    return -peek(maxHeap);
}

/* Извлечь элементы из кучи */
int *getMinHeap(MaxHeap *maxHeap) {
    // Инвертировать все элементы кучи и записать их в массив res
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

// Функция поиска k наибольших элементов массива на основе кучи
int *topKHeap(int *nums, int sizeNums, int k) {
    // Инициализация минимальной кучи
    // Обратите внимание: мы инвертируем все элементы кучи, чтобы с помощью максимальной кучи имитировать минимальную
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // Поместить первые k элементов массива в кучу
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Начиная с элемента k+1, поддерживать длину кучи равной k
    for (int i = k; i < sizeNums; i++) {
        // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    int *res = getMinHeap(maxHeap);
    // Освободить память
    delMaxHeap(maxHeap);
    return res;
}

/* Driver Code */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int k = 3;
    int sizeNums = sizeof(nums) / sizeof(nums[0]);

    int *res = topKHeap(nums, sizeNums, k);
    printf("Наибольшие %d элементов: ", k);
    printArray(res, k);

    free(res);
    return 0;
}
