<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 23647693cd10debbca04beefe0c095fe8d907502390a09c2424986aa1c67f8f5 -->

# 單精度浮點數的位欄位

把32位編碼拆成符號、指數和分數，算出對應的正規數。

## 結構與關係

指數使表示範圍擴大，但不增加有效精度：正規數含隱含1共有24位二進位制有效精度，絕對值越大，相鄰可表示數通常越稀疏。

<table><caption>32位欄位及其含義</caption><thead><tr><th scope="col">欄位</th><th scope="col">位序</th><th scope="col">位數</th><th scope="col">本例二進位制</th><th scope="col">解釋</th></tr></thead><tbody><tr><th scope="row">符號S</th><td>b₃₁</td><td>1</td><td>0</td><td>正號</td></tr><tr><th scope="row">指數E</th><td>b₃₀至b₂₃</td><td>8</td><td>01111100</td><td>儲存值124；實際指數124−127=−3</td></tr><tr><th scope="row">分數N</th><td>b₂₂至b₀</td><td>23</td><td>01100000000000000000000</td><td>N=2⁻²+2⁻³=0.375；正規數有效數字1+N=1.375</td></tr></tbody></table>

<a id="source-42"></a>

最高位符號S=0，因此符號項為(−1)⁰=+1。中間8位指數E=01111100₂=124（處於正規數範圍1至254內），減去偏移127得−3，縮放項為2⁻³=0.125。低23位分數N的前3位為011、後20位為0，表示0×2⁻¹+1×2⁻²+1×2⁻³=0.375；加上正規數隱含的整數位1得到1+N=1.375。三項相乘得1×0.125×1.375=0.171875。

## 結果

正規數（1≤E≤254）公式為(−1)^S×2^(E−127)×(1+N)。當E為0或255時，須改用零、次正規數、無窮大或NaN的專門規則，不能直接套此式。
