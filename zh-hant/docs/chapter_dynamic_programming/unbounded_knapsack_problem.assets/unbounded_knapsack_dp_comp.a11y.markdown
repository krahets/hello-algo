<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 3355b60cf3c3f8287b01271484a3c16c3c082931bb2365ebdb280d81a5d39aeb -->

# 完全背包的單行更新

按容量從小到大正序更新單行陣列，複用本輪較小容量的新解，使同種物品可以重複選取。

## 問題與輸入

背包容量上限為 4，共有 3 種可重複選取的物品：1 號蘋果（重量 1、價值 5）、2 號菠蘿（重量 2、價值 11）、3 號西瓜（重量 3、價值 15）。本組從第 1 種物品蘋果已處理完畢開始，僅演示第 2 種物品菠蘿的單行更新，第 3 種物品西瓜尚未參與。

二維狀態 dp\[i, c\] 表示僅用前 i 種物品、總重量不超過容量 c 時的最大價值；空間最佳化後的單行陣列 dp\[c\]（容量索引 c 從 0 至 4）按輪依次覆蓋上一輪結果。

## 結構與關係

第 i = 2 輪按容量 c = 1、2、3、4 正序走訪。容量不足以放入菠蘿（c &lt; 2）時沿用上一輪舊值；裝得下時（c &gt;= 2），比較不選菠蘿的舊值 dp\[c\] 與選入菠蘿的本輪值 dp\[c - 2\] + 11，取較大者寫入 dp\[c\]。較小正容量在本輪已先處理，容量 0 始終保持有效邊界 0，因此正序讀取本行左側的 dp\[c - 2\] 可以再次選入菠蘿，實現同種物品重複選取；0-1 背包每件限用一次、必須倒序讀取上一輪舊值的限制不適用於這裡。

每幀包含兩張狀態表：單行表逐容量標明當前數值及所屬輪次（區分上一輪 i = 1 與本輪 i = 2）；二維對照表展示各子問題的計算進度，其中尚未計算的初值 0 不代表有效解。

<table><caption>物品輸入</caption><thead><tr><th scope="col">編號i</th><th scope="col">物品</th><th scope="col">重量</th><th scope="col">價值</th></tr></thead><tbody><tr><th scope="row">1</th><td>蘋果</td><td>1</td><td>5</td></tr><tr><th scope="row">2</th><td>菠蘿</td><td>2</td><td>11</td></tr><tr><th scope="row">3</th><td>西瓜</td><td>3</td><td>15</td></tr></tbody></table>

<a id="source-418"></a>

## 第 1 步：走訪 i = 2 前：單行儲存 i = 1 的解

開始第 i = 2 輪（菠蘿）之前，第 1 輪（僅選蘋果）已計算完畢：由於蘋果可重複選取，容量 0 至 4 依次放入 0 至 4 個蘋果，最大價值為 \[0, 5, 10, 15, 20\]。下方單行陣列 dp 當前儲存這組 i = 1 的解，準備從左到右正序處理第 2 種物品菠蘿。

<details><summary>本步完整狀態</summary><p>容量上限 4；蘋果重 1 值 5、菠蘿重 2 值 11、西瓜重 3 值 15，每種均可重複選取。本組只處理第 2 種物品菠蘿。當前為 i = 2 輪開始前：單行 dp = [0, 5, 10, 15, 20]，容量 1 至 4 均儲存上一輪 i = 1（僅選蘋果）的解。</p><table><caption>單行dp：各容量的值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；上一輪i=1，僅蘋果，尚未覆蓋</td></tr><tr><th scope="row">2</th><td>10，已計算；上一輪i=1，僅蘋果，尚未覆蓋</td></tr><tr><th scope="row">3</th><td>15，已計算；上一輪i=1，僅蘋果，尚未覆蓋</td></tr><tr><th scope="row">4</th><td>20，已計算；上一輪i=1，僅蘋果，尚未覆蓋</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0種物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>10，已計算</td><td>15，已計算</td><td>20，已計算</td></tr><tr><th scope="row">前2種物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-419"></a>

## 第 2 步：正序處理容量 c = 1：裝不下菠蘿，保持 5

