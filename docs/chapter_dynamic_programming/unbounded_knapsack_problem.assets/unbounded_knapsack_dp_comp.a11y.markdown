<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: ebbbd59dc7e27e4d6a5c8175f0ed38dbcf9bae79f38abcdcd3aa09f940a643fb -->

# 完全背包的单行更新

按容量从小到大正序更新单行数组，复用本轮较小容量的新解，使同种物品可以重复选取。

## 问题与输入

背包容量上限为 4，共有 3 种可重复选取的物品：1 号苹果（重量 1、价值 5）、2 号菠萝（重量 2、价值 11）、3 号西瓜（重量 3、价值 15）。本组从第 1 种物品苹果已处理完毕开始，仅演示第 2 种物品菠萝的单行更新，第 3 种物品西瓜尚未参与。

二维状态 dp\[i, c\] 表示仅用前 i 种物品、总重量不超过容量 c 时的最大价值；空间优化后的单行数组 dp\[c\]（容量索引 c 从 0 至 4）按轮依次覆盖上一轮结果。

## 结构与关系

第 i = 2 轮按容量 c = 1、2、3、4 正序遍历。容量不足以放入菠萝（c &lt; 2）时沿用上一轮旧值；装得下时（c &gt;= 2），比较不选菠萝的旧值 dp\[c\] 与选入菠萝的本轮值 dp\[c - 2\] + 11，取较大者写入 dp\[c\]。较小正容量在本轮已先处理，容量 0 始终保持有效边界 0，因此正序读取本行左侧的 dp\[c - 2\] 可以再次选入菠萝，实现同种物品重复选取；0-1 背包每件限用一次、必须倒序读取上一轮旧值的限制不适用于这里。

每帧包含两张状态表：单行表逐容量标明当前数值及所属轮次（区分上一轮 i = 1 与本轮 i = 2）；二维对照表展示各子问题的计算进度，其中尚未计算的初值 0 不代表有效解。

<table><caption>物品输入</caption><thead><tr><th scope="col">编号i</th><th scope="col">物品</th><th scope="col">重量</th><th scope="col">价值</th></tr></thead><tbody><tr><th scope="row">1</th><td>苹果</td><td>1</td><td>5</td></tr><tr><th scope="row">2</th><td>菠萝</td><td>2</td><td>11</td></tr><tr><th scope="row">3</th><td>西瓜</td><td>3</td><td>15</td></tr></tbody></table>

<a id="source-418"></a>

## 第 1 步：遍历 i = 2 前：单行保存 i = 1 的解

开始第 i = 2 轮（菠萝）之前，第 1 轮（仅选苹果）已计算完毕：由于苹果可重复选取，容量 0 至 4 依次放入 0 至 4 个苹果，最大价值为 \[0, 5, 10, 15, 20\]。下方单行数组 dp 当前保存这组 i = 1 的解，准备从左到右正序处理第 2 种物品菠萝。

<details><summary>本步完整状态</summary><p>容量上限 4；苹果重 1 值 5、菠萝重 2 值 11、西瓜重 3 值 15，每种均可重复选取。本组只处理第 2 种物品菠萝。当前为 i = 2 轮开始前：单行 dp = [0, 5, 10, 15, 20]，容量 1 至 4 均保存上一轮 i = 1（仅选苹果）的解。</p><table><caption>单行dp：各容量的值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；上一轮i=1，仅苹果，尚未覆盖</td></tr><tr><th scope="row">2</th><td>10，已计算；上一轮i=1，仅苹果，尚未覆盖</td></tr><tr><th scope="row">3</th><td>15，已计算；上一轮i=1，仅苹果，尚未覆盖</td></tr><tr><th scope="row">4</th><td>20，已计算；上一轮i=1，仅苹果，尚未覆盖</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0种物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1种物品</th><td>0，边界有效</td><td>5，已计算</td><td>10，已计算</td><td>15，已计算</td><td>20，已计算</td></tr><tr><th scope="row">前2种物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-419"></a>

## 第 2 步：正序处理容量 c = 1：装不下菠萝，保持 5

