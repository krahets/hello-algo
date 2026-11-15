<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 4f224c55e85d07b411cb822f79664f6e4f69fd741d52099332b0dcfa9a548887 -->

# 斐波那契遞迴樹

遞迴分支重複求解同名子問題，說明樸素遞迴為何產生大量計算。

## 結構與關係

這是一般n的部分展開示意；較小n會較早達到基本情況，不能機械展開到圖中所有符號層。

<table><caption>圖中各層呼叫；同名項表示不同調用</caption><thead><tr><th scope="col">層</th><th scope="col">呼叫節點（圖中從左到右）</th><th scope="col">數量</th></tr></thead><tbody><tr><th scope="row">1</th><td>f(n)</td><td>1</td></tr><tr><th scope="row">2</th><td>f(n−1)、f(n−2)</td><td>2</td></tr><tr><th scope="row">3</th><td>f(n−2)、f(n−3)、f(n−3)、f(n−4)</td><td>4</td></tr><tr><th scope="row">4</th><td>f(n−3)、f(n−4)、f(n−4)、f(n−5)、f(n−4)、f(n−5)、f(n−5)、f(n−6)</td><td>8</td></tr><tr><th scope="row">5</th><td>每個上一層節點再分出兩個省略號，後續呼叫未具體畫出</td><td>16個省略號</td></tr></tbody></table>

<a id="source-24"></a>

每個未達基本情況的節點f(k)，都會分出左子呼叫f(k−1)和右子呼叫f(k−2)。例如根f(n)在第2層的右子問題f(n−2)，與左子問題f(n−1)在第3層分出的左子問題f(n−2)，分屬兩條不同調用路徑，會各自獨立展開計算，不會自動合併或複用結果。

## 結果

圖中已展開層的節點數為1、2、4、8；實際分支到基本情況即停止，並非所有層始終翻倍。樸素遞迴的呼叫規模隨n呈指數增長。
