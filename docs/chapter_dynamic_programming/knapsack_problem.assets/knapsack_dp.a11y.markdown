<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 2933e268f2d5e8372b9de0238a8b6380988780bc7e0aeaf1cdec7c0a913f016a -->

# 0-1 背包动态规划

三件物品各最多选一次，按物品与容量逐格递推选与不选的较大价值，求出容量 4 下的最大总价值。

## 问题与输入

候选物品有 3 件（n = 3）：1 号苹果（重 1、价值 5）、2 号菠萝（重 2、价值 11）、3 号西瓜（重 3、价值 15），详见物品表。背包容量 cap = 4，每件物品最多选一次，目标是在不超重的前提下获得最大总价值，无须恰好装满。

状态 dp\[i, c\] 表示从前 i 件物品中选择、总重量不超过容量 c 时的最大价值。行下标 i 取 0 至 3，列下标 c 取 0 至 4，状态表共 4 行 5 列；物品编号 i 从 1 开始，对应数组重量 wgt\[i-1\] 和价值 val\[i-1\]。

## 结构与关系

第 0 行（无物品可选）和第 0 列（背包容量为 0）的最大价值确定为 0，在图中显示为深色字体的有效边界 0；第 1 至 3 行、第 1 至 4 列的其余 12 个格子初始虽也填 0，但显示为淡色字体，仅代表尚未计算的初值 0，不能当作已算出的最优价值。填表按行 i = 1 至 3、每行内按容量 c = 1 至 4 依次推进。

对于第 i 件物品（重量 w = wgt\[i-1\]，价值 v = val\[i-1\]）：若 w &gt; c，当前容量装不下该物品，只能不选，直接继承正上方的 dp\[i-1, c\]；若 w ≤ c，则比较不选该物品的 dp\[i-1, c\] 与选入该物品的 dp\[i-1, c-w\] + v，取较大值写入 dp\[i, c\]。两个候选来源都取自上一行 i-1，保证每件物品最多计入一次。

<table><caption>本组物品数据</caption><thead><tr><th scope="col">物品编号i</th><th scope="col">物品</th><th scope="col">重量wgt[i−1]</th><th scope="col">价值val[i−1]</th></tr></thead><tbody><tr><th scope="row">1</th><td>苹果</td><td>1</td><td>5</td></tr><tr><th scope="row">2</th><td>菠萝</td><td>2</td><td>11</td></tr><tr><th scope="row">3</th><td>西瓜</td><td>3</td><td>15</td></tr></tbody></table>

<table><caption>填表完成后的最大价值；边界0已有效</caption><thead><tr><th scope="col">前i件物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">0</th><td>0（边界有效）</td><td>0（边界有效）</td><td>0（边界有效）</td><td>0（边界有效）</td><td>0（边界有效）</td></tr><tr><th scope="row">1</th><td>0（边界有效）</td><td>5</td><td>5</td><td>5</td><td>5</td></tr><tr><th scope="row">2</th><td>0（边界有效）</td><td>5</td><td>11</td><td>16</td><td>16</td></tr><tr><th scope="row">3</th><td>0（边界有效）</td><td>5</td><td>11</td><td>16</td><td>20</td></tr></tbody></table>

<table><caption>非边界格首次算出结果的步骤；此前均为未计算初值0</caption><thead><tr><th scope="col">步骤位置</th><th scope="col">单元格</th><th scope="col">子问题</th><th scope="col">算得价值</th></tr></thead><tbody><tr><th scope="row">2</th><td>dp[1, 1]</td><td>前1件物品、容量1</td><td>5</td></tr><tr><th scope="row">3</th><td>dp[1, 2]</td><td>前1件物品、容量2</td><td>5</td></tr><tr><th scope="row">4</th><td>dp[1, 3]</td><td>前1件物品、容量3</td><td>5</td></tr><tr><th scope="row">5</th><td>dp[1, 4]</td><td>前1件物品、容量4</td><td>5</td></tr><tr><th scope="row">6</th><td>dp[2, 1]</td><td>前2件物品、容量1</td><td>5</td></tr><tr><th scope="row">7</th><td>dp[2, 2]</td><td>前2件物品、容量2</td><td>11</td></tr><tr><th scope="row">8</th><td>dp[2, 3]</td><td>前2件物品、容量3</td><td>16</td></tr><tr><th scope="row">9</th><td>dp[2, 4]</td><td>前2件物品、容量4</td><td>16</td></tr><tr><th scope="row">10</th><td>dp[3, 1]</td><td>前3件物品、容量1</td><td>5</td></tr><tr><th scope="row">11</th><td>dp[3, 2]</td><td>前3件物品、容量2</td><td>11</td></tr><tr><th scope="row">12</th><td>dp[3, 3]</td><td>前3件物品、容量3</td><td>16</td></tr><tr><th scope="row">13</th><td>dp[3, 4]</td><td>前3件物品、容量4</td><td>20</td></tr></tbody></table>

