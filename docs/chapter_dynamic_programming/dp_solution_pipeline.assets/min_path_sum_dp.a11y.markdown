<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: f0f7e48575a7fbc27897b3a1ed5e72e913d21e7d34153f1dfb5522a152a239c6 -->

# 最小路径和动态规划

从左上角起点出发，先累计首行与首列的唯一边界路径，再按行逐格取上方与左方较小值加当前格代价，递推至右下角终点。

## 问题与输入

给定 4×4 非负整数代价网格 grid（行列索引均从 0 开始，完整数值见输入表），要求从左上角起点 \[0,0\] 走到右下角终点 \[3,3\]，每步只能向右或向下移动一格，路径总代价包含起点与终点的格值。

状态表 dp\[i,j\] 表示从起点 \[0,0\] 到达第 i 行第 j 列格子的最小路径和。建表之初填入的 0 仅表示尚未计算的初始占位值，绝不代表存在一条代价为 0 的路径。

## 结构与关系

边界初始化：起点记为 dp\[0,0\] = grid\[0,0\] = 1；第 0 行只能从左方一路向右到达，第 0 列只能从上方一路向下到达，因此先沿首行、首列累加得到共 7 个有效边界格。

内部递推：对第 1 至 3 行、第 1 至 3 列的 9 个内部格，按行从左到右依次计算状态转移方程 dp\[i,j\] = min(dp\[i-1,j\], dp\[i,j-1\]) + grid\[i,j\]，保证每次求值时上方 dp\[i-1,j\] 与左方 dp\[i,j-1\] 均已算出有效结果。每帧附带的状态表将格值与“未计算初值”“边界有效”或“已计算”同时写入单元格，便于按坐标直接查阅。

<table><caption>原始网格 grid；行列索引均从 0 开始</caption><thead><tr><th scope="col">行索引</th><th scope="col">列 0</th><th scope="col">列 1</th><th scope="col">列 2</th><th scope="col">列 3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>3</td><td>1</td><td>5</td></tr><tr><th scope="row">1</th><td>2</td><td>2</td><td>4</td><td>2</td></tr><tr><th scope="row">2</th><td>5</td><td>3</td><td>2</td><td>1</td></tr><tr><th scope="row">3</th><td>4</td><td>3</td><td>5</td><td>2</td></tr></tbody></table>

<a id="source-382"></a>

## 第 1 步：初始化dp存储

建立 4×4 的 dp 状态表并全部填入未计算初值 0；此时包括起点 \[0,0\]、第 0 行与第 0 列在内的全部 16 格均尚未求值，0 不代表零代价路径。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]（起终点代价均计入，原始代价见 grid 表）。当前 16 格全部为未计算初值 0，起点与首行、首列边界也尚未初始化。</p><table><caption>初始化dp存储后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">1</th><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">2</th><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">3</th><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-383"></a>

## 第 2 步：计算首行与首列边界

起点 dp\[0,0\] = grid\[0,0\] = 1；第 0 行沿唯一向右路径累加得到 \[1, 4, 5, 10\]，第 0 列沿唯一向下路径累加得到 \[1, 3, 8, 12\]。至此共 7 个边界格成为有效边界值，其余 9 个内部格（行 1 至 3、列 1 至 3）仍为未计算初值 0。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]（起终点代价均计入）。当前第 0 行 [1, 4, 5, 10] 与第 0 列 [1, 3, 8, 12] 共 7 个边界格已有效；内部 9 格（[1,1] 至 [3,3]）仍为未计算初值 0。</p><table><caption>计算首行与首列边界后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-384"></a>

## 第 3 步：计算dp\[1,1\]

进入内部第 1 行第 1 列：上方前驱 dp\[0,1\]=4，左方前驱 dp\[1,0\]=3，取较小值 3 并加上当前格代价 grid\[1,1\]=2，算得 dp\[1,1\] = min(4, 3) + 2 = 5。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]。当前 7 个边界格有效，内部格 dp[1,1] 已算出 5；其余 8 个内部格（[1,2]、[1,3] 及第 2、3 行内部格）仍为未计算初值 0。</p><table><caption>计算dp[1,1]后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>5，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-385"></a>

## 第 4 步：计算dp\[1,2\]

到达 \[1,2\]：上方前驱 dp\[0,2\]=5，左方前驱 dp\[1,1\]=5，两处前驱值相等，任取其一加上当前格代价 grid\[1,2\]=4，算得 dp\[1,2\] = min(5, 5) + 4 = 9。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]。当前 7 个边界格及内部格 dp[1,1]=5、dp[1,2]=9 已有效；其余 7 个内部格（[1,3] 及第 2、3 行内部格）仍为未计算初值 0。</p><table><caption>计算dp[1,2]后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>5，已计算</td><td>9，已计算</td><td>0，未计算初值</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-386"></a>

## 第 5 步：计算dp\[1,3\]

到达第 1 行末格 \[1,3\]：上方前驱 dp\[0,3\]=10，左方前驱 dp\[1,2\]=9，取较小值 9 加上当前格代价 grid\[1,3\]=2，算得 dp\[1,3\] = min(10, 9) + 2 = 11。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]。当前第 0、1 两行已全部有效（第 1 行依次为 [3, 5, 9, 11]），第 2、3 行的内部 6 格（[2,1] 至 [3,3]）仍为未计算初值 0。</p><table><caption>计算dp[1,3]后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>5，已计算</td><td>9，已计算</td><td>11，已计算</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-387"></a>

## 第 6 步：计算dp\[2,1\]

