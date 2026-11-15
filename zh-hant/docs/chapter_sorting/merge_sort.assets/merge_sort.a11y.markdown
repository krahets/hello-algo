<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 43403e18b8d03ea611e954f611c5c073c8afbae19fb465550abb560d11a51491 -->

# 四元素合併排序的遞迴執行順序

先將左半 \[7,3\] 排成 \[3,7\]，再處理右半 \[2,6\]，最後合併為 \[2,3,6,7\]。

## 問題與輸入

本組輸入是四元素陣列 \[7,3,2,6\]，索引為 0 至 3。先遞迴處理左半，再處理右半，最後合併兩邊的有序結果。

## 結構與關係

圖中保留已經展開的子問題和返回結果，用來表示遞迴呼叫歷史；它們並非同一陣列在當前時刻的多個版本。長度為 1 的子陣列直接返回。

每幀只新增當前呼叫或合併結果，完整已顯示記錄可在該幀的表格中查詢。合併時逐次比較兩個有序子陣列的首個未取元素，取較小值；一邊取完後接上另一邊的剩餘元素。

<table><caption>固定輸入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>7</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>6</td></tr></tbody></table>

<a id="source-274"></a>

## 第 1 步：開始排序四個元素

對四元素陣列 \[7, 3, 2, 6\] 啟動合併排序，當前處於頂層呼叫，尚未展開左、右子問題。

<details><summary>本步完整狀態</summary><p>四元素合併排序處於頂層入口，尚未展開子問題。當前表只記錄完整輸入快照。</p><table><caption>當前已顯示的遞迴呼叫記錄</caption><thead><tr><th scope="col">子問題或結果</th><th scope="col">陣列</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">完整輸入</th><td>[7, 3, 2, 6]</td><td>劃分時的輸入快照</td></tr></tbody></table></details>

<a id="source-275"></a>

## 第 2 步：遞迴處理左半

按先左後右的遞迴次序，從頂層劃分並先進入左半子問題 \[7, 3\]；右半 \[2, 6\] 暫未展開。

<details><summary>本步完整狀態</summary><p>四元素合併排序正在處理左半 [7,3]，右半尚未展開；當前表保留已出現的呼叫記錄。</p><table><caption>當前已顯示的遞迴呼叫記錄</caption><thead><tr><th scope="col">子問題或結果</th><th scope="col">陣列</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">完整輸入</th><td>[7, 3, 2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">左半輸入</th><td>[7, 3]</td><td>劃分時的輸入快照</td></tr></tbody></table></details>

<a id="source-276"></a>

## 第 3 步：左半分出單元素 7

繼續劃分左半 \[7, 3\]，先遞入其左側單元素子陣列 \[7\]；長度為 1 的子陣列觸發遞迴終止條件並直接返回。

<details><summary>本步完整狀態</summary><p>左半已劃分出單元素 [7] 並直接返回，另一單元素 [3] 及右半尚未展開。當前表保留已出現的記錄。</p><table><caption>當前已顯示的遞迴呼叫記錄</caption><thead><tr><th scope="col">子問題或結果</th><th scope="col">陣列</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">完整輸入</th><td>[7, 3, 2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">左半輸入</th><td>[7, 3]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">單元素 7</th><td>[7]</td><td>單元素，直接返回</td></tr></tbody></table></details>

<a id="source-277"></a>

## 第 4 步：左半分出單元素 3

左側單元素 \[7\] 返回後，遞入左半的另一單元素子陣列 \[3\]；它同樣滿足終止條件並直接返回。

<details><summary>本步完整狀態</summary><p>左半的單元素 [7] 和 [3] 均已返回，準備合併左半；右半尚未展開。</p><table><caption>當前已顯示的遞迴呼叫記錄</caption><thead><tr><th scope="col">子問題或結果</th><th scope="col">陣列</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">完整輸入</th><td>[7, 3, 2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">左半輸入</th><td>[7, 3]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">單元素 7</th><td>[7]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 3</th><td>[3]</td><td>單元素，直接返回</td></tr></tbody></table></details>

<a id="source-278"></a>

## 第 5 步：左半合併為 \[3,7\]

左半的兩個單元素均已返回，將 \[7\] 與 \[3\] 比較合併為有序結果 \[3, 7\]，完成左半子問題的回溯返回。

<details><summary>本步完整狀態</summary><p>左半已合併為有序結果 [3,7]，右半尚未展開。當前表中的 [7,3] 是呼叫時的輸入快照。</p><table><caption>當前已顯示的遞迴呼叫記錄</caption><thead><tr><th scope="col">子問題或結果</th><th scope="col">陣列</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">完整輸入</th><td>[7, 3, 2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">左半輸入</th><td>[7, 3]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">單元素 7</th><td>[7]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 3</th><td>[3]</td><td>單元素，直接返回</td></tr><tr><th scope="row">左半返回結果</th><td>[3, 7]</td><td>有序合併結果</td></tr></tbody></table></details>

<a id="source-279"></a>

## 第 6 步：遞迴處理右半

左半返回有序結果 \[3, 7\] 後，頂層遞迴進入右半子問題 \[2, 6\]。

