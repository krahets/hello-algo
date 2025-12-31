---
comments: true
---

# 7.3 &nbsp; 二分木の配列表現

連結リスト表現では、二分木の格納単位はノード`TreeNode`であり、ノードはポインタによって接続されます。連結リスト表現での二分木の基本操作については前の節で紹介しました。

では、配列を使って二分木を表現することはできるでしょうか？答えはイエスです。

## 7.3.1 &nbsp; 完全二分木の表現

まず簡単なケースから分析してみましょう。完全二分木が与えられたとき、レベル順探索の順序に従ってすべてのノードを配列に格納し、各ノードは一意の配列インデックスに対応します。

レベル順探索の特性に基づいて、親ノードのインデックスとその子ノードの間の「マッピング公式」を導き出すことができます：**ノードのインデックスが$i$の場合、その左の子のインデックスは$2i + 1$、右の子のインデックスは$2i + 2$です**。下図は、さまざまなノードのインデックス間のマッピング関係を示しています。

![完全二分木の配列表現](array_representation_of_tree.assets/array_representation_binary_tree.png){ class="animation-figure" }

<p align="center"> 図 7-12 &nbsp; 完全二分木の配列表現 </p>

**マッピング公式は、連結リストのノード参照（ポインタ）と同様の役割を果たします**。配列内の任意のノードが与えられたとき、マッピング公式を使用してその左（右）の子ノードにアクセスできます。

## 7.3.2 &nbsp; 任意の二分木の表現

完全二分木は特別なケースです。二分木の中間レベルには多くの`None`値が存在することがよくあります。レベル順探索のシーケンスにはこれらの`None`値が含まれないため、このシーケンスだけに依存して`None`値の数と分布を推測することはできません。**つまり、複数の二分木構造が同じレベル順探索シーケンスと一致する可能性があります**。

下図に示すように、完全でない二分木が与えられた場合、上記の配列表現方法は失敗します。

![レベル順探索シーケンスが複数の二分木の可能性に対応](array_representation_of_tree.assets/array_representation_without_empty.png){ class="animation-figure" }

<p align="center"> 図 7-13 &nbsp; レベル順探索シーケンスが複数の二分木の可能性に対応 </p>

この問題を解決するために、**レベル順探索シーケンスですべての`None`値を明示的に書き出すことを検討できます**。下図に示すように、この処理後、レベル順探索シーケンスは二分木を一意に表現できます。サンプルコードは以下の通りです：

=== "Python"

    ```python title=""
    # 二分木の配列表現
    # Noneを使用して空のスロットを表現
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

=== "C++"

    ```cpp title=""
    /* 二分木の配列表現 */
    // 最大整数値INT_MAXを使用して空のスロットをマーク
    vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Java"

    ```java title=""
    /* 二分木の配列表現 */
    // Integerラッパークラスを使用してnullで空のスロットをマーク
    Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
    ```

=== "C#"

    ```csharp title=""
    /* 二分木の配列表現 */
    // nullable int (int?)を使用してnullで空のスロットをマーク
    int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Go"

    ```go title=""
    /* 二分木の配列表現 */
    // any型スライスを使用してnilで空のスロットをマーク
    tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
    ```

=== "Swift"

    ```swift title=""
    /* 二分木の配列表現 */
    // optional Int (Int?)を使用してnilで空のスロットをマーク
    let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "JS"

    ```javascript title=""
    /* 二分木の配列表現 */
    // nullを使用して空のスロットを表現
    let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "TS"

    ```typescript title=""
    /* 二分木の配列表現 */
    // nullを使用して空のスロットを表現
    let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Dart"

    ```dart title=""
    /* 二分木の配列表現 */
    // nullable int (int?)を使用してnullで空のスロットをマーク
    List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Rust"

    ```rust title=""
    /* 二分木の配列表現 */
    // Noneを使用して空のスロットをマーク
    let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
    ```

=== "C"

    ```c title=""
    /* 二分木の配列表現 */
    // 最大int値を使用して空のスロットをマーク、したがってノード値はINT_MAXであってはならない
    int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Kotlin"

    ```kotlin title=""
    /* 二分木の配列表現 */
    // nullを使用して空のスロットを表現
    val tree = mutableListOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""

    ```

![任意の種類の二分木の配列表現](array_representation_of_tree.assets/array_representation_with_empty.png){ class="animation-figure" }

