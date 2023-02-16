---
comments: true
---

# 冒泡排序

「冒泡排序 Bubble Sort」是一种最基础的排序算法，非常适合作为第一个学习的排序算法。顾名思义，「冒泡」是该算法的核心操作。

!!! question "为什么叫“冒泡”"

    在水中，越大的泡泡浮力越大，所以最大的泡泡会最先浮到水面。

「冒泡」操作则是在模拟上述过程，具体做法为：从数组最左端开始向右遍历，依次对比相邻元素大小，若 **左元素 > 右元素** 则将它俩交换，最终可将最大元素移动至数组最右端。

完成此次冒泡操作后，**数组最大元素已在正确位置，接下来只需排序剩余 $n - 1$ 个元素**。

=== "Step 1"
    ![bubble_operation_step1](bubble_sort.assets/bubble_operation_step1.png)

=== "Step 2"
    ![bubble_operation_step2](bubble_sort.assets/bubble_operation_step2.png)

=== "Step 3"
    ![bubble_operation_step3](bubble_sort.assets/bubble_operation_step3.png)

=== "Step 4"
    ![bubble_operation_step4](bubble_sort.assets/bubble_operation_step4.png)

=== "Step 5"
    ![bubble_operation_step5](bubble_sort.assets/bubble_operation_step5.png)

=== "Step 6"
    ![bubble_operation_step6](bubble_sort.assets/bubble_operation_step6.png)

=== "Step 7"
    ![bubble_operation_step7](bubble_sort.assets/bubble_operation_step7.png)

<p align="center"> Fig. 冒泡操作 </p>

## 算法流程

1. 设数组长度为 $n$ ，完成第一轮「冒泡」后，数组最大元素已在正确位置，接下来只需排序剩余 $n - 1$ 个元素。
2. 同理，对剩余 $n - 1$ 个元素执行「冒泡」，可将第二大元素交换至正确位置，因而待排序元素只剩 $n - 2$ 个。
3. 以此类推…… **循环 $n - 1$ 轮「冒泡」，即可完成整个数组的排序**。

![bubble_sort](bubble_sort.assets/bubble_sort.png)

<p align="center"> Fig. 冒泡排序流程 </p>

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

**时间复杂度 $O(n^2)$** ：各轮「冒泡」遍历的数组长度为 $n - 1$ , $n - 2$ , $\cdots$ , $2$ , $1$ 次，求和为 $\frac{(n - 1) n}{2}$ ，因此使用 $O(n^2)$ 时间。

**空间复杂度 $O(1)$** ：指针 $i$ , $j$ 使用常数大小的额外空间。

**原地排序**：指针变量仅使用常数大小额外空间。

**稳定排序**：不交换相等元素。

**自适应排序**：引入 `flag` 优化后（见下文），最佳时间复杂度为 $O(N)$ 。

## 效率优化

我们发现，若在某轮「冒泡」中未执行任何交换操作，则说明数组已经完成排序，可直接返回结果。考虑可以增加一个标志位 `flag` 来监听该情况，若出现则直接返回。

优化后，冒泡排序的最差和平均时间复杂度仍为 $O(n^2)$ ；而在输入数组 **已排序** 时，达到 **最佳时间复杂度** $O(n)$ 。 

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
