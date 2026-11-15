<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 18616e03043fd27bf5c77d048debea3112f711b084a89810e69505d0177bc358 -->

# 斐波那契递归树

递归分支重复求解同名子问题，说明朴素递归为何产生大量计算。

## 结构与关系

这是一般n的部分展开示意；较小n会较早达到基本情况，不能机械展开到图中所有符号层。

<table><caption>图中各层调用；同名项表示不同调用</caption><thead><tr><th scope="col">层</th><th scope="col">调用节点（图中从左到右）</th><th scope="col">数量</th></tr></thead><tbody><tr><th scope="row">1</th><td>f(n)</td><td>1</td></tr><tr><th scope="row">2</th><td>f(n−1)、f(n−2)</td><td>2</td></tr><tr><th scope="row">3</th><td>f(n−2)、f(n−3)、f(n−3)、f(n−4)</td><td>4</td></tr><tr><th scope="row">4</th><td>f(n−3)、f(n−4)、f(n−4)、f(n−5)、f(n−4)、f(n−5)、f(n−5)、f(n−6)</td><td>8</td></tr><tr><th scope="row">5</th><td>每个上一层节点再分出两个省略号，后续调用未具体画出</td><td>16个省略号</td></tr></tbody></table>

<a id="source-24"></a>

每个未达基本情况的节点f(k)，都会分出左子调用f(k−1)和右子调用f(k−2)。例如根f(n)在第2层的右子问题f(n−2)，与左子问题f(n−1)在第3层分出的左子问题f(n−2)，分属两条不同调用路径，会各自独立展开计算，不会自动合并或复用结果。

## 结果

图中已展开层的节点数为1、2、4、8；实际分支到基本情况即停止，并非所有层始终翻倍。朴素递归的调用规模随n呈指数增长。
