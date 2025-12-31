---
comments: true
---

# 12.3 &nbsp; 二分木構築問題

!!! question

    二分木の前順走査 `preorder` シーケンスと中順走査 `inorder` シーケンスが与えられた場合、二分木を構築してそのルートノードを返してください。二分木に重複するノード値がないと仮定します（以下の図に示すように）。

![二分木構築のサンプルデータ](build_binary_tree_problem.assets/build_tree_example.png){ class="animation-figure" }

<p align="center"> 図 12-5 &nbsp; 二分木構築のサンプルデータ </p>

### 1. &nbsp; 分割統治問題かどうかの判定

`preorder` と `inorder` シーケンスから二分木を構築する元の問題は、典型的な分割統治問題です。

- **問題を分解できる**：分割統治の観点から、元の問題を2つの部分問題（左の部分木の構築と右の部分木の構築）とルートノードの初期化という1つの操作に分割できます。各部分木（部分問題）について、同じアプローチを継続的に適用し、より小さな部分木（部分問題）に分割し、最小の部分問題（空の部分木）に到達するまで続けます。
- **部分問題は独立している**：左と右の部分木は重複しません。左の部分木を構築する際、左の部分木に対応する中順走査と前順走査のセグメントのみが必要です。右の部分木にも同じアプローチが適用されます。
- **部分問題の解を組み合わせることができる**：左と右の部分木（部分問題の解）を構築したら、それらをルートノードに接続して元の問題の解を取得できます。

### 2. &nbsp; 部分木の分割方法

上記の分析に基づいて、この問題は分割統治を使用して解決できます。**しかし、前順走査 `preorder` シーケンスと中順走査 `inorder` シーケンスを使用して左と右の部分木をどのように分割すればよいでしょうか？**

定義により、`preorder` と `inorder` シーケンスの両方を3つの部分に分割できます：

- 前順走査：`[ ルート | 左の部分木 | 右の部分木 ]`。例えば、図では、木は `[ 3 | 9 | 2 1 7 ]` に対応します。
- 中順走査：`[ 左の部分木 | ルート | 右の部分木 ]`。例えば、図では、木は `[ 9 | 3 | 1 2 7 ]` に対応します。

前の図のデータを使用して、次の図に示すステップに従って分割結果を取得できます：

1. 前順走査の最初の要素3がルートノードの値です。
2. `inorder` シーケンス内でルートノード3のインデックスを見つけ、このインデックスを使用して `inorder` を `[ 9 | 3 ｜ 1 2 7 ]` に分割します。
3. `inorder` シーケンスの分割に従って、左と右の部分木がそれぞれ1個と3個のノードを含むことが簡単に決定できるため、`preorder` シーケンスを `[ 3 | 9 | 2 1 7 ]` に対応して分割できます。

![前順走査と中順走査での部分木の分割](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png){ class="animation-figure" }

<p align="center"> 図 12-6 &nbsp; 前順走査と中順走査での部分木の分割 </p>

### 3. &nbsp; 変数に基づく部分木範囲の記述

上記の分割方法に基づいて、**`preorder` と `inorder` シーケンスにおけるルート、左の部分木、右の部分木のインデックス範囲を取得しました**。これらのインデックス範囲を記述するために、いくつかのポインタ変数を使用します。

- 現在の木のルートノードの `preorder` シーケンスでのインデックスを $i$ とします。
- 現在の木のルートノードの `inorder` シーケンスでのインデックスを $m$ とします。
- 現在の木の `inorder` シーケンスでのインデックス範囲を $[l, r]$ とします。

以下の表に示すように、これらの変数は `preorder` シーケンスでのルートノードのインデックスと `inorder` シーケンスでの部分木のインデックス範囲を表します。

<p align="center"> 表 12-1 &nbsp; 前順走査と中順走査でのルートノードと部分木のインデックス </p>

<div class="center-table" markdown>

|               | `preorder` でのルートノードインデックス | `inorder` での部分木インデックス範囲 |
| ------------- | ------------------------------------- | ----------------------------------- |
| 現在の木      | $i$                                   | $[l, r]$                            |
| 左の部分木    | $i + 1$                               | $[l, m-1]$                          |
| 右の部分木    | $i + 1 + (m - l)$                     | $[m+1, r]$                          |

</div>

右の部分木のルートインデックスの $(m-l)$ は「左の部分木のノード数」を表すことに注意してください。より明確な理解のために、以下の図を参照することが役立つ場合があります。

![ルートノードと左右の部分木のインデックス](build_binary_tree_problem.assets/build_tree_division_pointers.png){ class="animation-figure" }

<p align="center"> 図 12-7 &nbsp; ルートノードと左右の部分木のインデックス </p>

### 4. &nbsp; コード実装

$m$ の問い合わせの効率を向上させるために、ハッシュテーブル `hmap` を使用して `inorder` シーケンスの要素からそのインデックスへのマッピングを格納します：

=== "Python"

    ```python title="build_tree.py"
    def dfs(
        preorder: list[int],
        inorder_map: dict[int, int],
        i: int,
        l: int,
        r: int,
    ) -> TreeNode | None:
        """二分木の構築：分割統治"""
        # 部分木の区間が空のとき終了
        if r - l < 0:
            return None
        # ルートノードを初期化
        root = TreeNode(preorder[i])
        # m をクエリして左部分木と右部分木を分割
        m = inorder_map[preorder[i]]
        # 部分問題：左部分木を構築
        root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
        # 部分問題：右部分木を構築
        root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
        # ルートノードを返す
        return root

    def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
        """二分木を構築"""
        # ハッシュテーブルを初期化、中順走査の要素からインデックスへのマッピングを保存
        inorder_map = {val: i for i, val in enumerate(inorder)}
        root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
        return root
    ```

