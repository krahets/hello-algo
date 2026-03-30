# 編集距離問題

編集距離は、Levenshtein 距離とも呼ばれ、2つの文字列の相互変換に必要な最小の編集回数を指し、通常は情報検索や自然言語処理において2つの系列の類似度を測るために用いられます。

!!! question

    2つの文字列 $s$ と $t$ を入力し、$s$ を $t$ に変換するのに必要な最小編集回数を返してください。
    
    1つの文字列に対して3種類の編集操作を行えます。1文字の挿入、1文字の削除、任意の文字への置換です。

下図に示すように、`kitten` を `sitting` に変換するには 3 回の編集が必要で、内訳は 2 回の置換と 1 回の挿入です。`hello` を `algo` に変換する場合も 3 回必要で、内訳は 2 回の置換と 1 回の削除です。

![編集距離のサンプルデータ](edit_distance_problem.assets/edit_distance_example.png)

**編集距離問題は決定木モデルで自然に説明できます**。文字列が木のノードに対応し、1回の決定（1回の編集操作）が木の1本の辺に対応します。

下図に示すように、操作に制限がない場合、各ノードからは多くの辺を派生でき、それぞれの辺が1種類の操作に対応します。これは `hello` から `algo` への変換に多くの経路があり得ることを意味します。

決定木の観点から見ると、本問の目標はノード `hello` とノード `algo` の間の最短経路を求めることです。

![決定木モデルに基づく編集距離問題の表現](edit_distance_problem.assets/edit_distance_decision_tree.png)

### 動的計画法の考え方

**第1ステップ：各ラウンドの決定を考え、状態を定義して、$dp$ テーブルを得る**

各ラウンドの決定は、文字列 $s$ に対して1回の編集操作を行うことです。

編集操作の過程で問題の規模が徐々に小さくなることを期待します。そうして初めて部分問題を構築できます。文字列 $s$ と $t$ の長さをそれぞれ $n$ と $m$ とし、まず両文字列の末尾の文字 $s[n-1]$ と $t[m-1]$ を考えます。

- $s[n-1]$ と $t[m-1]$ が同じなら、それらをスキップして、直接 $s[n-2]$ と $t[m-2]$ を考えます。
- $s[n-1]$ と $t[m-1]$ が異なるなら、$s$ に対して1回の編集（挿入、削除、置換）を行い、両文字列の末尾の文字を同じにします。そうすることでそれらをスキップし、より小さい問題を考えられます。

つまり、文字列 $s$ に対する各ラウンドの決定（編集操作）は、$s$ と $t$ における残りの未一致文字を変化させます。したがって、状態は現在 $s$ と $t$ で考えている第 $i$ と第 $j$ 文字とし、$[i, j]$ と記します。

状態 $[i, j]$ に対応する部分問題は、**$s$ の先頭 $i$ 文字を $t$ の先頭 $j$ 文字に変換するのに必要な最小編集回数**です。

これにより、サイズが $(i+1) \times (j+1)$ の2次元 $dp$ テーブルが得られます。

**第2ステップ：最適部分構造を見つけ、状態遷移方程式を導く**

部分問題 $dp[i, j]$ を考えます。これに対応する2つの文字列の末尾文字は $s[i-1]$ と $t[j-1]$ であり、編集操作の違いに応じて下図の3つの場合に分けられます。

1. $s[i-1]$ の後ろに $t[j-1]$ を追加する。このとき残る部分問題は $dp[i, j-1]$ です。
2. $s[i-1]$ を削除する。このとき残る部分問題は $dp[i-1, j]$ です。
3. $s[i-1]$ を $t[j-1]$ に置き換える。このとき残る部分問題は $dp[i-1, j-1]$ です。

![編集距離の状態遷移](edit_distance_problem.assets/edit_distance_state_transfer.png)

以上の分析から、最適部分構造は次のように得られます。$dp[i, j]$ の最小編集回数は、$dp[i, j-1]$、$dp[i-1, j]$、$dp[i-1, j-1]$ の3つのうち最小の編集回数に、今回の編集回数 $1$ を加えたものです。対応する状態遷移方程式は次のとおりです：

