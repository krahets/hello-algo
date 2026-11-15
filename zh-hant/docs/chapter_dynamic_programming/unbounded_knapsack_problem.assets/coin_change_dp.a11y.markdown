<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 5e861f4e9d8c32b2dc4960b2735779598433add81f1237d34061db19f9fc860e -->

# 零錢兌換的動態規劃

按硬幣種類與目標金額逐格填表，求恰好湊出 4 元所需的最少硬幣枚數。

## 問題與輸入

可選硬幣面值為 1、2、5 元（共 3 種，每種均可重複選取），目標金額為 4 元。狀態 dp\[i, a\] 表示僅用前 i 種硬幣恰好湊出金額 a 的最少硬幣枚數；二維 dp 表共 4 行 5 列，行索引 i 從 0 至 3，列索引 a 從 0 至 4。

MAX = 目標金額 + 1 = 5 是表示“不可達（無解）”的邊界標記，絕非需要 5 枚硬幣。目標金額 0 不需要硬幣，首列邊界值為 0；無硬幣可用（i = 0）時，任何正金額均不可達。

## 結構與關係

先建立 4×5 全零表，再將首行正金額格 dp\[0, 1\] 至 dp\[0, 4\] 設為不可達標記 MAX = 5，首列 dp\[0, 0\] 至 dp\[3, 0\] 保持有效邊界 0。隨後按行 i = 1 至 3、每行金額 a = 1 至 4 依次填表：當前硬幣面值大於金額 a 時無法選入，直接繼承正上方 dp\[i - 1, a\]；否則比較上方 dp\[i - 1, a\]（不選該硬幣）與本行左方 dp\[i, a - 面值\] + 1（選入一枚該硬幣），取較小值。從本行左方轉移允許重複選取同種硬幣。

狀態表逐格標註“邊界有效”“已計算”或“未計算初值”；第 1 至 3 行正金額格在計算前顯示的 0 只是未計算初值，不代表用 0 枚硬幣就能湊出正金額。

<table><caption>可選硬幣</caption><thead><tr><th scope="col">編號i</th><th scope="col">面值</th></tr></thead><tbody><tr><th scope="row">1</th><td>1</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>5</td></tr></tbody></table>

<table><caption>計算完成的最少硬幣數；MAX=5表示不可達</caption><thead><tr><th scope="col">前i種硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td><td>MAX</td><td>MAX</td><td>MAX</td><td>MAX</td></tr><tr><th scope="row">1</th><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td></tr><tr><th scope="row">2</th><td>0</td><td>1</td><td>1</td><td>2</td><td>2</td></tr><tr><th scope="row">3</th><td>0</td><td>1</td><td>1</td><td>2</td><td>2</td></tr></tbody></table>

<a id="source-426"></a>

## 第 1 步：建立 4×5 初始全零 dp 表

根據 3 種硬幣（面值 1、2、5）與目標金額 4，建立 4×5 的二維 dp 表（行 i = 0 至 3，列 a = 0 至 4）。剛分配時所有單元格預設置為 0：首列金額 0 的 0 即為有效邊界（湊出 0 元需 0 枚硬幣），而其餘正金額格的 0 均為尚未計算的初值，等待下一步設定首行 MAX 不可達邊界。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前建立 4×5 全零矩陣：首列金額 0 為有效邊界 0，其餘正金額格均為未計算初值 0，尚未設定首行 MAX 邊界。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-427"></a>

## 第 2 步：設定首行正金額為不可達邊界 MAX = 5

無硬幣可用（i = 0）時無法湊出任何大於 0 的金額，因此將首行正金額格 dp\[0, 1\] 至 dp\[0, 4\] 設為不可達標記 MAX = 5（表示狀態已定義為無解，而非需要 5 枚硬幣）；金額 a = 0 時最少需 0 枚硬幣，首列 dp\[0, 0\] 至 dp\[3, 0\] 保持有效邊界 0。第 1 至 3 行正金額格的 0 仍為未計算初值。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。邊界初始化完成：首行正金額 dp[0, 1] 至 dp[0, 4] 設為 MAX = 5（有效邊界，表示不可達），首列 dp[0, 0] 至 dp[3, 0] 為有效邊界 0，其餘 12 個內部格為未計算初值 0。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-428"></a>

## 第 3 步：計算 dp\[1, 1\]（面值 1、金額 1）：最少 1 枚

開始處理第 1 種硬幣（面值 1），計算金額 a = 1 的 dp\[1, 1\]：不選面值 1 硬幣時取正上方 dp\[0, 1\] = MAX（5，不可達）；選入 1 枚面值 1 硬幣時取本行左方邊界 dp\[1, 0\] = 0 加 1 得 1。取較小值 min(MAX, 1) = 1，寫入 dp\[1, 1\] = 1。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[1, 1]（前 1 種硬幣面值 1，湊金額 1）：比較上方 dp[0, 1] = MAX 與本行左方 dp[1, 0] + 1 = 1，取較小值寫入 dp[1, 1] = 1（1 枚 1 元）。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-429"></a>

