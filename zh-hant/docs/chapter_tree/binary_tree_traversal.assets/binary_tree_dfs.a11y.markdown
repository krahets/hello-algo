<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b659b506fed16aa1296da9797fb6d549fdecabcc513d0715cc138a6c05474a05 -->

# 二元樹的三種深度優先走訪

沿同一深度優先遞迴軌跡，按記錄當前節點值的時機區分前序、中序與後序走訪。

## 結構與關係

環繞樹外圍的虛線表示遞迴呼叫與返回的深度優先軌跡，並非樹的邊；節點旁的橙、藍、紫圓點分別對應左遞迴前、左右遞迴之間、右遞迴後三個記錄時機。

<table><caption>三種走訪的記錄時機與輸出</caption><thead><tr><th scope="col">走訪</th><th scope="col">記錄當前節點的時機</th><th scope="col">訪問優先順序</th><th scope="col">輸出序列</th></tr></thead><tbody><tr><th scope="row">前序</th><td>左遞迴之前</td><td>根 → 左子樹 → 右子樹</td><td>1, 2, 4, 5, 3, 6, 7</td></tr><tr><th scope="row">中序</th><td>左遞迴之後、右遞迴之前</td><td>左子樹 → 根 → 右子樹</td><td>4, 2, 5, 1, 6, 3, 7</td></tr><tr><th scope="row">後序</th><td>右遞迴之後</td><td>左子樹 → 右子樹 → 根</td><td>4, 5, 2, 6, 7, 3, 1</td></tr></tbody></table>

<a id="source-98"></a>

遞迴都先處理左子樹再處理右子樹，遇到空節點即返回。記錄當前節點發生在左遞迴之前為前序，在左、右兩個遞迴之間為中序，在右遞迴之後為後序。

## 結果

三種走訪序列見表；本圖是普通二元樹（根 1 的左子節點為 2），三種走訪不要求滿足二元搜尋樹的大小關係。
