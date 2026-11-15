<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 22db32440d3e9f64893b888477df6d2fdaa986c6b3c66fa9601c727897a90a5a -->

# 陣列元素的位址計算

利用首位址、固定元素長度和索引，直接算出元素位置。

<table><caption>索引、值與圖中位址</caption><thead><tr><th scope="col">索引</th><th scope="col">元素值</th><th scope="col">記憶體位址</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>00</td></tr><tr><th scope="row">1</th><td>3</td><td>04</td></tr><tr><th scope="row">2</th><td>2</td><td>08</td></tr><tr><th scope="row">3</th><td>5</td><td>12</td></tr><tr><th scope="row">4</th><td>4</td><td>16</td></tr></tbody></table>

<a id="source-47"></a>

元素位址=首元素位址+元素長度×索引。由於索引從0起算，本例索引3對應第4個元素（值為5），相對首元素跨過3個元素，位元組偏移為4×3=12，因此目標位址為000+4×3=012。注意這裡是按索引3直接定位值為5的元素，而不是在陣列中搜索數值3。

## 結果

連續儲存且元素等長時，位址可用一次乘法和加法求出，支持O(1)隨機訪問。
