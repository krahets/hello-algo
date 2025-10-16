---
comments: true
---

# 10.2 &nbsp; 二分探索による挿入

二分探索は目標要素を探索するだけでなく、目標要素の挿入位置を探索するなど、多くの変種問題を解決するためにも使用されます。

## 10.2.1 &nbsp; 重複要素がない場合

!!! question

    一意の要素を持つ長さ$n$のソート済み配列`nums`と要素`target`が与えられ、ソート順を維持しながら`target`を`nums`に挿入します。`target`が配列にすでに存在する場合は、既存の要素の左側に挿入します。挿入後の配列における`target`のインデックスを返してください。下図に示す例を参照してください。

![Example data for binary search insertion point](binary_search_insertion.assets/binary_search_insertion_example.png){ class="animation-figure" }

<p align="center"> 図 10-4 &nbsp; Example data for binary search insertion point </p>

前のセクションの二分探索コードを再利用したい場合、以下の2つの質問に答える必要があります。

**質問1**：配列にすでに`target`が含まれている場合、挿入位置は既存要素のインデックスになりますか？

`target`を等しい要素の左側に挿入するという要件は、新しく挿入される`target`が元の`target`の位置を置き換えることを意味します。つまり、**配列に`target`が含まれている場合、挿入位置は確かにその`target`のインデックスです**。

**質問2**：配列に`target`が含まれていない場合、どのインデックスに挿入されますか？

二分探索プロセスをさらに考えてみましょう：`nums[m] < target`のとき、ポインタ$i$が移動します。これは、ポインタ$i$が`target`以上の要素に近づいていることを意味します。同様に、ポインタ$j$は常に`target`以下の要素に近づいています。

