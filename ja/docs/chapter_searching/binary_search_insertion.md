# 二分探索の挿入位置

二分探索は目標要素の検索だけでなく、目標要素の挿入位置を探すなど、多くの派生問題の解決にも利用できます。

## 重複要素がない場合

!!! question

    長さ $n$ の整列済み配列 `nums` と要素 `target` が与えられます。配列には重複要素は存在しません。ここで `target` を配列 `nums` に挿入し、その順序を保ちます。配列中にすでに要素 `target` が存在する場合は、その左側に挿入します。挿入後の配列における `target` のインデックスを返してください。例を以下の図に示します。

![二分探索の挿入位置の例データ](binary_search_insertion.assets/binary_search_insertion_example.png)

前節の二分探索コードを再利用したい場合は、次の二つの問題に答える必要があります。

**問題 1**：配列に `target` が含まれる場合、挿入位置のインデックスはその要素のインデックスですか？

問題では `target` を等しい要素の左側に挿入するよう求めているため、新しく挿入された `target` は元の `target` の位置に入ります。つまり、**配列に `target` が含まれる場合、挿入位置のインデックスはその `target` のインデックスです**。

**問題 2**：配列に `target` が存在しない場合、挿入位置はどの要素のインデックスですか？

二分探索の過程をさらに考えると、`nums[m] < target` のときは $i$ が移動します。これは、ポインタ $i$ が `target` 以上の要素へ近づいていることを意味します。同様に、ポインタ $j$ は常に `target` 以下の要素へ近づいています。

したがって二分探索の終了時には、$i$ は最初の `target` より大きい要素を指し、$j$ は最初の `target` より小さい要素を指します。**よって、配列に `target` が含まれない場合、挿入インデックスは $i$ です**。コードは次のとおりです：

```src
[file]{binary_search_insertion}-[class]{}-[func]{binary_search_insertion_simple}
```

## 重複要素がある場合

!!! question

    前問を踏まえ、配列には重複要素が含まれる可能性があるものとし、それ以外の条件は変わりません。

配列中に複数の `target` が存在する場合、通常の二分探索ではそのうち一つの `target` のインデックスしか返せず、**その要素の左側と右側にあといくつ `target` があるかは分かりません**。

問題では目標要素を最も左に挿入する必要があるため、**配列中で最も左にある `target` のインデックスを探す必要があります**。まずは以下の図に示す手順で実現することを考えます。

1. 二分探索を実行し、任意の `target` のインデックスを得て、これを $k$ とします。
2. インデックス $k$ から始めて左へ線形探索し、最も左の `target` を見つけたら返します。

![線形探索による重複要素の挿入位置](binary_search_insertion.assets/binary_search_insertion_naive.png)

この方法は使用できますが、線形探索を含むため、時間計算量は $O(n)$ です。配列中に重複した `target` が多い場合、この方法の効率は低くなります。

次に、二分探索のコードを拡張することを考えます。以下の図に示すように、全体の流れは変えず、各反復でまず中点インデックス $m$ を計算し、その後 `target` と `nums[m]` の大小関係を判定して、次のいくつかの状況に分けます。

- `nums[m] < target` または `nums[m] > target` のときは、まだ `target` を見つけていないことを意味するため、通常の二分探索と同じ区間縮小を行い、**ポインタ $i$ と $j$ を `target` に近づけます**。
- `nums[m] == target` のときは、`target` より小さい要素が区間 $[i, m - 1]$ にあることを意味するため、$j = m - 1$ として区間を縮小し、**ポインタ $j$ を `target` より小さい要素に近づけます**。

ループ終了後、$i$ は最も左の `target` を指し、$j$ は最初の `target` より小さい要素を指すため、**インデックス $i$ が挿入位置です**。

=== "<1>"
    ![重複要素に対する二分探索の挿入位置の手順](binary_search_insertion.assets/binary_search_insertion_step1.png)

=== "<2>"
    ![binary_search_insertion_step2](binary_search_insertion.assets/binary_search_insertion_step2.png)

=== "<3>"
    ![binary_search_insertion_step3](binary_search_insertion.assets/binary_search_insertion_step3.png)

=== "<4>"
    ![binary_search_insertion_step4](binary_search_insertion.assets/binary_search_insertion_step4.png)

=== "<5>"
    ![binary_search_insertion_step5](binary_search_insertion.assets/binary_search_insertion_step5.png)

=== "<6>"
    ![binary_search_insertion_step6](binary_search_insertion.assets/binary_search_insertion_step6.png)

=== "<7>"
    ![binary_search_insertion_step7](binary_search_insertion.assets/binary_search_insertion_step7.png)

=== "<8>"
    ![binary_search_insertion_step8](binary_search_insertion.assets/binary_search_insertion_step8.png)

以下のコードを観察すると、分岐 `nums[m] > target` と `nums[m] == target` の処理は同じであるため、両者はまとめることができます。

それでも、判定条件を分けたままにしておくことは可能であり、そのほうがロジックがより明確で、可読性も高くなります。

```src
[file]{binary_search_insertion}-[class]{}-[func]{binary_search_insertion}
```

!!! tip

    本節のコードはすべて「両閉区間」の書き方です。興味のある読者は「左閉右開」の書き方を自分で実装してみてください。

要するに、二分探索とはポインタ $i$ と $j$ にそれぞれ探索目標を設定することにほかなりません。目標は具体的な要素（たとえば `target`）である場合もあれば、要素の範囲（たとえば `target` より小さい要素）である場合もあります。

繰り返される二分のループの中で、ポインタ $i$ と $j$ はどちらも事前に定めた目標へ徐々に近づいていきます。最終的に、それらは答えを見つけるか、境界を越えたところで停止します。
