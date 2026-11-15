<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 9eb1db25623e3ed5726ac57c63a1fc7880c6cb5c24a604252900d83fe0283a67 -->

# 零钱兑换的动态规划

按硬币种类与目标金额逐格填表，求恰好凑出 4 元所需的最少硬币枚数。

## 问题与输入

可选硬币面值为 1、2、5 元（共 3 种，每种均可重复选取），目标金额为 4 元。状态 dp\[i, a\] 表示仅用前 i 种硬币恰好凑出金额 a 的最少硬币枚数；二维 dp 表共 4 行 5 列，行索引 i 从 0 至 3，列索引 a 从 0 至 4。

MAX = 目标金额 + 1 = 5 是表示“不可达（无解）”的边界标记，绝非需要 5 枚硬币。目标金额 0 不需要硬币，首列边界值为 0；无硬币可用（i = 0）时，任何正金额均不可达。

## 结构与关系

先创建 4×5 全零表，再将首行正金额格 dp\[0, 1\] 至 dp\[0, 4\] 设为不可达标记 MAX = 5，首列 dp\[0, 0\] 至 dp\[3, 0\] 保持有效边界 0。随后按行 i = 1 至 3、每行金额 a = 1 至 4 依次填表：当前硬币面值大于金额 a 时无法选入，直接继承正上方 dp\[i - 1, a\]；否则比较上方 dp\[i - 1, a\]（不选该硬币）与本行左方 dp\[i, a - 面值\] + 1（选入一枚该硬币），取较小值。从本行左方转移允许重复选取同种硬币。

状态表逐格标注“边界有效”“已计算”或“未计算初值”；第 1 至 3 行正金额格在计算前显示的 0 只是未计算初值，不代表用 0 枚硬币就能凑出正金额。

<table><caption>可选硬币</caption><thead><tr><th scope="col">编号i</th><th scope="col">面值</th></tr></thead><tbody><tr><th scope="row">1</th><td>1</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>5</td></tr></tbody></table>

<table><caption>计算完成的最少硬币数；MAX=5表示不可达</caption><thead><tr><th scope="col">前i种硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td><td>MAX</td><td>MAX</td><td>MAX</td><td>MAX</td></tr><tr><th scope="row">1</th><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td></tr><tr><th scope="row">2</th><td>0</td><td>1</td><td>1</td><td>2</td><td>2</td></tr><tr><th scope="row">3</th><td>0</td><td>1</td><td>1</td><td>2</td><td>2</td></tr></tbody></table>

<a id="source-426"></a>

## 第 1 步：创建 4×5 初始全零 dp 表

根据 3 种硬币（面值 1、2、5）与目标金额 4，创建 4×5 的二维 dp 表（行 i = 0 至 3，列 a = 0 至 4）。刚分配时所有单元格默认置为 0：首列金额 0 的 0 即为有效边界（凑出 0 元需 0 枚硬币），而其余正金额格的 0 均为尚未计算的初值，等待下一步设置首行 MAX 不可达边界。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前创建 4×5 全零矩阵：首列金额 0 为有效边界 0，其余正金额格均为未计算初值 0，尚未设置首行 MAX 边界。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-427"></a>

## 第 2 步：设置首行正金额为不可达边界 MAX = 5

无硬币可用（i = 0）时无法凑出任何大于 0 的金额，因此将首行正金额格 dp\[0, 1\] 至 dp\[0, 4\] 设为不可达标记 MAX = 5（表示状态已定义为无解，而非需要 5 枚硬币）；金额 a = 0 时最少需 0 枚硬币，首列 dp\[0, 0\] 至 dp\[3, 0\] 保持有效边界 0。第 1 至 3 行正金额格的 0 仍为未计算初值。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。边界初始化完成：首行正金额 dp[0, 1] 至 dp[0, 4] 设为 MAX = 5（有效边界，表示不可达），首列 dp[0, 0] 至 dp[3, 0] 为有效边界 0，其余 12 个内部格为未计算初值 0。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-428"></a>

## 第 3 步：计算 dp\[1, 1\]（面值 1、金额 1）：最少 1 枚

开始处理第 1 种硬币（面值 1），计算金额 a = 1 的 dp\[1, 1\]：不选面值 1 硬币时取正上方 dp\[0, 1\] = MAX（5，不可达）；选入 1 枚面值 1 硬币时取本行左方边界 dp\[1, 0\] = 0 加 1 得 1。取较小值 min(MAX, 1) = 1，写入 dp\[1, 1\] = 1。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[1, 1]（前 1 种硬币面值 1，凑金额 1）：比较上方 dp[0, 1] = MAX 与本行左方 dp[1, 0] + 1 = 1，取较小值写入 dp[1, 1] = 1（1 枚 1 元）。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-429"></a>

## 第 4 步：计算 dp\[1, 2\]（面值 1、金额 2）：最少 2 枚

