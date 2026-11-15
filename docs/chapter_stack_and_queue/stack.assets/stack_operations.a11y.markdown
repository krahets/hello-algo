<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 6316defa72a00cecc5bfa65cd1d1707cd12c389e7b0e6d6a9053b76da563e32d -->

# 栈的入出操作

在栈顶同一端压入和弹出，体现后进先出。

## 问题与输入

所有序列按栈底到栈顶书写。push 向栈顶压入元素，pop 移除并返回栈顶元素。

## 结构与关系

虚线方块仅示意元素操作前的旧位置，不重复计入当前栈；移出容器外的实心方块表示本次 pop 的返回值。

<table><caption>栈每次操作后的内容</caption><thead><tr><th scope="col">操作</th><th scope="col">有效序列（栈底到栈顶）</th><th scope="col">本次返回</th></tr></thead><tbody><tr><th scope="row">初始</th><td>[1, 3, 2]</td><td>无</td></tr><tr><th scope="row">push(5)</th><td>[1, 3, 2, 5]</td><td>无</td></tr><tr><th scope="row">push(4)</th><td>[1, 3, 2, 5, 4]</td><td>无</td></tr><tr><th scope="row">第一次pop()</th><td>[1, 3, 2, 5]</td><td>4</td></tr><tr><th scope="row">第二次pop()</th><td>[1, 3, 2]</td><td>5</td></tr></tbody></table>

<a id="source-56"></a>

初始栈为 \[1, 3, 2\]（栈顶为 2）。先依次执行 push(5) 和 push(4)，每次压入的新元素都成为新的栈顶；再连续执行两次 pop()，后压入的 4 先弹出，随后 5 弹出，体现后进先出。

## 结果

连续两次出栈依次返回 4、5，栈恢复为 \[1, 3, 2\]。

## 栈的入出操作：动画

在栈顶同一端压入和弹出，体现后进先出。

所有序列按栈底到栈顶书写。push 向栈顶压入元素，pop 移除并返回栈顶元素。

本例初始栈为 \[1, 3, 2\]。

虚线方块仅示意元素操作前的旧位置，不重复计入当前栈；移出容器外的实心方块表示本次 pop 的返回值。

### 第 1 步：初始

初始栈包含 3 个元素，栈底为 1，栈顶为 2。

<details><summary>本步完整状态</summary><p>当前栈按栈底到栈顶为 [1, 3, 2]，共 3 个元素，栈底为 1、栈顶为 2；无返回值。</p></details>

### 第 2 步：push(5)

将 5 压入栈顶，原有元素次序不变，5 成为新栈顶。

<details><summary>本步完整状态</summary><p>执行 push(5) 后，当前栈按栈底到栈顶为 [1, 3, 2, 5]，共 4 个元素，栈底为 1、栈顶为 5；无返回值。</p></details>

### 第 3 步：push(4)

将 4 压入栈顶，压在 5 之上成为新栈顶。

<details><summary>本步完整状态</summary><p>执行 push(4) 后，当前栈按栈底到栈顶为 [1, 3, 2, 5, 4]，共 5 个元素，栈底为 1、栈顶为 4；无返回值。</p></details>

### 第 4 步：第一次pop()

移除并返回当前栈顶 4，下方的 5 重新成为栈顶。

<details><summary>本步完整状态</summary><p>第一次执行 pop() 后，当前栈按栈底到栈顶为 [1, 3, 2, 5]，共 4 个元素，栈底为 1、栈顶为 5；本次返回 4（已移出栈外）。</p></details>

### 第 5 步：第二次pop()

继续移除并返回栈顶 5，栈顶恢复为 2。

<details><summary>本步完整状态</summary><p>第二次执行 pop() 后，当前栈按栈底到栈顶为 [1, 3, 2]，共 3 个元素，栈底为 1、栈顶为 2；本次返回 5（已移出栈外）。</p></details>

### 结果

连续两次出栈依次返回 4、5，栈恢复为 \[1, 3, 2\]。
