<!-- 此文件由 utils/exercises/publish_exercises.py 根据 exercises.yaml 自动生成，请勿直接修改。 -->

# 练习

## 知识巩固

### 数组和链表怎样找到元素

数组和单向链表中都按顺序保存了 `[A, B, C, D, E]`。现在要读取第 4 个元素 `D`：

<!-- numbered-subquestions -->

1. 数组可以直接使用哪个索引？
2. 单向链表从头节点 `A` 开始，要沿着 `next` 依次经过哪些节点？
3. 当要读取的元素位置越来越靠后时，两种结构所需的步骤会怎样变化？哪一种更适合反复按位置读取？为什么？

??? success "参考答案"

    1. 若索引从 0 开始，第 4 个元素的索引是 3，数组可直接读取 `arr[3]`。

    2. 单向链表必须从头开始，访问路径为 `A → B → C → D`，需要沿 `next` 前进 3 次。

    3. 数组可以根据首地址和索引直接定位元素，按位置访问的时间复杂度为 $O(1)$。
        单向链表访问第 $k$ 个节点时，必须从头节点开始，沿着 `next` 前进 $k-1$ 次，
        最坏需要 $O(n)$ 时间。

        这里只比较按位置读取，不表示链表在所有操作上都更慢。

### 数组和链表怎样插入元素

数组和单向链表中都保存了 `A、B、C、D`。现在要在 `B` 后面插入 `X`：

- 数组容量为 5，当前状态是 `[A, B, C, D, _]`；
- 链表为 `A → B → C → D`，并且已经拿到了指向节点 `B` 的引用。

<!-- numbered-subquestions -->

1. 数组需要移动哪些元素？写出插入后的数组。
2. 链表应按什么顺序修改 `X.next` 和 `B.next`？写出插入后的链表。
3. 为什么比较插入效率时，要特别说明“已经拿到了节点 B 的引用”？

??? success "参考答案"

    1. 数组要先把 `D` 向右移动一格，再把 `C` 向右移动一格，最后把 `X` 放入索引 2，
        得到 `[A, B, X, C, D]`。

    2. `B.next` 原本指向 `C`。应先令 `X.next = B.next`，让 `X` 指向 `C`；
        再令 `B.next = X`。结果为 `A → B → X → C → D`。
        如果先覆盖 `B.next` 又没有保存原来的连接，就可能找不到 `C`。

    3. 已知 `B` 的位置后，链表插入只需修改两个连接，可以在 $O(1)$ 时间完成。
        如果还要从头查找 `B`，查找过程本身可能需要 $O(n)$ 时间。

### 列表容量是怎样增长的

一个基于数组实现的列表当前内容为 `[A, B, C]`，长度 `size = 3`，容量 `capacity = 4`。
规定容量不足时，新数组的容量扩大为原来的 2 倍。

<!-- numbered-subquestions -->

1. 追加 `D` 后，列表的长度和容量分别是多少？是否需要扩容？
2. 接着追加 `E` 时，容量会变为多少？需要复制几个原有元素？
3. 底层数组的长度不可变，为什么列表的容量看起来却可以增长？

??? success "参考答案"

    1. `D` 可以放入最后一个空位。此时内容为 `[A, B, C, D]`，
        `size = 4`、`capacity = 4`，不需要扩容。

    2. 再追加 `E` 时已经没有空位，需要创建容量为 8 的新数组，
        将 `A、B、C、D` 共 4 个原有元素复制过去，再加入 `E`。
        此时 `size = 5`、`capacity = 8`。

    3. 原来的数组本身没有变长。列表创建了一个更大的新数组，复制原有元素，
        再改用新数组作为底层存储，因此对使用者来说容量增长了。

## 编程练习

### 数组表示的大整数加一

数组 `digits` 从左到右保存一个非负整数的各位数字，例如 `[3, 0, 8]` 表示 308。
数字 0 用 `[0]` 表示；其他输入的第一位均不为 0。

请模拟一次十进制竖式加法，将这个整数增加 1，并把结果仍按相同的数组形式返回。
可以直接修改 `digits`；若最前面产生新的进位，可以返回一个更长的数组。

??? tip "解题提示"

    1. 像做竖式加法一样，从数组最后一位开始
    2. 当前位小于 9 时加一后即可立即返回
    3. 当前位等于 9 时把它改成 0；若所有位都是 9，需要在最前面补 1

[LeetCode](https://leetcode.cn/problems/plus-one/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 反转单向链表

给定一个单向链表的头节点 `head`。每个节点包含一个值和指向下一节点的 `next`。

请使用迭代方法反转所有节点之间的连接，并返回反转后的头节点。
要求不创建新的链表节点。

??? tip "解题提示"

    1. 先在纸上画出三个相连的节点和 prev、cur 两个指针
    2. 改写 cur.next 前，必须先用 nxt 保存原来的下一个节点
    3. 反转 cur.next 后，令 prev = cur，再令 cur = nxt，继续处理原链表中的下一个节点

[LeetCode](https://leetcode.cn/problems/reverse-linked-list/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [题目解析](https://leetcode.cn/problems/reverse-linked-list/solutions/2361282/206-fan-zhuan-lian-biao-shuang-zhi-zhen-r1jel/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
