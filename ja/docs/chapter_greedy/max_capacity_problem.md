# 最大容量問題

!!! question

    配列 $ht$ が与えられ、各要素は垂直な仕切り板の高さを表します。任意の 2 枚の仕切り板とその間の空間で、容器を作れます。
    
    容器の容量は高さと幅の積（面積）です。高さは低い方の仕切り板で決まり、幅は 2 枚の仕切り板の配列インデックスの差です。
    
    容器の容量が最大になるように 2 枚の仕切り板を選び、最大容量を返してください。例を下図に示します。

![最大容量問題のデータ例](max_capacity_problem.assets/max_capacity_example.png)

容器は任意の 2 枚の仕切り板で作るため、**この問題の状態は 2 枚のインデックス $[i, j]$ で表せます**。

問題文によると、容量は高さと幅の積であり、高さは低い方の板、幅はインデックスの差で決まります。容量を $cap[i, j]$ とすると、次の式が得られます。

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

配列の長さを $n$ とすると、2 枚の組み合わせ（状態の総数）は $C_n^2 = \frac{n(n - 1)}{2}$ 通りです。最も直接的には、**すべての状態を列挙して**最大容量を求められます。時間計算量は $O(n^2)$ です。

### 貪欲戦略を決める

この問題には、さらに効率的な解法があります。下図のように、$i < j$ かつ $ht[i] < ht[j]$ を満たす状態 $[i, j]$ を選びます。つまり、$i$ が低い板、$j$ が高い板です。

![初期状態](max_capacity_problem.assets/max_capacity_initial_state.png)

下図のように、**高い方の板 $j$ を低い方の板 $i$ に近づけると、容量は必ず小さくなります**。

板 $j$ を動かすと、幅 $j-i$ は必ず小さくなります。一方、高さは低い方の板で決まるため、変わらない（$i$ が引き続き低い方）か、小さくなる（移動後の $j$ が低い方になる）かのどちらかです。

![高い方の板を内側に動かした状態](max_capacity_problem.assets/max_capacity_moving_long_board.png)

逆に考えると、**容量が大きくなる可能性があるのは、低い方の板 $i$ を内側に動かす場合だけです**。幅は必ず小さくなりますが、**高さは大きくなる可能性がある**からです（移動先の板 $i$ がより高いことがあります）。たとえば下図では、低い方の板を動かすと面積が大きくなります。

![低い方の板を内側に動かした状態](max_capacity_problem.assets/max_capacity_moving_short_board.png)

ここから貪欲戦略が導けます。二つのポインタを容器の両端に置き、毎回、低い方の板に対応するポインタを内側に動かし、二つが出会うまで続けます。

下図に、貪欲戦略の実行手順を示します。

1. 初期状態では、ポインタ $i$ と $j$ を配列の両端に置きます。
2. 現在の状態の容量 $cap[i, j]$ を計算し、最大容量を更新します。
3. 板 $i$ と板 $j$ の高さを比較し、低い方を一つ内側に動かします。
4. 手順 `2.` と `3.` を繰り返し、$i$ と $j$ が出会ったら終了します。

=== "<1>"
    ![最大容量問題を貪欲に解く流れ](max_capacity_problem.assets/max_capacity_greedy_step1.png)

=== "<2>"
    ![最大容量問題を貪欲に解く流れ：手順 2](max_capacity_problem.assets/max_capacity_greedy_step2.png)

=== "<3>"
    ![最大容量問題を貪欲に解く流れ：手順 3](max_capacity_problem.assets/max_capacity_greedy_step3.png)

=== "<4>"
    ![最大容量問題を貪欲に解く流れ：手順 4](max_capacity_problem.assets/max_capacity_greedy_step4.png)

=== "<5>"
    ![最大容量問題を貪欲に解く流れ：手順 5](max_capacity_problem.assets/max_capacity_greedy_step5.png)

=== "<6>"
    ![最大容量問題を貪欲に解く流れ：手順 6](max_capacity_problem.assets/max_capacity_greedy_step6.png)

=== "<7>"
    ![最大容量問題を貪欲に解く流れ：手順 7](max_capacity_problem.assets/max_capacity_greedy_step7.png)

=== "<8>"
    ![最大容量問題を貪欲に解く流れ：手順 8](max_capacity_problem.assets/max_capacity_greedy_step8.png)

=== "<9>"
    ![最大容量問題を貪欲に解く流れ：手順 9](max_capacity_problem.assets/max_capacity_greedy_step9.png)

### コードの実装

ループは最大 $n$ 回なので、**時間計算量は $O(n)$ です**。

変数 $i$、$j$、$res$ が使う追加の空間は一定なので、**空間計算量は $O(1)$ です**。

```src
[file]{max_capacity}-[class]{}-[func]{max_capacity}
```

### 正しさの証明

貪欲法が総当たりより速いのは、各回の貪欲な選択で一部の状態を「飛ばす」ためです。

たとえば状態 $cap[i, j]$ で、$i$ が低い板、$j$ が高い板だとします。低い方の $i$ を貪欲に一つ内側へ動かすと、下図の状態が「飛ばされます」。**つまり、その後はこれらの状態の容量を確認できなくなります**。

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![低い方の板を動かすことで飛ばされる状態](max_capacity_problem.assets/max_capacity_skipped_states.png)

**飛ばされる状態は、実際には高い方の板 $j$ を内側へ動かして得られるすべての状態です**。高い方の板を内側へ動かすと容量が必ず小さくなることは、すでに示しました。したがって、飛ばす状態が最適解になることはなく、**飛ばしても最適解を見逃すことはありません**。

以上から、低い方の板を動かす操作は「安全」であり、貪欲戦略は有効です。
