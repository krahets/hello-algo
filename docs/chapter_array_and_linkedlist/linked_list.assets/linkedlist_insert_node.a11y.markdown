<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 2ba0e44b0efa39c6788226c8315a7f7b67738a87ddc22e9dd276bb7eca5bb70b -->

# 在链表中插入节点

在相邻节点 n0 与 n1 之间插入新节点 P，只需依次修改 P.next 与 n0.next 两次引用。

## 问题与输入

前驱节点 n0 的值为 1，后继节点 n1 的值为 3，初始时 n0.next 指向 n1，n1 右侧的省略号表示后续链表；待插入节点 P 的值为 0，初始尚未接入链表。next 表示节点的后继指针（引用）。

<table><caption>插入过程的连接</caption><thead><tr><th scope="col">阶段</th><th scope="col">n0.next</th><th scope="col">P.next</th><th scope="col">从n0出发依次经过</th></tr></thead><tbody><tr><th scope="row">初始</th><td>n1</td><td>未画出指向</td><td>n0 → n1 → …</td></tr><tr><th scope="row">连接P的后继</th><td>n1</td><td>n1</td><td>n0 → n1 → …</td></tr><tr><th scope="row">完成插入</th><td>P</td><td>n1</td><td>n0 → P → n1 → …</td></tr></tbody></table>

<a id="source-51"></a>

第一步先执行 P.next = n1，让新节点 P 指向原后继节点 n1；此时 n0.next 与 P.next 都指向 n1，从 n0 出发沿 next 仍直接到达 n1，尚未经过 P。第二步再执行 n0.next = P，将前驱 n0 的后继改为 P，才把 P 正式接入链表。图示先接后继再改前驱，是为了在仅靠 n0 引用原链表时不丢失 n1 的地址；配套代码则先用局部变量 n1 保存 n0.next，两种写法都能保证后续链表不断链。

## 结果

插入完成后链表连接为 n0（1）→ P（0）→ n1（3）→ …。各节点的数值及 n1 之后的连接保持不变；在已知前驱节点位置的前提下，两次引用修改的时间复杂度为 O(1)，无须移动后续节点。

## 在链表中插入节点：动画

在相邻节点 n0 与 n1 之间插入新节点 P，只需依次修改 P.next 与 n0.next 两次引用。

前驱节点 n0 的值为 1，后继节点 n1 的值为 3，初始时 n0.next 指向 n1，n1 右侧的省略号表示后续链表；待插入节点 P 的值为 0，初始尚未接入链表。next 表示节点的后继指针（引用）。

分两步依次修改 P.next 和 n0.next 的指向；整个过程中各节点的数值以及 n1 之后的链表连接均保持不变。

### 第 1 步：初始连接

初始时 n0.next = n1，待插入节点 P 独立于链表之外，图中未画出 P.next 的初始指向。

<details><summary>本步完整状态</summary><p>n0（值 1）的 n0.next 指向 n1（值 3），n1 后续连接省略；待插入节点 P（值 0）尚未接入链表，未画出其 next 指向。</p></details>

### 第 2 步：连接 P 的后继

执行 P.next = n1，使新节点 P 先连上后继节点 n1。此时 n0.next 仍指向 n1，从 n0 出发沿 next 仍直接到达 n1，还不会经过 P。

<details><summary>本步完整状态</summary><p>n0（值 1）的 n0.next 与 P（值 0）的 P.next 均指向 n1（值 3），n1 后续连接不变；此时从 n0 出发仍直接到 n1，尚未经过 P。</p></details>

### 第 3 步：把 P 接入链表

执行 n0.next = P，同时保留 P.next = n1。现在从 n0 出发会先经过 P，再到达 n1 及后续节点，插入完成。

<details><summary>本步完整状态</summary><p>n0.next 指向 P，P.next 指向 n1；链表连接变为 n0（1）→ P（0）→ n1（3）→ …，最终节点值顺序为 1 → 0 → 3 → 后续，插入完成。</p></details>

### 结果

插入完成后链表连接为 n0（1）→ P（0）→ n1（3）→ …。各节点的数值及 n1 之后的连接保持不变；在已知前驱节点位置的前提下，两次引用修改的时间复杂度为 O(1)，无须移动后续节点。
