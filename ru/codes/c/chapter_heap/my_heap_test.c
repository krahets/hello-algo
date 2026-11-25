/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* Пример использования */
int main() {
    /* Инициализировать кучу */
    // Инициализировать макс-кучу
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("Куча, построенная по входному массиву:\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Получить элемент в корне */
    printf("\nЭлемент в корне: %d\n", peek(maxHeap));

    /* Вставить элемент в кучу */
    push(maxHeap, 7);
    printf("\nПосле вставки элемента 7:\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Извлечь элемент из корня */
    int top = pop(maxHeap);
    printf("\nПосле извлечения элемента %d из корня:\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* Размер кучи */
    printf("\nЧисло элементов в куче: %d\n", size(maxHeap));

    /* Проверить, пуста ли куча */
    printf("\nПуста ли куча: %d\n", isEmpty(maxHeap));

    // Освободить память
    delMaxHeap(maxHeap);

    return 0;
}
