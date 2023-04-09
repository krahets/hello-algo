# 冒泡排序

「冒泡排序 Bubble Sort」的工作原理类似于泡泡在水中的浮动。在水中，较大的泡泡会最先浮到水面。

「冒泡操作」利用元素交换操作模拟了上述过程，具体做法为：从数组最左端开始向右遍历，依次比较相邻元素大小，如果“左元素 > 右元素”就交换它俩。遍历完成后，最大的元素会被移动到数组的最右端。

**在完成一次冒泡操作后，数组的最大元素已位于正确位置，接下来只需对剩余 $n - 1$ 个元素进行排序**。

=== "<1>"
    ![冒泡操作步骤](bubble_sort.assets/bubble_operation_step1.png)

=== "<2>"
    ![bubble_operation_step2](bubble_sort.assets/bubble_operation_step2.png)

=== "<3>"
    ![bubble_operation_step3](bubble_sort.assets/bubble_operation_step3.png)

=== "<4>"
    ![bubble_operation_step4](bubble_sort.assets/bubble_operation_step4.png)

=== "<5>"
    ![bubble_operation_step5](bubble_sort.assets/bubble_operation_step5.png)

=== "<6>"
    ![bubble_operation_step6](bubble_sort.assets/bubble_operation_step6.png)

=== "<7>"
    ![bubble_operation_step7](bubble_sort.assets/bubble_operation_step7.png)

## 算法流程

设输入数组长度为 $n$ ，整个冒泡排序的步骤为：

1. 完成第一轮「冒泡」后，数组的最大元素已位于正确位置，接下来只需对剩余 $n - 1$ 个元素进行排序；
2. 对剩余 $n - 1$ 个元素执行冒泡操作，可将第二大元素交换至正确位置，因而待排序元素只剩 $n - 2$ 个；
3. 如此类推，经过 $n - 1$ 轮冒泡操作，整个数组便完成排序；

![冒泡排序流程](bubble_sort.assets/bubble_sort_overview.png)

=== "Java"

    ```java title="bubble_sort.java"
    [class]{bubble_sort}-[func]{bubbleSort}
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    [class]{}-[func]{bubbleSort}
    ```

=== "Python"

    ```python title="bubble_sort.py"
    [class]{}-[func]{bubble_sort}
    ```

=== "Go"

    ```go title="bubble_sort.go"
    [class]{}-[func]{bubbleSort}
    ```

=== "JavaScript"

    ```javascript title="bubble_sort.js"
    [class]{}-[func]{bubbleSort}
    ```

=== "TypeScript"

    ```typescript title="bubble_sort.ts"
    [class]{}-[func]{bubbleSort}
    ```

=== "C"

    ```c title="bubble_sort.c"
    [class]{}-[func]{bubbleSort}
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    [class]{bubble_sort}-[func]{bubbleSort}
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    [class]{}-[func]{bubbleSort}
    ```

=== "Zig"

    ```zig title="bubble_sort.zig"
    [class]{}-[func]{bubbleSort}
    ```

## 算法特性

**时间复杂度 $O(n^2)$** ：各轮冒泡遍历的数组长度依次为 $n - 1$ , $n - 2$ , $\cdots$ , $2$ , $1$ ，总和为 $\frac{(n - 1) n}{2}$ ，因此使用 $O(n^2)$ 时间。在引入下文的 `flag` 优化后，最佳时间复杂度可达到 $O(n)$ ，所以它是“自适应排序”。

**空间复杂度 $O(1)$** ：指针 $i$ , $j$ 使用常数大小的额外空间，因此是“原地排序”。

由于冒泡操作中遇到相等元素不交换，因此冒泡排序是“稳定排序”。

## 效率优化

我们发现，如果某轮冒泡操作中没有执行任何交换操作，说明数组已经完成排序，可直接返回结果。因此，可以增加一个标志位 `flag` 来监测这种情况，一旦出现就立即返回。

经过优化，冒泡排序的最差和平均时间复杂度仍为 $O(n^2)$ ；但当输入数组完全有序时，可达到最佳时间复杂度 $O(n)$ 。

=== "Java"

    ```java title="bubble_sort.java"
    [class]{bubble_sort}-[func]{bubbleSortWithFlag}
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "Python"

    ```python title="bubble_sort.py"
    [class]{}-[func]{bubble_sort_with_flag}
    ```

=== "Go"

    ```go title="bubble_sort.go"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "JavaScript"

    ```javascript title="bubble_sort.js"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "TypeScript"

    ```typescript title="bubble_sort.ts"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "C"

    ```c title="bubble_sort.c"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    [class]{bubble_sort}-[func]{bubbleSortWithFlag}
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "Zig"

    ```zig title="bubble_sort.zig"
    [class]{}-[func]{bubbleSortWithFlag}
    ```
