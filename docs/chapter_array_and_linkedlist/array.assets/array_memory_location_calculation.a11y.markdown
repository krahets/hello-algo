<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 8aed1d49ed2942dd798f5cfd97128507358572ad214b7d86cb84bfb44ff04b70 -->

# 数组元素的地址计算

利用首地址、固定元素长度和索引，直接算出元素位置。

<table><caption>索引、值与图中地址</caption><thead><tr><th scope="col">索引</th><th scope="col">元素值</th><th scope="col">内存地址</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>00</td></tr><tr><th scope="row">1</th><td>3</td><td>04</td></tr><tr><th scope="row">2</th><td>2</td><td>08</td></tr><tr><th scope="row">3</th><td>5</td><td>12</td></tr><tr><th scope="row">4</th><td>4</td><td>16</td></tr></tbody></table>

<a id="source-47"></a>

元素地址=首元素地址+元素长度×索引。由于索引从0起算，本例索引3对应第4个元素（值为5），相对首元素跨过3个元素，字节偏移为4×3=12，因此目标地址为000+4×3=012。注意这里是按索引3直接定位值为5的元素，而不是在数组中搜索数值3。

## 结果

连续存储且元素等长时，地址可用一次乘法和加法求出，支持O(1)随机访问。
