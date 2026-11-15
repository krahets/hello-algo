<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 84b37c33fb6825dfbcd93fea69de53a1f21bd77bd066fd2d560ba57df41e6ab6 -->

# 八位原碼、一補數與二補數

比較正數與負數的轉換，理解二補數為何只有一種零表示。

<table><caption>八位編碼對照</caption><thead><tr><th scope="col">數字</th><th scope="col">原碼</th><th scope="col">一補數</th><th scope="col">二補數</th></tr></thead><tbody><tr><th scope="row">+0</th><td>0000 0000</td><td>0000 0000</td><td>0000 0000</td></tr><tr><th scope="row">+5</th><td>0000 0101</td><td>0000 0101</td><td>0000 0101</td></tr><tr><th scope="row">−0</th><td>1000 0000</td><td>1111 1111</td><td>0000 0000</td></tr><tr><th scope="row">−28</th><td>1001 1100</td><td>1110 0011</td><td>1110 0100</td></tr></tbody></table>

<a id="source-41"></a>

8位編碼以最高位作符號位。+0和+5的原碼、一補數、二補數完全相同；負數轉換時，先保留最高符號位1、將其餘低7位按位取反得到一補數，再加1並取低8位得到二補數。例如−28的原碼1001 1100取反得一補數1110 0011，加1進位後得二補數1110 0100；−0的原碼1000 0000取反得一補數1111 1111，加1產生九位1 0000 0000，捨去最高進位後得二補數0000 0000。

## 結果

+0與−0的二補數同為0000 0000，消除了正負零歧義。二補數還允許用同一套加法運算規則處理正負整數，並把減法轉化為加負數。
