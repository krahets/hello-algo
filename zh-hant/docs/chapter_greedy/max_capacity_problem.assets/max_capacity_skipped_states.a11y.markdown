<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: e2e3de70a3bc7aae1818c819d7ffba05ee12536869ba3b3a2dfa2b07bff6b7f6 -->

# 移動短板導致被跳過的狀態

雙指標從 cap\[0, 7\] 向內移動左短板至 cap\[1, 7\] 時，一次性跳過了仍以索引 0 為左板、右端為 6 至 1 的六個更窄狀態。

## 問題與輸入

在高度陣列 ht = \[3, 8, 5, 2, 7, 7, 3, 4\] 的初始狀態 \[0, 7\] 下，左板 i = 0（高 3）為短板，右板 j = 7（高 4）為長板，初始容量為 3 × 7 = 21。本圖從狀態空間剪枝角度說明：為何貪婪演算法記錄 21 並將左短板從 i = 0 移到 i = 1 後，無需再檢驗左端固定為 0 的其餘組合。

容器容量按 cap\[i, j\] = min(ht\[i\], ht\[j\]) × (j - i) 計算，水高取兩端板高較小值，寬度為索引差 j - i。

## 結構與關係

上排展示雙指標從初始狀態 cap\[0, 7\]（左板高 3、右板高 4、寬 7，容量 21）執行“移動短板”轉移到 cap\[1, 7\]。演算法在移動前已記錄當前最大容量 21。

下排“跳過的狀態”列出此次移動繞過的六個狀態：cap\[0, 6\]、cap\[0, 5\]、cap\[0, 4\]、cap\[0, 3\]、cap\[0, 2\]、cap\[0, 1\]。這六個狀態全部保留高度為 3 的原左短板 i = 0，相當於固定左端 i = 0 而將右端 j 從 6 依次向內移到 1：由於受左短板限制，它們的水高至多為 3，而底寬（6 至 1）全部嚴格小於 7，因此六個狀態的容量必然全部小於已記錄的 21，安全剪枝不會漏掉最優解。

第二張表按圖示順序列出六個跳過狀態的水高、寬度與推導容量（依次為 18、15、12、6、6、3）。其中當右端移到索引 3 時，因右板高度 ht\[3\] = 2 比左板高度 3 更矮，\[0, 3\] 的水高進一步降為 2（寬度 3，容量 6）；其餘五個跳過狀態的水高均為 3。注意圖面僅標註 cap\[i, j\] 狀態名，具體板高與容量數值由正文示例陣列 ht 結合公式推算。

<table><caption>輸入隔板高度；索引從0開始</caption><thead><tr><th scope="col">索引</th><th scope="col">高度</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>8</td></tr><tr><th scope="row">2</th><td>5</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>7</td></tr><tr><th scope="row">5</th><td>7</td></tr><tr><th scope="row">6</th><td>3</td></tr><tr><th scope="row">7</th><td>4</td></tr></tbody></table>

<table><caption>六個跳過狀態；容量由高度陣列按公式計算</caption><thead><tr><th scope="col">端點 [i,j]</th><th scope="col">水高 min(ht[i],ht[j])</th><th scope="col">寬度 j-i</th><th scope="col">容量</th></tr></thead><tbody><tr><th scope="row">[0,6]</th><td>3</td><td>6</td><td>18</td></tr><tr><th scope="row">[0,5]</th><td>3</td><td>5</td><td>15</td></tr><tr><th scope="row">[0,4]</th><td>3</td><td>4</td><td>12</td></tr><tr><th scope="row">[0,3]</th><td>2</td><td>3</td><td>6</td></tr><tr><th scope="row">[0,2]</th><td>3</td><td>2</td><td>6</td></tr><tr><th scope="row">[0,1]</th><td>3</td><td>1</td><td>3</td></tr></tbody></table>

<a id="source-469"></a>

## 固定左短板 i = 0 的六個更窄容器容量均小於 21

記錄 cap\[0, 7\] = 21 並右移左短板至 i = 1 後，左端仍固定在 i = 0、右端 j 取 6 至 1 的六個狀態寬度縮短且水高不超過左短板高度 3，容量必小於 21。

## 結果

被跳過的六個狀態 cap\[0, 6\] 至 cap\[0, 1\] 全部固定左短板 i = 0（高 3），寬度均小於 7 且水高至多為 3，推導容量（18、15、12、6、6、3）全部嚴格小於已記錄的 cap\[0, 7\] = 21，因此跳過它們不會丟失全域性最優解。
