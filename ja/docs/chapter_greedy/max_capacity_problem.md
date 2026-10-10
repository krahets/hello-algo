# 最大容量問題

!!! question

    配列 $ht$ が与えられ、各要素は垂直な仕切り板の高さを表します。配列内の任意の 2 枚の仕切り板と、その間の空間で容器を構成できます。
    
    容器の容量は高さと幅の積（面積）に等しく、高さは短い方の仕切り板で決まり、幅は 2 枚の仕切り板の配列インデックスの差です。
    
    配列から 2 枚の仕切り板を選び、構成される容器の容量が最大となるようにしてください。最大容量を返します。例を以下の図に示します。

![最大容量問題のサンプルデータ](max_capacity_problem.assets/max_capacity_example.png)

容器は任意の 2 枚の仕切り板で囲まれるため、**本問の状態は 2 枚の仕切り板のインデックスで表され、$[i, j]$ と記します**。

問題の条件より、容量は高さと幅の積に等しく、高さは短い板で決まり、幅は 2 枚の仕切り板の配列インデックスの差です。容量を $cap[i, j]$ とすると、計算式は次のようになります。

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

配列の長さを $n$ とすると、2 枚の仕切り板の組合せ数（状態総数）は $C_n^2 = \frac{n(n - 1)}{2}$ 個です。最も直接的には、**すべての状態を総当たりできます**。これにより最大容量を求められ、時間計算量は $O(n^2)$ です。

### 貪欲戦略の決定

この問題にはさらに効率的な解法があります。以下の図のように、状態 $[i, j]$ を 1 つ選び、インデックスが $i < j$ かつ高さが $ht[i] < ht[j]$ を満たすとします。つまり、$i$ が短い板、$j$ が長い板です。

![初期状態](max_capacity_problem.assets/max_capacity_initial_state.png)

以下の図のように、**このとき長い板 $j$ を短い板 $i$ に近づけると、容量は必ず小さくなります**。

これは、長い板 $j$ を動かした後は幅 $j-i$ が必ず小さくなるためです。また、高さは短い板で決まるので、高さは変わらない（ $i$ が依然として短い板）か、小さくなる（移動後の $j$ が短い板になる）ことしかありません。

![長い板を内側へ動かした後の状態](max_capacity_problem.assets/max_capacity_moving_long_board.png)

逆に考えると、**短い板 $i$ を内側へ縮めた場合にのみ、容量が大きくなる可能性があります**。幅は必ず小さくなりますが、**高さは大きくなる可能性がある**からです（移動後の短い板 $i$ がより長くなる可能性があります）。たとえば次の図では、短い板を動かした後に面積が大きくなっています。

![短い板を内側へ動かした後の状態](max_capacity_problem.assets/max_capacity_moving_short_board.png)

以上から、本問の貪欲戦略を導けます。2 本のポインタを初期化して容器の両端に置き、各ラウンドで短い板に対応するポインタを内側へ縮め、2 本のポインタが出会うまで続けます。

以下の図は、貪欲戦略の実行過程を示しています。

1. 初期状態では、ポインタ $i$ と $j$ は配列の両端にあります。
2. 現在の状態の容量 $cap[i, j]$ を計算し、最大容量を更新します。
3. 板 $i$ と板 $j$ の高さを比較し、短い板を内側へ 1 マス移動します。
4. `2.` と `3.` を繰り返し実行し、$i$ と $j$ が出会ったら終了します。

=== "<1>"
    ![最大容量問題の貪欲な過程](max_capacity_problem.assets/max_capacity_greedy_step1.png)

=== "<2>"
    ![max_capacity_greedy_step2](max_capacity_problem.assets/max_capacity_greedy_step2.png)

=== "<3>"
    ![max_capacity_greedy_step3](max_capacity_problem.assets/max_capacity_greedy_step3.png)

=== "<4>"
    ![max_capacity_greedy_step4](max_capacity_problem.assets/max_capacity_greedy_step4.png)

=== "<5>"
    ![max_capacity_greedy_step5](max_capacity_problem.assets/max_capacity_greedy_step5.png)

=== "<6>"
    ![max_capacity_greedy_step6](max_capacity_problem.assets/max_capacity_greedy_step6.png)

=== "<7>"
    ![max_capacity_greedy_step7](max_capacity_problem.assets/max_capacity_greedy_step7.png)

=== "<8>"
    ![max_capacity_greedy_step8](max_capacity_problem.assets/max_capacity_greedy_step8.png)

=== "<9>"
    ![max_capacity_greedy_step9](max_capacity_problem.assets/max_capacity_greedy_step9.png)

### コード実装

コードのループ回数は最大でも $n$ 回であるため、**時間計算量は $O(n)$** です。

変数 $i$、$j$、$res$ が使う追加領域は定数サイズなので、**空間計算量は $O(1)$** です。

```src
[file]{max_capacity}-[class]{}-[func]{max_capacity}
```

### 正しさの証明

貪欲法が総当たりより速いのは、各ラウンドの貪欲な選択がいくつかの状態を「スキップ」するためです。

たとえば状態 $cap[i, j]$ において、$i$ が短い板、$j$ が長い板だとします。貪欲に短い板 $i$ を内側へ 1 マス動かすと、次の図に示す状態が「スキップ」されます。**これは、その後それらの状態の容量を検証できないことを意味します**。

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![短い板の移動によってスキップされる状態](max_capacity_problem.assets/max_capacity_skipped_states.png)

観察すると、**これらのスキップされた状態は、実際には長い板 $j$ を内側へ動かしたすべての状態そのものです**。前述のとおり、長い板を内側へ動かすと容量は必ず小さくなります。つまり、スキップされた状態はいずれも最適解にはなりえず、**それらを飛ばしても最適解を逃すことはありません**。

以上の分析から、短い板を動かす操作は「安全」であり、貪欲戦略は有効であると分かります。
