# 選択ソート

<u>選択ソート（selection sort）</u>の仕組みは非常に単純です。ループを開始し、各ラウンドで未ソート区間から最小の要素を選び、整列済み区間の末尾に配置します。

配列の長さを $n$ とすると、選択ソートの手順は次の図のようになります。

1. 初期状態では、すべての要素が未ソートであり、未ソートな（インデックス）区間は $[0, n-1]$ です。
2. 区間 $[0, n-1]$ 内の最小要素を選び、インデックス $0$ の要素と交換します。これにより、配列の先頭 1 要素が整列済みになります。
3. 区間 $[1, n-1]$ 内の最小要素を選び、インデックス $1$ の要素と交換します。これにより、配列の先頭 2 要素が整列済みになります。
4. これを繰り返します。$n - 1$ 回の選択と交換を経ると、配列の先頭 $n - 1$ 要素が整列済みになります。
5. 残った 1 つの要素は必ず最大要素なので、ソートは不要です。これで配列のソートは完了します。

=== "<1>"
    ![選択ソートの手順](selection_sort.assets/selection_sort_step1.png)

=== "<2>"
    ![selection_sort_step2](selection_sort.assets/selection_sort_step2.png)

=== "<3>"
    ![selection_sort_step3](selection_sort.assets/selection_sort_step3.png)

=== "<4>"
    ![selection_sort_step4](selection_sort.assets/selection_sort_step4.png)

=== "<5>"
    ![selection_sort_step5](selection_sort.assets/selection_sort_step5.png)

=== "<6>"
    ![selection_sort_step6](selection_sort.assets/selection_sort_step6.png)

=== "<7>"
    ![selection_sort_step7](selection_sort.assets/selection_sort_step7.png)

=== "<8>"
    ![selection_sort_step8](selection_sort.assets/selection_sort_step8.png)

=== "<9>"
    ![selection_sort_step9](selection_sort.assets/selection_sort_step9.png)

=== "<10>"
    ![selection_sort_step10](selection_sort.assets/selection_sort_step10.png)

=== "<11>"
    ![selection_sort_step11](selection_sort.assets/selection_sort_step11.png)

コードでは、$k$ を用いて未ソート区間内の最小要素を記録します。

```src
[file]{selection_sort}-[class]{}-[func]{selection_sort}
```

## アルゴリズムの特徴

- **時間計算量は $O(n^2)$、非適応ソート**：外側のループは合計 $n - 1$ 回です。最初のラウンドの未ソート区間の長さは $n$、最後のラウンドでは $2$ であり、各ラウンドの内側のループ回数はそれぞれ $n$、$n - 1$、$\dots$、$3$、$2$ となります。総和は $\frac{(n - 1)(n + 2)}{2}$ です。
- **空間計算量は $O(1)$、インプレースソート**：ポインタ $i$ と $j$ は定数サイズの追加領域しか使用しません。
- **不安定ソート**：次の図のように、要素 `nums[i]` がそれと等しい要素の右側へ交換され、両者の相対的な順序が変わる可能性があります。

![選択ソートの不安定な例](selection_sort.assets/selection_sort_instability.png)
