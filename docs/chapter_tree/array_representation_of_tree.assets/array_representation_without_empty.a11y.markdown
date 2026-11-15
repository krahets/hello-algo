<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: e8f94a6cc7dfbba35d24dfdca464819e3d6037438e57e254f6f88aa3d787e91a -->

# 省略中间空位的层序数组

省略非完美二叉树中间的空位后，压紧的层序数组会使索引错位，同一序列可对应不同树形。

<table><caption>压紧数组与原树位置的对应</caption><thead><tr><th scope="col">压紧数组索引</th><th scope="col">节点值</th><th scope="col">原树位置编号</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td></tr><tr><th scope="row">1</th><td>2</td><td>1</td></tr><tr><th scope="row">2</th><td>3</td><td>2</td></tr><tr><th scope="row">3</th><td>4</td><td>3</td></tr><tr><th scope="row">4</th><td>6</td><td>5</td></tr><tr><th scope="row">5</th><td>7</td><td>6</td></tr><tr><th scope="row">6</th><td>8</td><td>7</td></tr><tr><th scope="row">7</th><td>9</td><td>8</td></tr><tr><th scope="row">8</th><td>12</td><td>11</td></tr><tr><th scope="row">9</th><td>15</td><td>14</td></tr></tbody></table>

<a id="source-111"></a>

原树缺少位置 4、9、10、12、13 的节点；若跳过空位直接压紧为 \[1, 2, 3, 4, 6, 7, 8, 9, 12, 15\]，节点 6 会从原位置 5 前移到压紧索引 4。此时套用 2i+2 会把索引 4 的 6 误判为索引 1 的节点 2 的右子节点，但原树中 2 无右子节点、6 是 3 的左子节点。

## 结果

省略中间空位后，同一层序数值序列可对应不同连接的树。该问题针对中间存在空位的情形；完全二叉树的空位都在层序末尾，省略末尾空位不会破坏索引映射。
