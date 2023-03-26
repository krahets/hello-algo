# 基数排序

上节介绍的计数排序适用于数据量 $n$ 大但数据范围 $m$ 不大的情况。假设需要排序 $n = 10^6$ 个学号数据，学号是 $8$ 位数字，那么数据范围 $m = 10^8$ 很大，使用计数排序则需要开辟巨大的内存空间，而基数排序则可以避免这种情况。

「基数排序 Radix Sort」主体思路与计数排序一致，也通过统计出现次数实现排序，**并在此基础上利用位与位之间的递进关系，依次对每一位执行排序**，从而获得排序结果。

## 算法流程

以上述的学号数据为例，设数字最低位为第 $1$ 位、最高位为第 $8$ 位，基数排序的流程为：

1. 初始化位数 $k = 1$ ；
2. 对学号的第 $k$ 位执行「计数排序」，完成后，数据即按照第 $k$ 位从小到大排序；
3. 将 $k$ 自增 $1$ ，并返回第 `2.` 步继续迭代，直至排序完所有位后结束；

![基数排序算法流程](radix_sort.assets/radix_sort_overview.png)

下面来剖析代码实现。对于一个 $d$ 进制的数字 $x$ ，其第 $k$ 位 $x_k$ 的计算公式为

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \mod d
$$

其中 $\lfloor a \rfloor$ 代表对浮点数 $a$ 执行向下取整，$\mod d$ 代表对 $d$ 取余。学号数据的 $d = 10$ , $k \in [1, 8]$ 。

此外，我们需要小幅改动计数排序代码，使之可以根据数字第 $k$ 位执行排序。

=== "Java"

    ```java title="radix_sort.java"
    [class]{radix_sort}-[func]{digit}

    [class]{radix_sort}-[func]{countingSortDigit}

    [class]{radix_sort}-[func]{radixSort}
    ```

=== "C++"

    ```cpp title="radix_sort.cpp"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Python"

    ```python title="radix_sort.py"
    [class]{}-[func]{digit}

    [class]{}-[func]{counting_sort_digit}

    [class]{}-[func]{radix_sort}
    ```

=== "Go"

    ```go title="radix_sort.go"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "JavaScript"

    ```javascript title="radix_sort.js"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "TypeScript"

    ```typescript title="radix_sort.ts"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "C"

    ```c title="radix_sort.c"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "C#"

    ```csharp title="radix_sort.cs"
    [class]{radix_sort}-[func]{digit}

    [class]{radix_sort}-[func]{countingSortDigit}

    [class]{radix_sort}-[func]{radixSort}
    ```

=== "Swift"

    ```swift title="radix_sort.swift"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Zig"

    ```zig title="radix_sort.zig"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

!!! question "为什么从最低位开始排序？"

    对于先后两轮排序，第二轮排序可能会覆盖第一轮排序的结果，比如第一轮认为 $a < b$ ，而第二轮认为 $a > b$ ，则第二轮会取代第一轮的结果。由于数字高位比低位的优先级更高，所以要先排序低位再排序高位。

## 算法特性

**时间复杂度 $O(n k)$** ：设数据量为 $n$ 、数据为 $d$ 进制、最大为 $k$ 位，则对某一位执行计数排序使用 $O(n + d)$ 时间，排序 $k$ 位使用 $O((n + d)k)$ 时间；一般情况下 $d$ 和 $k$ 都比较小，此时时间复杂度近似为 $O(n)$ 。

**空间复杂度 $O(n + d)$** ：与计数排序一样，借助了长度分别为 $n$ , $d$ 的数组 `res` 和 `counter` ，因此是“非原地排序”。

与计数排序一致，基数排序也是稳定排序。相比于计数排序，基数排序可适用于数值范围较大的情况，**但前提是数据必须可以被表示为固定位数的格式，且位数不能太大**。比如浮点数就不适合使用基数排序，因为其位数 $k$ 太大，可能时间复杂度 $O(nk) \gg O(n^2)$ 。