<a id="source-397"></a>

## 第 1 步：初始化 4×5 状态矩阵

初始化尺寸为 (n + 1) × (cap + 1) 即 4 × 5 的 dp 矩阵并全部填入 0。其中第 0 行（无物品可选）和第 0 列（背包容量为 0）为深色字体的确定边界值 0；第 1 至 3 行、第 1 至 4 列的其余 12 个格子为淡色 0，表示尚未执行状态转移的初值 0。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。已初始化状态表：无物品（i=0）或容量为0（c=0）的边界格均为0，其余12格为待计算的初值0。</p><table><caption>初始化后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-398"></a>

## 第 2 步：计算 dp\[1, 1\]，最大价值为 5

考虑前 1 件物品（苹果，重 1、价值 5）、容量 1。不选苹果得 dp\[0, 1\] = 0；选入苹果后剩余容量 0，得 dp\[0, 0\] + 5 = 0 + 5 = 5。取较大值 5 写入 dp\[1, 1\]。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算苹果（i=1）、容量 c=1：比较不选苹果的价值0与选入苹果的价值5，将 dp[1, 1] 写为5。</p><table><caption>计算 dp[1, 1] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-399"></a>

## 第 3 步：计算 dp\[1, 2\]，最大价值为 5

考虑前 1 件物品（苹果）、容量 2。不选苹果得 dp\[0, 2\] = 0；选入苹果后剩余容量 1，从上一行得 dp\[0, 1\] + 5 = 0 + 5 = 5。取较大值 5 写入 dp\[1, 2\]。由于苹果只能选一次，剩余容量 1 不能重复放入第二颗苹果。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算苹果（i=1）、容量 c=2：苹果最多选一次，比较不选的价值0与选入苹果的价值5，将 dp[1, 2] 写为5。</p><table><caption>计算 dp[1, 2] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-400"></a>

## 第 4 步：计算 dp\[1, 3\]，最大价值为 5

考虑前 1 件物品（苹果）、容量 3。不选苹果得 dp\[0, 3\] = 0；选入苹果后剩余容量 2，得 dp\[0, 2\] + 5 = 0 + 5 = 5。取较大值 5 写入 dp\[1, 3\]。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算苹果（i=1）、容量 c=3：苹果最多选一次，比较不选的价值0与选入苹果的价值5，将 dp[1, 3] 写为5。</p><table><caption>计算 dp[1, 3] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-401"></a>

## 第 5 步：计算 dp\[1, 4\]，最大价值为 5

考虑前 1 件物品（苹果）、容量 4。不选苹果得 dp\[0, 4\] = 0；选入苹果后剩余容量 3，得 dp\[0, 3\] + 5 = 0 + 5 = 5。取较大值 5 写入 dp\[1, 4\]，第 1 行计算完毕。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算苹果（i=1）、容量 c=4：苹果最多选一次，比较不选的价值0与选入苹果的价值5，将 dp[1, 4] 写为5，完成第1行。</p><table><caption>计算 dp[1, 4] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-402"></a>

## 第 6 步：计算 dp\[2, 1\]，装不下菠萝保持 5

考虑前 2 件物品、容量 1。2 号菠萝重 2，超过当前容量 1，只能不选，直接从正上方读取 dp\[1, 1\] = 5 写入 dp\[2, 1\]。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算菠萝（i=2）、容量 c=1：菠萝重2，当前容量装不下，只能不选并继承上一行价值5，将 dp[2, 1] 写为5。</p><table><caption>计算 dp[2, 1] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>5，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-403"></a>

## 第 7 步：计算 dp\[2, 2\]，选入菠萝更新为 11

考虑前 2 件物品、容量 2。不选菠萝得 dp\[1, 2\] = 5；选入菠萝后剩余容量 0，得 dp\[1, 0\] + 11 = 0 + 11 = 11。取较大值 11 写入 dp\[2, 2\]。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算菠萝（i=2）、容量 c=2：比较不选菠萝的价值5与只选菠萝的价值11，将 dp[2, 2] 写为11。</p><table><caption>计算 dp[2, 2] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-404"></a>

## 第 8 步：计算 dp\[2, 3\]，苹果加菠萝更新为 16

考虑前 2 件物品、容量 3。不选菠萝得 dp\[1, 3\] = 5；选入菠萝后剩余容量 1，读取左上方 dp\[1, 1\] = 5（已选苹果）并加菠萝价值 11 得 16。取较大值 16 写入 dp\[2, 3\]。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算菠萝（i=2）、容量 c=3：比较不选菠萝的价值5与选入菠萝加苹果的价值16，将 dp[2, 3] 写为16。</p><table><caption>计算 dp[2, 3] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>0，未计算初值</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-405"></a>

## 第 9 步：计算 dp\[2, 4\]，最大价值为 16

