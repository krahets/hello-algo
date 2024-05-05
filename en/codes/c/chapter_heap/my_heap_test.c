/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* Driver Code */
int main() {
    /* Initialize the heap */
    // Initialize max-heap
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("After inputting array and building heap\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Access heap top element */
    printf("\nTop element of the heap is %d\n", peek(maxHeap));

    /* Push the element into heap */
    push(maxHeap, 7);
    printf("\nElement 7 entered into heap\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Pop the element at the heap top */
    int top = pop(maxHeap);
    printf("\nAfter the top element %d is removed from the heap\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* Get heap size */
    printf("\nNumber of elements in the heap is %d\n", size(maxHeap));

    /* Determine if heap is empty */
    printf("\nIs the heap empty %d\n", isEmpty(maxHeap));

    // Free memory
    delMaxHeap(maxHeap);

    return 0;
}
