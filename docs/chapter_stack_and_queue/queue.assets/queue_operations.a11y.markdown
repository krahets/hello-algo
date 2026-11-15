<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 8c0735da9da7c435524958c7ac637bbc4196c400540fe2edca80687fab45b3e1 -->

# 队列的入出操作

队尾加入、队首取出，体现先入先出。

## 问题与输入

所有序列按队首到队尾书写。图中 push 向队尾入队，pop 从队首出队并返回该元素。

## 结构与关系

虚线方块仅示意元素操作前的旧位置，不重复计入当前队列；移出容器外的实心方块表示本次 pop 的返回值。

<table><caption>队列每次操作后的内容</caption><thead><tr><th scope="col">操作</th><th scope="col">有效序列（队首到队尾）</th><th scope="col">本次返回</th></tr></thead><tbody><tr><th scope="row">初始</th><td>[1, 3, 2]</td><td>无</td></tr><tr><th scope="row">push(5)</th><td>[1, 3, 2, 5]</td><td>无</td></tr><tr><th scope="row">push(4)</th><td>[1, 3, 2, 5, 4]</td><td>无</td></tr><tr><th scope="row">第一次pop()</th><td>[3, 2, 5, 4]</td><td>1</td></tr><tr><th scope="row">第二次pop()</th><td>[2, 5, 4]</td><td>3</td></tr></tbody></table>

<a id="source-63"></a>

初始队列为 \[1, 3, 2\]（队首为 1，队尾为 2）。先在队尾依次执行 push(5)、push(4)，新元素排在已有元素之后；再从队首连续执行两次 pop()，最早在队首的 1 和 3 依次出队，体现先入先出。

## 结果

连续两次出队依次返回最早进入的 1、3，剩余队列为 \[2, 5, 4\]。

## 队列的入出操作：动画

队尾加入、队首取出，体现先入先出。

所有序列按队首到队尾书写。图中 push 向队尾入队，pop 从队首出队并返回该元素。

本例初始队列为 \[1, 3, 2\]。

虚线方块仅示意元素操作前的旧位置，不重复计入当前队列；移出容器外的实心方块表示本次 pop 的返回值。

### 第 1 步：初始

初始队列包含 3 个元素，队首为 1，队尾为 2。

<details><summary>本步完整状态</summary><p>当前队列按队首到队尾为 [1, 3, 2]，共 3 个元素，队首为 1、队尾为 2；无返回值。</p></details>

### 第 2 步：push(5)

将 5 加入队尾，原有元素先后次序不变，5 成为新队尾。

<details><summary>本步完整状态</summary><p>执行 push(5) 后，当前队列按队首到队尾为 [1, 3, 2, 5]，共 4 个元素，队首为 1、队尾为 5；无返回值。</p></details>

### 第 3 步：push(4)

将 4 加入队尾，排在 5 之后成为新队尾。

<details><summary>本步完整状态</summary><p>执行 push(4) 后，当前队列按队首到队尾为 [1, 3, 2, 5, 4]，共 5 个元素，队首为 1、队尾为 4；无返回值。</p></details>

### 第 4 步：第一次pop()

移除并返回队首 1，紧随其后的 3 成为新队首。

<details><summary>本步完整状态</summary><p>第一次执行 pop() 后，当前队列按队首到队尾为 [3, 2, 5, 4]，共 4 个元素，队首为 3、队尾为 4；本次返回 1（已移出队列）。</p></details>

### 第 5 步：第二次pop()

继续移除并返回队首 3，2 成为新队首。

<details><summary>本步完整状态</summary><p>第二次执行 pop() 后，当前队列按队首到队尾为 [2, 5, 4]，共 3 个元素，队首为 2、队尾为 4；本次返回 3（已移出队列）。</p></details>

### 结果

连续两次出队依次返回最早进入的 1、3，剩余队列为 \[2, 5, 4\]。