したがって、二分の終了時には確実に：$i$は`target`より大きい最初の要素を指し、$j$は`target`より小さい最初の要素を指します。**配列に`target`が含まれていない場合、挿入位置は$i$であることは明らかです**。コードは以下の通りです：

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion_simple(nums: list[int], target: int) -> int:
        """挿入位置の二分探索（重複要素なし）"""
        i, j = 0, len(nums) - 1  # 両端閉区間 [0, n-1] を初期化
        while i <= j:
            m = i + (j - i) // 2  # 中点インデックス m を計算
            if nums[m] < target:
                i = m + 1  # ターゲットは区間 [m+1, j] にある
            elif nums[m] > target:
                j = m - 1  # ターゲットは区間 [i, m-1] にある
            else:
                return m  # ターゲットが見つかった場合、挿入位置 m を返す
        # ターゲットが見つからなかった場合、挿入位置 i を返す
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* 挿入ポイントの二分探索（重複要素なし） */
    int binarySearchInsertionSimple(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 両端閉区間[0, n-1]を初期化
        while (i <= j) {
            int m = i + (j - i) / 2; // 中点インデックスmを計算
            if (nums[m] < target) {
                i = m + 1; // ターゲットは区間[m+1, j]にある
            } else if (nums[m] > target) {
                j = m - 1; // ターゲットは区間[i, m-1]にある
            } else {
                return m; // ターゲットが見つかったため、挿入ポイントmを返す
            }
        }
        // ターゲットが見つからなかったため、挿入ポイントiを返す
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* 挿入点の二分探索（重複要素なし） */
    int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 両端閉区間 [0, n-1] を初期化
        while (i <= j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] にある
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] にある
            } else {
                return m; // target を見つけたので、挿入点 m を返す
            }
        }
        // target を見つけられなかったので、挿入点 i を返す
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    [class]{binary_search_insertion}-[func]{BinarySearchInsertionSimple}
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    [class]{}-[func]{binarySearchInsertionSimple}
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    [class]{}-[func]{binarySearchInsertionSimple}
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    [class]{}-[func]{binarySearchInsertionSimple}
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    [class]{}-[func]{binarySearchInsertionSimple}
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    [class]{}-[func]{binarySearchInsertionSimple}
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    [class]{}-[func]{binary_search_insertion_simple}
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    [class]{}-[func]{binarySearchInsertionSimple}
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    [class]{}-[func]{binarySearchInsertionSimple}
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    [class]{}-[func]{binary_search_insertion_simple}
    ```

=== "Zig"

    ```zig title="binary_search_insertion.zig"
    [class]{}-[func]{binarySearchInsertionSimple}
    ```

## 10.2.2 &nbsp; 重複要素がある場合

!!! question

    前の質問に基づいて、配列に重複要素が含まれている可能性があると仮定し、他はすべて同じとします。

配列に`target`の複数の出現がある場合、通常の二分探索は`target`の1つの出現のインデックスのみを返すことができ、**その位置の左右に`target`の出現がいくつあるかを特定することはできません**。

問題では目標要素を最も左の位置に挿入することが要求されているため、**配列内の最も左の`target`のインデックスを見つける必要があります**。最初に下図に示すステップを通してこれを実装することを考えてみましょう。

1. 二分探索を実行して`target`の任意のインデックス、例えば$k$を見つけます。
2. インデックス$k$から開始して、最も左の`target`の出現が見つかるまで左に線形探索を行い、このインデックスを返します。

![Linear search for the insertion point of duplicate elements](binary_search_insertion.assets/binary_search_insertion_naive.png){ class="animation-figure" }

<p align="center"> 図 10-5 &nbsp; Linear search for the insertion point of duplicate elements </p>

この方法は実現可能ですが、線形探索を含むため、時間計算量は$O(n)$です。この方法は、配列に多くの重複する`target`が含まれている場合に非効率です。

今度は二分探索コードを拡張することを考えてみましょう。下図に示すように、全体的なプロセスは同じままです。各ラウンドで、まず中間インデックス$m$を計算し、次に`target`と`nums[m]`の値を比較して、以下のケースになります。

- `nums[m] < target`または`nums[m] > target`のとき、これは`target`がまだ見つかっていないことを意味するため、通常の二分探索を使用して探索範囲を狭め、**ポインタ$i$と$j$を`target`に近づけます**。
- `nums[m] == target`のとき、これは`target`より小さい要素が範囲$[i, m - 1]$にあることを示すため、$j = m - 1$を使用して範囲を狭め、**ポインタ$j$を`target`より小さい要素に近づけます**。

ループ後、$i$は最も左の`target`を指し、$j$は`target`より小さい最初の要素を指すため、**インデックス$i$が挿入位置です**。

=== "<1>"
    ![Steps for binary search insertion point of duplicate elements](binary_search_insertion.assets/binary_search_insertion_step1.png){ class="animation-figure" }

=== "<2>"
    ![binary_search_insertion_step2](binary_search_insertion.assets/binary_search_insertion_step2.png){ class="animation-figure" }

=== "<3>"
    ![binary_search_insertion_step3](binary_search_insertion.assets/binary_search_insertion_step3.png){ class="animation-figure" }

=== "<4>"
    ![binary_search_insertion_step4](binary_search_insertion.assets/binary_search_insertion_step4.png){ class="animation-figure" }

=== "<5>"
    ![binary_search_insertion_step5](binary_search_insertion.assets/binary_search_insertion_step5.png){ class="animation-figure" }

=== "<6>"
    ![binary_search_insertion_step6](binary_search_insertion.assets/binary_search_insertion_step6.png){ class="animation-figure" }

=== "<7>"
    ![binary_search_insertion_step7](binary_search_insertion.assets/binary_search_insertion_step7.png){ class="animation-figure" }

=== "<8>"
    ![binary_search_insertion_step8](binary_search_insertion.assets/binary_search_insertion_step8.png){ class="animation-figure" }

<p align="center"> 図 10-6 &nbsp; Steps for binary search insertion point of duplicate elements </p>

以下のコードを観察してください。分岐`nums[m] > target`と`nums[m] == target`の操作は同じであるため、これら2つの分岐をマージできます。

それでも、ロジックがより明確になり、可読性が向上するため、条件を展開したままにしておくことができます。

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion(nums: list[int], target: int) -> int:
        """挿入位置の二分探索（重複要素あり）"""
        i, j = 0, len(nums) - 1  # 両端閉区間 [0, n-1] を初期化
        while i <= j:
            m = i + (j - i) // 2  # 中点インデックス m を計算
            if nums[m] < target:
                i = m + 1  # ターゲットは区間 [m+1, j] にある
            elif nums[m] > target:
                j = m - 1  # ターゲットは区間 [i, m-1] にある
            else:
                j = m - 1  # ターゲット未満の最初の要素は区間 [i, m-1] にある
        # 挿入位置 i を返す
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* 挿入ポイントの二分探索（重複要素あり） */
    int binarySearchInsertion(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // 両端閉区間[0, n-1]を初期化
        while (i <= j) {
            int m = i + (j - i) / 2; // 中点インデックスmを計算
            if (nums[m] < target) {
                i = m + 1; // ターゲットは区間[m+1, j]にある
            } else if (nums[m] > target) {
                j = m - 1; // ターゲットは区間[i, m-1]にある
            } else {
                j = m - 1; // ターゲット未満の最初の要素は区間[i, m-1]にある
            }
        }
        // 挿入ポイントiを返す
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* 挿入点の二分探索（重複要素あり） */
    int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 両端閉区間 [0, n-1] を初期化
        while (i <= j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] にある
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] にある
            } else {
                j = m - 1; // target より小さい最初の要素は区間 [i, m-1] にある
            }
        }
        // 挿入点 i を返す
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    [class]{binary_search_insertion}-[func]{BinarySearchInsertion}
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    [class]{}-[func]{binarySearchInsertion}
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    [class]{}-[func]{binarySearchInsertion}
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    [class]{}-[func]{binarySearchInsertion}
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    [class]{}-[func]{binarySearchInsertion}
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    [class]{}-[func]{binarySearchInsertion}
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    [class]{}-[func]{binary_search_insertion}
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    [class]{}-[func]{binarySearchInsertion}
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    [class]{}-[func]{binarySearchInsertion}
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    [class]{}-[func]{binary_search_insertion}
    ```

=== "Zig"

    ```zig title="binary_search_insertion.zig"
    [class]{}-[func]{binarySearchInsertion}
    ```

!!! tip

    このセクションのコードは「閉区間」を使用しています。「左閉右開」に興味がある場合は、自分でコードを実装してみてください。

要約すると、二分探索は本質的にポインタ$i$と$j$の探索目標を設定することです。これらの目標は特定の要素（`target`など）または要素の範囲（`target`より小さいものなど）である可能性があります。

二分探索の連続ループにおいて、ポインタ$i$と$j$は段階的に事前定義された目標に近づきます。最終的に、それらは答えを見つけるか、境界を越えた後に停止します。
