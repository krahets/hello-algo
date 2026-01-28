# Heap Sort

!!! tip

    Before reading this section, please ensure you have completed the "Heap" chapter.

<u>Heap sort (heap sort)</u> is an efficient sorting algorithm based on the heap data structure. We can use the "build heap operation" and "element out-heap operation" that we have already learned to implement heap sort.

1. Input the array and build a min-heap, at which point the smallest element is at the heap top.
2. Continuously perform the out-heap operation, record the out-heap elements in sequence, and an ascending sorted sequence can be obtained.

Although the above method is feasible, it requires an additional array to save the popped elements, which is quite wasteful of space. In practice, we usually use a more elegant implementation method.

## Algorithm Flow

Assume the array length is $n$. The flow of heap sort is shown in the figure below.

1. Input the array and build a max-heap. After completion, the largest element is at the heap top.
2. Swap the heap top element (first element) with the heap bottom element (last element). After the swap is complete, reduce the heap length by $1$ and increase the count of sorted elements by $1$.
3. Starting from the heap top element, perform top-to-bottom heapify operation (sift down). After heapify is complete, the heap property is restored.
4. Loop through steps `2.` and `3.` After looping $n - 1$ rounds, the array sorting can be completed.

!!! tip

    In fact, the element out-heap operation also includes steps `2.` and `3.`, with just an additional step to pop the element.

=== "<1>"
    ![Heap sort steps](heap_sort.assets/heap_sort_step1.png)

=== "<2>"
    ![heap_sort_step2](heap_sort.assets/heap_sort_step2.png)

=== "<3>"
    ![heap_sort_step3](heap_sort.assets/heap_sort_step3.png)

=== "<4>"
    ![heap_sort_step4](heap_sort.assets/heap_sort_step4.png)

=== "<5>"
    ![heap_sort_step5](heap_sort.assets/heap_sort_step5.png)

=== "<6>"
    ![heap_sort_step6](heap_sort.assets/heap_sort_step6.png)

=== "<7>"
    ![heap_sort_step7](heap_sort.assets/heap_sort_step7.png)

=== "<8>"
    ![heap_sort_step8](heap_sort.assets/heap_sort_step8.png)

=== "<9>"
    ![heap_sort_step9](heap_sort.assets/heap_sort_step9.png)

=== "<10>"
    ![heap_sort_step10](heap_sort.assets/heap_sort_step10.png)

=== "<11>"
    ![heap_sort_step11](heap_sort.assets/heap_sort_step11.png)

=== "<12>"
    ![heap_sort_step12](heap_sort.assets/heap_sort_step12.png)

In the code implementation, we use the same top-to-bottom heapify function `sift_down()` from the "Heap" chapter. It is worth noting that since the heap length will decrease as the largest element is extracted, we need to add a length parameter $n$ to the `sift_down()` function to specify the current effective length of the heap. The code is as follows:

```src
[file]{heap_sort}-[class]{}-[func]{heap_sort}
```

## Algorithm Characteristics

- **Time complexity of $O(n \log n)$, non-adaptive sorting**: The build heap operation uses $O(n)$ time. Extracting the largest element from the heap has a time complexity of $O(\log n)$, looping a total of $n - 1$ rounds.
- **Space complexity of $O(1)$, in-place sorting**: A few pointer variables use $O(1)$ space. Element swapping and heapify operations are both performed on the original array.
- **Non-stable sorting**: When swapping the heap top element and heap bottom element, the relative positions of equal elements may change.
