# 0-1 ナップサック問題

ナップサック問題は、動的計画法の入門として非常に適した問題であり、動的計画法で最もよく見られる問題形式の1つです。これには 0-1 ナップサック問題、完全ナップサック問題、多重ナップサック問題など、多くの派生があります。

本節では、まず最も一般的な 0-1 ナップサック問題を解いていきます。

!!! question

    $n$ 個の品物が与えられ、$i$ 番目の品物の重さは $wgt[i-1]$、価値は $val[i-1]$ であり、容量 $cap$ のナップサックがあります。各品物は1回しか選べないとき、ナップサック容量の制約下で入れられる品物の最大価値を求めてください。

以下の図を見てみましょう。品物番号 $i$ は $1$ から始まり、配列のインデックスは $0$ から始まるため、品物 $i$ は重さ $wgt[i-1]$、価値 $val[i-1]$ に対応します。

![0-1 ナップサックのサンプルデータ](knapsack_problem.assets/knapsack_example.png)

0-1 ナップサック問題は、$n$ 回の意思決定からなる過程とみなせます。各品物について「入れない」「入れる」という2つの選択肢があるため、この問題は決定木モデルを満たします。

この問題の目的は「ナップサック容量の制約下で入れられる品物の最大価値」を求めることなので、動的計画法の問題である可能性が高いです。

**ステップ1：各ラウンドの選択を考え、状態を定義して、$dp$ テーブルを得る**

各品物について、ナップサックに入れなければ容量は変わらず、入れれば容量は減少します。ここから状態を、現在の品物番号 $i$ とナップサック容量 $c$ として定義し、$[i, c]$ と表せます。

状態 $[i, c]$ に対応する部分問題は、**先頭 $i$ 個の品物を容量 $c$ のナップサックに入れるときの最大価値** であり、これを $dp[i, c]$ と記します。

求めるべきものは $dp[n, cap]$ なので、サイズ $(n+1) \times (cap+1)$ の2次元 $dp$ テーブルが必要です。

**ステップ2：最適部分構造を見つけ、状態遷移方程式を導く**

品物 $i$ に対する選択を行った後に残るのは、先頭 $i-1$ 個の品物に対する部分問題であり、次の2つのケースに分けられます。

- **品物 $i$ を入れない** ：ナップサック容量は変わらず、状態は $[i-1, c]$ に変化します。
- **品物 $i$ を入れる** ：ナップサック容量は $wgt[i-1]$ だけ減少し、価値は $val[i-1]$ だけ増加して、状態は $[i-1, c-wgt[i-1]]$ に変化します。

以上の分析から、この問題の最適部分構造が分かります。すなわち、**最大価値 $dp[i, c]$ は、品物 $i$ を入れない場合と入れる場合のうち、より価値の大きい方に等しい** ということです。これにより、次の状態遷移方程式を導けます。

$$
dp[i, c] = \max(dp[i-1, c], dp[i-1, c - wgt[i-1]] + val[i-1])
$$

注意すべき点として、現在の品物の重さ $wgt[i - 1]$ が残りのナップサック容量 $c$ を超える場合は、入れない選択しかできません。

**ステップ3：境界条件と状態遷移の順序を決める**

品物がない場合、またはナップサック容量が $0$ の場合、最大価値は $0$ です。すなわち、先頭列 $dp[i, 0]$ と先頭行 $dp[0, c]$ はいずれも $0$ になります。

現在の状態 $[i, c]$ は、上側の状態 $[i-1, c]$ と左上の状態 $[i-1, c-wgt[i-1]]$ から遷移してくるため、2重ループで $dp$ テーブル全体を順方向に走査すれば十分です。

以上の分析に基づき、次に全探索、メモ化探索、動的計画法の順で実装していきます。

### 方法1：全探索

探索コードには次の要素が含まれます。

- **再帰引数**：状態 $[i, c]$ です。
- **戻り値**：部分問題の解 $dp[i, c]$ です。
- **終了条件**：品物番号が範囲外である $i = 0$、またはナップサックの残り容量が $0$ のとき、再帰を終了して価値 $0$ を返します。
- **枝刈り**：現在の品物の重さがナップサックの残り容量を超える場合、入れない選択しかできません。

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dfs}
```

以下の図のように、各品物ごとに「選ばない」「選ぶ」の2つの探索分岐が生じるため、時間計算量は $O(2^n)$ です。

再帰木を観察すると、$dp[1, 10]$ などの重複部分問題が存在することが分かります。品物数が多く、ナップサック容量が大きく、特に同じ重さの品物が多い場合には、重複部分問題の数は大幅に増加します。

![0-1 ナップサック問題の全探索の再帰木](knapsack_problem.assets/knapsack_dfs.png)

### 方法2：メモ化探索

重複部分問題が一度だけ計算されるようにするため、メモ配列 `mem` を用いて部分問題の解を記録します。ここで `mem[i][c]` は $dp[i, c]$ に対応します。

メモ化を導入すると、**時間計算量は部分問題の数に依存し**、すなわち $O(n \times cap)$ になります。実装コードは次のとおりです。

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dfs_mem}
```