<details><summary>本步完整狀態</summary><p>左半已有序，當前進入右半 [2,6]；右半下方的單元素尚未展開。已顯示的結果和輸入快照見表。</p><table><caption>當前已顯示的遞迴呼叫記錄</caption><thead><tr><th scope="col">子問題或結果</th><th scope="col">陣列</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">完整輸入</th><td>[7, 3, 2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">左半輸入</th><td>[7, 3]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">右半輸入</th><td>[2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">單元素 7</th><td>[7]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 3</th><td>[3]</td><td>單元素，直接返回</td></tr><tr><th scope="row">左半返回結果</th><td>[3, 7]</td><td>有序合併結果</td></tr></tbody></table></details>

<a id="source-280"></a>

## 第 7 步：右半分出單元素 2

繼續劃分右半 \[2, 6\]，先遞入其左側單元素子陣列 \[2\]；單元素直接返回。

<details><summary>本步完整狀態</summary><p>左半已有序；右半分出的單元素 [2] 已返回，[6] 尚未展開。當前表保留已出現的記錄。</p><table><caption>當前已顯示的遞迴呼叫記錄</caption><thead><tr><th scope="col">子問題或結果</th><th scope="col">陣列</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">完整輸入</th><td>[7, 3, 2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">左半輸入</th><td>[7, 3]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">右半輸入</th><td>[2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">單元素 7</th><td>[7]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 3</th><td>[3]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 2</th><td>[2]</td><td>單元素，直接返回</td></tr><tr><th scope="row">左半返回結果</th><td>[3, 7]</td><td>有序合併結果</td></tr></tbody></table></details>

<a id="source-281"></a>

## 第 8 步：右半分出單元素 6

單元素 \[2\] 返回後，再遞入右半的右側單元素子陣列 \[6\]；它也滿足終止條件並直接返回。

<details><summary>本步完整狀態</summary><p>右半的單元素 [2] 與 [6] 均已返回，準備合併右半；左半有序結果已就緒。</p><table><caption>當前已顯示的遞迴呼叫記錄</caption><thead><tr><th scope="col">子問題或結果</th><th scope="col">陣列</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">完整輸入</th><td>[7, 3, 2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">左半輸入</th><td>[7, 3]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">右半輸入</th><td>[2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">單元素 7</th><td>[7]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 3</th><td>[3]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 2</th><td>[2]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 6</th><td>[6]</td><td>單元素，直接返回</td></tr><tr><th scope="row">左半返回結果</th><td>[3, 7]</td><td>有序合併結果</td></tr></tbody></table></details>

<a id="source-282"></a>

## 第 9 步：右半合併為 \[2,6\]

將右半已返回的兩個單元素 \[2\] 和 \[6\] 合併，得到右半的有序返回結果 \[2, 6\]。

<details><summary>本步完整狀態</summary><p>左半結果 [3,7] 與右半結果 [2,6] 均已就緒，準備頂層合併。</p><table><caption>當前已顯示的遞迴呼叫記錄</caption><thead><tr><th scope="col">子問題或結果</th><th scope="col">陣列</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">完整輸入</th><td>[7, 3, 2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">左半輸入</th><td>[7, 3]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">右半輸入</th><td>[2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">單元素 7</th><td>[7]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 3</th><td>[3]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 2</th><td>[2]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 6</th><td>[6]</td><td>單元素，直接返回</td></tr><tr><th scope="row">左半返回結果</th><td>[3, 7]</td><td>有序合併結果</td></tr><tr><th scope="row">右半返回結果</th><td>[2, 6]</td><td>有序合併結果</td></tr></tbody></table></details>

<a id="source-283"></a>

## 第 10 步：合併左右兩半

左右兩半均已返回，在頂層將 \[3, 7\] 與 \[2, 6\] 按首元素比較依次取出 2、3、6、7，合併得到最終有序陣列 \[2, 3, 6, 7\]。

<details><summary>本步完整狀態</summary><p>頂層合併已完成，四元素陣列升序。當前表保留全部輸入快照、單元素和合並結果。</p><table><caption>當前已顯示的遞迴呼叫記錄</caption><thead><tr><th scope="col">子問題或結果</th><th scope="col">陣列</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">完整輸入</th><td>[7, 3, 2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">左半輸入</th><td>[7, 3]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">右半輸入</th><td>[2, 6]</td><td>劃分時的輸入快照</td></tr><tr><th scope="row">單元素 7</th><td>[7]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 3</th><td>[3]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 2</th><td>[2]</td><td>單元素，直接返回</td></tr><tr><th scope="row">單元素 6</th><td>[6]</td><td>單元素，直接返回</td></tr><tr><th scope="row">左半返回結果</th><td>[3, 7]</td><td>有序合併結果</td></tr><tr><th scope="row">右半返回結果</th><td>[2, 6]</td><td>有序合併結果</td></tr><tr><th scope="row">頂層返回結果</th><td>[2, 3, 6, 7]</td><td>有序合併結果</td></tr></tbody></table></details>

## 結果

左半部分先完成劃分與合併得到 \[3, 7\]，右半部分隨後完成劃分與合併得到 \[2, 6\]；頂層最後依次取出 2、3、6、7，合成最終有序陣列 \[2, 3, 6, 7\]。本組十幀展示的是遞迴展開與回溯合併的完整呼叫軌跡，而非十次元素大小比較。
