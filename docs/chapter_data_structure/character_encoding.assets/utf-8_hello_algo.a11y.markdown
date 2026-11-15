<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: f49071a5ae64b85ccb3e75966af02000bfdabadeadceddf3ed755348f695479c -->

# Hello算法 的UTF-8编码

用七个字符比较单字节与三字节编码，识别字符起始和续字节。

## 结构与关系

三字节首字节以1110开头：三个1后还必须跟0；后两个字节均以10开头。不能只凭“最高三位是1”忽略后续0。

<table><caption>逐字符码点与UTF-8字节</caption><thead><tr><th scope="col">位置与字符</th><th scope="col">Unicode码点</th><th scope="col">图中的16位码点</th><th scope="col">UTF-8二进制字节</th><th scope="col">字节数</th></tr></thead><tbody><tr><th scope="row">1：H</th><td>U+0048</td><td>00000000 01001000</td><td>01001000</td><td>1</td></tr><tr><th scope="row">2：e</th><td>U+0065</td><td>00000000 01100101</td><td>01100101</td><td>1</td></tr><tr><th scope="row">3：l</th><td>U+006C</td><td>00000000 01101100</td><td>01101100</td><td>1</td></tr><tr><th scope="row">4：l</th><td>U+006C</td><td>00000000 01101100</td><td>01101100</td><td>1</td></tr><tr><th scope="row">5：o</th><td>U+006F</td><td>00000000 01101111</td><td>01101111</td><td>1</td></tr><tr><th scope="row">6：算</th><td>U+7B97</td><td>01111011 10010111</td><td>11100111 10101110 10010111</td><td>3</td></tr><tr><th scope="row">7：法</th><td>U+6CD5</td><td>01101100 11010101</td><td>11100110 10110011 10010101</td><td>3</td></tr></tbody></table>

<a id="source-45"></a>

ASCII范围内的英文字符采用单字节模板0xxxxxxx，低7位直接填入码点。“算”与“法”采用三字节模板1110xxxx 10xxxxxx 10xxxxxx，去掉各字节前缀后留下4+6+6=16个数据位：例如“算”的本例16位码点按0111、101110、010111三段填入模板，“法”按0110、110011、010101三段填入模板。

## 结果

UTF-8前缀区分单字节起始、三字节起始与续字节；本例总字节数为5×1+2×3=11。
