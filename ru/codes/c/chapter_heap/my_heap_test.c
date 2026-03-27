/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* Driver Code */
int main() {
    /* Инициализироватькуча */
    // Инициализировать max-кучу
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("После построения кучи по входному массиву\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Получить верхний элемент кучи */
    printf("\nЭлемент на вершине кучи равен %d\n", peek(maxHeap));

    /* Добавить элемент в кучу */
    push(maxHeap, 7);
    printf("\nПосле добавления элемента 7 в кучу\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Извлечь верхний элемент из кучи */
    int top = pop(maxHeap);
    printf("\nПосле извлечения верхнего элемента %d из кучи\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* Получить размер кучи */
    printf("\nКоличество элементов в куче равно %d\n", size(maxHeap));

    /* Проверить, пуста ли куча */
    printf("\nПуста ли куча %d\n", isEmpty(maxHeap));

    // Освободить память
    delMaxHeap(maxHeap);

    return 0;
}
