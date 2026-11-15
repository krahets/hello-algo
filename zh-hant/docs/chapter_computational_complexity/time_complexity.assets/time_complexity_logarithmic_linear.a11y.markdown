<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 70e97bfc308961cc429db36d15f8f06e8e6b09dc4a056cb5e93a14bc10c77ba0 -->

# 分治樹的分層工作量

子問題數量加倍、單個工作量減半，使每層總工作量保持相同。

## 問題與輸入

最底層示意畫出4個框並用省略號間隔，代表全部n個葉子，不表示僅有4個葉子。

<table><caption>圖中各層操作總數</caption><thead><tr><th scope="col">層級</th><th scope="col">子問題數</th><th scope="col">單個子問題運算元</th><th scope="col">本層總數</th></tr></thead><tbody><tr><th scope="row">根層</th><td>1</td><td>n</td><td>n</td></tr><tr><th scope="row">下一層</th><td>2</td><td>n/2</td><td>n</td></tr><tr><th scope="row">再下一層</th><td>4</td><td>n/4</td><td>n</td></tr><tr><th scope="row">中間層</th><td>繼續加倍</td><td>繼續減半</td><td>n</td></tr><tr><th scope="row">葉層</th><td>n</td><td>1</td><td>n</td></tr></tbody></table>

<a id="source-31"></a>

總運算元由“每層工作量n”與“總層數log₂n+1”相乘得到，共n(log₂n+1)次。自頂向下每分一層，子問題數量加倍，但單個子問題的運算元同時減半：第d層（根為第0層）有2^d個子問題、每個運算元為n/2^d，兩者相乘恆為n。如此二分直到規模為1的葉層（n個葉子、每個計1次），共經歷log₂n+1層。

## 結果

全部log₂n+1層的操作總數為n(log₂n+1)=n log₂n+n，時間複雜度為O(n log n)。
