<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 0f664053c58590e121f997ddd87572574bed3542b71556b7aedfde9139c5d396 -->

# 0-1 背包動態規劃

三件物品各最多選一次，按物品與容量逐格遞推選與不選的較大價值，求出容量 4 下的最大總價值。

## 問題與輸入

候選物品有 3 件（n = 3）：1 號蘋果（重 1、價值 5）、2 號菠蘿（重 2、價值 11）、3 號西瓜（重 3、價值 15），詳見物品表。背包容量 cap = 4，每件物品最多選一次，目標是在不超重的前提下獲得最大總價值，無須恰好裝滿。

狀態 dp\[i, c\] 表示從前 i 件物品中選擇、總重量不超過容量 c 時的最大價值。行下標 i 取 0 至 3，列下標 c 取 0 至 4，狀態表共 4 行 5 列；物品編號 i 從 1 開始，對應陣列重量 wgt\[i-1\] 和價值 val\[i-1\]。

## 結構與關係

第 0 行（無物品可選）和第 0 列（背包容量為 0）的最大價值確定為 0，在圖中顯示為深色字型的有效邊界 0；第 1 至 3 行、第 1 至 4 列的其餘 12 個格子初始雖也填 0，但顯示為淡色字型，僅代表尚未計算的初值 0，不能當作已算出的最優價值。填表按行 i = 1 至 3、每行內按容量 c = 1 至 4 依次推進。

對於第 i 件物品（重量 w = wgt\[i-1\]，價值 v = val\[i-1\]）：若 w &gt; c，當前容量裝不下該物品，只能不選，直接繼承正上方的 dp\[i-1, c\]；若 w ≤ c，則比較不選該物品的 dp\[i-1, c\] 與選入該物品的 dp\[i-1, c-w\] + v，取較大值寫入 dp\[i, c\]。兩個候選來源都取自上一行 i-1，保證每件物品最多計入一次。

<table><caption>本組物品資料</caption><thead><tr><th scope="col">物品編號i</th><th scope="col">物品</th><th scope="col">重量wgt[i−1]</th><th scope="col">價值val[i−1]</th></tr></thead><tbody><tr><th scope="row">1</th><td>蘋果</td><td>1</td><td>5</td></tr><tr><th scope="row">2</th><td>菠蘿</td><td>2</td><td>11</td></tr><tr><th scope="row">3</th><td>西瓜</td><td>3</td><td>15</td></tr></tbody></table>

<table><caption>填表完成後的最大價值；邊界0已有效</caption><thead><tr><th scope="col">前i件物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">0</th><td>0（邊界有效）</td><td>0（邊界有效）</td><td>0（邊界有效）</td><td>0（邊界有效）</td><td>0（邊界有效）</td></tr><tr><th scope="row">1</th><td>0（邊界有效）</td><td>5</td><td>5</td><td>5</td><td>5</td></tr><tr><th scope="row">2</th><td>0（邊界有效）</td><td>5</td><td>11</td><td>16</td><td>16</td></tr><tr><th scope="row">3</th><td>0（邊界有效）</td><td>5</td><td>11</td><td>16</td><td>20</td></tr></tbody></table>

<table><caption>非邊界格首次算出結果的步驟；此前均為未計算初值0</caption><thead><tr><th scope="col">步驟位置</th><th scope="col">單元格</th><th scope="col">子問題</th><th scope="col">算得價值</th></tr></thead><tbody><tr><th scope="row">2</th><td>dp[1, 1]</td><td>前1件物品、容量1</td><td>5</td></tr><tr><th scope="row">3</th><td>dp[1, 2]</td><td>前1件物品、容量2</td><td>5</td></tr><tr><th scope="row">4</th><td>dp[1, 3]</td><td>前1件物品、容量3</td><td>5</td></tr><tr><th scope="row">5</th><td>dp[1, 4]</td><td>前1件物品、容量4</td><td>5</td></tr><tr><th scope="row">6</th><td>dp[2, 1]</td><td>前2件物品、容量1</td><td>5</td></tr><tr><th scope="row">7</th><td>dp[2, 2]</td><td>前2件物品、容量2</td><td>11</td></tr><tr><th scope="row">8</th><td>dp[2, 3]</td><td>前2件物品、容量3</td><td>16</td></tr><tr><th scope="row">9</th><td>dp[2, 4]</td><td>前2件物品、容量4</td><td>16</td></tr><tr><th scope="row">10</th><td>dp[3, 1]</td><td>前3件物品、容量1</td><td>5</td></tr><tr><th scope="row">11</th><td>dp[3, 2]</td><td>前3件物品、容量2</td><td>11</td></tr><tr><th scope="row">12</th><td>dp[3, 3]</td><td>前3件物品、容量3</td><td>16</td></tr><tr><th scope="row">13</th><td>dp[3, 4]</td><td>前3件物品、容量4</td><td>20</td></tr></tbody></table>

<a id="source-397"></a>

