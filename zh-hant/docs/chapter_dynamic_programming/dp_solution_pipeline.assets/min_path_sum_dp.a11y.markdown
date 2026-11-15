<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 7adba07e9c5dd5d4d5266ddd7a7d9c61c29f2b59841a653714365d17d4d435aa -->

# 最小路徑和動態規劃

從左上角起點出發，先累計首行與首列的唯一邊界路徑，再按行逐格取上方與左方較小值加當前格代價，遞推至右下角終點。

## 問題與輸入

給定 4×4 非負整數代價網格 grid（行列索引均從 0 開始，完整數值見輸入表），要求從左上角起點 \[0,0\] 走到右下角終點 \[3,3\]，每步只能向右或向下移動一格，路徑總代價包含起點與終點的格值。

狀態表 dp\[i,j\] 表示從起點 \[0,0\] 到達第 i 行第 j 列格子的最小路徑和。建表之初填入的 0 僅表示尚未計算的初始佔位值，絕不代表存在一條代價為 0 的路徑。

## 結構與關係

邊界初始化：起點記為 dp\[0,0\] = grid\[0,0\] = 1；第 0 行只能從左方一路向右到達，第 0 列只能從上方一路向下到達，因此先沿首行、首列累加得到共 7 個有效邊界格。

內部遞推：對第 1 至 3 行、第 1 至 3 列的 9 個內部格，按行從左到右依次計算狀態轉移方程 dp\[i,j\] = min(dp\[i-1,j\], dp\[i,j-1\]) + grid\[i,j\]，保證每次求值時上方 dp\[i-1,j\] 與左方 dp\[i,j-1\] 均已算出有效結果。每幀附帶的狀態表將格值與“未計算初值”“邊界有效”或“已計算”同時寫入單元格，便於按座標直接查閱。

<table><caption>原始網格 grid；行列索引均從 0 開始</caption><thead><tr><th scope="col">行索引</th><th scope="col">列 0</th><th scope="col">列 1</th><th scope="col">列 2</th><th scope="col">列 3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>3</td><td>1</td><td>5</td></tr><tr><th scope="row">1</th><td>2</td><td>2</td><td>4</td><td>2</td></tr><tr><th scope="row">2</th><td>5</td><td>3</td><td>2</td><td>1</td></tr><tr><th scope="row">3</th><td>4</td><td>3</td><td>5</td><td>2</td></tr></tbody></table>

<a id="source-382"></a>

## 第 1 步：初始化dp儲存

建立 4×4 的 dp 狀態表並全部填入未計算初值 0；此時包括起點 \[0,0\]、第 0 行與第 0 列在內的全部 16 格均尚未求值，0 不代表零代價路徑。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]（起終點代價均計入，原始代價見 grid 表）。當前 16 格全部為未計算初值 0，起點與首行、首列邊界也尚未初始化。</p><table><caption>初始化dp儲存後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">1</th><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">2</th><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">3</th><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-383"></a>

## 第 2 步：計算首行與首列邊界

起點 dp\[0,0\] = grid\[0,0\] = 1；第 0 行沿唯一向右路徑累加得到 \[1, 4, 5, 10\]，第 0 列沿唯一向下路徑累加得到 \[1, 3, 8, 12\]。至此共 7 個邊界格成為有效邊界值，其餘 9 個內部格（行 1 至 3、列 1 至 3）仍為未計算初值 0。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]（起終點代價均計入）。當前第 0 行 [1, 4, 5, 10] 與第 0 列 [1, 3, 8, 12] 共 7 個邊界格已有效；內部 9 格（[1,1] 至 [3,3]）仍為未計算初值 0。</p><table><caption>計算首行與首列邊界後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-384"></a>

## 第 3 步：計算dp\[1,1\]

