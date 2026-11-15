<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: cd80fa231e88c359d80f5ed5a88c411c8475101c21bf82ff9f483f419cc49d4b -->

# 背包動態規劃的單行壓縮

使用單行一維陣列儲存狀態，按容量從大到小倒序更新，確保狀態轉移讀取的是上一輪物品的舊值，避免同一件物品被重複選入。

## 問題與輸入

共有三件物品：物品 1 蘋果（重量 1、價值 5）、物品 2 菠蘿（重量 2、價值 11）、物品 3 西瓜（重量 3、價值 15），背包最大容量為 4，每件物品最多選一次。物品編號 i 從 1 開始，對應陣列下標 wgt\[i-1\] 與 val\[i-1\]。

本組 6 幀僅演示外層迴圈 i=2（處理第二件物品菠蘿）這一輪的完整倒序更新過程。進入本輪前，一維陣列 dp\[0..4\] 已儲存僅考慮第 1 件物品蘋果（i=1）的結果 \[0, 5, 5, 5, 5\]；第 3 件物品西瓜（i=3）在本組中始終尚未處理。dp\[c\] 表示在當前已考慮物品範圍內、總重量不超過容量 c 時的最大價值，不要求恰好裝滿。

## 結構與關係

處理菠蘿（重 2、值 11）時，若當前容量 c ≥ 2，狀態轉移需比較“不選菠蘿”（保留上一輪舊值 dp\[c\]）與“選入菠蘿”（讀取上一輪較小容量舊值 dp\[c-2\] + 11），取較大者寫回 dp\[c\]。按容量 c = 4、3、2、1 倒序走訪時，被讀取的左方格 dp\[c-2\] 尚未被本輪覆蓋，仍保持上一輪（i=1，僅考慮蘋果）的舊狀態。

反之，若按容量從小到大正序更新，容量 2 會先被更新為 dp\[2\] = 11（已選入一件菠蘿）；隨後計算容量 4 時讀取 dp\[2\] + 11 就會算出 22，相當於在容量 4 內把同一件菠蘿重複裝入兩次，違背 0-1 背包每件最多一次的限制。倒序更新在 dp\[2\] 仍為舊值 5 時先算容量 4，從而得到正確值 5 + 11 = 16。

每幀畫面上方給出 4×5 二維對照表，下方為實際使用的單行陣列 dp\[0..4\]。單行中藍色格表示保留的上一輪（i=1）舊狀態，綠色格表示本輪（i=2）已完成更新的新狀態；本輪末尾整行統一改標為藍色，準備作為下一輪處理西瓜時的舊狀態，數值本身不再變化。

<table><caption>本組物品資料</caption><thead><tr><th scope="col">物品編號i</th><th scope="col">物品</th><th scope="col">重量wgt[i−1]</th><th scope="col">價值val[i−1]</th></tr></thead><tbody><tr><th scope="row">1</th><td>蘋果</td><td>1</td><td>5</td></tr><tr><th scope="row">2</th><td>菠蘿</td><td>2</td><td>11</td></tr><tr><th scope="row">3</th><td>西瓜</td><td>3</td><td>15</td></tr></tbody></table>

<a id="source-411"></a>

## 第 1 步：開始處理菠蘿

進入 i=2（菠蘿，重 2、值 11）這一輪前，單行 dp\[0..4\] 已存有上一輪 i=1（僅考慮蘋果）的有效結果 \[0, 5, 5, 5, 5\]，並非全零初始表。容量 0 恆為有效邊界 0，容量 1 至 4 均處於上一輪 i=1 的舊狀態，準備從最大容量 c=4 開始倒序更新。

<details><summary>本步完整狀態</summary><p>背包容量 4，每件最多選一次（蘋果重 1 值 5、菠蘿重 2 值 11、西瓜重 3 值 15），本組僅演示處理第二件物品菠蘿（i=2）。當前單行 dp[0..4] = [0, 5, 5, 5, 5]：容量 0 為邊界有效 0，容量 1 至 4 均為上一輪 i=1（僅考慮蘋果）的舊狀態，尚未被本輪覆蓋。</p><table><caption>單行dp：各容量的當前值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；上一輪i=1，僅考慮蘋果，尚未被本輪覆蓋</td></tr><tr><th scope="row">2</th><td>5，已計算；上一輪i=1，僅考慮蘋果，尚未被本輪覆蓋</td></tr><tr><th scope="row">3</th><td>5，已計算；上一輪i=1，僅考慮蘋果，尚未被本輪覆蓋</td></tr><tr><th scope="row">4</th><td>5，已計算；上一輪i=1，僅考慮蘋果，尚未被本輪覆蓋</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">前2件物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">前3件物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-412"></a>

