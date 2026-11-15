<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: f6d9198102e225b8f0dd15a76a360c639788695cc1be310cb5ceed2578e3e12f -->

# 尾递归求和

用累加器在递归调用前完成加法，返回时直接传回结果。

## 结构与关系

图中函数写作recur(n,res)，正文代码名为tail\_recur；两者表示相同的累加器过程。图上展示7行返回，不表示任意n都恰好调用7层。

<table><caption>图中向下调用时的累加器</caption><thead><tr><th scope="col">当前参数k</th><th scope="col">已累计res</th></tr></thead><tbody><tr><th scope="row">n</th><td>0</td></tr><tr><th scope="row">n−1</th><td>n</td></tr><tr><th scope="row">中间调用</th><td>省略</td></tr><tr><th scope="row">3</th><td>n+…+5+4</td></tr><tr><th scope="row">2</th><td>n+…+5+4+3</td></tr><tr><th scope="row">1</th><td>n+…+5+4+3+2</td></tr><tr><th scope="row">0</th><td>n+…+5+4+3+2+1，完整总和</td></tr></tbody></table>

<a id="source-23"></a>

从recur(n,0)出发，每层在递归调用前先将当前参数k并入累加器res，再调用recur(k−1,res+k)向下传递。当k=1时，res还差最后一项1；再调用一次进入基本情况k=0时，res已累加成完整总和n+…+1并直接返回。回传阶段每层只原样转发下层返回值，不再做额外加法。

## 结果

只有执行环境实际支持并启用尾递归优化时，才能复用栈帧使空间复杂度降为O(1)；若未优化，栈空间仍为O(n)。Python默认不支持尾递归优化。