進入內部第 1 行第 1 列：上方前驅 dp\[0,1\]=4，左方前驅 dp\[1,0\]=3，取較小值 3 並加上當前格代價 grid\[1,1\]=2，算得 dp\[1,1\] = min(4, 3) + 2 = 5。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]。當前 7 個邊界格有效，內部格 dp[1,1] 已算出 5；其餘 8 個內部格（[1,2]、[1,3] 及第 2、3 行內部格）仍為未計算初值 0。</p><table><caption>計算dp[1,1]後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>5，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-385"></a>

## 第 4 步：計算dp\[1,2\]

到達 \[1,2\]：上方前驅 dp\[0,2\]=5，左方前驅 dp\[1,1\]=5，兩處前驅值相等，任取其一加上當前格代價 grid\[1,2\]=4，算得 dp\[1,2\] = min(5, 5) + 4 = 9。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]。當前 7 個邊界格及內部格 dp[1,1]=5、dp[1,2]=9 已有效；其餘 7 個內部格（[1,3] 及第 2、3 行內部格）仍為未計算初值 0。</p><table><caption>計算dp[1,2]後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>5，已計算</td><td>9，已計算</td><td>0，未計算初值</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-386"></a>

## 第 5 步：計算dp\[1,3\]

到達第 1 行末格 \[1,3\]：上方前驅 dp\[0,3\]=10，左方前驅 dp\[1,2\]=9，取較小值 9 加上當前格代價 grid\[1,3\]=2，算得 dp\[1,3\] = min(10, 9) + 2 = 11。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]。當前第 0、1 兩行已全部有效（第 1 行依次為 [3, 5, 9, 11]），第 2、3 行的內部 6 格（[2,1] 至 [3,3]）仍為未計算初值 0。</p><table><caption>計算dp[1,3]後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>5，已計算</td><td>9，已計算</td><td>11，已計算</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-387"></a>

## 第 6 步：計算dp\[2,1\]

推進到第 2 行首個內部格 \[2,1\]：上方前驅 dp\[1,1\]=5，左方前驅 dp\[2,0\]=8，取較小值 5 加上當前格代價 grid\[2,1\]=3，算得 dp\[2,1\] = min(5, 8) + 3 = 8。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]。當前第 0、1 行全部有效，第 2 行已算出 dp[2,0]=8、dp[2,1]=8；剩餘 5 個內部格（[2,2]、[2,3] 及 [3,1] 至 [3,3]）仍為未計算初值 0。</p><table><caption>計算dp[2,1]後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>5，已計算</td><td>9，已計算</td><td>11，已計算</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>8，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-388"></a>

## 第 7 步：計算dp\[2,2\]

到達 \[2,2\]：上方前驅 dp\[1,2\]=9，左方前驅 dp\[2,1\]=8，取較小值 8 加上當前格代價 grid\[2,2\]=2，算得 dp\[2,2\] = min(9, 8) + 2 = 10。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]。當前內部格已算至 dp[2,2]=10；剩餘 4 個內部格（[2,3] 與第 3 行的 [3,1]、[3,2]、[3,3]）仍為未計算初值 0。</p><table><caption>計算dp[2,2]後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>5，已計算</td><td>9，已計算</td><td>11，已計算</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>8，已計算</td><td>10，已計算</td><td>0，未計算初值</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-389"></a>

## 第 8 步：計算dp\[2,3\]

到達第 2 行末格 \[2,3\]：上方前驅 dp\[1,3\]=11，左方前驅 dp\[2,2\]=10，取較小值 10 加上當前格代價 grid\[2,3\]=1，算得 dp\[2,3\] = min(11, 10) + 1 = 11。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]。當前第 0、1、2 三行已全部有效（第 2 行依次為 [8, 8, 10, 11]）；僅剩第 3 行的 3 個內部格 [3,1]、[3,2]、[3,3] 仍為未計算初值 0。</p><table><caption>計算dp[2,3]後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>5，已計算</td><td>9，已計算</td><td>11，已計算</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>8，已計算</td><td>10，已計算</td><td>11，已計算</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-390"></a>

## 第 9 步：計算dp\[3,1\]