次の図は、メモ化探索で剪定された探索分岐を示しています。

![0-1 ナップサック問題のメモ化探索の再帰木](knapsack_problem.assets/knapsack_dfs_mem.png)

### 方法3：動的計画法

動的計画法の本質は、状態遷移に従って $dp$ テーブルを埋めていく過程です。コードは次のようになります。

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dp}
```

以下の図のように、時間計算量と空間計算量はいずれも配列 `dp` のサイズによって決まり、$O(n \times cap)$ です。

=== "<1>"
    ![0-1 ナップサック問題の動的計画法の過程](knapsack_problem.assets/knapsack_dp_step1.png)

=== "<2>"
    ![knapsack_dp_step2](knapsack_problem.assets/knapsack_dp_step2.png)

=== "<3>"
    ![knapsack_dp_step3](knapsack_problem.assets/knapsack_dp_step3.png)

=== "<4>"
    ![knapsack_dp_step4](knapsack_problem.assets/knapsack_dp_step4.png)

=== "<5>"
    ![knapsack_dp_step5](knapsack_problem.assets/knapsack_dp_step5.png)

=== "<6>"
    ![knapsack_dp_step6](knapsack_problem.assets/knapsack_dp_step6.png)

=== "<7>"
    ![knapsack_dp_step7](knapsack_problem.assets/knapsack_dp_step7.png)

=== "<8>"
    ![knapsack_dp_step8](knapsack_problem.assets/knapsack_dp_step8.png)

=== "<9>"
    ![knapsack_dp_step9](knapsack_problem.assets/knapsack_dp_step9.png)

=== "<10>"
    ![knapsack_dp_step10](knapsack_problem.assets/knapsack_dp_step10.png)

=== "<11>"
    ![knapsack_dp_step11](knapsack_problem.assets/knapsack_dp_step11.png)

=== "<12>"
    ![knapsack_dp_step12](knapsack_problem.assets/knapsack_dp_step12.png)

=== "<13>"
    ![knapsack_dp_step13](knapsack_problem.assets/knapsack_dp_step13.png)

=== "<14>"
    ![knapsack_dp_step14](knapsack_problem.assets/knapsack_dp_step14.png)

### 空間最適化

各状態は直前の行の状態にしか依存しないため、2つの配列をローテーションして用いることで、空間計算量を $O(n^2)$ から $O(n)$ に削減できます。

さらに考えると、1つの配列だけで空間最適化を実現できるでしょうか。観察すると、各状態は真上または左上のマスから遷移してきます。配列が1つしかないと仮定すると、$i$ 行目の走査を開始した時点では、その配列にはまだ $i-1$ 行目の状態が格納されています。

- 順方向に走査すると、$dp[i, j]$ に到達した時点で、左上にある $dp[i-1, 1]$ ~ $dp[i-1, j-1]$ の値がすでに上書きされている可能性があり、正しい状態遷移結果を得られません。
- 逆方向に走査すれば、上書きの問題は発生せず、状態遷移を正しく行えます。

次の図は、単一配列のもとで $i = 1$ 行目から $i = 2$ 行目へ変換する過程を示しています。順方向走査と逆方向走査の違いを考えてみてください。

=== "<1>"
    ![0-1 ナップサックの空間最適化後の動的計画法の過程](knapsack_problem.assets/knapsack_dp_comp_step1.png)

=== "<2>"
    ![knapsack_dp_comp_step2](knapsack_problem.assets/knapsack_dp_comp_step2.png)

=== "<3>"
    ![knapsack_dp_comp_step3](knapsack_problem.assets/knapsack_dp_comp_step3.png)

=== "<4>"
    ![knapsack_dp_comp_step4](knapsack_problem.assets/knapsack_dp_comp_step4.png)

=== "<5>"
    ![knapsack_dp_comp_step5](knapsack_problem.assets/knapsack_dp_comp_step5.png)

=== "<6>"
    ![knapsack_dp_comp_step6](knapsack_problem.assets/knapsack_dp_comp_step6.png)

コード実装では、配列 `dp` の第1次元 $i$ をそのまま削除し、内側のループを逆方向走査に変更するだけで済みます。

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dp_comp}
```
