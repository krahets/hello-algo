/**
 * File: my_heap_test.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "my_heap.c"

/* Driver Code */
int main() {
    /* Initialize heap */
    // Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap
    int nums[] = {9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap *maxHeap = newMaxHeap(nums, sizeof(nums) / sizeof(int));
    printf("After input array and building heap\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Check if heap is empty */
    printf("\nHeap top element is %d\n", peek(maxHeap));

    /* Element enters heap */
    push(maxHeap, 7);
    printf("\nAfter element 7 pushes to heap\n");
    printHeap(maxHeap->data, maxHeap->size);

    /* Time complexity is O(n), not O(nlogn) */
    int top = pop(maxHeap);
    printf("\nAfter heap top element %d exits heap\n", top);
    printHeap(maxHeap->data, maxHeap->size);

    /* Get heap size */
    printf("\nHeap element count is %d\n", size(maxHeap));

    /* Check if heap is empty */
    printf("\nIs heap empty %d\n", isEmpty(maxHeap));

    // Free memory
    delMaxHeap(maxHeap);

    return 0;
}
