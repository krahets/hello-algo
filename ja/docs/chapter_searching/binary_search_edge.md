---
comments: true
---

# 10.3 &nbsp; 二分探索の境界

## 10.3.1 &nbsp; 左境界を見つける

!!! question

    重複要素を含む可能性がある長さ$n$のソート済み配列`nums`が与えられ、最も左の要素`target`のインデックスを返してください。要素が配列に存在しない場合は、$-1$を返してください。

挿入位置の二分探索方法を思い出すと、探索完了後、インデックス$i$は`target`の最も左の出現を指します。したがって、**挿入位置の探索は本質的に最も左の`target`のインデックスを見つけることと同じです**。

挿入位置を見つける関数を使用して`target`の左境界を見つけることができます。配列に`target`が含まれていない可能性があることに注意してください。これは以下の2つの結果につながる可能性があります：

- 挿入位置のインデックス$i$が範囲外です。
- 要素`nums[i]`が`target`と等しくありません。

これらの場合、単に$-1$を返します。コードは以下の通りです：

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """最左端のターゲットの二分探索"""
        # ターゲットの挿入位置を見つけることと同等
        i = binary_search_insertion(nums, target)
        # ターゲットが見つからなかった場合、-1 を返す
        if i == len(nums) or nums[i] != target:
            return -1
        # ターゲットが見つかった場合、インデックス i を返す
        return i
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 最左のターゲットの二分探索 */
    int binarySearchLeftEdge(vector<int> &nums, int target) {
        // targetの挿入ポイントを見つけることと等価
        int i = binarySearchInsertion(nums, target);
        // targetが見つからなかったため、-1を返す
        if (i == nums.size() || nums[i] != target) {
            return -1;
        }
        // targetが見つかったため、インデックスiを返す
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 最も左の target を二分探索 */
    int binarySearchLeftEdge(int[] nums, int target) {
        // target の挿入点を見つけることと等価
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // target を見つけられなかったので、-1 を返す
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // target を見つけたので、インデックス i を返す
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    [class]{binary_search_edge}-[func]{BinarySearchLeftEdge}
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    [class]{}-[func]{binary_search_left_edge}
    ```

=== "C"

    ```c title="binary_search_edge.c"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    [class]{}-[func]{binary_search_left_edge}
    ```

## 10.3.2 &nbsp; 右境界を見つける

`target`の最も右の出現をどのように見つけるでしょうか？最も直接的な方法は、`nums[m] == target`の場合に探索境界を調整する方法を変更して、従来の二分探索ロジックを修正することです。コードはここでは省略されています。興味がある場合は、自分でコードを実装してみてください。

以下では、さらに2つの巧妙な方法を紹介します。

### 1. &nbsp; 左境界探索を再利用する

`target`の最も右の出現を見つけるには、最も左の`target`を見つけるために使用された関数を再利用できます。具体的には、最も右のターゲットの探索を最も左のターゲット + 1の探索に変換します。

下図に示すように、探索完了後、ポインタ$i$は最も左の`target + 1`（存在する場合）を指し、ポインタ$j$は`target`の最も右の出現を指します。したがって、$j$を返すことで右境界が得られます。

![Transforming the search for the right boundary into the search for the left boundary](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> 図 10-7 &nbsp; Transforming the search for the right boundary into the search for the left boundary </p>

返される挿入位置は$i$であることに注意してください。したがって、$j$を得るためには1を引く必要があります：

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """最右端のターゲットの二分探索"""
        # 最左端のターゲット + 1 を見つけることに変換
        i = binary_search_insertion(nums, target + 1)
        # j は最右端のターゲットを指し、i はターゲットより大きい最初の要素を指す
        j = i - 1
        # ターゲットが見つからなかった場合、-1 を返す
        if j == -1 or nums[j] != target:
            return -1
        # ターゲットが見つかった場合、インデックス j を返す
        return j
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* 最右のターゲットの二分探索 */
    int binarySearchRightEdge(vector<int> &nums, int target) {
        // 最左のtarget + 1を見つけることに変換
        int i = binarySearchInsertion(nums, target + 1);
        // jは最右のターゲットを指し、iはtargetより大きい最初の要素を指す
        int j = i - 1;
        // targetが見つからなかったため、-1を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // targetが見つかったため、インデックスjを返す
        return j;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* 最も右の target を二分探索 */
    int binarySearchRightEdge(int[] nums, int target) {
        // 最も左の target + 1 を見つけることに変換
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target を見つけられなかったので、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target を見つけたので、インデックス j を返す
        return j;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    [class]{binary_search_edge}-[func]{BinarySearchRightEdge}
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    [class]{}-[func]{binary_search_right_edge}
    ```

=== "C"

    ```c title="binary_search_edge.c"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    [class]{}-[func]{binary_search_right_edge}
    ```

### 2. &nbsp; 要素探索に変換する

配列に`target`が含まれていない場合、$i$と$j$は最終的に`target`より大きい最初の要素と小さい最初の要素をそれぞれ指します。

したがって、下図に示すように、配列に存在しない要素を構築して、左と右の境界を探索できます。

- 最も左の`target`を見つけるには：`target - 0.5`を探索することに変換でき、ポインタ$i$を返します。
- 最も右の`target`を見つけるには：`target + 0.5`を探索することに変換でき、ポインタ$j$を返します。

![Transforming the search for boundaries into the search for an element](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> 図 10-8 &nbsp; Transforming the search for boundaries into the search for an element </p>

コードはここでは省略されていますが、このアプローチについて注意すべき2つの重要な点があります。

- 与えられた配列`nums`には小数が含まれていないため、等しい場合の処理は心配ありません。
- ただし、このアプローチで小数を導入するには、`target`変数を浮動小数点型に変更する必要があります（Pythonでは変更は不要です）。
