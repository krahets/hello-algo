/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* Driver Code */
int main() {
    /* Инициализация кучи */
    // Инициализация максимальной кучи
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("После построения кучи из входного массива\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Получение элемента с вершины кучи */
    printf("\nВерхний элемент кучи = %d\n", peek(maxHeap));

    /* Добавление элемента в кучу */
    push(maxHeap, 7);
    printf("\nПосле добавления элемента 7 в кучу\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Извлечение элемента с вершины кучи */
    int top = pop(maxHeap);
    printf("\nПосле извлечения верхнего элемента %d из кучи\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* Получение размера кучи */
    printf("\nКоличество элементов в куче = %d\n", size(maxHeap));

    /* Проверка, пуста ли куча */
    printf("\nПуста ли куча: %d\n", isEmpty(maxHeap));

    // Освободить память
    delMaxHeap(maxHeap);

    return 0;
}
