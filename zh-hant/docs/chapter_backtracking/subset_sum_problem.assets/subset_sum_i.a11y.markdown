<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 8aac7702b2e4ba3b7b2c8f9c94bd6f1702382d28d05c8dda7dd55c7b8a1acd0a -->

# 子集和 I：餘額迴零與順序剪枝

從目標 9 起逐層扣減候選，結合 start=i 與越界 break，輸出 \[3, 3, 3\] 和 \[4, 5\]。

## 問題與輸入

輸入為已升序排列的正整數陣列 choices = \[3, 4, 5\]（索引 0、1、2）與初始目標 target = 9，元素允許重複選取，組合不區分順序。圖中圓節點內的數字表示剩餘目標餘額（9 減去當前前綴和），減至 0 時即命中合法子集。

## 結構與關係

每輪從起始索引 start 起列舉候選 choices\[i\] 並從餘額中減去它；餘額迴 0 時記錄當前組合並返回。向下遞迴傳遞 start = i，既允許重複選取當前元素，又跳過更早索引（圖中黑剪刀所示的順序剪枝）。

由於候選已升序排列，在允許範圍 i &gt;= start 內一旦遇到第一個大於當前餘額的候選（相減後小於 0），程式碼直接 break 跳出本輪迴圈，其後更大的候選一併跳過，不會逐個遞迴進入圖中紅剪刀畫出的越界分支。

<table><caption>按字首查詢餘額與選擇限制</caption><thead><tr><th scope="col">當前字首</th><th scope="col">剩餘目標</th><th scope="col">可繼續選擇</th><th scope="col">圖中限制或終止情況</th><th scope="col">實際後續</th></tr></thead><tbody><tr><th scope="row">[]</th><td>9</td><td>3、4、5</td><td>無</td><td>選擇後餘額分別為 6、5、4</td></tr><tr><th scope="row">[3]</th><td>6</td><td>3、4、5</td><td>無</td><td>選擇後餘額分別為 3、2、1</td></tr><tr><th scope="row">[3,3]</th><td>3</td><td>3</td><td>4、5 越界</td><td>選 3 到 0；遇 4 時 break</td></tr><tr><th scope="row">[3,3,3]</th><td>0</td><td>無</td><td>不再選擇</td><td>記錄 [3,3,3]</td></tr><tr><th scope="row">[3,4]</th><td>2</td><td>無</td><td>3 為更早索引；4、5 越界</td><td>從 4 開始即 break</td></tr><tr><th scope="row">[3,5]</th><td>1</td><td>無</td><td>3、4 為更早索引；5 越界</td><td>從 5 開始即 break</td></tr><tr><th scope="row">[4]</th><td>5</td><td>4、5</td><td>3 為更早索引</td><td>選 4 到 1；選 5 到 0</td></tr><tr><th scope="row">[4,4]</th><td>1</td><td>無</td><td>後續未在圖中展開</td><td>按程式碼規則，從 4 開始即 break</td></tr><tr><th scope="row">[4,5]</th><td>0</td><td>無</td><td>不再選擇</td><td>記錄 [4,5]</td></tr><tr><th scope="row">[5]</th><td>4</td><td>無</td><td>3、4 為更早索引；5 越界</td><td>從 5 開始即 break</td></tr></tbody></table>

<a id="source-360"></a>

同時約束剩餘餘額與非遞減起始索引 start = i，使每種可行組合只生成一次，且遇到首個大於餘額的候選即 break。

## 結果

順序剪枝（start = i）與升序越界剪枝（break）配合後，搜尋樹僅輸出 \[3, 3, 3\] 與 \[4, 5\] 兩個不重複解。
