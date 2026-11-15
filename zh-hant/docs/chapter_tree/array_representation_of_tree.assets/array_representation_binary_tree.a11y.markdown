<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: a37d3a9520b638f99b31e3d211bbb40c408c597414ec0621a19edc872a45b371 -->

# 完美二元樹的陣列表示

將完美二元樹按層序存入零基陣列，用索引算式 2i+1 與 2i+2 定位左右子節點。

<table><caption>節點索引與左右子節點位置</caption><thead><tr><th scope="col">當前索引</th><th scope="col">節點值</th><th scope="col">左子節點：索引和值</th><th scope="col">右子節點：索引和值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>1：2</td><td>2：3</td></tr><tr><th scope="row">1</th><td>2</td><td>3：4</td><td>4：5</td></tr><tr><th scope="row">2</th><td>3</td><td>5：6</td><td>6：7</td></tr><tr><th scope="row">3</th><td>4</td><td>7：8</td><td>8：9</td></tr><tr><th scope="row">4</th><td>5</td><td>9：10</td><td>10：11</td></tr><tr><th scope="row">5</th><td>6</td><td>11：12</td><td>12：13</td></tr><tr><th scope="row">6</th><td>7</td><td>13：14</td><td>14：15</td></tr><tr><th scope="row">7</th><td>8</td><td>15：越界，無子節點</td><td>16：越界，無子節點</td></tr><tr><th scope="row">8</th><td>9</td><td>17：越界，無子節點</td><td>18：越界，無子節點</td></tr><tr><th scope="row">9</th><td>10</td><td>19：越界，無子節點</td><td>20：越界，無子節點</td></tr><tr><th scope="row">10</th><td>11</td><td>21：越界，無子節點</td><td>22：越界，無子節點</td></tr><tr><th scope="row">11</th><td>12</td><td>23：越界，無子節點</td><td>24：越界，無子節點</td></tr><tr><th scope="row">12</th><td>13</td><td>25：越界，無子節點</td><td>26：越界，無子節點</td></tr><tr><th scope="row">13</th><td>14</td><td>27：越界，無子節點</td><td>28：越界，無子節點</td></tr><tr><th scope="row">14</th><td>15</td><td>29：越界，無子節點</td><td>30：越界，無子節點</td></tr></tbody></table>

<a id="source-110"></a>

節點按層從左到右存入陣列，根在索引 0。若當前節點的陣列索引為 i，則左子節點位置為 2i+1，右子節點位置為 2i+2；公式代入的是索引 i 而非節點值。例如節點 6 位於索引 5，其左、右子節點分別在索引 11（值 12）和索引 12（值 13）。

## 結果

索引算式可替代子節點指標，但訪問時仍須檢查陣列邊界：本圖索引 7 至 14（節點 8 至 15）是葉節點，算出的子位置 15 至 30 全部越界，表示無子節點。