## 第 2 步：倒序更新容量4

首先處理最大容量 c=4：不選菠蘿保留舊值 dp\[4\]=5；選入菠蘿則讀取尚未被本輪覆蓋的上一輪舊值 dp\[4-2\]=dp\[2\]=5，加上菠蘿價值 11 得 16。取較大值將 dp\[4\] 更新為 16（迴屬本輪 i=2），而容量 1、2、3 仍保持上一輪 i=1 的舊值 5。

<details><summary>本步完整狀態</summary><p>背包容量 4，當前倒序處理第二件物品菠蘿（i=2，重 2 值 11）。單行 dp[0..4] = [0, 5, 5, 5, 16]：容量 4 已更新為本輪 i=2 的 16；容量 1、2、3 仍為上一輪 i=1 的舊狀態 5（其中 dp[2]=5 剛被容量 4 作為舊狀態讀取）；容量 0 為邊界有效 0。</p><table><caption>單行dp：各容量的當前值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；上一輪i=1，僅考慮蘋果，尚未被本輪覆蓋</td></tr><tr><th scope="row">2</th><td>5，已計算；上一輪i=1，僅考慮蘋果，尚未被本輪覆蓋</td></tr><tr><th scope="row">3</th><td>5，已計算；上一輪i=1，僅考慮蘋果，尚未被本輪覆蓋</td></tr><tr><th scope="row">4</th><td>16，已計算；本輪i=2，考慮蘋果與菠蘿</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">前2件物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>16，已計算</td></tr><tr><th scope="row">前3件物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-413"></a>

## 第 3 步：倒序更新容量3

繼續倒序處理容量 c=3：不選菠蘿保留舊值 dp\[3\]=5；選入菠蘿則讀取仍屬上一輪 i=1 的舊值 dp\[3-2\]=dp\[1\]=5，加 11 得 16。取較大值將 dp\[3\] 更新為 16（迴屬本輪 i=2），容量 1、2 仍保持上一輪 i=1 的舊狀態 5。

<details><summary>本步完整狀態</summary><p>背包容量 4，當前倒序處理第二件物品菠蘿（i=2，重 2 值 11）。單行 dp[0..4] = [0, 5, 5, 16, 16]：容量 3、4 已更新為本輪 i=2 的 16；容量 1、2 仍為上一輪 i=1 的舊狀態 5；容量 0 為邊界有效 0。</p><table><caption>單行dp：各容量的當前值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；上一輪i=1，僅考慮蘋果，尚未被本輪覆蓋</td></tr><tr><th scope="row">2</th><td>5，已計算；上一輪i=1，僅考慮蘋果，尚未被本輪覆蓋</td></tr><tr><th scope="row">3</th><td>16，已計算；本輪i=2，考慮蘋果與菠蘿</td></tr><tr><th scope="row">4</th><td>16，已計算；本輪i=2，考慮蘋果與菠蘿</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">前2件物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>16，已計算</td><td>16，已計算</td></tr><tr><th scope="row">前3件物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-414"></a>

## 第 4 步：倒序更新容量2

繼續倒序處理容量 c=2：不選菠蘿保留舊值 dp\[2\]=5；選入菠蘿則讀取邊界 dp\[2-2\]=dp\[0\]=0，加 11 得 11。取較大值將 dp\[2\] 更新為 11（迴屬本輪 i=2）。正因為倒序到此刻才覆蓋 dp\[2\]，此前計算容量 4 時才能讀到未被覆蓋的舊值 dp\[2\]=5；若正序先將 dp\[2\] 改為 11，容量 4 就會錯算成 11+11=22。

<details><summary>本步完整狀態</summary><p>背包容量 4，當前倒序處理第二件物品菠蘿（i=2，重 2 值 11）。單行 dp[0..4] = [0, 5, 11, 16, 16]：容量 2、3、4 已更新為本輪 i=2 的結果（分別為 11、16、16）；僅剩容量 1 仍為上一輪 i=1 的舊狀態 5；容量 0 為邊界有效 0。</p><table><caption>單行dp：各容量的當前值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；上一輪i=1，僅考慮蘋果，尚未被本輪覆蓋</td></tr><tr><th scope="row">2</th><td>11，已計算；本輪i=2，考慮蘋果與菠蘿</td></tr><tr><th scope="row">3</th><td>16，已計算；本輪i=2，考慮蘋果與菠蘿</td></tr><tr><th scope="row">4</th><td>16，已計算；本輪i=2，考慮蘋果與菠蘿</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">前2件物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>11，已計算</td><td>16，已計算</td><td>16，已計算</td></tr><tr><th scope="row">前3件物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-415"></a>

