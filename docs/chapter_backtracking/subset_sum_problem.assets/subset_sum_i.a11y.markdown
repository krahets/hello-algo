<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 33edb279b517f0c84c4f455b97946ea98f89e2ba26431ee4222632d7a413f28f -->

# 子集和 I：余额归零与顺序剪枝

从目标 9 起逐层扣减候选，结合 start=i 与越界 break，输出 \[3, 3, 3\] 和 \[4, 5\]。

## 问题与输入

输入为已升序排列的正整数数组 choices = \[3, 4, 5\]（索引 0、1、2）与初始目标 target = 9，元素允许重复选取，组合不区分顺序。图中圆节点内的数字表示剩余目标余额（9 减去当前前缀和），减至 0 时即命中合法子集。

## 结构与关系

每轮从起始索引 start 起枚举候选 choices\[i\] 并从余额中减去它；余额归 0 时记录当前组合并返回。向下递归传递 start = i，既允许重复选取当前元素，又跳过更早索引（图中黑剪刀所示的顺序剪枝）。

由于候选已升序排列，在允许范围 i &gt;= start 内一旦遇到第一个大于当前余额的候选（相减后小于 0），代码直接 break 跳出本轮循环，其后更大的候选一并跳过，不会逐个递归进入图中红剪刀画出的越界分支。

<table><caption>按前缀查询余额与选择限制</caption><thead><tr><th scope="col">当前前缀</th><th scope="col">剩余目标</th><th scope="col">可继续选择</th><th scope="col">图中限制或终止情况</th><th scope="col">实际后续</th></tr></thead><tbody><tr><th scope="row">[]</th><td>9</td><td>3、4、5</td><td>无</td><td>选择后余额分别为 6、5、4</td></tr><tr><th scope="row">[3]</th><td>6</td><td>3、4、5</td><td>无</td><td>选择后余额分别为 3、2、1</td></tr><tr><th scope="row">[3,3]</th><td>3</td><td>3</td><td>4、5 越界</td><td>选 3 到 0；遇 4 时 break</td></tr><tr><th scope="row">[3,3,3]</th><td>0</td><td>无</td><td>不再选择</td><td>记录 [3,3,3]</td></tr><tr><th scope="row">[3,4]</th><td>2</td><td>无</td><td>3 为更早索引；4、5 越界</td><td>从 4 开始即 break</td></tr><tr><th scope="row">[3,5]</th><td>1</td><td>无</td><td>3、4 为更早索引；5 越界</td><td>从 5 开始即 break</td></tr><tr><th scope="row">[4]</th><td>5</td><td>4、5</td><td>3 为更早索引</td><td>选 4 到 1；选 5 到 0</td></tr><tr><th scope="row">[4,4]</th><td>1</td><td>无</td><td>后续未在图中展开</td><td>按代码规则，从 4 开始即 break</td></tr><tr><th scope="row">[4,5]</th><td>0</td><td>无</td><td>不再选择</td><td>记录 [4,5]</td></tr><tr><th scope="row">[5]</th><td>4</td><td>无</td><td>3、4 为更早索引；5 越界</td><td>从 5 开始即 break</td></tr></tbody></table>

<a id="source-360"></a>

同时约束剩余余额与非递减起始索引 start = i，使每种可行组合只生成一次，且遇到首个大于余额的候选即 break。

## 结果

顺序剪枝（start = i）与升序越界剪枝（break）配合后，搜索树仅输出 \[3, 3, 3\] 与 \[4, 5\] 两个不重复解。
