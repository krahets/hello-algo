# 二分木の構築問題

!!! question

    二分木の前順走査 `preorder` と中順走査 `inorder` が与えられたとき、これらから二分木を構築し、その根ノードを返してください。二分木には値が重複するノードが存在しないものとします（下図のとおり）。

![二分木を構築する例のデータ](build_binary_tree_problem.assets/build_tree_example.png)

### 分割統治問題かどうかを判断する

元の問題は `preorder` と `inorder` から二分木を構築することであり、典型的な分割統治問題です。

- **問題は分解できる**：分割統治の観点から見ると、元の問題は 2 つの部分問題、すなわち左部分木の構築と右部分木の構築に分けられ、さらに根ノードを初期化する 1 ステップが加わります。各部分木（部分問題）に対しても、同じ分割方法を再利用してより小さな部分木（部分問題）へと分けていき、最小の部分問題（空部分木）に達した時点で終了します。
- **部分問題は独立している**：左部分木と右部分木は互いに独立しており、両者の間に重なりはありません。左部分木を構築するときは、中順走査と前順走査のうち左部分木に対応する部分だけを見れば十分です。右部分木も同様です。
- **部分問題の解は統合できる**：左部分木と右部分木（部分問題の解）が得られたら、それらを根ノードに接続することで元の問題の解を得られます。

### 部分木をどのように分割するか

以上の分析より、この問題は分割統治で解けます。**では、前順走査 `preorder` と中順走査 `inorder` を使って左部分木と右部分木をどのように分割すればよいのでしょうか**？

定義に従うと、`preorder` と `inorder` はいずれも 3 つの部分に分けられます。

- 前順走査：`[ 根ノード | 左部分木 | 右部分木 ]` ，例えば上図の木は `[ 3 | 9 | 2 1 7 ]` に対応します。
- 中順走査：`[ 左部分木 | 根ノード ｜ 右部分木 ]` ，例えば上図の木は `[ 9 | 3 | 1 2 7 ]` に対応します。

上図のデータを例にすると、下図の手順によって分割結果を得られます。

1. 前順走査の先頭要素 3 が根ノードの値です。
2. 根ノード 3 の `inorder` におけるインデックスを探すと、そのインデックスを用いて `inorder` を `[ 9 | 3 ｜ 1 2 7 ]` に分割できます。
3. `inorder` の分割結果から、左部分木と右部分木のノード数はそれぞれ 1 と 3 であることがわかり、したがって `preorder` を `[ 3 | 9 | 2 1 7 ]` に分割できます。

![前順走査と中順走査で部分木を分割する](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png)

### 変数を用いて部分木区間を記述する

以上の分割方法により、**根ノード、左部分木、右部分木が `preorder` と `inorder` の中で占めるインデックス区間**が得られました。これらのインデックス区間を表すために、いくつかのポインタ変数を導入します。

- 現在の木の根ノードが `preorder` に現れるインデックスを $i$ とします。
- 現在の木の根ノードが `inorder` に現れるインデックスを $m$ とします。
- 現在の木が `inorder` において占めるインデックス区間を $[l, r]$ とします。

次の表のように、これらの変数を用いれば根ノードの `preorder` におけるインデックスと、部分木の `inorder` におけるインデックス区間を表せます。

<p align="center"> 表 <id> &nbsp; 根ノードと部分木の前順走査・中順走査におけるインデックス </p>

|        | 根ノードの `preorder` におけるインデックス | 部分木の `inorder` におけるインデックス区間 |
| ------ | ---------------------------- | ----------------------------- |
| 現在の木 | $i$                          | $[l, r]$                      |
| 左部分木 | $i + 1$                      | $[l, m-1]$                    |
| 右部分木 | $i + 1 + (m - l)$            | $[m+1, r]$                    |

右部分木の根ノードのインデックスにある $(m-l)$ は「左部分木のノード数」を意味します。下図と合わせて理解することを勧めます。

![根ノードと左右部分木のインデックス区間の表し方](build_binary_tree_problem.assets/build_tree_division_pointers.png)

### コードの実装

$m$ の検索効率を高めるために、ハッシュテーブル `hmap` を用いて配列 `inorder` の要素からインデックスへの対応を保存します。

```src
[file]{build_tree}-[class]{}-[func]{build_tree}
```

下図は二分木を構築する再帰過程を示しています。各ノードは下向きに「再帰していく」過程で生成され、各辺（参照）は上向きに「戻る」過程で張られます。

=== "<1>"
    ![二分木を構築する再帰過程](build_binary_tree_problem.assets/built_tree_step1.png)

=== "<2>"
    ![built_tree_step2](build_binary_tree_problem.assets/built_tree_step2.png)

=== "<3>"
    ![built_tree_step3](build_binary_tree_problem.assets/built_tree_step3.png)

=== "<4>"
    ![built_tree_step4](build_binary_tree_problem.assets/built_tree_step4.png)

=== "<5>"
    ![built_tree_step5](build_binary_tree_problem.assets/built_tree_step5.png)

=== "<6>"
    ![built_tree_step6](build_binary_tree_problem.assets/built_tree_step6.png)

=== "<7>"
    ![built_tree_step7](build_binary_tree_problem.assets/built_tree_step7.png)

=== "<8>"
    ![built_tree_step8](build_binary_tree_problem.assets/built_tree_step8.png)

=== "<9>"
    ![built_tree_step9](build_binary_tree_problem.assets/built_tree_step9.png)

各再帰関数における前順走査 `preorder` と中順走査 `inorder` の分割結果を下図に示します。

![各再帰関数での分割結果](build_binary_tree_problem.assets/built_tree_overall.png)

木のノード数を $n$ とすると、各ノードの初期化（再帰関数 `dfs()` の 1 回の実行）には $O(1)$ 時間かかります。**したがって、全体の時間計算量は $O(n)$** です。

ハッシュテーブルには `inorder` の要素からインデックスへの対応を保存するため、空間計算量は $O(n)$ です。最悪の場合、すなわち二分木が連結リストに退化すると、再帰の深さは $n$ に達し、$O(n)$ のスタックフレーム空間を使用します。**したがって、全体の空間計算量は $O(n)$** です。
