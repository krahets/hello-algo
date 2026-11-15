<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b3a19896e82da117d4532e6b960f43153aea5548f4a3cbbaf3c4a7c394ef6f86 -->

# 排序演算法對比

對比九種主流排序演算法的時間複雜度、空間複雜度與四項特性，結合實現條件與資料特徵選擇演算法。

## 問題與輸入

圖底部圖例給出各複雜度參數的含義：n 為資料量大小；桶排序中 k 為桶數量；計數排序中 m 為資料範圍；基數排序中 k 為最大位數，資料為 b 進位制。不同演算法行中的符號 k 代表不同物理量，閱讀時需按行區分。

右側四項特性評價維度分別為：“穩定性”（相等元素排序後是否保持原有相對先後次序）、“就地性”（是否原地重排而無須與輸入規模相當的額外輔助陣列，遞迴呼叫堆疊仍計入空間複雜度）、“自適應性”（能否利用輸入已有的有序程度提前減少計算量）以及“基於比較”（依賴元素間大小比較還是利用鍵值分佈/數位統計）。

## 結構與關係

九種演算法按左側括弧分為走訪排序、分治排序和線性排序三類。各項精確指標見對照表；單元格括號內的“優、中、差”忠實對映原圖底色評級，並非所有工程場景下的絕對優劣。

泡沫排序的最佳時間 O(n) 與“自適應”特性，基於“某輪未發生交換即提前結束”的最佳化實現。快速排序的最差空間複雜度 O(log n)，基於“每輪只遞迴較短子陣列、用迴圈處理較長子陣列”的尾遞迴/堆疊深度最佳化實現；未做該最佳化的普通遞迴實現最差堆疊空間為 O(n)。

桶排序標為“穩定”，前提是桶內排序採用穩定排序演算法；其最佳與平均時間 O(n+k) 要求桶內排序的總開銷保持線性（例如資料均勻分佈且桶數隨 n 增長，使每桶預期僅含常數個元素，僅分佈均勻但桶數過少並不足夠）。若所有元素落入同一桶且桶內採用平方階排序，最差時間會退化到 O(n²)。

計數排序 O(n+m) 受資料範圍 m 制約；基數排序 O(nk) 受最大位數 k 與進位制 b 制約。三類線性排序對可處理的資料型別與取值範圍均有前置要求，不能把分類標籤 O(n) 當作無條件成立的線性時間保證。

<table><caption>圖中分類標籤</caption><thead><tr><th scope="col">型別</th><th scope="col">圖示覆雜度標籤</th><th scope="col">演算法</th></tr></thead><tbody><tr><th scope="row">走訪排序</th><td>O(n²)</td><td>選擇、冒泡、插入</td></tr><tr><th scope="row">分治排序</th><td>O(n log n)</td><td>快速、合併、堆積</td></tr><tr><th scope="row">線性排序</th><td>O(n)</td><td>桶、計數、基數</td></tr></tbody></table>

<table><caption>九種排序演算法：指標及原圖評級；成立條件見正文</caption><thead><tr><th scope="col">演算法</th><th scope="col">最佳時間</th><th scope="col">平均時間</th><th scope="col">最差時間</th><th scope="col">最差空間</th><th scope="col">穩定性</th><th scope="col">就地性</th><th scope="col">自適應性</th><th scope="col">是否基於比較</th></tr></thead><tbody><tr><th scope="row">選擇排序</th><td>O(n²)（差）</td><td>O(n²)（差）</td><td>O(n²)（差）</td><td>O(1)（優）</td><td>非穩定（差）</td><td>原地（優）</td><td>非自適應（中）</td><td>比較（中）</td></tr><tr><th scope="row">泡沫排序</th><td>O(n)（優）</td><td>O(n²)（差）</td><td>O(n²)（差）</td><td>O(1)（優）</td><td>穩定（優）</td><td>原地（優）</td><td>自適應（優）</td><td>比較（中）</td></tr><tr><th scope="row">插入排序</th><td>O(n)（優）</td><td>O(n²)（差）</td><td>O(n²)（差）</td><td>O(1)（優）</td><td>穩定（優）</td><td>原地（優）</td><td>自適應（優）</td><td>比較（中）</td></tr><tr><th scope="row">快速排序</th><td>O(n log n)（優）</td><td>O(n log n)（優）</td><td>O(n²)（差）</td><td>O(log n)（優）</td><td>非穩定（差）</td><td>原地（優）</td><td>非自適應（中）</td><td>比較（中）</td></tr><tr><th scope="row">合併排序</th><td>O(n log n)（優）</td><td>O(n log n)（優）</td><td>O(n log n)（優）</td><td>O(n)（差）</td><td>穩定（優）</td><td>非原地（差）</td><td>非自適應（中）</td><td>比較（中）</td></tr><tr><th scope="row">堆積排序</th><td>O(n log n)（優）</td><td>O(n log n)（優）</td><td>O(n log n)（優）</td><td>O(1)（優）</td><td>非穩定（差）</td><td>原地（優）</td><td>非自適應（中）</td><td>比較（中）</td></tr><tr><th scope="row">桶排序</th><td>O(n+k)（優）</td><td>O(n+k)（優）</td><td>O(n²)（差）</td><td>O(n+k)（差）</td><td>穩定（優）</td><td>非原地（差）</td><td>非自適應（中）</td><td>非比較（中）</td></tr><tr><th scope="row">計數排序</th><td>O(n+m)（優）</td><td>O(n+m)（優）</td><td>O(n+m)（優）</td><td>O(n+m)（差）</td><td>穩定（優）</td><td>非原地（差）</td><td>非自適應（中）</td><td>非比較（中）</td></tr><tr><th scope="row">基數排序</th><td>O(nk)（優）</td><td>O(nk)（優）</td><td>O(nk)（差）</td><td>O(n+b)（差）</td><td>穩定（優）</td><td>非原地（差）</td><td>非自適應（中）</td><td>非比較（中）</td></tr></tbody></table>

<a id="source-240"></a>

表中時間複雜度按最佳、平均、最差分為三列，空間複雜度僅列最差情況；穩定性、就地性、自適應性與是否基於比較分別成列。原圖圖例以淺綠表示“優”、淺藍表示“中”、紫灰表示“差”，下方資料表已將單元格底色轉化為括號內的文字評級（注意基數排序的最佳、平均、最差時間公式均為 O(nk)，但原圖將最佳與平均塗為淺綠“優”、最差塗為紫灰“差”，表中忠實保留原圖評級）。

## 結果

排序演算法的設計存在取捨，圖中沒有任何一種演算法在所有指標上都評為“優”。實際選用時應綜合資料規模、預估有序程度、取值範圍、記憶體限制及穩定性需求。