$$
dp[i, j] = \min(dp[i, j-1], dp[i-1, j], dp[i-1, j-1]) + 1
$$

注意すべき点として、**$s[i-1]$ と $t[j-1]$ が同じ場合、現在の文字を編集する必要はありません**。この場合の状態遷移方程式は次のとおりです：

$$
dp[i, j] = dp[i-1, j-1]
$$

**第3ステップ：境界条件と状態遷移の順序を決める**

2つの文字列がともに空のとき、編集回数は $0$、すなわち $dp[0, 0] = 0$ です。$s$ が空で $t$ が空でないとき、最小編集回数は $t$ の長さに等しいため、先頭行は $dp[0, j] = j$ です。$s$ が空でなく $t$ が空のとき、最小編集回数は $s$ の長さに等しいため、先頭列は $dp[i, 0] = i$ です。

状態遷移方程式を観察すると、$dp[i, j]$ の解は左、上、左上の解に依存します。そのため、2重ループで $dp$ テーブル全体を順方向に走査すれば十分です。

### コードの実装

```src
[file]{edit_distance}-[class]{}-[func]{edit_distance_dp}
```

下図に示すように、編集距離問題の状態遷移の過程はナップサック問題と非常によく似ており、どちらも2次元グリッドを埋めていく過程とみなせます。

=== "<1>"
    ![編集距離の動的計画法の過程](edit_distance_problem.assets/edit_distance_dp_step1.png)

=== "<2>"
    ![edit_distance_dp_step2](edit_distance_problem.assets/edit_distance_dp_step2.png)

=== "<3>"
    ![edit_distance_dp_step3](edit_distance_problem.assets/edit_distance_dp_step3.png)

=== "<4>"
    ![edit_distance_dp_step4](edit_distance_problem.assets/edit_distance_dp_step4.png)

=== "<5>"
    ![edit_distance_dp_step5](edit_distance_problem.assets/edit_distance_dp_step5.png)

=== "<6>"
    ![edit_distance_dp_step6](edit_distance_problem.assets/edit_distance_dp_step6.png)

=== "<7>"
    ![edit_distance_dp_step7](edit_distance_problem.assets/edit_distance_dp_step7.png)

=== "<8>"
    ![edit_distance_dp_step8](edit_distance_problem.assets/edit_distance_dp_step8.png)

=== "<9>"
    ![edit_distance_dp_step9](edit_distance_problem.assets/edit_distance_dp_step9.png)

=== "<10>"
    ![edit_distance_dp_step10](edit_distance_problem.assets/edit_distance_dp_step10.png)

=== "<11>"
    ![edit_distance_dp_step11](edit_distance_problem.assets/edit_distance_dp_step11.png)

=== "<12>"
    ![edit_distance_dp_step12](edit_distance_problem.assets/edit_distance_dp_step12.png)

=== "<13>"
    ![edit_distance_dp_step13](edit_distance_problem.assets/edit_distance_dp_step13.png)

=== "<14>"
    ![edit_distance_dp_step14](edit_distance_problem.assets/edit_distance_dp_step14.png)

=== "<15>"
    ![edit_distance_dp_step15](edit_distance_problem.assets/edit_distance_dp_step15.png)

### 空間最適化

$dp[i,j]$ は上の $dp[i-1, j]$、左の $dp[i, j-1]$、左上の $dp[i-1, j-1]$ から遷移されますが、順方向走査では左上の $dp[i-1, j-1]$ を失い、逆方向走査では $dp[i, j-1]$ を事前に構築できません。そのため、どちらの走査順序も適切ではありません。

そのため、変数 `leftup` を用いて左上の解 $dp[i-1, j-1]$ を一時保存し、左と上の解だけを考えればよくなります。このときの状況は完全ナップサック問題と同じであり、順方向走査を用いることができます。コードは次のとおりです：

```src
[file]{edit_distance}-[class]{}-[func]{edit_distance_dp_comp}
```
