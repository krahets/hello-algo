<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: d3a3846d5afcdfd5900d0ee0ecb4fd3c83b6b2145ed77846a9a07782be38ee65 -->

# 省略中間空位的層序陣列

省略非完美二元樹中間的空位後，壓緊的層序陣列會使索引錯位，同一序列可對應不同樹形。

<table><caption>壓緊陣列與原樹位置的對應</caption><thead><tr><th scope="col">壓緊陣列索引</th><th scope="col">節點值</th><th scope="col">原樹位置編號</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td></tr><tr><th scope="row">1</th><td>2</td><td>1</td></tr><tr><th scope="row">2</th><td>3</td><td>2</td></tr><tr><th scope="row">3</th><td>4</td><td>3</td></tr><tr><th scope="row">4</th><td>6</td><td>5</td></tr><tr><th scope="row">5</th><td>7</td><td>6</td></tr><tr><th scope="row">6</th><td>8</td><td>7</td></tr><tr><th scope="row">7</th><td>9</td><td>8</td></tr><tr><th scope="row">8</th><td>12</td><td>11</td></tr><tr><th scope="row">9</th><td>15</td><td>14</td></tr></tbody></table>

<a id="source-111"></a>

原樹缺少位置 4、9、10、12、13 的節點；若跳過空位直接壓緊為 \[1, 2, 3, 4, 6, 7, 8, 9, 12, 15\]，節點 6 會從原位置 5 前移到壓緊索引 4。此時套用 2i+2 會把索引 4 的 6 誤判為索引 1 的節點 2 的右子節點，但原樹中 2 無右子節點、6 是 3 的左子節點。

## 結果

省略中間空位後，同一層序數值序列可對應不同連線的樹。該問題針對中間存在空位的情形；完全二元樹的空位都在層序末尾，省略末尾空位不會破壞索引對映。