从容量 c = 1 开始正序遍历：菠萝重量 2 大于容量 1，无法放入菠萝。上方二维表中 dp\[2, 1\] 直接继承正上方 dp\[1, 1\] = 5；下方单行数组的 dp\[1\] 数值保持 5，但所属轮次已更新为本轮 i = 2（图中以绿色标示本轮已处理），而容量 2 至 4 仍为上一轮 i = 1 的旧值。

<details><summary>本步完整状态</summary><p>容量上限 4；苹果重 1 值 5、菠萝重 2 值 11、西瓜重 3 值 15，每种均可重复选取。本组只处理第 2 种物品菠萝。当前 i = 2，c = 1：菠萝重 2 超过容量 1，无法选入，dp[1] 保持 5 并完成本轮 i = 2 处理；容量 2 至 4 仍属上一轮 i = 1。</p><table><caption>单行dp：各容量的值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；本轮i=2，苹果与菠萝</td></tr><tr><th scope="row">2</th><td>10，已计算；上一轮i=1，仅苹果，尚未覆盖</td></tr><tr><th scope="row">3</th><td>15，已计算；上一轮i=1，仅苹果，尚未覆盖</td></tr><tr><th scope="row">4</th><td>20，已计算；上一轮i=1，仅苹果，尚未覆盖</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0种物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1种物品</th><td>0，边界有效</td><td>5，已计算</td><td>10，已计算</td><td>15，已计算</td><td>20，已计算</td></tr><tr><th scope="row">前2种物品</th><td>0，边界有效</td><td>5，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-420"></a>

## 第 3 步：正序更新容量 c = 2：选入 1 个菠萝，更新为 11

向右正序推进到容量 c = 2：不选菠萝时沿用上一轮旧值 dp\[2\] = 10（两个苹果）；选入 1 个菠萝时，读取本行左侧容量 0 的边界状态 dp\[0\] = 0 并加菠萝价值 11，得 11。取 max(10, 11) = 11，将单行 dp\[2\] 更新为本轮新值 11。

<details><summary>本步完整状态</summary><p>容量上限 4；苹果重 1 值 5、菠萝重 2 值 11、西瓜重 3 值 15，每种均可重复选取。本组只处理第 2 种物品菠萝。当前 i = 2，c = 2：比较旧值 10 与 dp[0] + 11 = 11，取较大值将 dp[2] 更新为 11（选 1 个菠萝）。</p><table><caption>单行dp：各容量的值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；本轮i=2，苹果与菠萝</td></tr><tr><th scope="row">2</th><td>11，已计算；本轮i=2，苹果与菠萝</td></tr><tr><th scope="row">3</th><td>15，已计算；上一轮i=1，仅苹果，尚未覆盖</td></tr><tr><th scope="row">4</th><td>20，已计算；上一轮i=1，仅苹果，尚未覆盖</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0种物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1种物品</th><td>0，边界有效</td><td>5，已计算</td><td>10，已计算</td><td>15，已计算</td><td>20，已计算</td></tr><tr><th scope="row">前2种物品</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-421"></a>

## 第 4 步：正序更新容量 c = 3：苹果加菠萝，更新为 16

继续正序推进到容量 c = 3：不选菠萝时为上一轮旧值 dp\[3\] = 15（三个苹果）；选入 1 个菠萝时，读取本行左侧已在本轮处理过的 dp\[1\] = 5（一个苹果），加上菠萝价值 11 得 16（一个苹果加一个菠萝）。取 max(15, 16) = 16，将 dp\[3\] 更新为 16。

<details><summary>本步完整状态</summary><p>容量上限 4；苹果重 1 值 5、菠萝重 2 值 11、西瓜重 3 值 15，每种均可重复选取。本组只处理第 2 种物品菠萝。当前 i = 2，c = 3：比较旧值 15 与本行 dp[1] + 11 = 16，将 dp[3] 更新为 16（1 个苹果加 1 个菠萝）。</p><table><caption>单行dp：各容量的值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；本轮i=2，苹果与菠萝</td></tr><tr><th scope="row">2</th><td>11，已计算；本轮i=2，苹果与菠萝</td></tr><tr><th scope="row">3</th><td>16，已计算；本轮i=2，苹果与菠萝</td></tr><tr><th scope="row">4</th><td>20，已计算；上一轮i=1，仅苹果，尚未覆盖</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0种物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1种物品</th><td>0，边界有效</td><td>5，已计算</td><td>10，已计算</td><td>15，已计算</td><td>20，已计算</td></tr><tr><th scope="row">前2种物品</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>0，未计算初值</td></tr><tr><th scope="row">前3种物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-422"></a>

