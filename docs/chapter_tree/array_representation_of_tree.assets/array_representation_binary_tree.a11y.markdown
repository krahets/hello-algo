<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b3b4c6943b518f5a09dbfba1f2b7e6f4d8b44541fb1ce641fcf200bfdc147dbf -->

# 完美二叉树的数组表示

将完美二叉树按层序存入零基数组，用索引算式 2i+1 与 2i+2 定位左右子节点。

<table><caption>节点索引与左右子节点位置</caption><thead><tr><th scope="col">当前索引</th><th scope="col">节点值</th><th scope="col">左子节点：索引和值</th><th scope="col">右子节点：索引和值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>1：2</td><td>2：3</td></tr><tr><th scope="row">1</th><td>2</td><td>3：4</td><td>4：5</td></tr><tr><th scope="row">2</th><td>3</td><td>5：6</td><td>6：7</td></tr><tr><th scope="row">3</th><td>4</td><td>7：8</td><td>8：9</td></tr><tr><th scope="row">4</th><td>5</td><td>9：10</td><td>10：11</td></tr><tr><th scope="row">5</th><td>6</td><td>11：12</td><td>12：13</td></tr><tr><th scope="row">6</th><td>7</td><td>13：14</td><td>14：15</td></tr><tr><th scope="row">7</th><td>8</td><td>15：越界，无子节点</td><td>16：越界，无子节点</td></tr><tr><th scope="row">8</th><td>9</td><td>17：越界，无子节点</td><td>18：越界，无子节点</td></tr><tr><th scope="row">9</th><td>10</td><td>19：越界，无子节点</td><td>20：越界，无子节点</td></tr><tr><th scope="row">10</th><td>11</td><td>21：越界，无子节点</td><td>22：越界，无子节点</td></tr><tr><th scope="row">11</th><td>12</td><td>23：越界，无子节点</td><td>24：越界，无子节点</td></tr><tr><th scope="row">12</th><td>13</td><td>25：越界，无子节点</td><td>26：越界，无子节点</td></tr><tr><th scope="row">13</th><td>14</td><td>27：越界，无子节点</td><td>28：越界，无子节点</td></tr><tr><th scope="row">14</th><td>15</td><td>29：越界，无子节点</td><td>30：越界，无子节点</td></tr></tbody></table>

<a id="source-110"></a>

节点按层从左到右存入数组，根在索引 0。若当前节点的数组索引为 i，则左子节点位置为 2i+1，右子节点位置为 2i+2；公式代入的是索引 i 而非节点值。例如节点 6 位于索引 5，其左、右子节点分别在索引 11（值 12）和索引 12（值 13）。

## 结果

索引算式可替代子节点指针，但访问时仍须检查数组边界：本图索引 7 至 14（节点 8 至 15）是叶节点，算出的子位置 15 至 30 全部越界，表示无子节点。
