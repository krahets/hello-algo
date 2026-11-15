<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 25068d56810efd23476b0951e0fddc8c5d8c5dcfdd3b23c88b3a4e38d43654d6 -->

# 迴圈結構與操作次數

比較單次操作、單層迴圈和雙層迴圈的工作量增長。

<table><caption>迴圈結構的工作量</caption><thead><tr><th scope="col">結構</th><th scope="col">基礎操作次數</th><th scope="col">時間複雜度</th></tr></thead><tbody><tr><th scope="row">無迴圈</th><td>1</td><td>常數階O(1)</td></tr><tr><th scope="row">單層迴圈n次</th><td>n</td><td>線性階O(n)</td></tr><tr><th scope="row">雙層巢狀，各n次</th><td>n×n=n²</td><td>平方階O(n²)</td></tr></tbody></table>

<a id="source-28"></a>

圖中每個小方塊代表1次基礎操作，外圍迴圈框表示重複執行的範圍。無迴圈結構只執行1次操作；單層迴圈將基礎操作重複n次；雙層巢狀迴圈並非兩個迴圈先後相加，而是外層每執行1輪，內層都要完整執行n次，因此總操作次數按乘法計為n×n=n²。

## 結果

本圖內迴圈次數每輪固定為n，雙層總次數是n×n，不能把它算成兩層次數相加。
