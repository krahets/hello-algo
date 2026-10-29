# 二分木の配列表現

連結リスト形式では、二分木の格納単位はノード `TreeNode` で、ノード同士はポインタでつながっています。前節では、この形式の二分木の基本操作を紹介しました。

では、二分木を配列で表すこともできるでしょうか。答えは、できます。

## パーフェクト二分木の表現

まず単純な場合を考えます。パーフェクト二分木の全ノードをレベル順に配列へ格納すると、各ノードが一意のインデックスに対応します。

レベル順走査の特徴から、親と子のインデックスの対応式を導けます。**ノードのインデックスが $i$ なら、左の子は $2i + 1$、右の子は $2i + 2$ です**。下図に対応関係を示します。

![パーフェクト二分木の配列表現](array_representation_of_tree.assets/array_representation_binary_tree.png)

**この対応式は、連結リストのノード参照（ポインタ）と同じ役割を果たします**。配列内のどのノードからでも、式を使って左右の子にアクセスできます。

## 任意の二分木の表現

パーフェクト二分木は特殊な場合です。一般の二分木では、中間の層にも多くの `None` があります。レベル順の列にはそれらが含まれないため、その列だけでは `None` の数や位置を推測できません。**つまり、同じレベル順の列に対応する二分木の構造が複数あります**。

下図のように、パーフェクト二分木でない木には、上の配列表現をそのまま使えません。

![同じレベル順の列に対応する複数の二分木](array_representation_of_tree.assets/array_representation_without_empty.png)

解決するには、**レベル順の列にすべての `None` を明示的に書き込みます**。下図のように、これで二分木を一意に表せます。コード例を示します。

=== "Python"

    ```python title=""
    # 二分木の配列表現
    # None で空の位置を表す
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

=== "C++"

    ```cpp title=""
    /* 二分木の配列表現 */
    // int の最大値 INT_MAX で空の位置を示す
    vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Java"

    ```java title=""
    /* 二分木の配列表現 */
    // int のラッパークラス Integer を使うと、null で空の位置を示せる
    Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
    ```

=== "C#"

    ```csharp title=""
    /* 二分木の配列表現 */
    // null 許容型 int? を使うと、null で空の位置を示せる
    int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Go"

    ```go title=""
    /* 二分木の配列表現 */
    // any 型のスライスを使うと、nil で空の位置を示せる
    tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
    ```

=== "Swift"

    ```swift title=""
    /* 二分木の配列表現 */
    // オプショナル型 Int? を使うと、nil で空の位置を示せる
    let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "JS"

    ```javascript title=""
    /* 二分木の配列表現 */
    // null で空の位置を表す
    let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "TS"

    ```typescript title=""
    /* 二分木の配列表現 */
    // null で空の位置を表す
    let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Dart"

    ```dart title=""
    /* 二分木の配列表現 */
    // null 許容型 int? を使うと、null で空の位置を示せる
    List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Rust"

    ```rust title=""
    /* 二分木の配列表現 */
    // None で空の位置を示す
    let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
    ```

=== "C"

    ```c title=""
    /* 二分木の配列表現 */
    // int の最大値で空の位置を示すため、ノードの値に INT_MAX は使えない
    int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Kotlin"

    ```kotlin title=""
    /* 二分木の配列表現 */
    // null で空の位置を表す
    val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""
    ### 二分木の配列表現 ###
    # nil で空の位置を表す
    tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

![任意の二分木の配列表現](array_representation_of_tree.assets/array_representation_with_empty.png)

**完全二分木は、配列で表すのに非常に適しています**。定義を思い出すと、`None` は最下層の右側にしかありません。**したがって、すべての `None` はレベル順の列の末尾に現れます**。

つまり、完全二分木を配列で表す場合は、`None` の格納をすべて省けるので便利です。下図に例を示します。

![完全二分木の配列表現](array_representation_of_tree.assets/array_representation_complete_binary_tree.png)

以下は配列で二分木を実装したコードで、次の操作を含みます。

- 指定したノードの値、左右の子、親を取得します。
- 行きがけ順、通りがけ順、帰りがけ順、レベル順の走査列を取得します。

```src
[file]{array_binary_tree}-[class]{array_binary_tree}-[func]{}
```

## 長所と制約

配列表現の主な長所は次のとおりです。

- 連続したメモリに格納されるのでキャッシュとの相性がよく、アクセスと走査が高速です。
- ポインタの格納が不要なので、領域を節約できます。
- ノードにランダムアクセスできます。

一方、次の制約もあります。

- 連続したメモリが必要なので、データ量が非常に多い木には適しません。
- ノードの追加・削除には配列の挿入・削除操作が必要で、効率が低くなります。
- `None` が多い二分木では、配列内で実際のノードデータが占める割合が低く、領域の利用効率が下がります。
