---
comments: true
---

# 插入排序

「插入排序 Insertion Sort」是一种基于 **数组插入操作** 的排序算法。

「插入操作」的思想：选定数组的某个元素为基准数 `base` ，将 `base` 与其左边的元素依次对比大小，并 “插入” 到正确位置。

然而，由于数组在内存中的存储方式是连续的，我们无法直接把 `base` 插入到目标位置，而是需要将从目标位置到 `base` 之间的所有元素向右移动一位（本质上是一次数组插入操作）。

![insertion_operation](insertion_sort.assets/insertion_operation.png)

<p align="center"> Fig. 插入操作 </p>

## 算法流程

1. 第 1 轮先选取数组的 **第 2 个元素** 为 `base` ，执行「插入操作」后， **数组前 2 个元素已完成排序**。
2. 第 2 轮选取 **第 3 个元素** 为 `base` ，执行「插入操作」后， **数组前 3 个元素已完成排序**。
3. 以此类推……最后一轮选取 **数组尾元素** 为 `base` ，执行「插入操作」后 **所有元素已完成排序**。

![insertion_sort](insertion_sort.assets/insertion_sort.png)

<p align="center"> Fig. 插入排序流程 </p>

=== "Java"

    ```java title="insertion_sort.java"
    /* 插入排序 */
    void insertionSort(int[] nums) {
        // 外循环：base = nums[1], nums[2], ..., nums[n-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // 内循环：将 base 插入到左边的正确位置
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j];  // 1. 将 nums[j] 向右移动一位
                j--;
            }
            nums[j + 1] = base;         // 2. 将 base 赋值到正确位置
        }
    }
    ```

=== "C++"

    ```cpp title="insertion_sort.cpp"
    /* 插入排序 */
    void insertionSort(vector<int>& nums) {
        // 外循环：base = nums[1], nums[2], ..., nums[n-1]
        for (int i = 1; i < nums.size(); i++) {
            int base = nums[i], j = i - 1;
            // 内循环：将 base 插入到左边的正确位置
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j];  // 1. 将 nums[j] 向右移动一位
                j--;
            }
            nums[j + 1] = base;         // 2. 将 base 赋值到正确位置
        }
    }
    ```

=== "Python"

    ```python title="insertion_sort.py"
    """ 插入排序 """
    def insertion_sort(nums):
        # 外循环：base = nums[1], nums[2], ..., nums[n-1]
        for i in range(1, len(nums)):
            base = nums[i]
            j = i - 1
            # 内循环：将 base 插入到左边的正确位置
            while j >= 0 and nums[j] > base:
                nums[j + 1] = nums[j]  # 1. 将 nums[j] 向右移动一位
                j -= 1
            nums[j + 1] = base         # 2. 将 base 赋值到正确位置
    ```

## 算法特性

**时间复杂度 $O(n^2)$ ：** 最差情况下，各轮插入操作循环 $n - 1$ , $n-2$ , $\cdots$ , $2$ , $1$ 次，求和为 $\frac{(n - 1) n}{2}$ ，使用 $O(n^2)$ 时间。

**空间复杂度 $O(1)$ ：** 指针 $i$ , $j$ 使用常数大小的额外空间。

**原地排序：** 指针变量仅使用常数大小额外空间。

**稳定排序：** 不交换相等元素。

**自适应排序：** 最佳情况下，时间复杂度为 $O(n)$  。

## 插入排序 vs 冒泡排序

!!! question

    虽然「插入排序」和「冒泡排序」的时间复杂度皆为 $O(n^2)$ ，但实际运行速度却有很大差别，这是为什么呢？

回顾复杂度分析，两个方法的循环次数都是 $\frac{(n - 1) n}{2}$ 。但不同的是，「冒泡操作」是在做 **元素交换** ，需要借助一个临时变量实现，共 3 个单元操作；而「插入操作」是在做 **赋值** ，只需 1 个单元操作；因此，可以粗略估计出冒泡排序的计算开销约为插入排序的 3 倍。

插入排序运行速度快，并且具有原地、稳定、自适应的优点，因此很受欢迎。实际上，包括 Java 在内的许多编程语言的排序库函数的实现都用到了插入排序。库函数的大致思路：

- 对于 **长数组**，采用基于分治的排序算法，例如「快速排序」，时间复杂度为 $O(n \log n)$ ；
- 对于 **短数组**，直接使用「插入排序」，时间复杂度为 $O(n^2)$ ；

在数组较短时，复杂度中的常数项（即每轮中的单元操作数量）占主导作用，此时插入排序运行地更快。这个现象与「线性查找」和「二分查找」的情况类似。
