<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 5c25d16e153ddbb6504c6123081f966e6d7e82c7810a87615c813cc45543d075 -->

# 分治树的分层工作量

子问题数量加倍、单个工作量减半，使每层总工作量保持相同。

## 问题与输入

最底层示意画出4个框并用省略号间隔，代表全部n个叶子，不表示仅有4个叶子。

<table><caption>图中各层操作总数</caption><thead><tr><th scope="col">层级</th><th scope="col">子问题数</th><th scope="col">单个子问题操作数</th><th scope="col">本层总数</th></tr></thead><tbody><tr><th scope="row">根层</th><td>1</td><td>n</td><td>n</td></tr><tr><th scope="row">下一层</th><td>2</td><td>n/2</td><td>n</td></tr><tr><th scope="row">再下一层</th><td>4</td><td>n/4</td><td>n</td></tr><tr><th scope="row">中间层</th><td>继续加倍</td><td>继续减半</td><td>n</td></tr><tr><th scope="row">叶层</th><td>n</td><td>1</td><td>n</td></tr></tbody></table>

<a id="source-31"></a>

总操作数由“每层工作量n”与“总层数log₂n+1”相乘得到，共n(log₂n+1)次。自顶向下每分一层，子问题数量加倍，但单个子问题的操作数同时减半：第d层（根为第0层）有2^d个子问题、每个操作数为n/2^d，两者相乘恒为n。如此二分直到规模为1的叶层（n个叶子、每个计1次），共经历log₂n+1层。

## 结果

全部log₂n+1层的操作总数为n(log₂n+1)=n log₂n+n，时间复杂度为O(n log n)。
