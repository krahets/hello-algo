<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 60dbf906ab1c567fb4a0e0c492628796100bfc6768fa1b553049819ab26a12d7 -->

# 普通递归求和

先把求和问题缩小到基本情况，再在返回时逐层相加。

<table><caption>图中调用与返回表达式</caption><thead><tr><th scope="col">调用</th><th scope="col">返回表达式</th></tr></thead><tbody><tr><th scope="row">recur(n)</th><td>n+((n−1)+…+2+1)</td></tr><tr><th scope="row">recur(n−1)</th><td>(n−1)+((n−2)+…+2+1)</td></tr><tr><th scope="row">中间调用</th><td>省略</td></tr><tr><th scope="row">recur(4)</th><td>4+(3+2+1)</td></tr><tr><th scope="row">recur(3)</th><td>3+(2+1)</td></tr><tr><th scope="row">recur(2)</th><td>2+(1)</td></tr><tr><th scope="row">recur(1)</th><td>1，终止条件</td></tr></tbody></table>

<a id="source-21"></a>

递入阶段，从recur(n)起逐层调用recur(n−1)，将参数一路缩小到终止条件recur(1)。回传阶段，recur(1)直接返回1；recur(2)收到下层结果1后计算2+1=3，recur(3)收到3后计算3+3=6，依次向上累加直到最初调用。因为每层必须先拿到子调用的返回值，才能把本层参数加进去，所以求和加法都在返回阶段完成。

## 结果

最初调用recur(n)最终返回1+2+…+n。图中省略号代表中间层调用，各层依赖关系不变。
