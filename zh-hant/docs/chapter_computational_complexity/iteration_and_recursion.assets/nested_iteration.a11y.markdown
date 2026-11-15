<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 3f1293a265775f3929ade554811d422335c11a364f188efe98db0b3b2b29ac8f -->

# 雙層巢狀迴圈

每輪外迴圈都重新執行完整的內迴圈，決定任務總次數。

## 問題與輸入

i控制外迴圈，j控制內迴圈；本圖內外兩層都完整走訪1至n。

<a id="source-20"></a>

外迴圈先令i=1並判斷i≤n。若外層條件為真，則進入內迴圈並重置j=1，再判斷j≤n：為真時執行任務、令j+=1，並回到內層判斷j≤n；當j≤n為假時，內迴圈結束，流程令i+=1並回到外層判斷i≤n。只要外層條件仍為真，就會再次重置j=1開啟新一輪內迴圈；直到i≤n為假，整個流程才結束。

## 結果

外層每個i都完整對應內層j=1至n，任務共執行n×n=n²次。
