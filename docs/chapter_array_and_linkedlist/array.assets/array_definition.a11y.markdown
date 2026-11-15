<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: de0bc778afe1518f04ac28f4262ddd12c84a864c5aa11de011703c361833d308 -->

# 数组的元素、索引与地址

数组通过从 0 开始的索引定位元素，所有元素在内存中连续存放且占用相同大小的空间。

<table><caption>五个元素的位置与内存地址</caption><thead><tr><th scope="col">索引</th><th scope="col">元素值</th><th scope="col">起始内存地址</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>00</td></tr><tr><th scope="row">1</th><td>3</td><td>04</td></tr><tr><th scope="row">2</th><td>2</td><td>08</td></tr><tr><th scope="row">3</th><td>5</td><td>12</td></tr><tr><th scope="row">4</th><td>4</td><td>16</td></tr></tbody></table>

<a id="source-46"></a>

数组把相同类型的元素保存在连续的内存空间中。本例数组 \[1, 3, 2, 5, 4\] 共有 5 个元素，索引依次为 0 至 4；每个元素占 4 字节，起始内存地址依次为 00、04、08、12、16，因此相邻元素的地址固定相差 4。右侧内存网格中，五个连续单元格表示划分给数组的空间，其余单元格表示可用内存空间。地址中的前导 0 仅为对齐位数的记法，不表示八进制。

## 结果

索引表示元素在数组中的位置序号，元素值是该位置存放的数据，内存地址则是存储单元的起始编号，三者概念不同。