考虑前 2 件物品、容量 4。不选菠萝得 dp\[1, 4\] = 5；选入菠萝后剩余容量 2，由 dp\[1, 2\] + 11 = 5 + 11 = 16。取较大值 16 写入 dp\[2, 4\]，第 2 行计算完毕。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算菠萝（i=2）、容量 c=4：比较不选菠萝的价值5与选入菠萝加苹果的价值16，将 dp[2, 4] 写为16，完成第2行。</p><table><caption>计算 dp[2, 4] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>16，已计算</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-406"></a>

## 第 10 步：计算 dp\[3, 1\]，装不下西瓜保持 5

考虑前 3 件物品、容量 1。3 号西瓜重 3，超过当前容量 1，只能不选，直接从正上方读取 dp\[2, 1\] = 5 写入 dp\[3, 1\]。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算西瓜（i=3）、容量 c=1：西瓜重3，当前容量装不下，只能不选并继承上一行价值5，将 dp[3, 1] 写为5。</p><table><caption>计算 dp[3, 1] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>16，已计算</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>5，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-407"></a>

## 第 11 步：计算 dp\[3, 2\]，装不下西瓜保持 11

考虑前 3 件物品、容量 2。西瓜重 3 仍超过当前容量 2，只能不选，直接从正上方读取 dp\[2, 2\] = 11 写入 dp\[3, 2\]。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算西瓜（i=3）、容量 c=2：西瓜重3，当前容量装不下，只能不选并继承上一行价值11，将 dp[3, 2] 写为11。</p><table><caption>计算 dp[3, 2] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>16，已计算</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-408"></a>

## 第 12 步：计算 dp\[3, 3\]，不选西瓜保留 16

考虑前 3 件物品、容量 3。不选西瓜得正上方 dp\[2, 3\] = 16（苹果加菠萝）；选入西瓜后剩余容量 0，得左上方 dp\[2, 0\] + 15 = 0 + 15 = 15。因不选西瓜的价值 16 高于单选西瓜的 15，取较大值 16 写入 dp\[3, 3\]。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算西瓜（i=3）、容量 c=3：比较不选西瓜的价值16（苹果加菠萝）与只选西瓜的价值15，将 dp[3, 3] 写为16。此时 dp[3, 4] 仍为未计算初值0。</p><table><caption>计算 dp[3, 3] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>16，已计算</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-409"></a>

## 第 13 步：计算 dp\[3, 4\]，苹果加西瓜更新为 20

考虑前 3 件物品、容量 4。不选西瓜得正上方 dp\[2, 4\] = 16；选入西瓜后剩余容量 1，由左上方 dp\[2, 1\] = 5（已选苹果）加西瓜价值 15 得 20。取较大值 20 写入右下角 dp\[3, 4\]。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。正在计算西瓜（i=3）、容量 c=4：比较不选西瓜的价值16与选入西瓜加苹果的价值20，将 dp[3, 4] 写为20。至此全部单元格计算完毕。</p><table><caption>计算 dp[3, 4] 后的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>16，已计算</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>20，已计算</td></tr></tbody></table></details>

<a id="source-410"></a>

## 第 14 步：返回容量 4 的最大价值 20

全部状态转移完成，右下角高亮格 dp\[3, 4\] = 20 即为最终返回值。画面下方提示“返回将所有物品放入背包的最大价值 20”，这里的“所有物品”指考虑完全部三件候选物品的范围（i = 3）：实际最优子集是选择苹果（重量 1、价值 5）与西瓜（重量 3、价值 15），放弃菠萝，总重量恰好为 4、最大总价值为 20。

<details><summary>本步完整状态</summary><p>背包容量为4；苹果重1、价值5，菠萝重2、价值11，西瓜重3、价值15，每件最多选一次。表中每格表示从该行可选物品中选择、总重量不超过该列容量时的最大价值。全部单元格填表完成，返回右下角 dp[3, 4]=20；最优方案为选择苹果和西瓜，总重量4、最大价值20。</p><table><caption>返回结果时的最大价值表</caption><thead><tr><th scope="col">可选物品（前 i 件）</th><th scope="col">容量 c=0</th><th scope="col">容量 c=1</th><th scope="col">容量 c=2</th><th scope="col">容量 c=3</th><th scope="col">容量 c=4</th></tr></thead><tbody><tr><th scope="row">没有物品（i=0）</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">苹果（i=1）</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">苹果、菠萝（i=2）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>16，已计算</td></tr><tr><th scope="row">苹果、菠萝、西瓜（i=3）</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>20，已计算</td></tr></tbody></table></details>

## 结果

最终右下角 dp\[3, 4\] = 20：最优方案是选择苹果（重 1、价值 5）和西瓜（重 3、价值 15），总重量 1 + 3 = 4，最大总价值 5 + 15 = 20。末帧图注“将所有物品放入背包的最大价值 20”是指考虑全部三件候选物品后的最优子集价值；三件全选总重为 6，已超过背包容量 4。
