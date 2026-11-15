<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 0e7f88b1484d5d4510a12d097f53caa6f8b315cc1524c1840ce43215129a2ec8 -->

# 背包动态规划的单行压缩

使用单行一维数组保存状态，按容量从大到小倒序更新，确保状态转移读取的是上一轮物品的旧值，避免同一件物品被重复选入。

## 问题与输入

共有三件物品：物品 1 苹果（重量 1、价值 5）、物品 2 菠萝（重量 2、价值 11）、物品 3 西瓜（重量 3、价值 15），背包最大容量为 4，每件物品最多选一次。物品编号 i 从 1 开始，对应数组下标 wgt\[i-1\] 与 val\[i-1\]。

本组 6 帧仅演示外层循环 i=2（处理第二件物品菠萝）这一轮的完整倒序更新过程。进入本轮前，一维数组 dp\[0..4\] 已保存仅考虑第 1 件物品苹果（i=1）的结果 \[0, 5, 5, 5, 5\]；第 3 件物品西瓜（i=3）在本组中始终尚未处理。dp\[c\] 表示在当前已考虑物品范围内、总重量不超过容量 c 时的最大价值，不要求恰好装满。

## 结构与关系

处理菠萝（重 2、值 11）时，若当前容量 c ≥ 2，状态转移需比较“不选菠萝”（保留上一轮旧值 dp\[c\]）与“选入菠萝”（读取上一轮较小容量旧值 dp\[c-2\] + 11），取较大者写回 dp\[c\]。按容量 c = 4、3、2、1 倒序遍历时，被读取的左方格 dp\[c-2\] 尚未被本轮覆盖，仍保持上一轮（i=1，仅考虑苹果）的旧状态。

反之，若按容量从小到大正序更新，容量 2 会先被更新为 dp\[2\] = 11（已选入一件菠萝）；随后计算容量 4 时读取 dp\[2\] + 11 就会算出 22，相当于在容量 4 内把同一件菠萝重复装入两次，违背 0-1 背包每件最多一次的限制。倒序更新在 dp\[2\] 仍为旧值 5 时先算容量 4，从而得到正确值 5 + 11 = 16。

每帧画面上方给出 4×5 二维对照表，下方为实际使用的单行数组 dp\[0..4\]。单行中蓝色格表示保留的上一轮（i=1）旧状态，绿色格表示本轮（i=2）已完成更新的新状态；本轮末尾整行统一改标为蓝色，准备作为下一轮处理西瓜时的旧状态，数值本身不再变化。

<table><caption>本组物品数据</caption><thead><tr><th scope="col">物品编号i</th><th scope="col">物品</th><th scope="col">重量wgt[i−1]</th><th scope="col">价值val[i−1]</th></tr></thead><tbody><tr><th scope="row">1</th><td>苹果</td><td>1</td><td>5</td></tr><tr><th scope="row">2</th><td>菠萝</td><td>2</td><td>11</td></tr><tr><th scope="row">3</th><td>西瓜</td><td>3</td><td>15</td></tr></tbody></table>

<a id="source-411"></a>

## 第 1 步：开始处理菠萝

进入 i=2（菠萝，重 2、值 11）这一轮前，单行 dp\[0..4\] 已存有上一轮 i=1（仅考虑苹果）的有效结果 \[0, 5, 5, 5, 5\]，并非全零初始表。容量 0 恒为有效边界 0，容量 1 至 4 均处于上一轮 i=1 的旧状态，准备从最大容量 c=4 开始倒序更新。

<details><summary>本步完整状态</summary><p>背包容量 4，每件最多选一次（苹果重 1 值 5、菠萝重 2 值 11、西瓜重 3 值 15），本组仅演示处理第二件物品菠萝（i=2）。当前单行 dp[0..4] = [0, 5, 5, 5, 5]：容量 0 为边界有效 0，容量 1 至 4 均为上一轮 i=1（仅考虑苹果）的旧状态，尚未被本轮覆盖。</p><table><caption>单行dp：各容量的当前值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；上一轮i=1，仅考虑苹果，尚未被本轮覆盖</td></tr><tr><th scope="row">2</th><td>5，已计算；上一轮i=1，仅考虑苹果，尚未被本轮覆盖</td></tr><tr><th scope="row">3</th><td>5，已计算；上一轮i=1，仅考虑苹果，尚未被本轮覆盖</td></tr><tr><th scope="row">4</th><td>5，已计算；上一轮i=1，仅考虑苹果，尚未被本轮覆盖</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">前2件物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">前3件物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-412"></a>