## 第 1 步：初始化 4×5 狀態矩陣

初始化尺寸為 (n + 1) × (cap + 1) 即 4 × 5 的 dp 矩陣並全部填入 0。其中第 0 行（無物品可選）和第 0 列（背包容量為 0）為深色字型的確定邊界值 0；第 1 至 3 行、第 1 至 4 列的其餘 12 個格子為淡色 0，表示尚未執行狀態轉移的初值 0。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。已初始化狀態表：無物品（i=0）或容量為0（c=0）的邊界格均為0，其餘12格為待計算的初值0。</p><table><caption>初始化後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-398"></a>

## 第 2 步：計算 dp\[1, 1\]，最大價值為 5

考慮前 1 件物品（蘋果，重 1、價值 5）、容量 1。不選蘋果得 dp\[0, 1\] = 0；選入蘋果後剩餘容量 0，得 dp\[0, 0\] + 5 = 0 + 5 = 5。取較大值 5 寫入 dp\[1, 1\]。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算蘋果（i=1）、容量 c=1：比較不選蘋果的價值0與選入蘋果的價值5，將 dp[1, 1] 寫為5。</p><table><caption>計算 dp[1, 1] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-399"></a>

## 第 3 步：計算 dp\[1, 2\]，最大價值為 5

考慮前 1 件物品（蘋果）、容量 2。不選蘋果得 dp\[0, 2\] = 0；選入蘋果後剩餘容量 1，從上一行得 dp\[0, 1\] + 5 = 0 + 5 = 5。取較大值 5 寫入 dp\[1, 2\]。由於蘋果只能選一次，剩餘容量 1 不能重複放入第二顆蘋果。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算蘋果（i=1）、容量 c=2：蘋果最多選一次，比較不選的價值0與選入蘋果的價值5，將 dp[1, 2] 寫為5。</p><table><caption>計算 dp[1, 2] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-400"></a>

## 第 4 步：計算 dp\[1, 3\]，最大價值為 5

考慮前 1 件物品（蘋果）、容量 3。不選蘋果得 dp\[0, 3\] = 0；選入蘋果後剩餘容量 2，得 dp\[0, 2\] + 5 = 0 + 5 = 5。取較大值 5 寫入 dp\[1, 3\]。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算蘋果（i=1）、容量 c=3：蘋果最多選一次，比較不選的價值0與選入蘋果的價值5，將 dp[1, 3] 寫為5。</p><table><caption>計算 dp[1, 3] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-401"></a>

## 第 5 步：計算 dp\[1, 4\]，最大價值為 5

考慮前 1 件物品（蘋果）、容量 4。不選蘋果得 dp\[0, 4\] = 0；選入蘋果後剩餘容量 3，得 dp\[0, 3\] + 5 = 0 + 5 = 5。取較大值 5 寫入 dp\[1, 4\]，第 1 行計算完畢。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算蘋果（i=1）、容量 c=4：蘋果最多選一次，比較不選的價值0與選入蘋果的價值5，將 dp[1, 4] 寫為5，完成第1行。</p><table><caption>計算 dp[1, 4] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-402"></a>

## 第 6 步：計算 dp\[2, 1\]，裝不下菠蘿保持 5

考慮前 2 件物品、容量 1。2 號菠蘿重 2，超過當前容量 1，只能不選，直接從正上方讀取 dp\[1, 1\] = 5 寫入 dp\[2, 1\]。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算菠蘿（i=2）、容量 c=1：菠蘿重2，當前容量裝不下，只能不選並繼承上一行價值5，將 dp[2, 1] 寫為5。</p><table><caption>計算 dp[2, 1] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>5，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-403"></a>

## 第 7 步：計算 dp\[2, 2\]，選入菠蘿更新為 11

考慮前 2 件物品、容量 2。不選菠蘿得 dp\[1, 2\] = 5；選入菠蘿後剩餘容量 0，得 dp\[1, 0\] + 11 = 0 + 11 = 11。取較大值 11 寫入 dp\[2, 2\]。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算菠蘿（i=2）、容量 c=2：比較不選菠蘿的價值5與只選菠蘿的價值11，將 dp[2, 2] 寫為11。</p><table><caption>計算 dp[2, 2] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-404"></a>

## 第 8 步：計算 dp\[2, 3\]，蘋果加菠蘿更新為 16

考慮前 2 件物品、容量 3。不選菠蘿得 dp\[1, 3\] = 5；選入菠蘿後剩餘容量 1，讀取左上方 dp\[1, 1\] = 5（已選蘋果）並加菠蘿價值 11 得 16。取較大值 16 寫入 dp\[2, 3\]。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算菠蘿（i=2）、容量 c=3：比較不選菠蘿的價值5與選入菠蘿加蘋果的價值16，將 dp[2, 3] 寫為16。</p><table><caption>計算 dp[2, 3] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>0，未計算初值</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-405"></a>

