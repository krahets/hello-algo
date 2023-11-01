# Selection Sort

The workings of "selection sort" are straightforward: start a loop that selects the smallest element from the unsorted interval in each round and puts it at the end of the sorted interval.

Let the length of the array be $n$ , the flow of the selection sorting algorithm is shown below.

1. In the initial state, all elements are unsorted, i.e., the unsorted (indexed) interval is $[0, n-1]$ .
2. Select the smallest element in the interval $[0, n-1]$ and swap it with the element at index $0$. When finished, the first 1 element of the array is sorted.
3. Pick the smallest element in the interval $[1, n-1]$ and swap it with the element at index $1$. When finished, the first 2 elements of the array are sorted.
4. And so on. After $n - 1$ rounds of selection and swapping, the first $n - 1$ elements of the array are sorted.
5. The only remaining element must be the largest element, and no sorting is necessary, so the array is sorted.

=== "<1>"
    ![selection sort step](selection_sort.assets/selection_sort_step1.png)

=== "<2>"
    ![selection_sort_step2](selection_sort.assets/selection_sort_step2.png)

=== "<3>"
    ![selection_sort_step3](selection_sort.assets/selection_sort_step3.png)

=== "<4>"
    ![selection_sort_step4](selection_sort.assets/selection_sort_step4.png)

=== "<5>"
    ![selection_sort_step5](selection_sort.assets/selection_sort_step5.png)

=== "<6>"
    ![selection_sort_step6](selection_sort.assets/selection_sort_step6.png)

=== "<7>"
    ![selection_sort_step7](selection_sort.assets/selection_sort_step7.png)

=== "<8>"
    ![selection_sort_step8](selection_sort.assets/selection_sort_step8.png)

=== "<9>"
    ![selection_sort_step9](selection_sort.assets/selection_sort_step9.png)

=== "<10>"
    ![selection_sort_step10](selection_sort.assets/selection_sort_step10.png)

=== "<11>"
    ![selection_sort_step11](selection_sort.assets/selection_sort_step11.png)

In the code, we use $k$ to record the smallest element in the unsorted interval.

```src
[file]{selection_sort}-[class]{}-[func]{selection_sort}
```

## Algorithm Properties

- **Time complexity is $O(n^2)$, non-adaptive sorting**: the outer loop consists of a total of $n - 1$ rounds, the length of the unsorted interval in the first round is $n$ , and the length of the unsorted interval in the last round is $2$ , i.e., each round of the outer loop contains $n$, $n - 1$, $\dots$, $3$, $2$ rounds of inner loops, and the summation is $\frac{(n - 1)(n + 2)}{2}$ .
- **Space complexity $O(1)$, In-place sorting**: pointers $i$ and $j$ use extra space of constant size.
- **Unstable ordering**: as shown in the figure below, it is possible for an element `nums[i]` to be swapped to the right of an element equal to it, resulting in a change in the relative order of the two.

![Example of selection sort non-instability](selection_sort.assets/selection_sort_instability.png)
