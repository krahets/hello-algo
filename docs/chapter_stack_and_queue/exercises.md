<!-- 此文件由 utils/exercises/publish_exercises.py 根据 exercises.yaml 自动生成，请勿直接修改。 -->

# 练习

## 知识巩固

### 栈和队列会先取出谁

准备一个空栈 `S` 和一个空队列 `Q`，分别对它们执行下面同一组操作：

步骤 1：加入 `A`；
步骤 2：加入 `B`；
步骤 3：移除一个元素并记录；
步骤 4：加入 `C`；
步骤 5：不断移除并记录，直到容器为空。

请分别写出 `S` 和 `Q` 中元素被移除的顺序，并用“先入后出”或“先入先出”解释差异。

??? success "参考答案"

    栈 `S` 的移除顺序是 `B、C、A`：加入 `A、B` 后先弹出最近加入的 `B`，再加入 `C`，
    此后依次弹出 `C、A`，体现“先入后出”。

    队列 `Q` 的移除顺序是 `A、B、C`：加入 `A、B` 后先移除最早加入的 `A`，
    再加入 `C`，此后依次移除 `B、C`，体现“先入先出”。

### 队尾越过数组末尾怎么办

用长度为 5 的环形数组实现队列，数组索引为 `0～4`。
当前 `front = 3`、`size = 2`，队列中的 `A、B` 分别位于索引 3、4。

<!-- numbered-subquestions -->

1. 执行“`C` 入队”时，`C` 应放在哪个索引？入队后 `size` 是多少？
2. 接着执行一次出队，弹出哪个元素？新的 `front` 和 `size` 分别是多少？
3. 此时从队首到队尾的逻辑顺序是什么？出队时是否需要移动数组中的其他元素？为什么？

??? success "参考答案"

    1. 新元素的位置为
        `(front + size) % 5 = (3 + 2) % 5 = 0`，
        所以 `C` 放在索引 0。入队后 `size = 3`。

    2. 出队弹出当前队首 `A`。新的队首索引为
        `(3 + 1) % 5 = 4`，因此 `front = 4`、`size = 2`。

    3. 有效元素的逻辑顺序为 `B、C`，其中 `B` 位于索引 4，`C` 位于索引 0。
        出队时只需移动 `front` 并修改 `size`，环形数组用取余让索引回到开头，
        因此无须把其他元素整体向前移动。

### 双向队列的两端操作

这里规定：`push_first` 表示从队首加入，`push_last` 表示从队尾加入，
`pop_first` 表示从队首弹出，`pop_last` 表示从队尾弹出。

对一个空的双向队列 `deq` 依次执行：

1. `push_last(A)`
2. `push_last(B)`
3. `push_first(C)`
4. `pop_last()`
5. `push_last(D)`
6. `pop_first()`

<!-- numbered-subquestions -->

1. 两次弹出的元素分别是什么？
2. 全部操作完成后，从队首到队尾还剩哪些元素？
3. 检查这 6 步操作：只允许从队尾加入、从队首删除的队列能否全部完成？如果不能，请指出无法完成的操作；再说明双向队列能否完成及其原因。

??? success "参考答案"

    前三步后，双向队列从队首到队尾为 `[C, A, B]`。

    <!-- numbered-subquestions -->

    1. `pop_last()` 弹出 `B`；加入 `D` 后队列为 `[C, A, D]`，
        `pop_first()` 再弹出 `C`。

    2. 最后剩下 `[A, D]`。

    3. 只允许在队尾添加、在队首删除的队列不能完成全部操作：
        第 3 步 `push_first(C)` 要求从队首加入，第 4 步 `pop_last()` 要求从队尾删除，都超出了这种队列的操作范围。
        双向队列的两端都可以添加和删除，因此能够完成这 6 步操作。

## 编程练习

### 检查括号序列

给定一个只包含 `()`、`[]`、`{}` 这三类括号的字符串 `s`，请使用栈判断它是否合法。

合法序列须同时满足：每个右括号都必须与最近一个尚未配对的左括号类型匹配，
并且遍历结束后没有未配对的左括号。返回布尔值表示判断结果。

??? tip "解题提示"

    1. 可以建立“右括号到对应左括号”的映射
    2. 遇到右括号时，先检查栈是否为空，再检查栈顶是否匹配
    3. 遍历结束后，栈也必须为空

[LeetCode](https://leetcode.cn/problems/valid-parentheses/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [题目解析](https://leetcode.cn/problems/valid-parentheses/solutions/9185/valid-parentheses-fu-zhu-zhan-fa-by-jin407891080/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
