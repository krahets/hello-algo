# 選択ソート

<u>選択ソート（selection sort）</u>の仕組みは簡単です。ループの各回で未整列区間の最小要素を選び、整列済み区間の末尾に加えます。

配列の長さを $n$ とします。下図に選択ソートの手順を示します。

1. 初めは全要素が未整列なので、未整列のインデックス区間は $[0, n-1]$ です。
2. 区間 $[0, n-1]$ の最小要素を選び、インデックス $0$ の要素と交換します。これで配列の先頭の 1 要素が整列します。
3. 区間 $[1, n-1]$ の最小要素を選び、インデックス $1$ の要素と交換します。これで配列の先頭の 2 要素が整列します。
4. これを繰り返します。$n - 1$ 回の選択と交換が終わると、先頭の $n - 1$ 要素が整列します。
5. 残りの 1 要素は必ず最大なので、並べ替える必要はありません。これで配列のソートは完了です。

=== "<1>"
    ![選択ソートの手順](selection_sort.assets/selection_sort_step1.svg)

=== "<2>"
    ![selection_sort_step2](selection_sort.assets/selection_sort_step2.svg)

=== "<3>"
    ![selection_sort_step3](selection_sort.assets/selection_sort_step3.svg)

=== "<4>"
    ![selection_sort_step4](selection_sort.assets/selection_sort_step4.svg)

=== "<5>"
    ![selection_sort_step5](selection_sort.assets/selection_sort_step5.svg)

=== "<6>"
    ![selection_sort_step6](selection_sort.assets/selection_sort_step6.svg)

=== "<7>"
    ![selection_sort_step7](selection_sort.assets/selection_sort_step7.svg)

=== "<8>"
    ![selection_sort_step8](selection_sort.assets/selection_sort_step8.svg)

=== "<9>"
    ![selection_sort_step9](selection_sort.assets/selection_sort_step9.svg)

=== "<10>"
    ![selection_sort_step10](selection_sort.assets/selection_sort_step10.svg)

=== "<11>"
    ![selection_sort_step11](selection_sort.assets/selection_sort_step11.svg)

コードでは、$k$ を使って未整列区間の最小要素の位置を記録します。

```src
[file]{selection_sort}-[class]{}-[func]{selection_sort}
```

## アルゴリズムの特性

- **時間計算量は $O(n^2)$、非適応的なソート**。外側のループは $n - 1$ 回で、内側のループは最初の回に $n - 1$ 回、最後の回に $1$ 回実行します。各回の実行回数は順に $n - 1$、$n - 2$、$\dots$、$2$、$1$ で、合計は $\frac{n(n - 1)}{2}$ です。
- **空間計算量は $O(1)$、インプレースソート**。ポインタ $i$ と $j$ が使う追加領域は一定です。
- **不安定なソート**。下図のように、要素 `nums[i]` が交換によって等しい要素の右側に移り、相対順序が変わることがあります。

![選択ソートで等しい要素の順序が変わる例](selection_sort.assets/selection_sort_instability.svg)
