# 选择排序

<u>选择排序（selection sort）</u>的工作原理非常简单：开启一个循环，每轮从未排序区间选择最小的元素，将其放到已排序区间的末尾。

设数组的长度为 $n$ ，选择排序的算法流程如下图所示。

1. 初始状态下，所有元素未排序，即未排序（索引）区间为 $[0, n-1]$ 。
2. 选取区间 $[0, n-1]$ 中的最小元素，将其与索引 $0$ 处的元素交换。完成后，数组前 1 个元素已排序。
3. 选取区间 $[1, n-1]$ 中的最小元素，将其与索引 $1$ 处的元素交换。完成后，数组前 2 个元素已排序。
4. 以此类推。经过 $n - 1$ 轮选择与交换后，数组前 $n - 1$ 个元素已排序。
5. 仅剩的一个元素必定是最大元素，无须排序，因此数组排序完成。

=== "<1>"
    ![选择排序步骤](selection_sort.assets/selection_sort_step1.png)

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

在代码中，我们用 $k$ 来记录未排序区间内的最小元素：

```src
[file]{selection_sort}-[class]{}-[func]{selection_sort}
```

## 算法特性

- **时间复杂度为 $O(n^2)$、非自适应排序**：外循环共 $n - 1$ 轮，第一轮的未排序区间长度为 $n$ ，最后一轮的未排序区间长度为 $2$ ，即各轮外循环分别包含 $n$、$n - 1$、$\dots$、$3$、$2$ 轮内循环，求和为 $\frac{(n - 1)(n + 2)}{2}$ 。
- **空间复杂度为 $O(1)$、原地排序**：指针 $i$ 和 $j$ 使用常数大小的额外空间。
- **非稳定排序**：如下图所示，元素 `nums[i]` 有可能被交换至与其相等的元素的右边，导致两者的相对顺序发生改变。

![选择排序非稳定示例](selection_sort.assets/selection_sort_instability.png)