=== "C++"

    ```cpp title="build_tree.cpp"
    /* 二分木の構築：分割統治 */
    TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
        // 部分木の区間が空の場合に終了
        if (r - l < 0)
            return NULL;
        // ルートノードを初期化
        TreeNode *root = new TreeNode(preorder[i]);
        // m を問い合わせて左右の部分木を分割
        int m = inorderMap[preorder[i]];
        // 部分問題：左の部分木を構築
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 部分問題：右の部分木を構築
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // ルートノードを返す
        return root;
    }

    /* 二分木の構築 */
    TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
        // ハッシュテーブルを初期化し、中間順序の要素からインデックスへのマッピングを格納
        unordered_map<int, int> inorderMap;
        for (int i = 0; i < inorder.size(); i++) {
            inorderMap[inorder[i]] = i;
        }
        TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
        return root;
    }
    ```

=== "Java"

    ```java title="build_tree.java"
    /* 二分木の構築：分割統治 */
    TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // 部分木の区間が空の場合に終了
        if (r - l < 0)
            return null;
        // ルートノードを初期化
        TreeNode root = new TreeNode(preorder[i]);
        // m を問い合わせて左右の部分木を分割
        int m = inorderMap.get(preorder[i]);
        // 部分問題：左の部分木を構築
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 部分問題：右の部分木を構築
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // ルートノードを返す
        return root;
    }

    /* 二分木の構築 */
    TreeNode buildTree(int[] preorder, int[] inorder) {
        // ハッシュテーブルを初期化し、中間順序の要素からインデックスへのマッピングを格納
        Map<Integer, Integer> inorderMap = new HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            inorderMap.put(inorder[i], i);
        }
        TreeNode root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
        return root;
    }
    ```

=== "C#"

    ```csharp title="build_tree.cs"
    [class]{build_tree}-[func]{DFS}

    [class]{build_tree}-[func]{BuildTree}
    ```

=== "Go"

    ```go title="build_tree.go"
    [class]{}-[func]{dfsBuildTree}

    [class]{}-[func]{buildTree}
    ```

=== "Swift"

    ```swift title="build_tree.swift"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "JS"

    ```javascript title="build_tree.js"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "TS"

    ```typescript title="build_tree.ts"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "Dart"

    ```dart title="build_tree.dart"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "Rust"

    ```rust title="build_tree.rs"
    [class]{}-[func]{dfs}

    [class]{}-[func]{build_tree}
    ```

=== "C"

    ```c title="build_tree.c"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "Kotlin"

    ```kotlin title="build_tree.kt"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "Ruby"

    ```ruby title="build_tree.rb"
    [class]{}-[func]{dfs}

    [class]{}-[func]{build_tree}
    ```

以下の図は、二分木を構築する再帰過程を示しています。各ノードは再帰の「下降」段階で作成され、各エッジ（参照）は「上昇」段階で形成されます。

=== "<1>"
    ![二分木構築の再帰過程](build_binary_tree_problem.assets/built_tree_step1.png){ class="animation-figure" }

=== "<2>"
    ![built_tree_step2](build_binary_tree_problem.assets/built_tree_step2.png){ class="animation-figure" }

=== "<3>"
    ![built_tree_step3](build_binary_tree_problem.assets/built_tree_step3.png){ class="animation-figure" }

=== "<4>"
    ![built_tree_step4](build_binary_tree_problem.assets/built_tree_step4.png){ class="animation-figure" }

=== "<5>"
    ![built_tree_step5](build_binary_tree_problem.assets/built_tree_step5.png){ class="animation-figure" }

=== "<6>"
    ![built_tree_step6](build_binary_tree_problem.assets/built_tree_step6.png){ class="animation-figure" }

=== "<7>"
    ![built_tree_step7](build_binary_tree_problem.assets/built_tree_step7.png){ class="animation-figure" }

=== "<8>"
    ![built_tree_step8](build_binary_tree_problem.assets/built_tree_step8.png){ class="animation-figure" }

=== "<9>"
    ![built_tree_step9](build_binary_tree_problem.assets/built_tree_step9.png){ class="animation-figure" }

<p align="center"> 図 12-8 &nbsp; 二分木構築の再帰過程 </p>

各再帰関数の `preorder` と `inorder` シーケンスの分割は以下の図に示されています。

![各再帰関数での分割](build_binary_tree_problem.assets/built_tree_overall.png){ class="animation-figure" }

<p align="center"> 図 12-9 &nbsp; 各再帰関数での分割 </p>

二分木が $n$ 個のノードを持つと仮定すると、各ノードの初期化（再帰関数 `dfs()` の呼び出し）には $O(1)$ 時間がかかります。**したがって、全体の時間計算量は $O(n)$ です**。

ハッシュテーブルは `inorder` 要素からそのインデックスへのマッピングを格納するため、$O(n)$ スペースが必要です。最悪の場合、二分木が連結リストに退化すると、再帰の深さは $n$ に達し、$O(n)$ のスタックスペースを消費する可能性があります。**したがって、全体の空間計算量は $O(n)$ です**。
