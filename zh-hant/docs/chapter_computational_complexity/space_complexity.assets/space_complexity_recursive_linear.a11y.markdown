<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b87f52c4238872e7a33c96b4850f5edbf056fdef6941a5866d9fcfe546d26635 -->

# 遞迴呼叫的堆疊空間

空間取決於同時未返回的呼叫數，逐層遞迴會積累堆疊幀。

## 結構與關係

圖中用return 0示意逐層返回；現版Python程式碼使用裸return（實際返回None，而非數值0）。此處分析的是呼叫堆疊幀佔用，返回值寫法的差異不影響空間複雜度結論。

<a id="source-35"></a>

遞入階段，linear\_recur(n)呼叫linear\_recur(n−1)，一路深入到基本情況linear\_recur(1)。由於外層呼叫必須等待內層返回才能結束，到達最深處時，呼叫堆疊中會同時保留linear\_recur(n)至linear\_recur(1)共n個未返回的堆疊幀。回傳階段從最深處逐層返回，每返回一層才釋放該層堆疊幀。

## 結果

空間複雜度按執行過程中的峰值記憶體計算：每層佔固定區域性空間，最深處n個同時駐留的堆疊幀使堆疊空間達到O(n)，後續逐層釋放不改變這一峰值。
