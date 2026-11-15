<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 9432fef4b5d3aa640b372bd0cfb1ba0358b7c705618a303e48543ffff3e7d52c -->

# 循环结构与操作次数

比较单次操作、单层循环和双层循环的工作量增长。

<table><caption>循环结构的工作量</caption><thead><tr><th scope="col">结构</th><th scope="col">基础操作次数</th><th scope="col">时间复杂度</th></tr></thead><tbody><tr><th scope="row">无循环</th><td>1</td><td>常数阶O(1)</td></tr><tr><th scope="row">单层循环n次</th><td>n</td><td>线性阶O(n)</td></tr><tr><th scope="row">双层嵌套，各n次</th><td>n×n=n²</td><td>平方阶O(n²)</td></tr></tbody></table>

<a id="source-28"></a>

图中每个小方块代表1次基础操作，外围循环框表示重复执行的范围。无循环结构只执行1次操作；单层循环将基础操作重复n次；双层嵌套循环并非两个循环先后相加，而是外层每执行1轮，内层都要完整运行n次，因此总操作次数按乘法计为n×n=n²。

## 结果

本图内循环次数每轮固定为n，双层总次数是n×n，不能把它算成两层次数相加。
