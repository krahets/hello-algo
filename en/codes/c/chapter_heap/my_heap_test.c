/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* Driver code */
int main() {
    /* Initialize the heap */
    // Initialize a max-heap
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("Heap built from the input array:\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Get the root element */
    printf("\nRoot element: %d\n", peek(maxHeap));

    /* Push an element onto the heap */
    push(maxHeap, 7);
    printf("\nHeap after pushing 7:\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Pop the root */
    int top = pop(maxHeap);
    printf("\nHeap after popping the root (%d):\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* Get the heap size */
    printf("\nNumber of elements in the heap: %d\n", size(maxHeap));

    /* Check whether the heap is empty */
    printf("\nIs the heap empty? %d\n", isEmpty(maxHeap));

    // Free the memory
    delMaxHeap(maxHeap);

    return 0;
}
