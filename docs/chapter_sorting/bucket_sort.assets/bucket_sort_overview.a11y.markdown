<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 6600a252742ac1d51b56950aa0a8597a5243eb20054d0e112dec7a74ddb75397 -->

# 分成五个桶，桶内排序后依次合并

十个小数按数值范围分入五个桶，桶内分别升序排序，再按桶序连接成有序数组。

## 问题与输入

输入数组为 nums = \[0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37\]，全部元素均为 \[0, 1) 区间内的浮点数，算法设置五个宽度为 0.2 的桶。

## 结构与关系

先将每个数放入它所属的左闭右开区间，再分别对桶内元素排序。中间画面已经完成这两项操作，并不展示刚入桶时的先后顺序。

最后按区间从小到大的桶序拼接；由于桶的数值范围互不重叠，各桶内部也已升序，拼接后即为完整有序数组。

<table><caption>输入数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>0.49</td></tr><tr><th scope="row">1</th><td>0.96</td></tr><tr><th scope="row">2</th><td>0.82</td></tr><tr><th scope="row">3</th><td>0.09</td></tr><tr><th scope="row">4</th><td>0.57</td></tr><tr><th scope="row">5</th><td>0.43</td></tr><tr><th scope="row">6</th><td>0.91</td></tr><tr><th scope="row">7</th><td>0.75</td></tr><tr><th scope="row">8</th><td>0.15</td></tr><tr><th scope="row">9</th><td>0.37</td></tr></tbody></table>

<table><caption>五个桶的范围与排序结果</caption><thead><tr><th scope="col">桶范围</th><th scope="col">桶内升序结果</th></tr></thead><tbody><tr><th scope="row">[0,0.2)</th><td>0.09、0.15</td></tr><tr><th scope="row">[0.2,0.4)</th><td>0.37</td></tr><tr><th scope="row">[0.4,0.6)</th><td>0.43、0.49、0.57</td></tr><tr><th scope="row">[0.6,0.8)</th><td>0.75</td></tr><tr><th scope="row">[0.8,1.0)</th><td>0.82、0.91、0.96</td></tr></tbody></table>

<a id="source-296"></a>

将 10 个 \[0, 1) 内的小数按区间宽度 0.2 分入 5 个左闭右开桶，各桶内部独立完成升序排序后，再按桶区间从小到大依次拼接。

## 结果

合并后的结果数组为 \[0.09, 0.15, 0.37, 0.43, 0.49, 0.57, 0.75, 0.82, 0.91, 0.96\]。分桶阶段保证了桶间整体的大小次序，桶内排序保证了每个子区间内部的有序性，二者共同完成桶排序。

## 分成五个桶，桶内排序后依次合并：动画

十个小数按数值范围分入五个桶，桶内分别升序排序，再按桶序连接成有序数组。

输入数组为 nums = \[0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37\]，全部元素均为 \[0, 1) 区间内的浮点数，算法设置五个宽度为 0.2 的桶。

先将每个数放入它所属的左闭右开区间，再分别对桶内元素排序。中间画面已经完成这两项操作，并不展示刚入桶时的先后顺序。

最后按区间从小到大的桶序拼接；由于桶的数值范围互不重叠，各桶内部也已升序，拼接后即为完整有序数组。

### 第 1 步：准备分桶

给出初始待排序的 10 个 \[0, 1) 浮点数，准备按宽度 0.2 的五个左闭右开区间分桶。

<details><summary>本步完整状态</summary><p>十个 [0,1) 内的小数尚未分桶，准备使用五个宽度为 0.2 的左闭右开区间。当前输入的索引和值见表。</p><table><caption>输入数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>0.49</td></tr><tr><th scope="row">1</th><td>0.96</td></tr><tr><th scope="row">2</th><td>0.82</td></tr><tr><th scope="row">3</th><td>0.09</td></tr><tr><th scope="row">4</th><td>0.57</td></tr><tr><th scope="row">5</th><td>0.43</td></tr><tr><th scope="row">6</th><td>0.91</td></tr><tr><th scope="row">7</th><td>0.75</td></tr><tr><th scope="row">8</th><td>0.15</td></tr><tr><th scope="row">9</th><td>0.37</td></tr></tbody></table></details>

### 第 2 步：分桶并完成桶内排序

将 10 个数分入各自所属的区间桶，且五个桶均已同步完成桶内升序排序。以 \[0.4, 0.6) 桶为例，桶内显示为升序的 0.43、0.49、0.57，而非按原数组出现顺序排列的 0.49、0.57、0.43。

<details><summary>本步完整状态</summary><p>十个小数已分入五个桶，各桶内部均已升序。当前表逐桶列出区间及排序结果；尚未拼接结果数组。</p><table><caption>五个桶的范围与排序结果</caption><thead><tr><th scope="col">桶范围</th><th scope="col">桶内升序结果</th></tr></thead><tbody><tr><th scope="row">[0,0.2)</th><td>0.09、0.15</td></tr><tr><th scope="row">[0.2,0.4)</th><td>0.37</td></tr><tr><th scope="row">[0.4,0.6)</th><td>0.43、0.49、0.57</td></tr><tr><th scope="row">[0.6,0.8)</th><td>0.75</td></tr><tr><th scope="row">[0.8,1.0)</th><td>0.82、0.91、0.96</td></tr></tbody></table></details>

### 第 3 步：按桶序拼接完成

因 5 个桶的区间从低到高互不重叠且桶内均已升序，从 \[0, 0.2) 到 \[0.8, 1.0) 逐桶顺序取出元素拼接，即得到最终升序数组。

<details><summary>本步完整状态</summary><p>五个桶已按区间从小到大的顺序拼接，十个小数全部升序。当前表列出结果数组的每个索引和值。</p><table><caption>排序结果</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>0.09</td></tr><tr><th scope="row">1</th><td>0.15</td></tr><tr><th scope="row">2</th><td>0.37</td></tr><tr><th scope="row">3</th><td>0.43</td></tr><tr><th scope="row">4</th><td>0.49</td></tr><tr><th scope="row">5</th><td>0.57</td></tr><tr><th scope="row">6</th><td>0.75</td></tr><tr><th scope="row">7</th><td>0.82</td></tr><tr><th scope="row">8</th><td>0.91</td></tr><tr><th scope="row">9</th><td>0.96</td></tr></tbody></table></details>

### 结果

合并后的结果数组为 \[0.09, 0.15, 0.37, 0.43, 0.49, 0.57, 0.75, 0.82, 0.91, 0.96\]。分桶阶段保证了桶间整体的大小次序，桶内排序保证了每个子区间内部的有序性，二者共同完成桶排序。