推進到最後一行內部格 \[3,1\]：上方前驅 dp\[2,1\]=8，左方前驅 dp\[3,0\]=12，取較小值 8 加上當前格代價 grid\[3,1\]=3，算得 dp\[3,1\] = min(8, 12) + 3 = 11。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]。當前內部格已算至 dp[3,1]=11；僅剩 [3,2] 與終點 [3,3] 兩格仍為未計算初值 0。</p><table><caption>計算dp[3,1]後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>5，已計算</td><td>9，已計算</td><td>11，已計算</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>8，已計算</td><td>10，已計算</td><td>11，已計算</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>11，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-391"></a>

## 第 10 步：計算dp\[3,2\]

到達 \[3,2\]：上方前驅 dp\[2,2\]=10，左方前驅 dp\[3,1\]=11，取較小值 10 加上當前格代價 grid\[3,2\]=5，算得 dp\[3,2\] = min(10, 11) + 5 = 15。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]。當前除右下角終點外其餘 15 格均已有效（其中 dp[2,3]=11、dp[3,2]=15）；最後一個內部格 dp[3,3] 仍為 0（未計算初值）。</p><table><caption>計算dp[3,2]後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>5，已計算</td><td>9，已計算</td><td>11，已計算</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>8，已計算</td><td>10，已計算</td><td>11，已計算</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>11，已計算</td><td>15，已計算</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-392"></a>

## 第 11 步：計算dp\[3,3\]

計算最後一個內部格（終點）\[3,3\]：上方前驅為 dp\[2,3\]=11，左方前驅為 dp\[3,2\]=15，取較小值 11 加上當前格權重 grid\[3,3\]=2，算得 dp\[3,3\] = min(dp\[2,3\]=11, dp\[3,2\]=15) + grid\[3,3\](2) = 13。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]。最後一個內部格 dp[3,3] 已由 min(11, 15) + 2 算得 13；至此 4×4 的 dp 表全部 16 格均已有效。</p><table><caption>計算dp[3,3]後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>5，已計算</td><td>9，已計算</td><td>11，已計算</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>8，已計算</td><td>10，已計算</td><td>11，已計算</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>11，已計算</td><td>15，已計算</td><td>13，已計算</td></tr></tbody></table></details>

<a id="source-393"></a>

## 第 12 步：返回最小路徑和

全部 16 個狀態格已計算完畢，本步不再執行新計算，直接讀取並返回右下角終點狀態 dp\[3,3\] = 13 作為最小路徑和。

<details><summary>本步完整狀態</summary><p>任務為在 4×4 網格中從 [0,0] 僅向右或向下走到 [3,3]（起終點代價均計入，原始代價見 grid 表）。全表 16 格均已有效（末行 [12, 11, 15, 13]），函式返回終點最小路徑和 dp[3,3] = 13。</p><table><caption>返回最小路徑和後的dp狀態</caption><thead><tr><th scope="col">行索引i</th><th scope="col">列j=0</th><th scope="col">列j=1</th><th scope="col">列j=2</th><th scope="col">列j=3</th></tr></thead><tbody><tr><th scope="row">0</th><td>1，邊界有效</td><td>4，邊界有效</td><td>5，邊界有效</td><td>10，邊界有效</td></tr><tr><th scope="row">1</th><td>3，邊界有效</td><td>5，已計算</td><td>9，已計算</td><td>11，已計算</td></tr><tr><th scope="row">2</th><td>8，邊界有效</td><td>8，已計算</td><td>10，已計算</td><td>11，已計算</td></tr><tr><th scope="row">3</th><td>12，邊界有效</td><td>11，已計算</td><td>15，已計算</td><td>13，已計算</td></tr></tbody></table></details>

## 結果

遞推完成後，右下角終點狀態 dp\[3,3\] = 13 即為從 \[0,0\] 到 \[3,3\] 的最小路徑和；本過程只計算並返回最小累計代價 13，未回溯輸出具體路徑座標。
