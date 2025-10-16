# グラフ走査

木は「一対多」の関係を表現し、グラフはより高い自由度を持ち、任意の「多対多」の関係を表現できます。したがって、木をグラフの特別なケースと見なすことができます。明らかに、**木の走査操作もグラフ走査操作の特別なケースです**。

グラフと木の両方で、走査操作を実装するために探索アルゴリズムの応用が必要です。グラフ走査は2つのタイプに分けることができます：<u>幅優先探索（BFS）</u>と<u>深さ優先探索（DFS）</u>です。

## 幅優先探索

**幅優先探索は近くから遠くへの走査方法で、ある頂点から開始し、常に最も近い頂点を優先的に訪問し、層ごとに外側に展開していきます**。下図に示すように、左上の頂点から開始し、まずその頂点のすべての隣接頂点を走査し、次に次の頂点のすべての隣接頂点を走査し、以下同様に、すべての頂点が訪問されるまで続けます。

![グラフの幅優先走査](graph_traversal.assets/graph_bfs.png)

### アルゴリズムの実装

BFSは通常キューの助けを借りて実装されます（下記のコード参照）。キューは「先入先出」で、これは「近くから遠くへ」走査するBFSの考え方と一致します。

1. 開始頂点`startVet`をキューに追加し、ループを開始します。
2. ループの各反復で、キューの先頭の頂点をポップし、それを訪問済みとして記録し、次にその頂点のすべての隣接頂点をキューの末尾に追加します。
3. すべての頂点が訪問されるまで手順`2.`を繰り返します。

頂点の再訪問を防ぐために、ハッシュセット`visited`を使用してどのノードが訪問されたかを記録します。

```src
[file]{graph_bfs}-[class]{}-[func]{graph_bfs}
```

コードは比較的抽象的ですが、下図と比較することでより良く理解できます。

=== "<1>"
    ![グラフの幅優先探索の手順](graph_traversal.assets/graph_bfs_step1.png)

=== "<2>"
    ![graph_bfs_step2](graph_traversal.assets/graph_bfs_step2.png)

=== "<3>"
    ![graph_bfs_step3](graph_traversal.assets/graph_bfs_step3.png)

=== "<4>"
    ![graph_bfs_step4](graph_traversal.assets/graph_bfs_step4.png)

=== "<5>"
    ![graph_bfs_step5](graph_traversal.assets/graph_bfs_step5.png)

=== "<6>"
    ![graph_bfs_step6](graph_traversal.assets/graph_bfs_step6.png)

=== "<7>"
    ![graph_bfs_step7](graph_traversal.assets/graph_bfs_step7.png)

=== "<8>"
    ![graph_bfs_step8](graph_traversal.assets/graph_bfs_step8.png)

=== "<9>"
    ![graph_bfs_step9](graph_traversal.assets/graph_bfs_step9.png)

=== "<10>"
    ![graph_bfs_step10](graph_traversal.assets/graph_bfs_step10.png)

=== "<11>"
    ![graph_bfs_step11](graph_traversal.assets/graph_bfs_step11.png)

!!! question "幅優先走査のシーケンスは一意ですか？"

    一意ではありません。幅優先走査は「近くから遠く」の順序で走査することのみを要求し、**同じ距離の頂点の走査順序は任意にできます**。例えば、上図では、頂点$1$と$3$の訪問順序を交換できますし、頂点$2$、$4$、$6$の順序も同様です。

### 計算量分析

**時間計算量**：すべての頂点が一度ずつエンキューおよびデキューされ、$O(|V|)$時間を使用します。隣接頂点を走査する過程で、無向グラフであるため、すべての辺が$2$回訪問され、$O(2|E|)$時間を使用します。全体で$O(|V| + |E|)$時間を使用します。

**空間計算量**：リスト`res`、ハッシュセット`visited`、キュー`que`の最大頂点数は$|V|$で、$O(|V|)$空間を使用します。

## 深さ優先探索

**深さ優先探索は可能な限り遠くまで行き、それ以上のパスがない場合にバックトラックする走査方法です**。下図に示すように、左上の頂点から開始し、それ以上のパスがなくなるまで現在の頂点のいずれかの隣接頂点を訪問し、次に戻って続行し、すべての頂点が走査されるまで続けます。

![グラフの深さ優先走査](graph_traversal.assets/graph_dfs.png)

### アルゴリズムの実装

この「可能な限り遠くまで行ってから戻る」アルゴリズムパラダイムは通常再帰に基づいて実装されます。幅優先探索と同様に、深さ優先探索でも、再訪問を避けるために訪問済み頂点を記録するハッシュセット`visited`の助けが必要です。

```src
[file]{graph_dfs}-[class]{}-[func]{graph_dfs}
```

深さ優先探索のアルゴリズムプロセスを下図に示します。

- **破線は下向きの再帰を表し**、新しい頂点を訪問するために新しい再帰メソッドが開始されたことを示します。
- **曲線の破線は上向きのバックトラックを表し**、この再帰メソッドがこのメソッドが開始された位置に戻ったことを示します。

理解を深めるため、下図とコードを組み合わせて、DFSプロセス全体を頭の中でシミュレート（または描画）することをお勧めします。各再帰メソッドがいつ開始され、いつ戻るかを含めてです。

=== "<1>"
    ![グラフの深さ優先探索の手順](graph_traversal.assets/graph_dfs_step1.png)

=== "<2>"
    ![graph_dfs_step2](graph_traversal.assets/graph_dfs_step2.png)

=== "<3>"
    ![graph_dfs_step3](graph_traversal.assets/graph_dfs_step3.png)

=== "<4>"
    ![graph_dfs_step4](graph_traversal.assets/graph_dfs_step4.png)

=== "<5>"
    ![graph_dfs_step5](graph_traversal.assets/graph_dfs_step5.png)

=== "<6>"
    ![graph_dfs_step6](graph_traversal.assets/graph_dfs_step6.png)

=== "<7>"
    ![graph_dfs_step7](graph_traversal.assets/graph_dfs_step7.png)

=== "<8>"
    ![graph_dfs_step8](graph_traversal.assets/graph_dfs_step8.png)

=== "<9>"
    ![graph_dfs_step9](graph_traversal.assets/graph_dfs_step9.png)

=== "<10>"
    ![graph_dfs_step10](graph_traversal.assets/graph_dfs_step10.png)

=== "<11>"
    ![graph_dfs_step11](graph_traversal.assets/graph_dfs_step11.png)

!!! question "深さ優先走査のシーケンスは一意ですか？"

    幅優先走査と同様に、深さ優先走査シーケンスの順序も一意ではありません。ある頂点が与えられた場合、どの方向を最初に探索することも可能です。つまり、隣接頂点の順序は任意にシャッフルできますが、すべて深さ優先走査の一部です。

    木の走査を例に取ると、「根 $\rightarrow$ 左 $\rightarrow$ 右」、「左 $\rightarrow$ 根 $\rightarrow$ 右」、「左 $\rightarrow$ 右 $\rightarrow$ 根」は、それぞれ前順、中順、後順走査に対応します。これらは3つの異なる走査優先度を示していますが、3つすべてが深さ優先走査と見なされます。

### 計算量分析

**時間計算量**：すべての頂点が一度訪問され、$O(|V|)$時間を使用します。すべての辺が2回訪問され、$O(2|E|)$時間を使用します。全体で$O(|V| + |E|)$時間を使用します。

**空間計算量**：リスト`res`、ハッシュセット`visited`の最大頂点数は$|V|$で、最大再帰深度は$|V|$です。したがって、$O(|V|)$空間を使用します。
