<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: dd4d697ab4e44dc404371087af95482f3a18f9af53dd237dc54c9f7f8c380e44 -->

# 移动短板导致被跳过的状态

双指针从 cap\[0, 7\] 向内移动左短板至 cap\[1, 7\] 时，一次性跳过了仍以索引 0 为左板、右端为 6 至 1 的六个更窄状态。

## 问题与输入

在高度数组 ht = \[3, 8, 5, 2, 7, 7, 3, 4\] 的初始状态 \[0, 7\] 下，左板 i = 0（高 3）为短板，右板 j = 7（高 4）为长板，初始容量为 3 × 7 = 21。本图从状态空间剪枝角度说明：为何贪心算法记录 21 并将左短板从 i = 0 移到 i = 1 后，无需再检验左端固定为 0 的其余组合。

容器容量按 cap\[i, j\] = min(ht\[i\], ht\[j\]) × (j - i) 计算，水高取两端板高较小值，宽度为索引差 j - i。

## 结构与关系

上排展示双指针从初始状态 cap\[0, 7\]（左板高 3、右板高 4、宽 7，容量 21）执行“移动短板”转移到 cap\[1, 7\]。算法在移动前已记录当前最大容量 21。

下排“跳过的状态”列出此次移动绕过的六个状态：cap\[0, 6\]、cap\[0, 5\]、cap\[0, 4\]、cap\[0, 3\]、cap\[0, 2\]、cap\[0, 1\]。这六个状态全部保留高度为 3 的原左短板 i = 0，相当于固定左端 i = 0 而将右端 j 从 6 依次向内移到 1：由于受左短板限制，它们的水高至多为 3，而底宽（6 至 1）全部严格小于 7，因此六个状态的容量必然全部小于已记录的 21，安全剪枝不会漏掉最优解。

第二张表按图示顺序列出六个跳过状态的水高、宽度与推导容量（依次为 18、15、12、6、6、3）。其中当右端移到索引 3 时，因右板高度 ht\[3\] = 2 比左板高度 3 更矮，\[0, 3\] 的水高进一步降为 2（宽度 3，容量 6）；其余五个跳过状态的水高均为 3。注意图面仅标注 cap\[i, j\] 状态名，具体板高与容量数值由正文示例数组 ht 结合公式推算。

<table><caption>输入隔板高度；索引从0开始</caption><thead><tr><th scope="col">索引</th><th scope="col">高度</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>8</td></tr><tr><th scope="row">2</th><td>5</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>7</td></tr><tr><th scope="row">5</th><td>7</td></tr><tr><th scope="row">6</th><td>3</td></tr><tr><th scope="row">7</th><td>4</td></tr></tbody></table>

<table><caption>六个跳过状态；容量由高度数组按公式计算</caption><thead><tr><th scope="col">端点 [i,j]</th><th scope="col">水高 min(ht[i],ht[j])</th><th scope="col">宽度 j-i</th><th scope="col">容量</th></tr></thead><tbody><tr><th scope="row">[0,6]</th><td>3</td><td>6</td><td>18</td></tr><tr><th scope="row">[0,5]</th><td>3</td><td>5</td><td>15</td></tr><tr><th scope="row">[0,4]</th><td>3</td><td>4</td><td>12</td></tr><tr><th scope="row">[0,3]</th><td>2</td><td>3</td><td>6</td></tr><tr><th scope="row">[0,2]</th><td>3</td><td>2</td><td>6</td></tr><tr><th scope="row">[0,1]</th><td>3</td><td>1</td><td>3</td></tr></tbody></table>

<a id="source-469"></a>

## 固定左短板 i = 0 的六个更窄容器容量均小于 21

记录 cap\[0, 7\] = 21 并右移左短板至 i = 1 后，左端仍固定在 i = 0、右端 j 取 6 至 1 的六个状态宽度缩短且水高不超过左短板高度 3，容量必小于 21。

## 结果

被跳过的六个状态 cap\[0, 6\] 至 cap\[0, 1\] 全部固定左短板 i = 0（高 3），宽度均小于 7 且水高至多为 3，推导容量（18、15、12、6、6、3）全部严格小于已记录的 cap\[0, 7\] = 21，因此跳过它们不会丢失全局最优解。
