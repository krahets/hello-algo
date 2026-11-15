<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 7f6b2bfcae16e88f5ba33d13482d01496fa366e388ecdb073f514c02c2c43388 -->

# 四元素归并排序的递归执行顺序

先将左半 \[7,3\] 排成 \[3,7\]，再处理右半 \[2,6\]，最后合并为 \[2,3,6,7\]。

## 问题与输入

本组输入是四元素数组 \[7,3,2,6\]，索引为 0 至 3。先递归处理左半，再处理右半，最后合并两边的有序结果。

## 结构与关系

图中保留已经展开的子问题和返回结果，用来表示递归调用历史；它们并非同一数组在当前时刻的多个版本。长度为 1 的子数组直接返回。

每帧只新增当前调用或合并结果，完整已显示记录可在该帧的表格中查询。合并时逐次比较两个有序子数组的首个未取元素，取较小值；一边取完后接上另一边的剩余元素。

<table><caption>固定输入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>7</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>6</td></tr></tbody></table>

<a id="source-274"></a>

## 第 1 步：开始排序四个元素

对四元素数组 \[7, 3, 2, 6\] 启动归并排序，当前处于顶层调用，尚未展开左、右子问题。

<details><summary>本步完整状态</summary><p>四元素归并排序处于顶层入口，尚未展开子问题。当前表只记录完整输入快照。</p><table><caption>当前已显示的递归调用记录</caption><thead><tr><th scope="col">子问题或结果</th><th scope="col">数组</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">完整输入</th><td>[7, 3, 2, 6]</td><td>划分时的输入快照</td></tr></tbody></table></details>

<a id="source-275"></a>

## 第 2 步：递归处理左半

按先左后右的递归次序，从顶层划分并先进入左半子问题 \[7, 3\]；右半 \[2, 6\] 暂未展开。

<details><summary>本步完整状态</summary><p>四元素归并排序正在处理左半 [7,3]，右半尚未展开；当前表保留已出现的调用记录。</p><table><caption>当前已显示的递归调用记录</caption><thead><tr><th scope="col">子问题或结果</th><th scope="col">数组</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">完整输入</th><td>[7, 3, 2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">左半输入</th><td>[7, 3]</td><td>划分时的输入快照</td></tr></tbody></table></details>

<a id="source-276"></a>

## 第 3 步：左半分出单元素 7

继续划分左半 \[7, 3\]，先递入其左侧单元素子数组 \[7\]；长度为 1 的子数组触发递归终止条件并直接返回。

<details><summary>本步完整状态</summary><p>左半已划分出单元素 [7] 并直接返回，另一单元素 [3] 及右半尚未展开。当前表保留已出现的记录。</p><table><caption>当前已显示的递归调用记录</caption><thead><tr><th scope="col">子问题或结果</th><th scope="col">数组</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">完整输入</th><td>[7, 3, 2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">左半输入</th><td>[7, 3]</td><td>划分时的输入快照</td></tr><tr><th scope="row">单元素 7</th><td>[7]</td><td>单元素，直接返回</td></tr></tbody></table></details>

<a id="source-277"></a>

## 第 4 步：左半分出单元素 3

左侧单元素 \[7\] 返回后，递入左半的另一单元素子数组 \[3\]；它同样满足终止条件并直接返回。

<details><summary>本步完整状态</summary><p>左半的单元素 [7] 和 [3] 均已返回，准备合并左半；右半尚未展开。</p><table><caption>当前已显示的递归调用记录</caption><thead><tr><th scope="col">子问题或结果</th><th scope="col">数组</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">完整输入</th><td>[7, 3, 2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">左半输入</th><td>[7, 3]</td><td>划分时的输入快照</td></tr><tr><th scope="row">单元素 7</th><td>[7]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 3</th><td>[3]</td><td>单元素，直接返回</td></tr></tbody></table></details>

<a id="source-278"></a>

## 第 5 步：左半合并为 \[3,7\]

左半的两个单元素均已返回，将 \[7\] 与 \[3\] 比较合并为有序结果 \[3, 7\]，完成左半子问题的回溯返回。

<details><summary>本步完整状态</summary><p>左半已合并为有序结果 [3,7]，右半尚未展开。当前表中的 [7,3] 是调用时的输入快照。</p><table><caption>当前已显示的递归调用记录</caption><thead><tr><th scope="col">子问题或结果</th><th scope="col">数组</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">完整输入</th><td>[7, 3, 2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">左半输入</th><td>[7, 3]</td><td>划分时的输入快照</td></tr><tr><th scope="row">单元素 7</th><td>[7]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 3</th><td>[3]</td><td>单元素，直接返回</td></tr><tr><th scope="row">左半返回结果</th><td>[3, 7]</td><td>有序合并结果</td></tr></tbody></table></details>

<a id="source-279"></a>

## 第 6 步：递归处理右半

左半返回有序结果 \[3, 7\] 后，顶层递归进入右半子问题 \[2, 6\]。