## 第 2 步：倒序更新容量4

首先处理最大容量 c=4：不选菠萝保留旧值 dp\[4\]=5；选入菠萝则读取尚未被本轮覆盖的上一轮旧值 dp\[4-2\]=dp\[2\]=5，加上菠萝价值 11 得 16。取较大值将 dp\[4\] 更新为 16（归属本轮 i=2），而容量 1、2、3 仍保持上一轮 i=1 的旧值 5。

<details><summary>本步完整状态</summary><p>背包容量 4，当前倒序处理第二件物品菠萝（i=2，重 2 值 11）。单行 dp[0..4] = [0, 5, 5, 5, 16]：容量 4 已更新为本轮 i=2 的 16；容量 1、2、3 仍为上一轮 i=1 的旧状态 5（其中 dp[2]=5 刚被容量 4 作为旧状态读取）；容量 0 为边界有效 0。</p><table><caption>单行dp：各容量的当前值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；上一轮i=1，仅考虑苹果，尚未被本轮覆盖</td></tr><tr><th scope="row">2</th><td>5，已计算；上一轮i=1，仅考虑苹果，尚未被本轮覆盖</td></tr><tr><th scope="row">3</th><td>5，已计算；上一轮i=1，仅考虑苹果，尚未被本轮覆盖</td></tr><tr><th scope="row">4</th><td>16，已计算；本轮i=2，考虑苹果与菠萝</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">前2件物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>16，已计算</td></tr><tr><th scope="row">前3件物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-413"></a>

## 第 3 步：倒序更新容量3

继续倒序处理容量 c=3：不选菠萝保留旧值 dp\[3\]=5；选入菠萝则读取仍属上一轮 i=1 的旧值 dp\[3-2\]=dp\[1\]=5，加 11 得 16。取较大值将 dp\[3\] 更新为 16（归属本轮 i=2），容量 1、2 仍保持上一轮 i=1 的旧状态 5。

<details><summary>本步完整状态</summary><p>背包容量 4，当前倒序处理第二件物品菠萝（i=2，重 2 值 11）。单行 dp[0..4] = [0, 5, 5, 16, 16]：容量 3、4 已更新为本轮 i=2 的 16；容量 1、2 仍为上一轮 i=1 的旧状态 5；容量 0 为边界有效 0。</p><table><caption>单行dp：各容量的当前值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；上一轮i=1，仅考虑苹果，尚未被本轮覆盖</td></tr><tr><th scope="row">2</th><td>5，已计算；上一轮i=1，仅考虑苹果，尚未被本轮覆盖</td></tr><tr><th scope="row">3</th><td>16，已计算；本轮i=2，考虑苹果与菠萝</td></tr><tr><th scope="row">4</th><td>16，已计算；本轮i=2，考虑苹果与菠萝</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">前2件物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>16，已计算</td><td>16，已计算</td></tr><tr><th scope="row">前3件物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-414"></a>

## 第 4 步：倒序更新容量2

继续倒序处理容量 c=2：不选菠萝保留旧值 dp\[2\]=5；选入菠萝则读取边界 dp\[2-2\]=dp\[0\]=0，加 11 得 11。取较大值将 dp\[2\] 更新为 11（归属本轮 i=2）。正因为倒序到此刻才覆盖 dp\[2\]，此前计算容量 4 时才能读到未被覆盖的旧值 dp\[2\]=5；若正序先将 dp\[2\] 改为 11，容量 4 就会错算成 11+11=22。

<details><summary>本步完整状态</summary><p>背包容量 4，当前倒序处理第二件物品菠萝（i=2，重 2 值 11）。单行 dp[0..4] = [0, 5, 11, 16, 16]：容量 2、3、4 已更新为本轮 i=2 的结果（分别为 11、16、16）；仅剩容量 1 仍为上一轮 i=1 的旧状态 5；容量 0 为边界有效 0。</p><table><caption>单行dp：各容量的当前值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；上一轮i=1，仅考虑苹果，尚未被本轮覆盖</td></tr><tr><th scope="row">2</th><td>11，已计算；本轮i=2，考虑苹果与菠萝</td></tr><tr><th scope="row">3</th><td>16，已计算；本轮i=2，考虑苹果与菠萝</td></tr><tr><th scope="row">4</th><td>16，已计算；本轮i=2，考虑苹果与菠萝</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">前2件物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>11，已计算</td><td>16，已计算</td><td>16，已计算</td></tr><tr><th scope="row">前3件物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-415"></a>