## 第 5 步：正序更新容量 c = 4：复用本轮新值，重复选菠萝得 22

正序推进到容量 c = 4：不选菠萝时为上一轮旧值 dp\[4\] = 20（四个苹果）；选入菠萝时，从本行左侧读取本轮刚更新过的 dp\[2\] = 11（已含 1 个菠萝），再加 1 个菠萝的价值 11 得到 22（共两个菠萝）。取 max(20, 22) = 22 写入 dp\[4\]，直接体现正序遍历允许复用本轮新解、重复选取同一种物品。

<details><summary>本步完整状态</summary><p>容量上限 4；苹果重 1 值 5、菠萝重 2 值 11、西瓜重 3 值 15，每种均可重复选取。本组只处理第 2 种物品菠萝。当前 i = 2，c = 4：复用本轮已更新的 dp[2] = 11 再加 11 得 22，大于旧值 20，dp[4] 更新为 22（两个菠萝）。</p><table><caption>单行dp：各容量的值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；本轮i=2，苹果与菠萝</td></tr><tr><th scope="row">2</th><td>11，已计算；本轮i=2，苹果与菠萝</td></tr><tr><th scope="row">3</th><td>16，已计算；本轮i=2，苹果与菠萝</td></tr><tr><th scope="row">4</th><td>22，已计算；本轮i=2，苹果与菠萝</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0种物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1种物品</th><td>0，边界有效</td><td>5，已计算</td><td>10，已计算</td><td>15，已计算</td><td>20，已计算</td></tr><tr><th scope="row">前2种物品</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>22，已计算</td></tr><tr><th scope="row">前3种物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-423"></a>

## 第 6 步：完成 i = 2 轮遍历：单行保存前两种物品的解

第 i = 2 轮正序遍历全部完成，单行数组 dp = \[0, 5, 11, 16, 22\] 完整保存了仅使用前两种物品（苹果、菠萝）时容量 0 至 4 的最大价值，将作为下一轮的旧状态基准。上方二维表第 3 行（西瓜）的正容量格仍为未计算的初值 0，容量 0 的格子保持有效边界 0，本组未演示第 3 种物品西瓜的更新。

<details><summary>本步完整状态</summary><p>容量上限 4；苹果重 1 值 5、菠萝重 2 值 11、西瓜重 3 值 15，每种均可重复选取。本组只处理第 2 种物品菠萝。i = 2 轮已完成：单行 dp = [0, 5, 11, 16, 22] 保存前两种物品（苹果、菠萝）的解，第 3 种物品西瓜尚未处理。</p><table><caption>单行dp：各容量的值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；本轮i=2，苹果与菠萝；下一轮将作为旧状态</td></tr><tr><th scope="row">2</th><td>11，已计算；本轮i=2，苹果与菠萝；下一轮将作为旧状态</td></tr><tr><th scope="row">3</th><td>16，已计算；本轮i=2，苹果与菠萝；下一轮将作为旧状态</td></tr><tr><th scope="row">4</th><td>22，已计算；本轮i=2，苹果与菠萝；下一轮将作为旧状态</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0种物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1种物品</th><td>0，边界有效</td><td>5，已计算</td><td>10，已计算</td><td>15，已计算</td><td>20，已计算</td></tr><tr><th scope="row">前2种物品</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>22，已计算</td></tr><tr><th scope="row">前3种物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

## 结果

第 i = 2 轮结束后，单行数组更新为 \[0, 5, 11, 16, 22\]；其中容量 4 复用本轮已更新的 dp\[2\] = 11 再加 11，选入两个菠萝达到最大价值 22。这仅是前两种物品（苹果、菠萝）的结果，第 3 种物品西瓜尚未处理。
