---
comments: true
---

# 11.2 &nbsp; 選択ソート

<u>選択ソート</u>は非常にシンプルな原理で動作します：各反復で未ソート区間から最小要素を選択し、ソート済みセクションの末尾に移動するループを使用します。

配列の長さを$n$とすると、選択ソートのステップは下図に示されます。

1. 最初に、すべての要素は未ソートで、つまり未ソート（インデックス）区間は$[0, n-1]$です。
2. 区間$[0, n-1]$の最小要素を選択し、インデックス$0$の要素と交換します。この後、配列の最初の要素がソートされます。
3. 区間$[1, n-1]$の最小要素を選択し、インデックス$1$の要素と交換します。この後、配列の最初の2つの要素がソートされます。
4. この方法で続行します。$n - 1$ラウンドの選択と交換の後、最初の$n - 1$個の要素がソートされます。
5. 残りの唯一の要素は結果的に最大要素であり、ソートする必要がないため、配列はソートされます。

=== "<1>"
    ![Selection sort process](selection_sort.assets/selection_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![selection_sort_step2](selection_sort.assets/selection_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![selection_sort_step3](selection_sort.assets/selection_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![selection_sort_step4](selection_sort.assets/selection_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![selection_sort_step5](selection_sort.assets/selection_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![selection_sort_step6](selection_sort.assets/selection_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![selection_sort_step7](selection_sort.assets/selection_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![selection_sort_step8](selection_sort.assets/selection_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![selection_sort_step9](selection_sort.assets/selection_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![selection_sort_step10](selection_sort.assets/selection_sort_step10.png){ class="animation-figure" }

=== "<11>"
    ![selection_sort_step11](selection_sort.assets/selection_sort_step11.png){ class="animation-figure" }

<p align="center"> 図 11-2 &nbsp; Selection sort process </p>

コードでは、$k$を使用して未ソート区間内の最小要素を記録します：

=== "Python"

    ```python title="selection_sort.py"
    def selection_sort(nums: list[int]):
        """選択ソート"""
        n = len(nums)
        # 外側のループ：未ソート範囲は [i, n-1]
        for i in range(n - 1):
            # 内側のループ：未ソート範囲内で最小要素を見つける
            k = i
            for j in range(i + 1, n):
                if nums[j] < nums[k]:
                    k = j  # 最小要素のインデックスを記録
            # 最小要素を未ソート範囲の先頭要素と交換
            nums[i], nums[k] = nums[k], nums[i]
    ```

=== "C++"

    ```cpp title="selection_sort.cpp"
    /* 選択ソート */
    void selectionSort(vector<int> &nums) {
        int n = nums.size();
        // 外側ループ：未ソート範囲は[i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 内側ループ：未ソート範囲内で最小要素を見つける
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 最小要素のインデックスを記録
            }
            // 最小要素を未ソート範囲の最初の要素と交換
            swap(nums[i], nums[k]);
        }
    }
    ```

=== "Java"

    ```java title="selection_sort.java"
    /* 選択ソート */
    void selectionSort(int[] nums) {
        int n = nums.length;
        // 外側ループ: 未ソート範囲は [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 内側ループ: 未ソート範囲内で最小要素を見つける
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 最小要素のインデックスを記録
            }
            // 最小要素と未ソート範囲の最初の要素を交換
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "C#"

    ```csharp title="selection_sort.cs"
    [class]{selection_sort}-[func]{SelectionSort}
    ```

=== "Go"

    ```go title="selection_sort.go"
    [class]{}-[func]{selectionSort}
    ```

=== "Swift"

    ```swift title="selection_sort.swift"
    [class]{}-[func]{selectionSort}
    ```

=== "JS"

    ```javascript title="selection_sort.js"
    [class]{}-[func]{selectionSort}
    ```

=== "TS"

    ```typescript title="selection_sort.ts"
    [class]{}-[func]{selectionSort}
    ```

=== "Dart"

    ```dart title="selection_sort.dart"
    [class]{}-[func]{selectionSort}
    ```

=== "Rust"

    ```rust title="selection_sort.rs"
    [class]{}-[func]{selection_sort}
    ```

=== "C"

    ```c title="selection_sort.c"
    [class]{}-[func]{selectionSort}
    ```

=== "Kotlin"

    ```kotlin title="selection_sort.kt"
    [class]{}-[func]{selectionSort}
    ```

=== "Ruby"

    ```ruby title="selection_sort.rb"
    [class]{}-[func]{selection_sort}
    ```

## 11.2.1 &nbsp; アルゴリズムの特性

- **$O(n^2)$の時間計算量、非適応ソート**：外側ループに$n - 1$回の反復があり、未ソートセクションの長さは最初の反復で$n$から始まり、最後の反復で$2$まで減少します。つまり、各外側ループ反復にはそれぞれ$n$、$n - 1$、$\dots$、$3$、$2$回の内側ループ反復が含まれ、合計は$\frac{(n - 1)(n + 2)}{2}$となります。
- **$O(1)$の空間計算量、インプレースソート**：ポインタ$i$と$j$で定数の追加空間を使用します。
- **非安定ソート**：下図に示すように、要素`nums[i]`は等しい要素の右側に交換される可能性があり、相対順序が変わる原因となります。

![Selection sort instability example](selection_sort.assets/selection_sort_instability.png){ class="animation-figure" }

<p align="center"> 図 11-3 &nbsp; Selection sort instability example </p>
