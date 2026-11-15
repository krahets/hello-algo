<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 83a83378645ad286429e7490dcdf3e0895a5467e406979a77a5197ad086e4ebe -->

# 陣列的元素、索引與位址

陣列透過從 0 開始的索引定位元素，所有元素在記憶體中連續存放且佔用相同大小的空間。

<table><caption>五個元素的位置與記憶體位址</caption><thead><tr><th scope="col">索引</th><th scope="col">元素值</th><th scope="col">起始記憶體位址</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>00</td></tr><tr><th scope="row">1</th><td>3</td><td>04</td></tr><tr><th scope="row">2</th><td>2</td><td>08</td></tr><tr><th scope="row">3</th><td>5</td><td>12</td></tr><tr><th scope="row">4</th><td>4</td><td>16</td></tr></tbody></table>

<a id="source-46"></a>

陣列把相同型別的元素儲存在連續的記憶體空間中。本例陣列 \[1, 3, 2, 5, 4\] 共有 5 個元素，索引依次為 0 至 4；每個元素佔 4 位元組，起始記憶體位址依次為 00、04、08、12、16，因此相鄰元素的位址固定相差 4。右側記憶體網格中，五個連續單元格表示劃分給陣列的空間，其餘單元格表示可用記憶體空間。位址中的前導 0 僅為對齊位數的記法，不表示八進位制。

## 結果

索引表示元素在陣列中的位置序號，元素值是該位置存放的資料，記憶體位址則是儲存單元的起始編號，三者概念不同。
