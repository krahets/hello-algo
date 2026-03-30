# グラフの走査

木は「一対多」の関係を表すのに対し、グラフはより高い自由度を持ち、任意の「多対多」の関係を表現できます。したがって、木はグラフの一種の特殊な場合とみなせます。明らかに、**木の走査操作もグラフの走査操作の一種の特殊な場合です**。

グラフと木はいずれも、走査操作を実現するために探索アルゴリズムを用いる必要があります。グラフの走査方法も、<u>幅優先走査</u>と<u>深さ優先走査</u>の 2 種類に分けられます。

## 幅優先走査

**幅優先走査は、近いところから遠いところへ向かう走査方法であり、ある頂点から出発して、常に最も近い頂点を優先して訪問し、層ごとに外側へ広がっていきます**。以下の図に示すように、左上の頂点から出発し、まずその頂点のすべての隣接頂点を走査し、次に次の頂点のすべての隣接頂点を走査し、これを繰り返して、すべての頂点を訪問するまで続けます。

![グラフの幅優先走査](graph_traversal.assets/graph_bfs.png)

### アルゴリズムの実装

BFS は通常キューを用いて実装され、コードは以下のとおりです。キューは「先入れ先出し」という性質を持ち、これは BFS の「近いところから遠いところへ」という考え方と本質的に一致しています。

1. 走査の開始頂点 `startVet` をキューに追加し、ループを開始します。
2. ループの各反復で、キュー先頭の頂点を取り出して訪問を記録し、その後その頂点のすべての隣接頂点をキューの末尾に追加します。
3. 手順 `2.` を繰り返し、すべての頂点が訪問されると終了します。

頂点の重複走査を防ぐために、どの頂点が訪問済みかを記録するハッシュ集合 `visited` を用います。

!!! tip

    ハッシュ集合は、`value` を持たず `key` だけを格納するハッシュテーブルとみなせます。これは $O(1)$ の時間計算量で `key` の追加・削除・検索・更新を行えます。`key` の一意性にもとづき、ハッシュ集合は通常、データの重複排除などの場面で用いられます。

```src
[file]{graph_bfs}-[class]{}-[func]{graph_bfs}
```

コードはやや抽象的なので、以下の図と照らし合わせて理解を深めることを勧めます。

=== "<1>"
    ![グラフの幅優先走査の手順](graph_traversal.assets/graph_bfs_step1.png)

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

!!! question "幅優先走査の順序列は一意ですか？"

    一意ではありません。幅優先走査は「近いところから遠いところへ」の順で走査することだけを要求し、**同じ距離にある複数の頂点の走査順は任意に入れ替えて構いません**。上図を例にすると、頂点 $1$ と $3$ の訪問順は交換でき、頂点 $2$、$4$、$6$ の訪問順も任意に入れ替えられます。

### 計算量の分析

**時間計算量**：すべての頂点は 1 回ずつキューに入り、1 回ずつキューから出るため、$O(|V|)$ 時間です。隣接頂点を走査する過程では、無向グラフであるため、すべての辺が $2$ 回訪問され、$O(2|E|)$ 時間です。したがって全体では $O(|V| + |E|)$ 時間です。

**空間計算量**：リスト `res`、ハッシュ集合 `visited`、キュー `que` に含まれる頂点数は最大で $|V|$ であるため、$O(|V|)$ 空間です。

## 深さ優先走査

**深さ優先走査は、まず行けるところまで進み、進めなくなったら戻る走査方法です**。以下の図に示すように、左上の頂点から出発し、現在の頂点のある隣接頂点を訪問して、行き止まりに達するまで進んだら戻り、再び別の方向へ進んで行き止まりまで進んで戻る、ということを繰り返し、すべての頂点の走査が完了するまで続けます。

![グラフの深さ優先走査](graph_traversal.assets/graph_dfs.png)

### アルゴリズムの実装

この「行き止まりまで進んでから戻る」アルゴリズムのパターンは、通常再帰にもとづいて実装されます。幅優先走査と同様に、深さ優先走査でも、頂点の重複訪問を避けるために、訪問済みの頂点を記録するハッシュ集合 `visited` を用います。

```src
[file]{graph_dfs}-[class]{}-[func]{graph_dfs}
```

深さ優先走査のアルゴリズムの流れは以下の図のとおりです。

- **直線の破線は下向きの再帰呼び出し**を表し、新しい頂点を訪問するために新たな再帰メソッドが開始されたことを意味します。
- **曲線の破線は上向きのバックトラック**を表し、この再帰メソッドがすでに戻って、呼び出し元の位置までたどり着いたことを意味します。

理解を深めるために、以下の図とコードを結びつけて、DFS 全体の過程を頭の中でシミュレーションする（あるいは紙に書き出す）ことを勧めます。各再帰メソッドがいつ開始し、いつ戻るかも含めて追ってみてください。

=== "<1>"
    ![グラフの深さ優先走査の手順](graph_traversal.assets/graph_dfs_step1.png)

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

!!! question "深さ優先走査の順序列は一意ですか？"

    幅優先走査と同様に、深さ優先走査の順序列も一意ではありません。ある頂点が与えられたとき、どの方向を先に探索してもよく、つまり隣接頂点の順序は任意に入れ替えられ、それでも深さ優先走査になります。
    
    木の走査を例にすると、「根 $\rightarrow$ 左 $\rightarrow$ 右」「左 $\rightarrow$ 根 $\rightarrow$ 右」「左 $\rightarrow$ 右 $\rightarrow$ 根」は、それぞれ先行順、中間順、後行順走査に対応します。これらは 3 種類の走査優先順位を示していますが、いずれも深さ優先走査に属します。

### 計算量の分析

**時間計算量**：すべての頂点は $1$ 回ずつ訪問されるため、$O(|V|)$ 時間です。すべての辺は $2$ 回ずつ訪問されるため、$O(2|E|)$ 時間です。したがって全体では $O(|V| + |E|)$ 時間です。

**空間計算量**：リスト `res` とハッシュ集合 `visited` に含まれる頂点数は最大で $|V|$ であり、再帰の深さも最大で $|V|$ であるため、$O(|V|)$ 空間です。