继续用第 1 种硬币（面值 1）计算金额 a = 2 的 dp\[1, 2\]：不选时为正上方 dp\[0, 2\] = MAX（不可达）；选入 1 枚面值 1 硬币时，复用本行左方刚算出的 dp\[1, 1\] = 1 再加 1 得 2（两枚 1 元）。取 min(MAX, 2) = 2，写入 dp\[1, 2\] = 2。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[1, 2]（前 1 种硬币面值 1，凑金额 2）：比较上方 dp[0, 2] = MAX 与本行左方 dp[1, 1] + 1 = 2，写入 dp[1, 2] = 2（两枚 1 元）。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-430"></a>

## 第 5 步：计算 dp\[1, 3\]（面值 1、金额 3）：最少 3 枚

继续用第 1 种硬币（面值 1）计算金额 a = 3 的 dp\[1, 3\]：不选时为正上方 dp\[0, 3\] = MAX（不可达）；选入 1 枚面值 1 硬币时由本行左方 dp\[1, 2\] = 2 加 1 得 3（三枚 1 元）。取 min(MAX, 3) = 3，写入 dp\[1, 3\] = 3。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[1, 3]（前 1 种硬币面值 1，凑金额 3）：比较上方 dp[0, 3] = MAX 与本行左方 dp[1, 2] + 1 = 3，写入 dp[1, 3] = 3（三枚 1 元）。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>0，未计算初值</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-431"></a>

## 第 6 步：计算 dp\[1, 4\]（面值 1、金额 4）：最少 4 枚

继续用第 1 种硬币（面值 1）计算金额 a = 4 的 dp\[1, 4\]：不选时为正上方 dp\[0, 4\] = MAX（不可达）；选入 1 枚面值 1 硬币时由本行左方 dp\[1, 3\] = 3 加 1 得 4（四枚 1 元）。取 min(MAX, 4) = 4 写入 dp\[1, 4\]，第 1 行计算完毕。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[1, 4]（前 1 种硬币面值 1，凑金额 4）：比较上方 dp[0, 4] = MAX 与本行左方 dp[1, 3] + 1 = 4，写入 dp[1, 4] = 4（四枚 1 元），第 1 行完成。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-432"></a>

## 第 7 步：计算 dp\[2, 1\]（面值 2、金额 1）：面值过大，继承 1 枚

进入第 2 行，引入第 2 种硬币（面值 2），计算金额 a = 1 的 dp\[2, 1\]。由于硬币面值 2 大于当前金额 1，无法选入 2 元硬币，直接沿竖直箭头继承正上方 dp\[1, 1\] = 1，写入 dp\[2, 1\] = 1。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[2, 1]（前 2 种硬币含面值 2，凑金额 1）：因面值 2 大于金额 1，无法选入，直接继承上方 dp[1, 1] = 1。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-433"></a>

## 第 8 步：计算 dp\[2, 2\]（面值 2、金额 2）：选 1 枚 2 元，更新为 1

处理第 2 种硬币（面值 2）、金额 a = 2：不选 2 元硬币时继承正上方 dp\[1, 2\] = 2（两枚 1 元）；选入 1 枚 2 元硬币时从本行左方边界 dp\[2, 0\] = 0 加 1 得 1（1 枚 2 元）。取较小值 min(2, 1) = 1，写入 dp\[2, 2\] = 1。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[2, 2]（前 2 种硬币含面值 2，凑金额 2）：比较上方 dp[1, 2] = 2 与本行左方 dp[2, 0] + 1 = 1，取较小值写入 dp[2, 2] = 1（1 枚 2 元）。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-434"></a>

## 第 9 步：计算 dp\[2, 3\]（面值 2、金额 3）：1 元加 2 元，更新为 2 枚

处理第 2 种硬币（面值 2）、金额 a = 3：不选 2 元硬币时为正上方 dp\[1, 3\] = 3（三枚 1 元）；选入 1 枚 2 元硬币时从本行左方 dp\[2, 1\] = 1（1 枚 1 元）加 1 得 2（1 元与 2 元各 1 枚）。取 min(3, 2) = 2，写入 dp\[2, 3\] = 2。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[2, 3]（前 2 种硬币含面值 2，凑金额 3）：比较上方 dp[1, 3] = 3 与本行左方 dp[2, 1] + 1 = 2，取较小值写入 dp[2, 3] = 2（1 元加 2 元共 2 枚）。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>2，已计算</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-435"></a>

## 第 10 步：计算 dp\[2, 4\]（面值 2、金额 4）：重复选 2 元，更新为 2 枚

