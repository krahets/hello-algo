<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 021de5895d772a5cfceb56c743a87502ef87162c9d3e667bd8a40954008fe6d9 -->

# 保留空位的二元樹陣列

在層序陣列中顯式保留中間缺失節點的空位，使 2i+1 與 2i+2 對映能唯一還原樹形。

<table><caption>陣列索引與節點值</caption><thead><tr><th scope="col">索引</th><th scope="col">節點值或空位</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>4</td></tr><tr><th scope="row">4</th><td>空</td></tr><tr><th scope="row">5</th><td>6</td></tr><tr><th scope="row">6</th><td>7</td></tr><tr><th scope="row">7</th><td>8</td></tr><tr><th scope="row">8</th><td>9</td></tr><tr><th scope="row">9</th><td>空</td></tr><tr><th scope="row">10</th><td>空</td></tr><tr><th scope="row">11</th><td>12</td></tr><tr><th scope="row">12</th><td>空</td></tr><tr><th scope="row">13</th><td>空</td></tr><tr><th scope="row">14</th><td>15</td></tr></tbody></table>

<a id="source-112"></a>

在陣列中保留索引 4、9、10、12、13 共 5 個空位後，後續節點不再向前錯位。連空位置 4 在下一層的兩個子位置 9、10 也必須留空佔位，才能保證更後面的節點落在正確索引上；如索引 5 的節點 6，左子位置 11 存 12，右子位置 12 為空。

## 結果

顯式保留中間空位後，可按索引 i 的子位置 2i+1、2i+2 唯一還原這棵樹。空位表示該處不存在節點（程式碼中常記為 None 或 null），不是數值 0。