<p align="center"> 図 7-14 &nbsp; 任意の種類の二分木の配列表現 </p>

注目すべきは、**完備二分木は配列表現に非常に適している**ということです。完備二分木の定義を思い出すと、`None`は最下位レベルでのみ、かつ右側に向かって現れます。**つまり、すべての`None`値は確実にレベル順探索シーケンスの最後に現れます**。

これは、配列を使用して完備二分木を表現する際、すべての`None`値の格納を省略できることを意味し、非常に便利です。下図に例を示します。

![完備二分木の配列表現](array_representation_of_tree.assets/array_representation_complete_binary_tree.png){ class="animation-figure" }

<p align="center"> 図 7-15 &nbsp; 完備二分木の配列表現 </p>

以下のコードは、配列表現に基づく二分木を実装し、次の操作を含みます：

- ノードが与えられたとき、その値、左（右）の子ノード、および親ノードを取得する。
- 前順、中順、後順、およびレベル順探索シーケンスを取得する。

=== "Python"

    ```python title="array_binary_tree.py"
    class ArrayBinaryTree:
        """配列ベースの二分木クラス"""

        def __init__(self, arr: list[int | None]):
            """コンストラクタ"""
            self._tree = list(arr)

        def size(self):
            """リストの容量"""
            return len(self._tree)

        def val(self, i: int) -> int | None:
            """インデックスiのノードの値を取得"""
            # インデックスが範囲外の場合、Noneを返し、空席を表す
            if i < 0 or i >= self.size():
                return None
            return self._tree[i]

        def left(self, i: int) -> int | None:
            """インデックスiのノードの左の子のインデックスを取得"""
            return 2 * i + 1

        def right(self, i: int) -> int | None:
            """インデックスiのノードの右の子のインデックスを取得"""
            return 2 * i + 2

        def parent(self, i: int) -> int | None:
            """インデックスiのノードの親のインデックスを取得"""
            return (i - 1) // 2

        def level_order(self) -> list[int]:
            """レベル順走査"""
            self.res = []
            # 配列を走査
            for i in range(self.size()):
                if self.val(i) is not None:
                    self.res.append(self.val(i))
            return self.res

        def dfs(self, i: int, order: str):
            """深さ優先走査"""
            if self.val(i) is None:
                return
            # 前順走査
            if order == "pre":
                self.res.append(self.val(i))
            self.dfs(self.left(i), order)
            # 中順走査
            if order == "in":
                self.res.append(self.val(i))
            self.dfs(self.right(i), order)
            # 後順走査
            if order == "post":
                self.res.append(self.val(i))

        def pre_order(self) -> list[int]:
            """前順走査"""
            self.res = []
            self.dfs(0, order="pre")
            return self.res

        def in_order(self) -> list[int]:
            """中順走査"""
            self.res = []
            self.dfs(0, order="in")
            return self.res

        def post_order(self) -> list[int]:
            """後順走査"""
            self.res = []
            self.dfs(0, order="post")
            return self.res
    ```

=== "C++"

    ```cpp title="array_binary_tree.cpp"
    /* 配列ベースの二分木クラス */
    class ArrayBinaryTree {
      public:
        /* コンストラクタ */
        ArrayBinaryTree(vector<int> arr) {
            tree = arr;
        }

        /* リストの容量 */
        int size() {
            return tree.size();
        }

        /* インデックス i のノードの値を取得 */
        int val(int i) {
            // インデックスが範囲外の場合、INT_MAX を返す（null を表す）
            if (i < 0 || i >= size())
                return INT_MAX;
            return tree[i];
        }

        /* インデックス i のノードの左の子のインデックスを取得 */
        int left(int i) {
            return 2 * i + 1;
        }

        /* インデックス i のノードの右の子のインデックスを取得 */
        int right(int i) {
            return 2 * i + 2;
        }

        /* インデックス i のノードの親のインデックスを取得 */
        int parent(int i) {
            return (i - 1) / 2;
        }

        /* レベル順走査 */
        vector<int> levelOrder() {
            vector<int> res;
            // 配列を走査
            for (int i = 0; i < size(); i++) {
                if (val(i) != INT_MAX)
                    res.push_back(val(i));
            }
            return res;
        }

        /* 前順走査 */
        vector<int> preOrder() {
            vector<int> res;
            dfs(0, "pre", res);
            return res;
        }

        /* 中順走査 */
        vector<int> inOrder() {
            vector<int> res;
            dfs(0, "in", res);
            return res;
        }

        /* 後順走査 */
        vector<int> postOrder() {
            vector<int> res;
            dfs(0, "post", res);
            return res;
        }

      private:
        vector<int> tree;

        /* 深さ優先走査 */
        void dfs(int i, string order, vector<int> &res) {
            // 空の位置の場合、戻る
            if (val(i) == INT_MAX)
                return;
            // 前順走査
            if (order == "pre")
                res.push_back(val(i));
            dfs(left(i), order, res);
            // 中順走査
            if (order == "in")
                res.push_back(val(i));
            dfs(right(i), order, res);
            // 後順走査
            if (order == "post")
                res.push_back(val(i));
        }
    };
    ```

