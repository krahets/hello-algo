<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b70f5529ff295186ef237792a53d22e35910900f7868e02074dfecc270faf566 -->

# 保留空位的二叉树数组

在层序数组中显式保留中间缺失节点的空位，使 2i+1 与 2i+2 映射能唯一还原树形。

<table><caption>数组索引与节点值</caption><thead><tr><th scope="col">索引</th><th scope="col">节点值或空位</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>4</td></tr><tr><th scope="row">4</th><td>空</td></tr><tr><th scope="row">5</th><td>6</td></tr><tr><th scope="row">6</th><td>7</td></tr><tr><th scope="row">7</th><td>8</td></tr><tr><th scope="row">8</th><td>9</td></tr><tr><th scope="row">9</th><td>空</td></tr><tr><th scope="row">10</th><td>空</td></tr><tr><th scope="row">11</th><td>12</td></tr><tr><th scope="row">12</th><td>空</td></tr><tr><th scope="row">13</th><td>空</td></tr><tr><th scope="row">14</th><td>15</td></tr></tbody></table>

<a id="source-112"></a>

在数组中保留索引 4、9、10、12、13 共 5 个空位后，后续节点不再向前错位。连空位置 4 在下一层的两个子位置 9、10 也必须留空占位，才能保证更后面的节点落在正确索引上；如索引 5 的节点 6，左子位置 11 存 12，右子位置 12 为空。

## 结果

显式保留中间空位后，可按索引 i 的子位置 2i+1、2i+2 唯一还原这棵树。空位表示该处不存在节点（代码中常记为 None 或 null），不是数值 0。
