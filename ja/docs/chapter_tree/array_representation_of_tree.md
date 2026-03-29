# 二分木の配列表現

連結リスト表現では、二分木の記憶単位はノード `TreeNode` であり、ノード同士はポインタによって接続されます。前節では、連結リスト表現における二分木の各種基本操作を紹介しました。

では、配列で二分木を表現できるでしょうか？答えはもちろん可能です。

## 充足二分木を表現する

まずは簡単な例を考えます。与えられた 1 本の充足二分木について、すべてのノードをレベル順走査の順に配列へ格納すると、各ノードは一意な配列インデックスに対応します。

レベル順走査の性質に基づくと、親ノードのインデックスと子ノードのインデックスの間にある「対応式」を導けます。**あるノードのインデックスが $i$ なら、その左子ノードのインデックスは $2i + 1$ 、右子ノードのインデックスは $2i + 2$ です**。以下の図は、各ノードインデックス間の対応関係を示しています。

![充足二分木の配列表現](array_representation_of_tree.assets/array_representation_binary_tree.png)

**対応式は、連結リストにおけるノード参照（ポインタ）と同じ役割を果たします**。与えられた配列内の任意のノードについて、この対応式を使えばその左（右）子ノードにアクセスできます。

## 任意の二分木を表現する

充足二分木は特殊なケースであり、一般の二分木では中間層に多数の `None` が存在することがよくあります。レベル順走査の列にはこれらの `None` が含まれないため、その列だけから `None` の数や分布位置を推定することはできません。**つまり、このレベル順走査列に一致する二分木構造は複数存在し得ます**。

次の図のように、非充足二分木が与えられると、上記の配列表現はすでに成り立ちません。

![レベル順走査列に対応する複数の二分木の可能性](array_representation_of_tree.assets/array_representation_without_empty.png)

この問題を解決するために、**レベル順走査列にすべての `None` を明示的に書き込む**ことを考えられます。次の図のように、このように処理すればレベル順走査列で二分木を一意に表現できます。コード例は以下のとおりです：

=== "Python"

    ```python title=""
    # 二分木の配列表現
    # 空き位置を表すために None を使う
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

=== "C++"

    ```cpp title=""
    /* 二分木の配列表現 */
    // int の最大値 INT_MAX を使って空き位置を示す
    vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Java"

    ```java title=""
    /* 二分木の配列表現 */
    // int のラッパークラス Integer を使えば、null で空き位置を示せる
    Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
    ```

=== "C#"

    ```csharp title=""
    /* 二分木の配列表現 */
    // nullable な int? 型を使えば、null で空き位置を示せる
    int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Go"

    ```go title=""
    /* 二分木の配列表現 */
    // any 型のスライスを使えば、nil で空き位置を示せる
    tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
    ```

=== "Swift"

    ```swift title=""
    /* 二分木の配列表現 */
    // nullable な Int? 型を使えば、nil で空き位置を示せる
    let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "JS"

    ```javascript title=""
    /* 二分木の配列表現 */
    // null を使って空き位置を表す
    let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "TS"

    ```typescript title=""
    /* 二分木の配列表現 */
    // null を使って空き位置を表す
    let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Dart"

    ```dart title=""
    /* 二分木の配列表現 */
    // nullable な int? 型を使えば、null で空き位置を示せる
    List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Rust"

    ```rust title=""
    /* 二分木の配列表現 */
    // None を使って空き位置を示す
    let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
    ```

=== "C"

    ```c title=""
    /* 二分木の配列表現 */
    // int の最大値で空き位置を示すため、ノード値は INT_MAX であってはならない
    int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Kotlin"

    ```kotlin title=""
    /* 二分木の配列表現 */
    // null を使って空き位置を表す
    val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""
    ### 二分木の配列表現 ###
    # nil を使って空き位置を表す
    tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

![任意の二分木の配列表現](array_representation_of_tree.assets/array_representation_with_empty.png)

補足すると、**完全二分木は配列による表現に非常に適しています**。完全二分木の定義を振り返ると、`None` は最下層の右側にしか現れないため、**すべての `None` は必ずレベル順走査列の末尾に現れます**。

つまり、完全二分木を配列で表す場合は、すべての `None` の格納を省略できるため、非常に便利です。次の図に例を示します。

![完全二分木の配列表現](array_representation_of_tree.assets/array_representation_complete_binary_tree.png)

以下のコードでは、配列ベースで表現した二分木を実装しており、次の操作を含みます。

- あるノードが与えられたとき、その値、左（右）子ノード、親ノードを取得する。
- 前順走査、中順走査、後順走査、レベル順走査の列を取得する。

```src
[file]{array_binary_tree}-[class]{array_binary_tree}-[func]{}
```

## 利点と制約

二分木の配列表現には主に次の利点があります。

- 配列は連続したメモリ空間に格納されるため、キャッシュ効率が高く、アクセスと走査が速い。
- ポインタを格納する必要がなく、比較的省スペースである。
- ノードへのランダムアクセスが可能である。

ただし、配列表現にはいくつかの制約もあります。

- 配列による格納には連続したメモリ空間が必要なため、データ量が大きすぎる木の格納には向かない。
- ノードの追加と削除は配列の挿入・削除操作で実現する必要があり、効率は低い。
- 二分木に大量の `None` が存在すると、配列に占める実ノードデータの比率が低くなり、空間利用率も低下する。