## 第 4 步：計算 dp\[1, 2\]（面值 1、金額 2）：最少 2 枚

繼續用第 1 種硬幣（面值 1）計算金額 a = 2 的 dp\[1, 2\]：不選時為正上方 dp\[0, 2\] = MAX（不可達）；選入 1 枚面值 1 硬幣時，複用本行左方剛算出的 dp\[1, 1\] = 1 再加 1 得 2（兩枚 1 元）。取 min(MAX, 2) = 2，寫入 dp\[1, 2\] = 2。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[1, 2]（前 1 種硬幣面值 1，湊金額 2）：比較上方 dp[0, 2] = MAX 與本行左方 dp[1, 1] + 1 = 2，寫入 dp[1, 2] = 2（兩枚 1 元）。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-430"></a>

## 第 5 步：計算 dp\[1, 3\]（面值 1、金額 3）：最少 3 枚

繼續用第 1 種硬幣（面值 1）計算金額 a = 3 的 dp\[1, 3\]：不選時為正上方 dp\[0, 3\] = MAX（不可達）；選入 1 枚面值 1 硬幣時由本行左方 dp\[1, 2\] = 2 加 1 得 3（三枚 1 元）。取 min(MAX, 3) = 3，寫入 dp\[1, 3\] = 3。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[1, 3]（前 1 種硬幣面值 1，湊金額 3）：比較上方 dp[0, 3] = MAX 與本行左方 dp[1, 2] + 1 = 3，寫入 dp[1, 3] = 3（三枚 1 元）。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>0，未計算初值</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-431"></a>

## 第 6 步：計算 dp\[1, 4\]（面值 1、金額 4）：最少 4 枚

繼續用第 1 種硬幣（面值 1）計算金額 a = 4 的 dp\[1, 4\]：不選時為正上方 dp\[0, 4\] = MAX（不可達）；選入 1 枚面值 1 硬幣時由本行左方 dp\[1, 3\] = 3 加 1 得 4（四枚 1 元）。取 min(MAX, 4) = 4 寫入 dp\[1, 4\]，第 1 行計算完畢。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[1, 4]（前 1 種硬幣面值 1，湊金額 4）：比較上方 dp[0, 4] = MAX 與本行左方 dp[1, 3] + 1 = 4，寫入 dp[1, 4] = 4（四枚 1 元），第 1 行完成。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-432"></a>

## 第 7 步：計算 dp\[2, 1\]（面值 2、金額 1）：面值過大，繼承 1 枚

進入第 2 行，引入第 2 種硬幣（面值 2），計算金額 a = 1 的 dp\[2, 1\]。由於硬幣面值 2 大於當前金額 1，無法選入 2 元硬幣，直接沿豎直箭頭繼承正上方 dp\[1, 1\] = 1，寫入 dp\[2, 1\] = 1。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[2, 1]（前 2 種硬幣含面值 2，湊金額 1）：因面值 2 大於金額 1，無法選入，直接繼承上方 dp[1, 1] = 1。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-433"></a>

## 第 8 步：計算 dp\[2, 2\]（面值 2、金額 2）：選 1 枚 2 元，更新為 1

處理第 2 種硬幣（面值 2）、金額 a = 2：不選 2 元硬幣時繼承正上方 dp\[1, 2\] = 2（兩枚 1 元）；選入 1 枚 2 元硬幣時從本行左方邊界 dp\[2, 0\] = 0 加 1 得 1（1 枚 2 元）。取較小值 min(2, 1) = 1，寫入 dp\[2, 2\] = 1。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[2, 2]（前 2 種硬幣含面值 2，湊金額 2）：比較上方 dp[1, 2] = 2 與本行左方 dp[2, 0] + 1 = 1，取較小值寫入 dp[2, 2] = 1（1 枚 2 元）。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-434"></a>

## 第 9 步：計算 dp\[2, 3\]（面值 2、金額 3）：1 元加 2 元，更新為 2 枚

處理第 2 種硬幣（面值 2）、金額 a = 3：不選 2 元硬幣時為正上方 dp\[1, 3\] = 3（三枚 1 元）；選入 1 枚 2 元硬幣時從本行左方 dp\[2, 1\] = 1（1 枚 1 元）加 1 得 2（1 元與 2 元各 1 枚）。取 min(3, 2) = 2，寫入 dp\[2, 3\] = 2。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[2, 3]（前 2 種硬幣含面值 2，湊金額 3）：比較上方 dp[1, 3] = 3 與本行左方 dp[2, 1] + 1 = 2，取較小值寫入 dp[2, 3] = 2（1 元加 2 元共 2 枚）。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>2，已計算</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-435"></a>

## 第 10 步：計算 dp\[2, 4\]（面值 2、金額 4）：重複選 2 元，更新為 2 枚