從容量 c = 1 開始正序走訪：菠蘿重量 2 大於容量 1，無法放入菠蘿。上方二維表中 dp\[2, 1\] 直接繼承正上方 dp\[1, 1\] = 5；下方單行陣列的 dp\[1\] 數值保持 5，但所屬輪次已更新為本輪 i = 2（圖中以綠色標示本輪已處理），而容量 2 至 4 仍為上一輪 i = 1 的舊值。

<details><summary>本步完整狀態</summary><p>容量上限 4；蘋果重 1 值 5、菠蘿重 2 值 11、西瓜重 3 值 15，每種均可重複選取。本組只處理第 2 種物品菠蘿。當前 i = 2，c = 1：菠蘿重 2 超過容量 1，無法選入，dp[1] 保持 5 並完成本輪 i = 2 處理；容量 2 至 4 仍屬上一輪 i = 1。</p><table><caption>單行dp：各容量的值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；本輪i=2，蘋果與菠蘿</td></tr><tr><th scope="row">2</th><td>10，已計算；上一輪i=1，僅蘋果，尚未覆蓋</td></tr><tr><th scope="row">3</th><td>15，已計算；上一輪i=1，僅蘋果，尚未覆蓋</td></tr><tr><th scope="row">4</th><td>20，已計算；上一輪i=1，僅蘋果，尚未覆蓋</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0種物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>10，已計算</td><td>15，已計算</td><td>20，已計算</td></tr><tr><th scope="row">前2種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-420"></a>

## 第 3 步：正序更新容量 c = 2：選入 1 個菠蘿，更新為 11

向右正序推進到容量 c = 2：不選菠蘿時沿用上一輪舊值 dp\[2\] = 10（兩個蘋果）；選入 1 個菠蘿時，讀取本行左側容量 0 的邊界狀態 dp\[0\] = 0 並加菠蘿價值 11，得 11。取 max(10, 11) = 11，將單行 dp\[2\] 更新為本輪新值 11。

<details><summary>本步完整狀態</summary><p>容量上限 4；蘋果重 1 值 5、菠蘿重 2 值 11、西瓜重 3 值 15，每種均可重複選取。本組只處理第 2 種物品菠蘿。當前 i = 2，c = 2：比較舊值 10 與 dp[0] + 11 = 11，取較大值將 dp[2] 更新為 11（選 1 個菠蘿）。</p><table><caption>單行dp：各容量的值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；本輪i=2，蘋果與菠蘿</td></tr><tr><th scope="row">2</th><td>11，已計算；本輪i=2，蘋果與菠蘿</td></tr><tr><th scope="row">3</th><td>15，已計算；上一輪i=1，僅蘋果，尚未覆蓋</td></tr><tr><th scope="row">4</th><td>20，已計算；上一輪i=1，僅蘋果，尚未覆蓋</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0種物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>10，已計算</td><td>15，已計算</td><td>20，已計算</td></tr><tr><th scope="row">前2種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-421"></a>

## 第 4 步：正序更新容量 c = 3：蘋果加菠蘿，更新為 16

繼續正序推進到容量 c = 3：不選菠蘿時為上一輪舊值 dp\[3\] = 15（三個蘋果）；選入 1 個菠蘿時，讀取本行左側已在本輪處理過的 dp\[1\] = 5（一個蘋果），加上菠蘿價值 11 得 16（一個蘋果加一個菠蘿）。取 max(15, 16) = 16，將 dp\[3\] 更新為 16。

<details><summary>本步完整狀態</summary><p>容量上限 4；蘋果重 1 值 5、菠蘿重 2 值 11、西瓜重 3 值 15，每種均可重複選取。本組只處理第 2 種物品菠蘿。當前 i = 2，c = 3：比較舊值 15 與本行 dp[1] + 11 = 16，將 dp[3] 更新為 16（1 個蘋果加 1 個菠蘿）。</p><table><caption>單行dp：各容量的值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；本輪i=2，蘋果與菠蘿</td></tr><tr><th scope="row">2</th><td>11，已計算；本輪i=2，蘋果與菠蘿</td></tr><tr><th scope="row">3</th><td>16，已計算；本輪i=2，蘋果與菠蘿</td></tr><tr><th scope="row">4</th><td>20，已計算；上一輪i=1，僅蘋果，尚未覆蓋</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0種物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>10，已計算</td><td>15，已計算</td><td>20，已計算</td></tr><tr><th scope="row">前2種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>0，未計算初值</td></tr><tr><th scope="row">前3種物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-422"></a>

