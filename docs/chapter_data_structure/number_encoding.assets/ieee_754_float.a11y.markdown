<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 4cab50e9d346c8d701f168117fd040a740aa8e6e5a3ac7543528c3a3dc644383 -->

# 单精度浮点数的位字段

把32位编码拆成符号、指数和分数，算出对应的正规数。

## 结构与关系

指数使表示范围扩大，但不增加有效精度：正规数含隐含1共有24位二进制有效精度，绝对值越大，相邻可表示数通常越稀疏。

<table><caption>32位字段及其含义</caption><thead><tr><th scope="col">字段</th><th scope="col">位序</th><th scope="col">位数</th><th scope="col">本例二进制</th><th scope="col">解释</th></tr></thead><tbody><tr><th scope="row">符号S</th><td>b₃₁</td><td>1</td><td>0</td><td>正号</td></tr><tr><th scope="row">指数E</th><td>b₃₀至b₂₃</td><td>8</td><td>01111100</td><td>存储值124；实际指数124−127=−3</td></tr><tr><th scope="row">分数N</th><td>b₂₂至b₀</td><td>23</td><td>01100000000000000000000</td><td>N=2⁻²+2⁻³=0.375；正规数有效数字1+N=1.375</td></tr></tbody></table>

<a id="source-42"></a>

最高位符号S=0，因此符号项为(−1)⁰=+1。中间8位指数E=01111100₂=124（处于正规数范围1至254内），减去偏移127得−3，缩放项为2⁻³=0.125。低23位分数N的前3位为011、后20位为0，表示0×2⁻¹+1×2⁻²+1×2⁻³=0.375；加上正规数隐含的整数位1得到1+N=1.375。三项相乘得1×0.125×1.375=0.171875。

## 结果

正规数（1≤E≤254）公式为(−1)^S×2^(E−127)×(1+N)。当E为0或255时，须改用零、次正规数、无穷大或NaN的专门规则，不能直接套此式。
