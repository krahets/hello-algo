<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 042d97a826fed3fafe517bab00c0892975e844b57711b30a17201801767cbf7d -->

# 汉诺塔的三阶段分解

将 n 盘从 A 移至 C，按序拆为 n−1 盘 A→B、最大盘 A→C、n−1 盘 B→C 三个子问题。

## 问题与输入

原问题记为 f(n)，表示将 n 个按上小下大叠放的圆盘从起始柱 A 移至目标柱 C；本图以五张圆盘为例图解一般分治策略（不同于上一张概览图的六张圆盘）。移动过程同样要求每次只从柱顶移动一张盘，且小盘时刻位于大盘之上。

在顶层问题中，A 为起始柱、B 为缓冲柱、C 为目标柱；当递归进入子问题时，三根柱子所承担的起始、缓冲、目标角色会相应轮换。

## 结构与关系

先把上方 n−1 张小盘借助 C 从 A 移到 B，腾出最大盘。再把最大盘从 A 移到 C。最后借助 A，把 B 上的 n−1 张小盘移到 C 的最大盘之上。

首尾两个子问题都还要递归拆成合法的单盘移动，不能一次搬动整叠小盘。图中虚线是移动前的位置，实色是阶段完成后的位置，始终只有同一组五张盘。

<table><caption>五盘示例的三个阶段</caption><thead><tr><th scope="col">阶段</th><th scope="col">移动任务</th><th scope="col">缓冲柱</th><th scope="col">完成后 A</th><th scope="col">完成后 B</th><th scope="col">完成后 C</th></tr></thead><tbody><tr><th scope="row">移开小盘</th><td>四小盘 A→B</td><td>C</td><td>最大盘</td><td>四小盘</td><td>空</td></tr><tr><th scope="row">移动最大盘</th><td>最大盘 A→C</td><td>不需要</td><td>空</td><td>四小盘</td><td>最大盘</td></tr><tr><th scope="row">移回小盘</th><td>四小盘 B→C</td><td>A</td><td>空</td><td>空</td><td>五盘按上小下大叠放</td></tr></tbody></table>

<a id="source-327"></a>

将五盘从 A 移至 C 拆为按序执行的三个阶段：先以 C 为缓冲将上方四小盘从 A 移到 B，再将最大盘从 A 直接移到 C，最后以 A 为缓冲将四小盘从 B 移到 C。两次四盘子问题的起始柱、缓冲柱与目标柱角色互不相同。

## 结果

三个子问题必须严格按自上而下的先后顺序执行，由此得到单盘移动次数的递推关系 T(n) = 2T(n−1) + 1；首尾两个 f(n−1) 子问题虽然规模相同，但起始柱、缓冲柱与目标柱的角色不同。
