<!-- 此文件由 utils/exercises/publish_exercises.py 根据 exercises.yaml 自动生成，请勿直接修改。 -->

# 练习

## 知识巩固

### 迭代与递归的时间和空间

下面两段代码都计算 $1 + 2 + \dots + n$（设 $n \ge 1$）。请把 `n` 设为 4，
按照程序实际执行的顺序回答问题，然后比较两种写法的效率。

```python
def sum_iter(n):
    s = 0
    for i in range(1, n + 1):
        s += i
    return s

def sum_recur(n):
    if n == 1:
        return 1
    return n + sum_recur(n - 1)
```

<!-- numbered-subquestions -->

1. 执行 `sum_iter(4)` 时，每轮循环结束后，变量 `s` 的值分别是多少？
2. 执行 `sum_recur(4)` 时，会依次调用哪些函数？从最深的一层开始返回时，结果怎样得到？
3. 两种写法的时间复杂度和空间复杂度分别是多少？结合第 1、2 问的执行过程说明理由。

??? success "参考答案"

    1. 循环变量 `i` 依次为 `1、2、3、4`，每轮结束后，`s` 依次变为
        `1、3、6、10`，所以 `sum_iter(4)` 返回 10。

    2. 函数依次调用
        `sum_recur(4) → sum_recur(3) → sum_recur(2) → sum_recur(1)`。
        `sum_recur(1)` 返回 1，随后各层依次得到 `2 + 1 = 3`、`3 + 3 = 6`、`4 + 6 = 10`。
        在最深处，4 次函数调用都尚未结束。

    3. 两段代码都进行与 $n$ 成正比的循环或调用，因此时间复杂度均为 $O(n)$ 。
        空间复杂度不同：迭代版只使用常数个变量，为 $O(1)$ ；
        递归版在到达终止条件前，前面的函数调用都要等待返回结果，因此调用栈中最多同时保存 $n$ 次调用，
        空间复杂度为 $O(n)$。

        分析空间复杂度时，除代码中的变量外，还要考虑递归调用占用的空间。

### 三段代码的时间复杂度

以下三个代码片段的输入均为正整数 $n$ 。请按时间复杂度从低到高排序，并写出各自的复杂度。

```python
# 片段一
s = 0
for i in range(n):
    s += i

# 片段二
s = 0
for i in range(n):
    for j in range(i, n):
        s += j

# 片段三
while n > 1:
    n = n // 2
```

??? success "参考答案"

    从低到高为：片段三 $O(\log n)$、片段一 $O(n)$、片段二 $O(n^2)$。
    片段三每轮把 $n$ 缩小为原来的一半，约循环 $\log_2 n$ 次。
    片段一的循环恰好执行 $n$ 次。片段二的内层循环次数依次为
    $n,n-1,\dots,1$，总次数为 $n(n+1)/2$，因此属于平方阶。

### 哪种反转更节省空间

要将数组 `nums` 中的元素全部反转，有两种做法：

<!-- numbered-subquestions -->

1. 新建一个等长数组 `res`，倒序复制后返回；
2. 用两个索引 `i` 和 `j` 分别从首、尾向中间移动，逐对交换 `nums[i]` 与 `nums[j]` 。

    两种做法的空间复杂度各是多少？哪种属于“原地”操作？

??? success "参考答案"

    1. 需要与输入等长的辅助数组，空间复杂度 $O(n)$。

    2. 只使用两个索引变量，
        空间复杂度 $O(1)$ ，属于原地操作。

        需要注意：原地反转会修改输入数组，
        仅在允许修改输入时才应优先选用；若需保留原数组，第 1 种做法的复制开销不可避免。

## 编程练习

### 斐波那契数

斐波那契数列满足：$F(0)=0$、$F(1)=1$，并且当 $n\ge2$ 时，
$F(n)=F(n-1)+F(n-2)$。

给定非负整数 `n`，请使用循环计算并返回 $F(n)$，不使用递归。

??? tip "解题提示"

    1. 先单独处理 n 为 0 和 1 的情况
    2. 计算下一项时只需要前两项，无须保存整个数列
    3. 更新两个变量时，注意不要过早覆盖仍会用到的旧值

[LeetCode](https://leetcode.cn/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [题目解析](https://leetcode.cn/problems/fibonacci-number/solutions/2361746/509-fei-bo-na-qi-shu-dong-tai-gui-hua-qi-so8h/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