## 第 5 步：正序更新容量 c = 4：複用本輪新值，重複選菠蘿得 22

正序推進到容量 c = 4：不選菠蘿時為上一輪舊值 dp\[4\] = 20（四個蘋果）；選入菠蘿時，從本行左側讀取本輪剛更新過的 dp\[2\] = 11（已含 1 個菠蘿），再加 1 個菠蘿的價值 11 得到 22（共兩個菠蘿）。取 max(20, 22) = 22 寫入 dp\[4\]，直接體現正序走訪允許複用本輪新解、重複選取同一種物品。

<details><summary>本步完整狀態</summary><p>容量上限 4；蘋果重 1 值 5、菠蘿重 2 值 11、西瓜重 3 值 15，每種均可重複選取。本組只處理第 2 種物品菠蘿。當前 i = 2，c = 4：複用本輪已更新的 dp[2] = 11 再加 11 得 22，大於舊值 20，dp[4] 更新為 22（兩個菠蘿）。</p><table><caption>單行dp：各容量的值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；本輪i=2，蘋果與菠蘿</td></tr><tr><th scope="row">2</th><td>11，已計算；本輪i=2，蘋果與菠蘿</td></tr><tr><th scope="row">3</th><td>16，已計算；本輪i=2，蘋果與菠蘿</td></tr><tr><th scope="row">4</th><td>22，已計算；本輪i=2，蘋果與菠蘿</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0種物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>10，已計算</td><td>15，已計算</td><td>20，已計算</td></tr><tr><th scope="row">前2種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>22，已計算</td></tr><tr><th scope="row">前3種物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-423"></a>

## 第 6 步：完成 i = 2 輪走訪：單行儲存前兩種物品的解

第 i = 2 輪正序走訪全部完成，單行陣列 dp = \[0, 5, 11, 16, 22\] 完整儲存了僅使用前兩種物品（蘋果、菠蘿）時容量 0 至 4 的最大價值，將作為下一輪的舊狀態基準。上方二維表第 3 行（西瓜）的正容量格仍為未計算的初值 0，容量 0 的格子保持有效邊界 0，本組未演示第 3 種物品西瓜的更新。

<details><summary>本步完整狀態</summary><p>容量上限 4；蘋果重 1 值 5、菠蘿重 2 值 11、西瓜重 3 值 15，每種均可重複選取。本組只處理第 2 種物品菠蘿。i = 2 輪已完成：單行 dp = [0, 5, 11, 16, 22] 儲存前兩種物品（蘋果、菠蘿）的解，第 3 種物品西瓜尚未處理。</p><table><caption>單行dp：各容量的值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；本輪i=2，蘋果與菠蘿；下一輪將作為舊狀態</td></tr><tr><th scope="row">2</th><td>11，已計算；本輪i=2，蘋果與菠蘿；下一輪將作為舊狀態</td></tr><tr><th scope="row">3</th><td>16，已計算；本輪i=2，蘋果與菠蘿；下一輪將作為舊狀態</td></tr><tr><th scope="row">4</th><td>22，已計算；本輪i=2，蘋果與菠蘿；下一輪將作為舊狀態</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0種物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>10，已計算</td><td>15，已計算</td><td>20，已計算</td></tr><tr><th scope="row">前2種物品</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>22，已計算</td></tr><tr><th scope="row">前3種物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

## 結果

第 i = 2 輪結束後，單行陣列更新為 \[0, 5, 11, 16, 22\]；其中容量 4 複用本輪已更新的 dp\[2\] = 11 再加 11，選入兩個菠蘿達到最大價值 22。這僅是前兩種物品（蘋果、菠蘿）的結果，第 3 種物品西瓜尚未處理。