## 第 5 步：處理裝不下菠蘿的容量1

最後處理容量 c=1：由於菠蘿重量 2 大於容量 1，無法裝入菠蘿，只能沿用上一輪不選菠蘿的值 dp\[1\]=5。雖然 dp\[1\] 的數值依然是 5，但該容量已完成第二輪（i=2）的判斷，狀態迴屬由上一輪 i=1 推進為本輪 i=2（數值不變不等於所屬輪次未變）。

<details><summary>本步完整狀態</summary><p>背包容量 4，當前倒序處理第二件物品菠蘿（i=2，重 2 值 11）。單行 dp[0..4] = [0, 5, 11, 16, 16]：容量 1 雖數值仍為 5，但已完成本輪判斷並迴屬 i=2；至此容量 1 至 4 全部為本輪 i=2（考慮蘋果與菠蘿）的有效結果，容量 0 為邊界有效 0。</p><table><caption>單行dp：各容量的當前值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；本輪i=2，考慮蘋果與菠蘿</td></tr><tr><th scope="row">2</th><td>11，已計算；本輪i=2，考慮蘋果與菠蘿</td></tr><tr><th scope="row">3</th><td>16，已計算；本輪i=2，考慮蘋果與菠蘿</td></tr><tr><th scope="row">4</th><td>16，已計算；本輪i=2，考慮蘋果與菠蘿</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">前2件物品</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>16，已計算</td></tr><tr><th scope="row">前3件物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-416"></a>

## 第 6 步：本輪結束，準備下一輪

第二輪（i=2，菠蘿）的所有容量均已更新完畢，單行 dp\[0..4\] = \[0, 5, 11, 16, 16\] 完整儲存前兩件物品的解。本幀沒有新增計算，將容量 1 至 4 的格子由綠色改標為藍色，使整行統一為藍色，表示這組 i=2 的結果將在下一輪處理第三件物品西瓜（i=3）時充當舊狀態；西瓜尚未開始處理。

<details><summary>本步完整狀態</summary><p>背包容量 4，第二件物品菠蘿（i=2）所在輪次已全部完成。單行 dp[0..4] = [0, 5, 11, 16, 16] 儲存前兩件物品（蘋果與菠蘿）的最大價值，整行轉作下一輪的舊狀態；第三件物品西瓜（重 3 值 15）尚未處理，因此 dp[4]=16 只是前兩件物品的區域性結果，並非三件物品的最終答案 20。</p><table><caption>單行dp：各容量的當前值與所屬輪</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效狀態與輪次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，邊界有效，各輪均為0</td></tr><tr><th scope="row">1</th><td>5，已計算；本輪i=2，考慮蘋果與菠蘿；下一輪將作為舊狀態</td></tr><tr><th scope="row">2</th><td>11，已計算；本輪i=2，考慮蘋果與菠蘿；下一輪將作為舊狀態</td></tr><tr><th scope="row">3</th><td>16，已計算；本輪i=2，考慮蘋果與菠蘿；下一輪將作為舊狀態</td></tr><tr><th scope="row">4</th><td>16，已計算；本輪i=2，考慮蘋果與菠蘿；下一輪將作為舊狀態</td></tr></tbody></table><table><caption>二維對照表：各子問題的計算進度</caption><thead><tr><th scope="col">可選物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td><td>0，邊界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，邊界有效</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td><td>5，已計算</td></tr><tr><th scope="row">前2件物品</th><td>0，邊界有效</td><td>5，已計算</td><td>11，已計算</td><td>16，已計算</td><td>16，已計算</td></tr><tr><th scope="row">前3件物品</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

## 結果

第二輪（i=2，菠蘿）倒序更新結束後，單行陣列為 dp = \[0, 5, 11, 16, 16\]，其中 dp\[4\] = 16 僅代表前兩件物品（蘋果與菠蘿）在容量 4 下的最大價值，是中間輪次的區域性結果；第三件物品西瓜（重 3、值 15）尚未處理，不能將 16 誤認為三件物品完整問題的最終答案 20。