处理第 2 种硬币（面值 2）、金额 a = 4：不选 2 元硬币时为正上方 dp\[1, 4\] = 4（四枚 1 元）；选入 2 元硬币时，从本行左方已更新的 dp\[2, 2\] = 1（已含 1 枚 2 元）再加 1 得 2（两枚 2 元）。取 min(4, 2) = 2 写入 dp\[2, 4\]，完成第 2 行，体现本行左方转移可重复选取同种硬币。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[2, 4]（前 2 种硬币含面值 2，凑金额 4）：比较上方 dp[1, 4] = 4 与本行左方 dp[2, 2] + 1 = 2，复用本行新值写入 dp[2, 4] = 2（两枚 2 元），第 2 行完成。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>2，已计算</td><td>2，已计算</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-436"></a>

## 第 11 步：计算 dp\[3, 1\]（面值 5、金额 1）：面值过大，继承 1 枚

进入第 3 行，引入第 3 种硬币（面值 5），计算金额 a = 1 的 dp\[3, 1\]。由于面值 5 大于当前金额 1，无法选入 5 元硬币，沿竖直箭头直接继承正上方 dp\[2, 1\] = 1，写入 dp\[3, 1\] = 1。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[3, 1]（前 3 种硬币含面值 5，凑金额 1）：因面值 5 大于金额 1，无法选入，直接继承上方 dp[2, 1] = 1。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>2，已计算</td><td>2，已计算</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-437"></a>

## 第 12 步：计算 dp\[3, 2\]（面值 5、金额 2）：面值过大，继承 1 枚

继续处理第 3 种硬币（面值 5）、金额 a = 2：面值 5 仍大于当前金额 2，无法选入 5 元硬币，直接继承正上方 dp\[2, 2\] = 1，写入 dp\[3, 2\] = 1。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[3, 2]（前 3 种硬币含面值 5，凑金额 2）：因面值 5 大于金额 2，无法选入，直接继承上方 dp[2, 2] = 1。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>2，已计算</td><td>2，已计算</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-438"></a>

## 第 13 步：计算 dp\[3, 3\]（面值 5、金额 3）：面值过大，继承 2 枚

继续处理第 3 种硬币（面值 5）、金额 a = 3：面值 5 大于当前金额 3，无法选入 5 元硬币，直接继承正上方 dp\[2, 3\] = 2，写入 dp\[3, 3\] = 2。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[3, 3]（前 3 种硬币含面值 5，凑金额 3）：因面值 5 大于金额 3，无法选入，直接继承上方 dp[2, 3] = 2。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>2，已计算</td><td>2，已计算</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>2，已计算</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-439"></a>

## 第 14 步：计算 dp\[3, 4\]（面值 5、金额 4）：面值过大，继承 2 枚

处理第 3 种硬币（面值 5）、右下角目标金额 a = 4：由于面值 5 大于金额 4，无法选入 5 元硬币，只能沿竖直箭头直接继承正上方前两种硬币的解 dp\[2, 4\] = 2（即两枚 2 元硬币凑成 4 元），写入 dp\[3, 4\] = 2，全表计算完成。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。当前计算 dp[3, 4]（前 3 种硬币含面值 5，凑金额 4）：因面值 5 大于金额 4，无法选入，直接继承上方前两种硬币的 dp[2, 4] = 2（两枚 2 元），全表填毕。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>2，已计算</td><td>2，已计算</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>2，已计算</td><td>2，已计算</td></tr></tbody></table></details>

<a id="source-440"></a>

## 第 15 步：读取右下角 dp\[3, 4\]，返回最少硬币数 2

全部状态转移结束后，读取右下角高亮格 dp\[3, 4\] = 2。由于该值不等于不可达标记 MAX（5），直接返回 2 作为恰好凑出 4 元的最少硬币枚数（由两枚 2 元硬币组成；若结果为 MAX 则返回 -1）。

<details><summary>本步完整状态</summary><p>硬币面值 1、2、5 各不限量，求恰好凑出 4 元的最少枚数；MAX = 5 表示不可达。全表计算完成，右下角 dp[3, 4] = 2 不等于 MAX，返回最少硬币枚数 2（两枚 2 元硬币）。</p><table><caption>当前最少硬币数与计算进度</caption><thead><tr><th scope="col">可选硬币</th><th scope="col">金额0</th><th scope="col">金额1</th><th scope="col">金额2</th><th scope="col">金额3</th><th scope="col">金额4</th></tr></thead><tbody><tr><th scope="row">前0种硬币</th><td>0，边界有效</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td><td>MAX，边界有效，表示不可达；MAX=5</td></tr><tr><th scope="row">前1种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">前2种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>2，已计算</td><td>2，已计算</td></tr><tr><th scope="row">前3种硬币</th><td>0，边界有效</td><td>1，已计算</td><td>1，已计算</td><td>2，已计算</td><td>2，已计算</td></tr></tbody></table></details>

## 结果

填表结束后返回右下角 dp\[3, 4\] = 2，即用两枚 2 元硬币恰好凑出 4 元。第 3 种硬币面值 5 大于目标金额 1 至 4，整行直接继承前两种硬币的结果。若最终结果为 MAX，则代表无解，代码返回 -1。
