<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 438eed829f69b66bbbe999875e076b712201f7cf6842581f6ec67aa3b4645085 -->

# 八位原码、反码与补码

比较正数与负数的转换，理解补码为何只有一种零表示。

<table><caption>八位编码对照</caption><thead><tr><th scope="col">数字</th><th scope="col">原码</th><th scope="col">反码</th><th scope="col">补码</th></tr></thead><tbody><tr><th scope="row">+0</th><td>0000 0000</td><td>0000 0000</td><td>0000 0000</td></tr><tr><th scope="row">+5</th><td>0000 0101</td><td>0000 0101</td><td>0000 0101</td></tr><tr><th scope="row">−0</th><td>1000 0000</td><td>1111 1111</td><td>0000 0000</td></tr><tr><th scope="row">−28</th><td>1001 1100</td><td>1110 0011</td><td>1110 0100</td></tr></tbody></table>

<a id="source-41"></a>

8位编码以最高位作符号位。+0和+5的原码、反码、补码完全相同；负数转换时，先保留最高符号位1、将其余低7位按位取反得到反码，再加1并取低8位得到补码。例如−28的原码1001 1100取反得反码1110 0011，加1进位后得补码1110 0100；−0的原码1000 0000取反得反码1111 1111，加1产生九位1 0000 0000，舍去最高进位后得补码0000 0000。

## 结果

+0与−0的补码同为0000 0000，消除了正负零歧义。补码还允许用同一套加法运算规则处理正负整数，并把减法转化为加负数。