處理第 2 種硬幣（面值 2）、金額 a = 4：不選 2 元硬幣時為正上方 dp\[1, 4\] = 4（四枚 1 元）；選入 2 元硬幣時，從本行左方已更新的 dp\[2, 2\] = 1（已含 1 枚 2 元）再加 1 得 2（兩枚 2 元）。取 min(4, 2) = 2 寫入 dp\[2, 4\]，完成第 2 行，體現本行左方轉移可重複選取同種硬幣。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[2, 4]（前 2 種硬幣含面值 2，湊金額 4）：比較上方 dp[1, 4] = 4 與本行左方 dp[2, 2] + 1 = 2，複用本行新值寫入 dp[2, 4] = 2（兩枚 2 元），第 2 行完成。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>2，已計算</td><td>2，已計算</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-436"></a>

## 第 11 步：計算 dp\[3, 1\]（面值 5、金額 1）：面值過大，繼承 1 枚

進入第 3 行，引入第 3 種硬幣（面值 5），計算金額 a = 1 的 dp\[3, 1\]。由於面值 5 大於當前金額 1，無法選入 5 元硬幣，沿豎直箭頭直接繼承正上方 dp\[2, 1\] = 1，寫入 dp\[3, 1\] = 1。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[3, 1]（前 3 種硬幣含面值 5，湊金額 1）：因面值 5 大於金額 1，無法選入，直接繼承上方 dp[2, 1] = 1。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>2，已計算</td><td>2，已計算</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-437"></a>

## 第 12 步：計算 dp\[3, 2\]（面值 5、金額 2）：面值過大，繼承 1 枚

繼續處理第 3 種硬幣（面值 5）、金額 a = 2：面值 5 仍大於當前金額 2，無法選入 5 元硬幣，直接繼承正上方 dp\[2, 2\] = 1，寫入 dp\[3, 2\] = 1。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[3, 2]（前 3 種硬幣含面值 5，湊金額 2）：因面值 5 大於金額 2，無法選入，直接繼承上方 dp[2, 2] = 1。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>2，已計算</td><td>2，已計算</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-438"></a>

## 第 13 步：計算 dp\[3, 3\]（面值 5、金額 3）：面值過大，繼承 2 枚

繼續處理第 3 種硬幣（面值 5）、金額 a = 3：面值 5 大於當前金額 3，無法選入 5 元硬幣，直接繼承正上方 dp\[2, 3\] = 2，寫入 dp\[3, 3\] = 2。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[3, 3]（前 3 種硬幣含面值 5，湊金額 3）：因面值 5 大於金額 3，無法選入，直接繼承上方 dp[2, 3] = 2。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>2，已計算</td><td>2，已計算</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>2，已計算</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-439"></a>

## 第 14 步：計算 dp\[3, 4\]（面值 5、金額 4）：面值過大，繼承 2 枚

處理第 3 種硬幣（面值 5）、右下角目標金額 a = 4：由於面值 5 大於金額 4，無法選入 5 元硬幣，只能沿豎直箭頭直接繼承正上方前兩種硬幣的解 dp\[2, 4\] = 2（即兩枚 2 元硬幣湊成 4 元），寫入 dp\[3, 4\] = 2，全表計算完成。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。當前計算 dp[3, 4]（前 3 種硬幣含面值 5，湊金額 4）：因面值 5 大於金額 4，無法選入，直接繼承上方前兩種硬幣的 dp[2, 4] = 2（兩枚 2 元），全表填畢。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>2，已計算</td><td>2，已計算</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>2，已計算</td><td>2，已計算</td></tr></tbody></table></details>

<a id="source-440"></a>

## 第 15 步：讀取右下角 dp\[3, 4\]，返回最少硬幣數 2

全部狀態轉移結束後，讀取右下角高亮格 dp\[3, 4\] = 2。由於該值不等於不可達標記 MAX（5），直接返回 2 作為恰好湊出 4 元的最少硬幣枚數（由兩枚 2 元硬幣組成；若結果為 MAX 則返回 -1）。

<details><summary>本步完整狀態</summary><p>硬幣面值 1、2、5 各不限量，求恰好湊出 4 元的最少枚數；MAX = 5 表示不可達。全表計算完成，右下角 dp[3, 4] = 2 不等於 MAX，返回最少硬幣枚數 2（兩枚 2 元硬幣）。</p><table><caption>當前最少硬幣數與計算進度</caption><thead><tr><th scope="col">可選硬幣</th><th scope="col">金額0</th><th scope="col">金額1</th><th scope="col">金額2</th><th scope="col">金額3</th><th scope="col">金額4</th></tr></thead><tbody><tr><th scope="row">前0種硬幣</th><td>0，邊界有效</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td><td>MAX，邊界有效，表示不可達；MAX=5</td></tr><tr><th scope="row">前1種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">前2種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>2，已計算</td><td>2，已計算</td></tr><tr><th scope="row">前3種硬幣</th><td>0，邊界有效</td><td>1，已計算</td><td>1，已計算</td><td>2，已計算</td><td>2，已計算</td></tr></tbody></table></details>

## 結果

填表結束後返回右下角 dp\[3, 4\] = 2，即用兩枚 2 元硬幣恰好湊出 4 元。第 3 種硬幣面值 5 大於目標金額 1 至 4，整行直接繼承前兩種硬幣的結果。若最終結果為 MAX，則代表無解，程式碼返回 -1。
