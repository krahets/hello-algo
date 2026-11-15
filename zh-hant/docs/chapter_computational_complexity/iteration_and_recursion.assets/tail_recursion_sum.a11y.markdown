<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 9b444457caa55565acabc5c9e4a871d675a5d8a8f9a062148ce27eeb2d6bcaab -->

# 尾遞迴求和

用累加器在遞迴呼叫前完成加法，返回時直接傳回結果。

## 結構與關係

圖中函式寫作recur(n,res)，正文程式碼名為tail\_recur；兩者表示相同的累加器過程。圖上展示7行返回，不表示任意n都恰好呼叫7層。

<table><caption>圖中向下呼叫時的累加器</caption><thead><tr><th scope="col">當前參數k</th><th scope="col">已累計res</th></tr></thead><tbody><tr><th scope="row">n</th><td>0</td></tr><tr><th scope="row">n−1</th><td>n</td></tr><tr><th scope="row">中間呼叫</th><td>省略</td></tr><tr><th scope="row">3</th><td>n+…+5+4</td></tr><tr><th scope="row">2</th><td>n+…+5+4+3</td></tr><tr><th scope="row">1</th><td>n+…+5+4+3+2</td></tr><tr><th scope="row">0</th><td>n+…+5+4+3+2+1，完整總和</td></tr></tbody></table>

<a id="source-23"></a>

從recur(n,0)出發，每層在遞迴呼叫前先將當前參數k併入累加器res，再呼叫recur(k−1,res+k)向下傳遞。當k=1時，res還差最後一項1；再呼叫一次進入基本情況k=0時，res已累加成完整總和n+…+1並直接返回。回傳階段每層只原樣轉發下層返回值，不再做額外加法。

## 結果

只有執行環境實際支持並啟用尾遞迴最佳化時，才能複用堆疊幀使空間複雜度降為O(1)；若未最佳化，堆疊空間仍為O(n)。Python預設不支持尾遞迴最佳化。
