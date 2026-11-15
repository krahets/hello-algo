<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b8892fe1566cc69cc3428b1c60cfddd6c92239dc334ea7d82ce1fee457283a40 -->

# Hello演算法 的UTF-8編碼

用七個字元比較單位元組與三位元組編碼，識別字符起始和續位元組。

## 結構與關係

三位元組首位元組以1110開頭：三個1後還必須跟0；後兩個位元組均以10開頭。不能只憑“最高三位是1”忽略後續0。

<table><caption>逐字元碼點與UTF-8位元組</caption><thead><tr><th scope="col">位置與字元</th><th scope="col">Unicode碼點</th><th scope="col">圖中的16位碼點</th><th scope="col">UTF-8二進位制位元組</th><th scope="col">位元組數</th></tr></thead><tbody><tr><th scope="row">1：H</th><td>U+0048</td><td>00000000 01001000</td><td>01001000</td><td>1</td></tr><tr><th scope="row">2：e</th><td>U+0065</td><td>00000000 01100101</td><td>01100101</td><td>1</td></tr><tr><th scope="row">3：l</th><td>U+006C</td><td>00000000 01101100</td><td>01101100</td><td>1</td></tr><tr><th scope="row">4：l</th><td>U+006C</td><td>00000000 01101100</td><td>01101100</td><td>1</td></tr><tr><th scope="row">5：o</th><td>U+006F</td><td>00000000 01101111</td><td>01101111</td><td>1</td></tr><tr><th scope="row">6：算</th><td>U+7B97</td><td>01111011 10010111</td><td>11100111 10101110 10010111</td><td>3</td></tr><tr><th scope="row">7：法</th><td>U+6CD5</td><td>01101100 11010101</td><td>11100110 10110011 10010101</td><td>3</td></tr></tbody></table>

<a id="source-45"></a>

ASCII範圍內的英文字符采用單位元組模板0xxxxxxx，低7位直接填入碼點。“算”與“法”採用三位元組模板1110xxxx 10xxxxxx 10xxxxxx，去掉各位元組字首後留下4+6+6=16個數據位：例如“算”的本例16位碼點按0111、101110、010111三段填入模板，“法”按0110、110011、010101三段填入模板。

## 結果

UTF-8字首區分單位元組起始、三位元組起始與續位元組；本例總位元組數為5×1+2×3=11。