推进到第 2 行首个内部格 \[2,1\]：上方前驱 dp\[1,1\]=5，左方前驱 dp\[2,0\]=8，取较小值 5 加上当前格代价 grid\[2,1\]=3，算得 dp\[2,1\] = min(5, 8) + 3 = 8。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]。当前第 0、1 行全部有效，第 2 行已算出 dp[2,0]=8、dp[2,1]=8；剩余 5 个内部格（[2,2]、[2,3] 及 [3,1] 至 [3,3]）仍为未计算初值 0。</p><table><caption>计算dp[2,1]后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>5，已计算</td><td>9，已计算</td><td>11，已计算</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>8，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-388"></a>

## 第 7 步：计算dp\[2,2\]

到达 \[2,2\]：上方前驱 dp\[1,2\]=9，左方前驱 dp\[2,1\]=8，取较小值 8 加上当前格代价 grid\[2,2\]=2，算得 dp\[2,2\] = min(9, 8) + 2 = 10。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]。当前内部格已算至 dp[2,2]=10；剩余 4 个内部格（[2,3] 与第 3 行的 [3,1]、[3,2]、[3,3]）仍为未计算初值 0。</p><table><caption>计算dp[2,2]后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>5，已计算</td><td>9，已计算</td><td>11，已计算</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>8，已计算</td><td>10，已计算</td><td>0，未计算初值</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-389"></a>

## 第 8 步：计算dp\[2,3\]

到达第 2 行末格 \[2,3\]：上方前驱 dp\[1,3\]=11，左方前驱 dp\[2,2\]=10，取较小值 10 加上当前格代价 grid\[2,3\]=1，算得 dp\[2,3\] = min(11, 10) + 1 = 11。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]。当前第 0、1、2 三行已全部有效（第 2 行依次为 [8, 8, 10, 11]）；仅剩第 3 行的 3 个内部格 [3,1]、[3,2]、[3,3] 仍为未计算初值 0。</p><table><caption>计算dp[2,3]后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>5，已计算</td><td>9，已计算</td><td>11，已计算</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>8，已计算</td><td>10，已计算</td><td>11，已计算</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-390"></a>

## 第 9 步：计算dp\[3,1\]

推进到最后一行内部格 \[3,1\]：上方前驱 dp\[2,1\]=8，左方前驱 dp\[3,0\]=12，取较小值 8 加上当前格代价 grid\[3,1\]=3，算得 dp\[3,1\] = min(8, 12) + 3 = 11。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]。当前内部格已算至 dp[3,1]=11；仅剩 [3,2] 与终点 [3,3] 两格仍为未计算初值 0。</p><table><caption>计算dp[3,1]后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>5，已计算</td><td>9，已计算</td><td>11，已计算</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>8，已计算</td><td>10，已计算</td><td>11，已计算</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>11，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-391"></a>

## 第 10 步：计算dp\[3,2\]

到达 \[3,2\]：上方前驱 dp\[2,2\]=10，左方前驱 dp\[3,1\]=11，取较小值 10 加上当前格代价 grid\[3,2\]=5，算得 dp\[3,2\] = min(10, 11) + 5 = 15。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]。当前除右下角终点外其余 15 格均已有效（其中 dp[2,3]=11、dp[3,2]=15）；最后一个内部格 dp[3,3] 仍为 0（未计算初值）。</p><table><caption>计算dp[3,2]后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>5，已计算</td><td>9，已计算</td><td>11，已计算</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>8，已计算</td><td>10，已计算</td><td>11，已计算</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>11，已计算</td><td>15，已计算</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-392"></a>

## 第 11 步：计算dp\[3,3\]

计算最后一个内部格（终点）\[3,3\]：上方前驱为 dp\[2,3\]=11，左方前驱为 dp\[3,2\]=15，取较小值 11 加上当前格权重 grid\[3,3\]=2，算得 dp\[3,3\] = min(dp\[2,3\]=11, dp\[3,2\]=15) + grid\[3,3\](2) = 13。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]。最后一个内部格 dp[3,3] 已由 min(11, 15) + 2 算得 13；至此 4×4 的 dp 表全部 16 格均已有效。</p><table><caption>计算dp[3,3]后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>5，已计算</td><td>9，已计算</td><td>11，已计算</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>8，已计算</td><td>10，已计算</td><td>11，已计算</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>11，已计算</td><td>15，已计算</td><td>13，已计算</td></tr></tbody></table></details>

<a id="source-393"></a>

## 第 12 步：返回最小路径和

全部 16 个状态格已计算完毕，本步不再执行新计算，直接读取并返回右下角终点状态 dp\[3,3\] = 13 作为最小路径和。

<details><summary>本步完整状态</summary><p>任务为在 4×4 网格中从 [0,0] 仅向右或向下走到 [3,3]（起终点代价均计入，原始代价见 grid 表）。全表 16 格均已有效（末行 [12, 11, 15, 13]），函数返回终点最小路径和 dp[3,3] = 13。</p><table><caption>返回最小路径和后的dp状态</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，边界有效</td><td>4，边界有效</td><td>5，边界有效</td><td>10，边界有效</td></tr><tr><th scope="row">1</th><td>3，边界有效</td><td>5，已计算</td><td>9，已计算</td><td>11，已计算</td></tr><tr><th scope="row">2</th><td>8，边界有效</td><td>8，已计算</td><td>10，已计算</td><td>11，已计算</td></tr><tr><th scope="row">3</th><td>12，边界有效</td><td>11，已计算</td><td>15，已计算</td><td>13，已计算</td></tr></tbody></table></details>

## 结果

递推完成后，右下角终点状态 dp\[3,3\] = 13 即为从 \[0,0\] 到 \[3,3\] 的最小路径和；本过程只计算并返回最小累计代价 13，未回溯输出具体路径坐标。
