# Heap sort

!!! tip

    Before reading this section, make sure you have completed the chapter on heaps.

<u>Heap sort</u> is an efficient sorting algorithm built on the heap data structure. We can implement it with the heap-building and removal operations we have already learned.

1. Build a min heap from the input array. The smallest element is now at the root.
2. Repeatedly remove the root and record the removed elements to obtain an ascending sequence.

Although this works, it requires an extra array to store the removed elements, wasting space. In practice, we usually use a more elegant implementation.

## Algorithm steps

For an array of length $n$, heap sort proceeds as shown below.

1. Build a max heap from the input array. The largest element is now at the root.
2. Swap the root, the first element, with the last element of the heap. Reduce the heap's length by $1$ and increase the number of sorted elements by $1$.
3. Starting at the root, sift down to restore the heap property.
4. Repeat steps `2.` and `3.`. After $n - 1$ rounds, the array is sorted.

!!! tip

    In fact, removing the root of a heap also includes steps `2.` and `3.`, with the additional step of removing an element from the array.

=== "<1>"
    ![Steps of heap sort](heap_sort.assets/heap_sort_step1.png)

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

The implementation uses the same `sift_down()` function introduced in the heap chapter. Because the heap shrinks as maximum elements are extracted, add a length parameter $n$ to specify its current valid length. The code is as follows:

```src
[file]{heap_sort}-[class]{}-[func]{heap_sort}
```

## Algorithm properties

- **Time complexity: $O(n \log n)$; not adaptive**. Building the heap takes $O(n)$ time. Extracting its maximum takes $O(\log n)$ time and is repeated $n - 1$ times.
- **Space complexity: $O(1)$; in-place**. A few pointer variables use $O(1)$ space. Swapping and sifting take place within the original array.
- **Not stable**. Swapping the root with the last element of the heap may change the relative order of equal elements.
