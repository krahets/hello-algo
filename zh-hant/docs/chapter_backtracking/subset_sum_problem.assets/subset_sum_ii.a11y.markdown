<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 70ec23710aa5c8cf8a49c61a21e1ac0079bef9a3b39724e8d84b2c8ad80e5953 -->

# 子集和 II 的四種剪枝

對有序陣列 \[4, 4̂, 5\] 搜尋和為 9 的子集，綜合四種剪枝條件後只保留唯一解 \[4, 5\]。

## 問題與輸入

輸入陣列已排序為 choices = \[4, 4̂, 5\]（索引依次為 0、1、2，4̂ 的數值仍為 4，僅區分第二個 4 的身份），目標 target = 9。圓圈內的數字表示減法後的剩餘 target（餘額）。

## 結構與關係

每個索引最多用一次，子集不區分順序。選中索引 i 後，下一輪從 start = i + 1 開始，同時實現兩項規則：既不回頭選更早索引（剪枝二），也不重用當前索引（剪枝三）。

根處跳過第二個 4 是同一輪值去重（剪枝四）；進入 \[4\] 後是新的一輪（start = 1），另一個 4（4̂）的索引尚未使用，仍可選它。字首 \[4, 4̂\] 餘額為 1，向後只剩 5；它超過餘額（剪枝一），直接結束迴圈。

圖中四種剪刀對應表一的四類別排除情形，程式碼並不會實際遞迴進入被剪分支；其中 \[4, 4̂\] 下再選首個 4 在圖中標為反序（剪枝二），它同時也已用過。

<table><caption>四種剪枝的含義</caption><thead><tr><th scope="col">圖例</th><th scope="col">排除情形</th></tr></thead><tbody><tr><th scope="row">剪枝一（紅）</th><td>選入後元素和超過9，即剩餘 target 為負</td></tr><tr><th scope="row">剪枝二（藍）</th><td>回到較早索引，產生不同順序的重複組合</td></tr><tr><th scope="row">剪枝三（紫）</th><td>再次使用已選的同一個陣列索引</td></tr><tr><th scope="row">剪枝四（青）</th><td>同一輪再次嘗試數值相同的候選</td></tr></tbody></table>

<table><caption>圖中各字首的候選與處置</caption><thead><tr><th scope="col">當前字首</th><th scope="col">剩餘目標</th><th scope="col">候選</th><th scope="col">結果或剪枝原因</th></tr></thead><tbody><tr><th scope="row">[]</th><td>9</td><td>4</td><td>保留，餘額 5</td></tr><tr><th scope="row">[]</th><td>9</td><td>4̂</td><td>同輪重複值，剪枝四</td></tr><tr><th scope="row">[]</th><td>9</td><td>5</td><td>保留，餘額 4</td></tr><tr><th scope="row">[4]</th><td>5</td><td>4</td><td>重用當前索引，剪枝三</td></tr><tr><th scope="row">[4]</th><td>5</td><td>4̂</td><td>不同索引，可選，餘額 1</td></tr><tr><th scope="row">[4]</th><td>5</td><td>5</td><td>餘額 0，記錄 [4,5]</td></tr><tr><th scope="row">[4,4̂]</th><td>1</td><td>4</td><td>回到更早索引，圖示剪枝二</td></tr><tr><th scope="row">[4,4̂]</th><td>1</td><td>4̂</td><td>重用當前索引，剪枝三</td></tr><tr><th scope="row">[4,4̂]</th><td>1</td><td>5</td><td>超過餘額，剪枝一</td></tr><tr><th scope="row">[5]</th><td>4</td><td>4、4̂</td><td>回到更早索引，剪枝二</td></tr><tr><th scope="row">[5]</th><td>4</td><td>5</td><td>重用當前索引，剪枝三</td></tr></tbody></table>

<a id="source-362"></a>

根處跳過同輪的第二個 4，而字首 \[4\] 後開啟新一輪，仍可選不同索引的 4̂；唯一成功路徑是先選 4 再選 5。

## 結果

四種剪枝共同作用後，唯一使剩餘 target 迴零的路徑是 \[4, 5\]。同輪去重剪掉了根處的 4̂，但不妨礙在字首 \[4\] 後的新一輪選用不同索引的 4̂。