## 第 5 步：处理装不下菠萝的容量1

最后处理容量 c=1：由于菠萝重量 2 大于容量 1，无法装入菠萝，只能沿用上一轮不选菠萝的值 dp\[1\]=5。虽然 dp\[1\] 的数值依然是 5，但该容量已完成第二轮（i=2）的判断，状态归属由上一轮 i=1 推进为本轮 i=2（数值不变不等于所属轮次未变）。

<details><summary>本步完整状态</summary><p>背包容量 4，当前倒序处理第二件物品菠萝（i=2，重 2 值 11）。单行 dp[0..4] = [0, 5, 11, 16, 16]：容量 1 虽数值仍为 5，但已完成本轮判断并归属 i=2；至此容量 1 至 4 全部为本轮 i=2（考虑苹果与菠萝）的有效结果，容量 0 为边界有效 0。</p><table><caption>单行dp：各容量的当前值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；本轮i=2，考虑苹果与菠萝</td></tr><tr><th scope="row">2</th><td>11，已计算；本轮i=2，考虑苹果与菠萝</td></tr><tr><th scope="row">3</th><td>16，已计算；本轮i=2，考虑苹果与菠萝</td></tr><tr><th scope="row">4</th><td>16，已计算；本轮i=2，考虑苹果与菠萝</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">前2件物品</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>16，已计算</td></tr><tr><th scope="row">前3件物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-416"></a>

## 第 6 步：本轮结束，准备下一轮

第二轮（i=2，菠萝）的所有容量均已更新完毕，单行 dp\[0..4\] = \[0, 5, 11, 16, 16\] 完整保存前两件物品的解。本帧没有新增计算，将容量 1 至 4 的格子由绿色改标为蓝色，使整行统一为蓝色，表示这组 i=2 的结果将在下一轮处理第三件物品西瓜（i=3）时充当旧状态；西瓜尚未开始处理。

<details><summary>本步完整状态</summary><p>背包容量 4，第二件物品菠萝（i=2）所在轮次已全部完成。单行 dp[0..4] = [0, 5, 11, 16, 16] 保存前两件物品（苹果与菠萝）的最大价值，整行转作下一轮的旧状态；第三件物品西瓜（重 3 值 15）尚未处理，因此 dp[4]=16 只是前两件物品的局部结果，并非三件物品的最终答案 20。</p><table><caption>单行dp：各容量的当前值与所属轮</caption><thead><tr><th scope="col">容量c</th><th scope="col">值、有效状态与轮次</th></tr></thead><tbody><tr><th scope="row">0</th><td>0，边界有效，各轮均为0</td></tr><tr><th scope="row">1</th><td>5，已计算；本轮i=2，考虑苹果与菠萝；下一轮将作为旧状态</td></tr><tr><th scope="row">2</th><td>11，已计算；本轮i=2，考虑苹果与菠萝；下一轮将作为旧状态</td></tr><tr><th scope="row">3</th><td>16，已计算；本轮i=2，考虑苹果与菠萝；下一轮将作为旧状态</td></tr><tr><th scope="row">4</th><td>16，已计算；本轮i=2，考虑苹果与菠萝；下一轮将作为旧状态</td></tr></tbody></table><table><caption>二维对照表：各子问题的计算进度</caption><thead><tr><th scope="col">可选物品</th><th scope="col">容量0</th><th scope="col">容量1</th><th scope="col">容量2</th><th scope="col">容量3</th><th scope="col">容量4</th></tr></thead><tbody><tr><th scope="row">前0件物品</th><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td><td>0，边界有效</td></tr><tr><th scope="row">前1件物品</th><td>0，边界有效</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td><td>5，已计算</td></tr><tr><th scope="row">前2件物品</th><td>0，边界有效</td><td>5，已计算</td><td>11，已计算</td><td>16，已计算</td><td>16，已计算</td></tr><tr><th scope="row">前3件物品</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

## 结果

第二轮（i=2，菠萝）倒序更新结束后，单行数组为 dp = \[0, 5, 11, 16, 16\]，其中 dp\[4\] = 16 仅代表前两件物品（苹果与菠萝）在容量 4 下的最大价值，是中间轮次的局部结果；第三件物品西瓜（重 3、值 15）尚未处理，不能将 16 误认为三件物品完整问题的最终答案 20。