## 第 9 步：計算 dp\[2, 4\]，最大價值為 16

考慮前 2 件物品、容量 4。不選菠蘿得 dp\[1, 4\] = 5；選入菠蘿後剩餘容量 2，由 dp\[1, 2\] + 11 = 5 + 11 = 16。取較大值 16 寫入 dp\[2, 4\]，第 2 行計算完畢。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算菠蘿（i=2）、容量 c=4：比較不選菠蘿的價值5與選入菠蘿加蘋果的價值16，將 dp[2, 4] 寫為16，完成第2行。</p><table><caption>計算 dp[2, 4] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>16，已計算</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-406"></a>

## 第 10 步：計算 dp\[3, 1\]，裝不下西瓜保持 5

考慮前 3 件物品、容量 1。3 號西瓜重 3，超過當前容量 1，只能不選，直接從正上方讀取 dp\[2, 1\] = 5 寫入 dp\[3, 1\]。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算西瓜（i=3）、容量 c=1：西瓜重3，當前容量裝不下，只能不選並繼承上一行價值5，將 dp[3, 1] 寫為5。</p><table><caption>計算 dp[3, 1] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>16，已計算</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>5，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-407"></a>

## 第 11 步：計算 dp\[3, 2\]，裝不下西瓜保持 11

考慮前 3 件物品、容量 2。西瓜重 3 仍超過當前容量 2，只能不選，直接從正上方讀取 dp\[2, 2\] = 11 寫入 dp\[3, 2\]。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算西瓜（i=3）、容量 c=2：西瓜重3，當前容量裝不下，只能不選並繼承上一行價值11，將 dp[3, 2] 寫為11。</p><table><caption>計算 dp[3, 2] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>16，已計算</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-408"></a>

## 第 12 步：計算 dp\[3, 3\]，不選西瓜保留 16

考慮前 3 件物品、容量 3。不選西瓜得正上方 dp\[2, 3\] = 16（蘋果加菠蘿）；選入西瓜後剩餘容量 0，得左上方 dp\[2, 0\] + 15 = 0 + 15 = 15。因不選西瓜的價值 16 高於單選西瓜的 15，取較大值 16 寫入 dp\[3, 3\]。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算西瓜（i=3）、容量 c=3：比較不選西瓜的價值16（蘋果加菠蘿）與只選西瓜的價值15，將 dp[3, 3] 寫為16。此時 dp[3, 4] 仍為未計算初值0。</p><table><caption>計算 dp[3, 3] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>16，已計算</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-409"></a>

## 第 13 步：計算 dp\[3, 4\]，蘋果加西瓜更新為 20

考慮前 3 件物品、容量 4。不選西瓜得正上方 dp\[2, 4\] = 16；選入西瓜後剩餘容量 1，由左上方 dp\[2, 1\] = 5（已選蘋果）加西瓜價值 15 得 20。取較大值 20 寫入右下角 dp\[3, 4\]。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。正在計算西瓜（i=3）、容量 c=4：比較不選西瓜的價值16與選入西瓜加蘋果的價值20，將 dp[3, 4] 寫為20。至此全部單元格計算完畢。</p><table><caption>計算 dp[3, 4] 後的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>16，已計算</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>20，已計算</td></tr></tbody></table></details>

<a id="source-410"></a>

## 第 14 步：返回容量 4 的最大價值 20

全部狀態轉移完成，右下角高亮格 dp\[3, 4\] = 20 即為最終返回值。畫面下方提示“返回將所有物品放入背包的最大價值 20”，這裡的“所有物品”指考慮完全部三件候選物品的範圍（i = 3）：實際最優子集是選擇蘋果（重量 1、價值 5）與西瓜（重量 3、價值 15），放棄菠蘿，總重量恰好為 4、最大總價值為 20。

<details><summary>本步完整狀態</summary><p>背包容量為4；蘋果重1、價值5，菠蘿重2、價值11，西瓜重3、價值15，每件最多選一次。表中每格表示從該行可選物品中選擇、總重量不超過該列容量時的最大價值。全部單元格填表完成，返回右下角 dp[3, 4]=20；最優方案為選擇蘋果和西瓜，總重量4、最大價值20。</p><table><caption>返回結果時的最大價值表</caption><thead><tr><th scope="col">可選物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">沒有物品（i=0）</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">蘋果（i=1）</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">蘋果、菠蘿（i=2）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>16，已計算</td></tr><tr><th scope="row">蘋果、菠蘿、西瓜（i=3）</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>20，已計算</td></tr></tbody></table></details>

## 結果

最終右下角 dp\[3, 4\] = 20：最優方案是選擇蘋果（重 1、價值 5）和西瓜（重 3、價值 15），總重量 1 + 3 = 4，最大總價值 5 + 15 = 20。末幀圖注“將所有物品放入背包的最大價值 20”是指考慮全部三件候選物品後的最優子集價值；三件全選總重為 6，已超過背包容量 4。
