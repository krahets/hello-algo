<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: dd934ebbfa8b0a96efffe66bf2d1b27f3535fb3b8d6123e0b142fbe5b23c3c39 -->

# 零錢兌換 II：金額 5 共有 4 種硬幣組合

使用可重複選取的面值 1、2、5 硬幣恰好湊出目標金額 5，不計取幣順序時共有 4 種不同組合。

## 問題與輸入

零錢兌換問題 II 同樣給定面值為 \[1, 2, 5\] 的 3 種無限量硬幣，但本示例的目標金額設為 amt = 5，且求解目標不再是“最少硬幣枚數”，而是統計“恰好湊出目標金額 5 的硬幣組合數量”（只改變硬幣排列順序而各面值枚數相同的方案視為同一種組合）。

## 結構與關係

畫面左上方表格列出編號 1 至 3 對應的硬幣面值 1、2、5，三行沒有背景高亮；表格右側的一條粗灰色向右箭頭指向錢袋，錢袋上方標註“目標金額 amt = 5”。

畫面下半部分在“硬幣組合方案：”右側自上而下逐行列出 4 種具體的硬幣加法算式，下方結果框內左上位置給出“硬幣組合數量：4”：第 1 行是 5 枚 1 元（1 + 1 + 1 + 1 + 1）；第 2 行是 3 枚 1 元加 1 枚 2 元（1 + 1 + 1 + 2）；第 3 行是 1 枚 1 元加 2 枚 2 元（1 + 2 + 2）；第 4 行是單獨 1 枚 5 元（5）。

<table><caption>可選硬幣</caption><thead><tr><th scope="col">編號i</th><th scope="col">面值</th></tr></thead><tbody><tr><td>1</td><td>1</td></tr><tr><td>2</td><td>2</td></tr><tr><td>3</td><td>5</td></tr></tbody></table>

<table><caption>湊成金額5的全部組合</caption><thead><tr><th scope="col">方案</th><th scope="col">面值1數量</th><th scope="col">面值2數量</th><th scope="col">面值5數量</th></tr></thead><tbody><tr><td>1+1+1+1+1</td><td>5</td><td>0</td><td>0</td></tr><tr><td>1+1+1+2</td><td>3</td><td>1</td><td>0</td></tr><tr><td>1+2+2</td><td>1</td><td>2</td><td>0</td></tr><tr><td>5</td><td>0</td><td>0</td><td>1</td></tr></tbody></table>

<a id="source-425"></a>

## 列出湊出目標金額 5 的 4 種硬幣組合

按所含較大面值硬幣的數量分類列舉：若使用面值 5，只能單取 1 枚 5；若不使用面值 5，則面值 2 可取 2 枚（配 1 枚 1）、1 枚（配 3 枚 1）或 0 枚（配 5 枚 1）。四種方案的硬幣面值總和均為 5，合計組合數量為 4。

## 結果

用面值 1、2、5 的硬幣湊出目標金額 5，共有 4 種不同的無序硬幣組合。
