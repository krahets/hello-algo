# 二分木の走査

物理構造の観点から見ると、木は連結リストを基盤としたデータ構造であり、その走査はポインタを通じてノードへ順にアクセスすることで行われます。しかし、木は非線形データ構造であるため、木の走査は連結リストの走査よりも複雑であり、検索アルゴリズムを用いて実現する必要があります。

二分木の一般的な走査方法には、レベル順走査、先行順走査、中間順走査、後行順走査などがあります。

## レベル順走査

次の図に示すように、<u>レベル順走査（level-order traversal）</u>では、二分木を上から下へ層ごとに走査し、各層では左から右の順にノードへアクセスします。

レベル順走査は本質的に<u>幅優先走査（breadth-first traversal）</u>に属し、<u>幅優先探索（breadth-first search, BFS）</u>とも呼ばれます。これは「同心円状に外側へ広がる」ような、層ごとの走査方法を表しています。

![二分木のレベル順走査](binary_tree_traversal.assets/binary_tree_bfs.png)

### コードの実装

幅優先走査は通常「キュー」を用いて実装します。キューは「先入れ先出し」の規則に従い、幅優先走査は「層ごとに進む」という規則に従います。両者の背後にある考え方は一致しています。実装コードは次のとおりです：

```src
[file]{binary_tree_bfs}-[class]{}-[func]{level_order}
```

### 計算量

- **時間計算量は $O(n)$** ：すべてのノードを1回ずつ訪問するため、計算量は $O(n)$ です。ここで、$n$ はノード数です。
- **空間計算量は $O(n)$** ：最悪の場合、すなわち完全二分木では、最下層に到達する前に、キュー内には最大で同時に $(n + 1) / 2$ 個のノードが存在し、$O(n)$ の空間を使用します。

## 先行順・中間順・後行順走査

同様に、先行順・中間順・後行順走査はいずれも<u>深度優先走査（depth-first traversal）</u>に属し、<u>深度優先探索（depth-first search, DFS）</u>とも呼ばれます。これは「まず行き止まりまで進み、その後で戻って続ける」という走査方法を表しています。

次の図は、二分木に対して深度優先走査を行う仕組みを示しています。**深度優先走査は、二分木全体の外周をぐるりと「一周する」ようなものです**。各ノードでは3つの位置に出会い、それぞれが先行順走査・中間順走査・後行順走査に対応します。

![二分探索木の先行順・中間順・後行順走査](binary_tree_traversal.assets/binary_tree_dfs.png)

### コードの実装

深度優先探索は通常、再帰に基づいて実装されます：

```src
[file]{binary_tree_dfs}-[class]{}-[func]{post_order}
```

!!! tip

    深度優先探索は反復によって実装することもできます。興味のある読者は自身で調べてみてください。

次の図は、二分木の先行順走査における再帰の過程を示しており、「行き」と「帰り」という2つの逆向きの部分に分けられます。

1. 「行き」は新しいメソッドの開始を表し、この過程でプログラムは次のノードにアクセスします。
2. 「帰り」は関数の復帰を表し、現在のノードへのアクセスが完了したことを意味します。

=== "<1>"
    ![先行順走査の再帰過程](binary_tree_traversal.assets/preorder_step1.png)

=== "<2>"
    ![preorder_step2](binary_tree_traversal.assets/preorder_step2.png)

=== "<3>"
    ![preorder_step3](binary_tree_traversal.assets/preorder_step3.png)

=== "<4>"
    ![preorder_step4](binary_tree_traversal.assets/preorder_step4.png)

=== "<5>"
    ![preorder_step5](binary_tree_traversal.assets/preorder_step5.png)

=== "<6>"
    ![preorder_step6](binary_tree_traversal.assets/preorder_step6.png)

=== "<7>"
    ![preorder_step7](binary_tree_traversal.assets/preorder_step7.png)

=== "<8>"
    ![preorder_step8](binary_tree_traversal.assets/preorder_step8.png)

=== "<9>"
    ![preorder_step9](binary_tree_traversal.assets/preorder_step9.png)

=== "<10>"
    ![preorder_step10](binary_tree_traversal.assets/preorder_step10.png)

=== "<11>"
    ![preorder_step11](binary_tree_traversal.assets/preorder_step11.png)

### 計算量

- **時間計算量は $O(n)$** ：すべてのノードを1回ずつ訪問するため、計算量は $O(n)$ です。
- **空間計算量は $O(n)$** ：最悪の場合、すなわち木が連結リストに退化したとき、再帰の深さは $n$ に達し、システムは $O(n)$ のスタックフレーム空間を使用します。
