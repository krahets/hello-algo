/**
 * File: top_k.c
 * Created Time: 2023-10-26
 * Author: krahets (krahets163.com)
 */

#include "my_heap.c"

/* Вставить элемент в кучу */
void pushMinHeap(MaxHeap *maxHeap, int val) {
    // Сменить знак элемента
    push(maxHeap, -val);
}

/* Извлечь элемент из кучи */
int popMinHeap(MaxHeap *maxHeap) {
    // Сменить знак элемента
    return -pop(maxHeap);
}

/* Посмотреть элемент в корне */
int peekMinHeap(MaxHeap *maxHeap) {
    // Сменить знак элемента
    return -peek(maxHeap);
}

/* Извлечь элементы кучи */
int *getMinHeap(MaxHeap *maxHeap) {
    // Сменить знак всех элементов кучи и записать их в массив res
    int *res = (int *)malloc(maxHeap->size * sizeof(int));
    for (int i = 0; i < maxHeap->size; i++) {
        res[i] = -maxHeap->data[i];
    }
    return res;
}

/* Функция поиска k наибольших элементов массива с помощью кучи */
int *topKHeap(int *nums, int sizeNums, int k) {
    // Инициализировать мин-кучу
    // Меняем знак всех элементов, чтобы использовать макс-кучу как мин-кучу
    int *empty = (int *)malloc(0);
    MaxHeap *maxHeap = newMaxHeap(empty, 0);
    // Добавить в кучу первые k элементов массива
    for (int i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // Начиная с (k+1)-го элемента, поддерживать размер кучи равным k
    for (int i = k; i < sizeNums; i++) {
        // Если текущий элемент больше корня, извлечь корень и вставить текущий элемент
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

/* Пример использования */
int main() {
    int nums[] = {1, 7, 6, 3, 2};
    int k = 3;
    int sizeNums = sizeof(nums) / sizeof(nums[0]);

    int *res = topKHeap(nums, sizeNums, k);
    printf("Наибольшие элементы (всего %d): ", k);
    printArray(res, k);

    free(res);
    return 0;
}