=== "Java"

    ```java title="array_binary_tree.java"
    /* 配列ベースの二分木クラス */
    class ArrayBinaryTree {
        private List<Integer> tree;

        /* コンストラクタ */
        public ArrayBinaryTree(List<Integer> arr) {
            tree = new ArrayList<>(arr);
        }

        /* リストの容量 */
        public int size() {
            return tree.size();
        }

        /* インデックス i のノードの値を取得 */
        public Integer val(int i) {
            // インデックスが範囲外の場合、null を返す（空の位置を表す）
            if (i < 0 || i >= size())
                return null;
            return tree.get(i);
        }

        /* インデックス i のノードの左の子のインデックスを取得 */
        public Integer left(int i) {
            return 2 * i + 1;
        }

        /* インデックス i のノードの右の子のインデックスを取得 */
        public Integer right(int i) {
            return 2 * i + 2;
        }

        /* インデックス i のノードの親のインデックスを取得 */
        public Integer parent(int i) {
            return (i - 1) / 2;
        }

        /* レベル順走査 */
        public List<Integer> levelOrder() {
            List<Integer> res = new ArrayList<>();
            // 配列を走査
            for (int i = 0; i < size(); i++) {
                if (val(i) != null)
                    res.add(val(i));
            }
            return res;
        }

        /* 深さ優先走査 */
        private void dfs(Integer i, String order, List<Integer> res) {
            // 空の位置の場合、戻る
            if (val(i) == null)
                return;
            // 前順走査
            if ("pre".equals(order))
                res.add(val(i));
            dfs(left(i), order, res);
            // 中順走査
            if ("in".equals(order))
                res.add(val(i));
            dfs(right(i), order, res);
            // 後順走査
            if ("post".equals(order))
                res.add(val(i));
        }

        /* 前順走査 */
        public List<Integer> preOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "pre", res);
            return res;
        }

        /* 中順走査 */
        public List<Integer> inOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "in", res);
            return res;
        }

        /* 後順走査 */
        public List<Integer> postOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "post", res);
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_binary_tree.cs"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Go"

    ```go title="array_binary_tree.go"
    [class]{arrayBinaryTree}-[func]{}
    ```

=== "Swift"

    ```swift title="array_binary_tree.swift"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "JS"

    ```javascript title="array_binary_tree.js"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "TS"

    ```typescript title="array_binary_tree.ts"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Dart"

    ```dart title="array_binary_tree.dart"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Rust"

    ```rust title="array_binary_tree.rs"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "C"

    ```c title="array_binary_tree.c"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="array_binary_tree.kt"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Ruby"

    ```ruby title="array_binary_tree.rb"
    [class]{ArrayBinaryTree}-[func]{}
    ```

## 7.3.3 &nbsp; 利点と制限

二分木の配列表現には以下の利点があります：

- 配列は連続したメモリ空間に格納されるため、キャッシュフレンドリーで、より高速なアクセスと探索が可能です。
- ポインタを格納する必要がないため、スペースを節約できます。
- ノードへのランダムアクセスが可能です。

しかし、配列表現にはいくつかの制限もあります：

- 配列格納には連続したメモリ空間が必要なため、大量のデータを持つ木の格納には適していません。
- ノードの追加や削除には配列の挿入や削除操作が必要で、効率が低くなります。
- 二分木に多くの`None`値がある場合、配列に含まれるノードデータの割合が低くなり、空間利用率が低下します。
