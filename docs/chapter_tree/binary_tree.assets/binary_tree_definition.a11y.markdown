<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 64049fa4404ace8e3ebf8a48fe44a87c6ffaf223e40c4c6c3bbd9b1f332c801c -->

# 二叉树的节点与子树

以根节点与左右分支为例，区分直接相连的单个子节点与包含其全部后代的子树。

<table><caption>图中全部非叶节点的左右子节点</caption><thead><tr><th scope="col">父节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">1</th><td>2</td><td>3</td></tr><tr><th scope="row">2</th><td>4</td><td>5</td></tr><tr><th scope="row">3</th><td>6</td><td>7</td></tr><tr><th scope="row">4</th><td>8</td><td>9</td></tr><tr><th scope="row">5</th><td>10</td><td>11</td></tr><tr><th scope="row">6</th><td>12</td><td>13</td></tr><tr><th scope="row">7</th><td>14</td><td>15</td></tr></tbody></table>

<a id="source-89"></a>

以根节点 1 为参照，直接相连的左子节点是单个节点 2，右子节点是单个节点 3；而左子树是以 2 为根的整棵树，包含 2、4、5、8、9、10、11 共 7 个节点，右子树以 3 为根，包含 3、6、7、12、13、14、15 共 7 个节点。子树包含其根及全部后代，范围大于单个子节点。

## 结果

父子与子树关系均相对所选参考节点而言：1 是 2、3 的父节点，2 又是 4、5 的父节点。图中把根 1 标作“父节点”仅表示它是 2、3 的父节点，根节点自身没有父节点。
