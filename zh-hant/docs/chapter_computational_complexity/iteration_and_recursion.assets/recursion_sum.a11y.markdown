<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: ffee207c9cda59bfbfd870dc99cf02ca9789074c831bab19994d036d12967a58 -->

# 普通遞迴求和

先把求和問題縮小到基本情況，再在返回時逐層相加。

<table><caption>圖中呼叫與返回表示式</caption><thead><tr><th scope="col">呼叫</th><th scope="col">返回表示式</th></tr></thead><tbody><tr><th scope="row">recur(n)</th><td>n+((n−1)+…+2+1)</td></tr><tr><th scope="row">recur(n−1)</th><td>(n−1)+((n−2)+…+2+1)</td></tr><tr><th scope="row">中間呼叫</th><td>省略</td></tr><tr><th scope="row">recur(4)</th><td>4+(3+2+1)</td></tr><tr><th scope="row">recur(3)</th><td>3+(2+1)</td></tr><tr><th scope="row">recur(2)</th><td>2+(1)</td></tr><tr><th scope="row">recur(1)</th><td>1，終止條件</td></tr></tbody></table>

<a id="source-21"></a>

遞入階段，從recur(n)起逐層呼叫recur(n−1)，將參數一路縮小到終止條件recur(1)。回傳階段，recur(1)直接返回1；recur(2)收到下層結果1後計算2+1=3，recur(3)收到3後計算3+3=6，依次向上累加直到最初呼叫。因為每層必須先拿到子呼叫的返回值，才能把本層參數加進去，所以求和加法都在返回階段完成。

## 結果

最初呼叫recur(n)最終返回1+2+…+n。圖中省略號代表中間層呼叫，各層依賴關係不變。