<details><summary>本步完整状态</summary><p>左半已有序，当前进入右半 [2,6]；右半下方的单元素尚未展开。已显示的结果和输入快照见表。</p><table><caption>当前已显示的递归调用记录</caption><thead><tr><th scope="col">子问题或结果</th><th scope="col">数组</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">完整输入</th><td>[7, 3, 2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">左半输入</th><td>[7, 3]</td><td>划分时的输入快照</td></tr><tr><th scope="row">右半输入</th><td>[2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">单元素 7</th><td>[7]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 3</th><td>[3]</td><td>单元素，直接返回</td></tr><tr><th scope="row">左半返回结果</th><td>[3, 7]</td><td>有序合并结果</td></tr></tbody></table></details>

<a id="source-280"></a>

## 第 7 步：右半分出单元素 2

继续划分右半 \[2, 6\]，先递入其左侧单元素子数组 \[2\]；单元素直接返回。

<details><summary>本步完整状态</summary><p>左半已有序；右半分出的单元素 [2] 已返回，[6] 尚未展开。当前表保留已出现的记录。</p><table><caption>当前已显示的递归调用记录</caption><thead><tr><th scope="col">子问题或结果</th><th scope="col">数组</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">完整输入</th><td>[7, 3, 2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">左半输入</th><td>[7, 3]</td><td>划分时的输入快照</td></tr><tr><th scope="row">右半输入</th><td>[2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">单元素 7</th><td>[7]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 3</th><td>[3]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 2</th><td>[2]</td><td>单元素，直接返回</td></tr><tr><th scope="row">左半返回结果</th><td>[3, 7]</td><td>有序合并结果</td></tr></tbody></table></details>

<a id="source-281"></a>

## 第 8 步：右半分出单元素 6

单元素 \[2\] 返回后，再递入右半的右侧单元素子数组 \[6\]；它也满足终止条件并直接返回。

<details><summary>本步完整状态</summary><p>右半的单元素 [2] 与 [6] 均已返回，准备合并右半；左半有序结果已就绪。</p><table><caption>当前已显示的递归调用记录</caption><thead><tr><th scope="col">子问题或结果</th><th scope="col">数组</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">完整输入</th><td>[7, 3, 2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">左半输入</th><td>[7, 3]</td><td>划分时的输入快照</td></tr><tr><th scope="row">右半输入</th><td>[2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">单元素 7</th><td>[7]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 3</th><td>[3]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 2</th><td>[2]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 6</th><td>[6]</td><td>单元素，直接返回</td></tr><tr><th scope="row">左半返回结果</th><td>[3, 7]</td><td>有序合并结果</td></tr></tbody></table></details>

<a id="source-282"></a>

## 第 9 步：右半合并为 \[2,6\]

将右半已返回的两个单元素 \[2\] 和 \[6\] 合并，得到右半的有序返回结果 \[2, 6\]。

<details><summary>本步完整状态</summary><p>左半结果 [3,7] 与右半结果 [2,6] 均已就绪，准备顶层合并。</p><table><caption>当前已显示的递归调用记录</caption><thead><tr><th scope="col">子问题或结果</th><th scope="col">数组</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">完整输入</th><td>[7, 3, 2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">左半输入</th><td>[7, 3]</td><td>划分时的输入快照</td></tr><tr><th scope="row">右半输入</th><td>[2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">单元素 7</th><td>[7]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 3</th><td>[3]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 2</th><td>[2]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 6</th><td>[6]</td><td>单元素，直接返回</td></tr><tr><th scope="row">左半返回结果</th><td>[3, 7]</td><td>有序合并结果</td></tr><tr><th scope="row">右半返回结果</th><td>[2, 6]</td><td>有序合并结果</td></tr></tbody></table></details>

<a id="source-283"></a>

## 第 10 步：合并左右两半

左右两半均已返回，在顶层将 \[3, 7\] 与 \[2, 6\] 按首元素比较依次取出 2、3、6、7，合并得到最终有序数组 \[2, 3, 6, 7\]。

<details><summary>本步完整状态</summary><p>顶层合并已完成，四元素数组升序。当前表保留全部输入快照、单元素和合并结果。</p><table><caption>当前已显示的递归调用记录</caption><thead><tr><th scope="col">子问题或结果</th><th scope="col">数组</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">完整输入</th><td>[7, 3, 2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">左半输入</th><td>[7, 3]</td><td>划分时的输入快照</td></tr><tr><th scope="row">右半输入</th><td>[2, 6]</td><td>划分时的输入快照</td></tr><tr><th scope="row">单元素 7</th><td>[7]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 3</th><td>[3]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 2</th><td>[2]</td><td>单元素，直接返回</td></tr><tr><th scope="row">单元素 6</th><td>[6]</td><td>单元素，直接返回</td></tr><tr><th scope="row">左半返回结果</th><td>[3, 7]</td><td>有序合并结果</td></tr><tr><th scope="row">右半返回结果</th><td>[2, 6]</td><td>有序合并结果</td></tr><tr><th scope="row">顶层返回结果</th><td>[2, 3, 6, 7]</td><td>有序合并结果</td></tr></tbody></table></details>

## 结果

左半部分先完成划分与合并得到 \[3, 7\]，右半部分随后完成划分与合并得到 \[2, 6\]；顶层最后依次取出 2、3、6、7，合成最终有序数组 \[2, 3, 6, 7\]。本组十帧展示的是递归展开与回溯合并的完整调用轨迹，而非十次元素大小比较。
