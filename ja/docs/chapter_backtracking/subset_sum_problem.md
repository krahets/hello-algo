---
comments: true
---

# 13.3 &nbsp; 部分集合和問題

## 13.3.1 &nbsp; 重複要素がない場合

!!! question

    正の整数の配列 `nums` とターゲット正整数 `target` が与えられた場合、組み合わせ内の要素の和が `target` に等しくなるようなすべての可能な組み合わせを見つけてください。与えられた配列には重複要素がなく、各要素は複数回選択できます。これらの組み合わせを重複する組み合わせを含まないリストとして返してください。

例えば、入力集合 $\{3, 4, 5\}$ とターゲット整数 $9$ の場合、解は $\{3, 3, 3\}, \{4, 5\}$ です。以下の2点に注意してください。

- 入力集合の要素は無制限に選択できます。
- 部分集合は要素の順序を区別しません。例えば $\{4, 5\}$ と $\{5, 4\}$ は同じ部分集合です。

### 1. &nbsp; 順列解法の参考

順列問題と同様に、部分集合の生成を一連の選択として想像でき、選択プロセス中に「要素和」をリアルタイムで更新できます。要素和が `target` に等しくなったとき、部分集合を結果リストに記録します。

順列問題とは異なり、**この問題では要素は無制限に選択できるため**、要素が選択されたかどうかを記録するための `selected` ブール配列を使用する必要がありません。順列コードに軽微な修正を加えて、最初に問題を解決できます：

=== "Python"

    ```python title="subset_sum_i_naive.py"
    def backtrack(
        state: list[int],
        target: int,
        total: int,
        choices: list[int],
        res: list[list[int]],
    ):
        """バックトラッキングアルゴリズム：部分集合の和 I"""
        # 部分集合の和が target と等しいとき、解を記録
        if total == target:
            res.append(list(state))
            return
        # すべての選択肢を走査
        for i in range(len(choices)):
            # 枝刈り：部分集合の和が target を超える場合、その選択をスキップ
            if total + choices[i] > target:
                continue
            # 試行：選択を行い、要素と total を更新
            state.append(choices[i])
            # 次の選択ラウンドに進む
            backtrack(state, target, total + choices[i], choices, res)
            # 撤回：選択を取り消し、前の状態に復元
            state.pop()

    def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
        """部分集合の和 I を解く（重複する部分集合を含む）"""
        state = []  # 状態（部分集合）
        total = 0  # 部分集合の和
        res = []  # 結果リスト（部分集合リスト）
        backtrack(state, target, total, nums, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i_naive.cpp"
    /* バックトラッキングアルゴリズム：部分集合和 I */
    void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
        // 部分集合の和がtargetと等しいとき、解を記録
        if (total == target) {
            res.push_back(state);
            return;
        }
        // すべての選択肢を走査
        for (int i = 0; i < choices.size(); i++) {
            // 剪定：部分集合の和がtargetを超えた場合、その選択をスキップ
            if (total + choices[i] > target) {
                continue;
            }
            // 試行：選択を行い、要素とtotalを更新
            state.push_back(choices[i]);
            // 次のラウンドの選択に進む
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：選択を取り消し、前の状態に復元
            state.pop_back();
        }
    }

    /* 部分集合和 I を解く（重複する部分集合を含む） */
    vector<vector<int>> subsetSumINaive(vector<int> nums, int target) {
        vector<int> state;       // 状態（部分集合）
        int total = 0;           // 部分集合の和
        vector<vector<int>> res; // 結果リスト（部分集合リスト）
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i_naive.java"
    /* バックトラッキングアルゴリズム：部分集合和 I */
    void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // 部分集合の和がtargetと等しいとき、解を記録
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を走査
        for (int i = 0; i < choices.length; i++) {
            // 剪定：部分集合の和がtargetを超えた場合、その選択をスキップ
            if (total + choices[i] > target) {
                continue;
            }
            // 試行：選択を行い、要素とtotalを更新
            state.add(choices[i]);
            // 次のラウンドの選択に進む
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：選択を取り消し、前の状態に復元
            state.remove(state.size() - 1);
        }
    }

    /* 部分集合和 I を解く（重複する部分集合を含む） */
    List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        int total = 0; // 部分集合の和
        List<List<Integer>> res = new ArrayList<>(); // 結果リスト（部分集合リスト）
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i_naive.cs"
    [class]{subset_sum_i_naive}-[func]{Backtrack}

    [class]{subset_sum_i_naive}-[func]{SubsetSumINaive}
    ```

=== "Go"

    ```go title="subset_sum_i_naive.go"
    [class]{}-[func]{backtrackSubsetSumINaive}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "Swift"

    ```swift title="subset_sum_i_naive.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "JS"

    ```javascript title="subset_sum_i_naive.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "TS"

    ```typescript title="subset_sum_i_naive.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "Dart"

    ```dart title="subset_sum_i_naive.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "Rust"

    ```rust title="subset_sum_i_naive.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_i_naive}
    ```

=== "C"

    ```c title="subset_sum_i_naive.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i_naive.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "Ruby"

    ```ruby title="subset_sum_i_naive.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_i_naive}
    ```

配列 $[3, 4, 5]$ とターゲット要素 $9$ を上記のコードに入力すると、結果 $[3, 3, 3], [4, 5], [5, 4]$ が得られます。**和が $9$ のすべての部分集合を正常に見つけましたが、重複する部分集合 $[4, 5]$ と $[5, 4]$ が含まれています**。

これは、検索プロセスが選択の順序を区別するためですが、部分集合は選択順序を区別しません。以下の図に示すように、$5$ の前に $4$ を選択することと $4$ の前に $5$ を選択することは異なる分岐ですが、同じ部分集合に対応します。

![部分集合の検索と境界外の剪定](subset_sum_problem.assets/subset_sum_i_naive.png){ class="animation-figure" }

<p align="center"> 図 13-10 &nbsp; 部分集合の検索と境界外の剪定 </p>

重複する部分集合を除去するために、**直接的なアイデアは結果リストを重複除去することです**。しかし、この方法は2つの理由で非常に非効率的です。

- 配列要素が多い場合、特に `target` が大きい場合、検索プロセスで大量の重複する部分集合が生成されます。
- 部分集合（配列）の差異を比較することは非常に時間がかかり、まず配列をソートし、次に配列の各要素の差異を比較する必要があります。

### 2. &nbsp; 重複部分集合の剪定

**剪定を通じて検索プロセス中に重複除去を検討します**。以下の図を観察すると、異なる順序で配列要素を選択するときに重複する部分集合が生成されます。例えば、以下の状況です。

1. 最初のラウンドで $3$ を選択し、2番目のラウンドで $4$ を選択すると、これら2つの要素を含むすべての部分集合が生成され、$[3, 4, \dots]$ と表記されます。
2. 後で、最初のラウンドで $4$ が選択されたとき、**2番目のラウンドは $3$ をスキップすべきです**。この選択によって生成される部分集合 $[4, 3, \dots]$ はステップ `1.` の部分集合と完全に重複するからです。

検索プロセスでは、各層の選択が左から右に一つずつ試行されるため、右側の分岐ほどより多く剪定されます。

1. 最初の2ラウンドで $3$ と $5$ を選択し、部分集合 $[3, 5, \dots]$ を生成します。
2. 最初の2ラウンドで $4$ と $5$ を選択し、部分集合 $[4, 5, \dots]$ を生成します。
3. 最初のラウンドで $5$ が選択された場合、**2番目のラウンドは $3$ と $4$ をスキップすべきです**。部分集合 $[5, 3, \dots]$ と $[5, 4, \dots]$ はステップ `1.` と `2.` で記述された部分集合と完全に重複するからです。

![異なる選択順序による重複部分集合](subset_sum_problem.assets/subset_sum_i_pruning.png){ class="animation-figure" }

<p align="center"> 図 13-11 &nbsp; 異なる選択順序による重複部分集合 </p>

要約すると、入力配列 $[x_1, x_2, \dots, x_n]$ が与えられた場合、検索プロセスでの選択シーケンスは $[x_{i_1}, x_{i_2}, \dots, x_{i_m}]$ であるべきで、$i_1 \leq i_2 \leq \dots \leq i_m$ を満たす必要があります。**この条件を満たさない選択シーケンスは重複を引き起こし、剪定されるべきです**。

### 3. &nbsp; コード実装

この剪定を実装するために、変数 `start` を初期化し、これは走査の開始点を示します。**選択 $x_{i}$ を行った後、次のラウンドをインデックス $i$ から開始するように設定します**。これにより、選択シーケンスが $i_1 \leq i_2 \leq \dots \leq i_m$ を満たすことが保証され、部分集合の一意性が保証されます。

さらに、コードに以下の2つの最適化を行いました。

- 検索を開始する前に、配列 `nums` をソートします。すべての選択の走査で、**部分集合和が `target` を超えたときにループを直接終了します**。後続の要素はより大きく、それらの部分集合和は確実に `target` を超えるからです。
- 要素和変数 `total` を除去し、**`target` に対して減算を実行して要素和をカウントします**。`target` が $0$ に等しくなったとき、解を記録します。

=== "Python"

    ```python title="subset_sum_i.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """バックトラッキングアルゴリズム：部分集合の和 I"""
        # 部分集合の和が target と等しいとき、解を記録
        if target == 0:
            res.append(list(state))
            return
        # すべての選択肢を走査
        # 枝刈り二：start から走査を開始して重複する部分集合の生成を避ける
        for i in range(start, len(choices)):
            # 枝刈り一：部分集合の和が target を超える場合、直ちにループを終了
            # これは配列がソートされており、後の要素がより大きいため、部分集合の和は必ず target を超えるため
            if target - choices[i] < 0:
                break
            # 試行：選択を行い、target、start を更新
            state.append(choices[i])
            # 次の選択ラウンドに進む
            backtrack(state, target - choices[i], choices, i, res)
            # 撤回：選択を取り消し、前の状態に復元
            state.pop()

    def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
        """部分集合の和 I を解く"""
        state = []  # 状態（部分集合）
        nums.sort()  # nums をソート
        start = 0  # 走査の開始点
        res = []  # 結果リスト（部分集合リスト）
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i.cpp"
    /* バックトラッキングアルゴリズム：部分集合和 I */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // 部分集合の和がtargetと等しいとき、解を記録
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // すべての選択肢を走査
        // 剪定二：startから走査を開始し、重複する部分集合の生成を回避
        for (int i = start; i < choices.size(); i++) {
            // 剪定一：部分集合の和がtargetを超えた場合、即座にループを終了
            // 配列がソートされているため、後の要素はさらに大きく、部分集合の和は必ずtargetを超える
            if (target - choices[i] < 0) {
                break;
            }
            // 試行：選択を行い、target、startを更新
            state.push_back(choices[i]);
            // 次のラウンドの選択に進む
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：選択を取り消し、前の状態に復元
            state.pop_back();
        }
    }

    /* 部分集合和 I を解く */
    vector<vector<int>> subsetSumI(vector<int> nums, int target) {
        vector<int> state;              // 状態（部分集合）
        sort(nums.begin(), nums.end()); // nums をソート
        int start = 0;                  // 走査の開始点
        vector<vector<int>> res;        // 結果リスト（部分集合リスト）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i.java"
    /* バックトラッキングアルゴリズム：部分集合和 I */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 部分集合の和がtargetと等しいとき、解を記録
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を走査
        // 剪定二：startから走査を開始し、重複する部分集合の生成を回避
        for (int i = start; i < choices.length; i++) {
            // 剪定一：部分集合の和がtargetを超えた場合、即座にループを終了
            // 配列がソートされているため、後の要素はさらに大きく、部分集合の和は必ずtargetを超える
            if (target - choices[i] < 0) {
                break;
            }
            // 試行：選択を行い、target、startを更新
            state.add(choices[i]);
            // 次のラウンドの選択に進む
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：選択を取り消し、前の状態に復元
            state.remove(state.size() - 1);
        }
    }

    /* 部分集合和 I を解く */
    List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        Arrays.sort(nums); // nums をソート
        int start = 0; // 走査の開始点
        List<List<Integer>> res = new ArrayList<>(); // 結果リスト（部分集合リスト）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i.cs"
    [class]{subset_sum_i}-[func]{Backtrack}

    [class]{subset_sum_i}-[func]{SubsetSumI}
    ```

=== "Go"

    ```go title="subset_sum_i.go"
    [class]{}-[func]{backtrackSubsetSumI}

    [class]{}-[func]{subsetSumI}
    ```

=== "Swift"

    ```swift title="subset_sum_i.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "JS"

    ```javascript title="subset_sum_i.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "TS"

    ```typescript title="subset_sum_i.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "Dart"

    ```dart title="subset_sum_i.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "Rust"

    ```rust title="subset_sum_i.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_i}
    ```

=== "C"

    ```c title="subset_sum_i.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "Ruby"

    ```ruby title="subset_sum_i.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_i}
    ```

以下の図は、配列 $[3, 4, 5]$ とターゲット要素 $9$ を上記のコードに入力した後の全体的なバックトラッキングプロセスを示しています。

![部分集合和 I のバックトラッキングプロセス](subset_sum_problem.assets/subset_sum_i.png){ class="animation-figure" }

<p align="center"> 図 13-12 &nbsp; 部分集合和 I のバックトラッキングプロセス </p>

## 13.3.2 &nbsp; 重複要素がある場合を考慮

!!! question

    正の整数の配列 `nums` とターゲット正整数 `target` が与えられた場合、組み合わせ内の要素の和が `target` に等しくなるようなすべての可能な組み合わせを見つけてください。**与えられた配列には重複要素が含まれる可能性があり、各要素は一度だけ選択できます**。これらの組み合わせを重複する組み合わせを含まないリストとして返してください。

前の問題と比較して、**この問題の入力配列には重複要素が含まれる可能性があり**、新しい問題が導入されます。例えば、配列 $[4, \hat{4}, 5]$ とターゲット要素 $9$ が与えられた場合、既存のコードの出力結果は $[4, 5], [\hat{4}, 5]$ となり、重複する部分集合が生成されます。

**この重複の理由は、特定のラウンドで等しい要素が複数回選択されることです**。以下の図では、最初のラウンドに3つの選択肢があり、そのうち2つが $4$ であり、2つの重複する検索分岐を生成し、重複する部分集合を出力します。同様に、2番目のラウンドの2つの $4$ も重複する部分集合を生成します。

![等しい要素による重複部分集合](subset_sum_problem.assets/subset_sum_ii_repeat.png){ class="animation-figure" }

<p align="center"> 図 13-13 &nbsp; 等しい要素による重複部分集合 </p>

### 1. &nbsp; 等値要素の剪定

この問題を解決するために、**等しい要素がラウンドごとに一度だけ選択されるように制限する必要があります**。実装は非常に巧妙です：配列がソートされているため、等しい要素は隣接しています。これは、特定のラウンドの選択で、現在の要素がその左側の要素と等しい場合、それはすでに選択されていることを意味するため、現在の要素を直接スキップします。

同時に、**この問題では各配列要素は一度だけ選択できると規定されています**。幸い、変数 `start` を使用してこの制約も満たすことができます：選択 $x_{i}$ を行った後、次のラウンドをインデックス $i + 1$ から前方に開始するように設定します。これにより、重複する部分集合が除去されるだけでなく、要素の重複選択も回避されます。

### 2. &nbsp; コード実装

=== "Python"

    ```python title="subset_sum_ii.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """バックトラッキングアルゴリズム：部分集合の和 II"""
        # 部分集合の和が target と等しいとき、解を記録
        if target == 0:
            res.append(list(state))
            return
        # すべての選択肢を走査
        # 枝刈り二：start から走査を開始して重複する部分集合の生成を避ける
        # 枝刈り三：start から走査を開始して同じ要素の重複選択を避ける
        for i in range(start, len(choices)):
            # 枝刈り一：部分集合の和が target を超える場合、直ちにループを終了
            # これは配列がソートされており、後の要素がより大きいため、部分集合の和は必ず target を超えるため
            if target - choices[i] < 0:
                break
            # 枝刈り四：要素が左の要素と等しい場合、検索分岐が重複していることを示すため、スキップ
            if i > start and choices[i] == choices[i - 1]:
                continue
            # 試行：選択を行い、target、start を更新
            state.append(choices[i])
            # 次の選択ラウンドに進む
            backtrack(state, target - choices[i], choices, i + 1, res)
            # 撤回：選択を取り消し、前の状態に復元
            state.pop()

    def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
        """部分集合の和 II を解く"""
        state = []  # 状態（部分集合）
        nums.sort()  # nums をソート
        start = 0  # 走査の開始点
        res = []  # 結果リスト（部分集合リスト）
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_ii.cpp"
    /* バックトラッキングアルゴリズム：部分集合和 II */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // 部分集合の和がtargetと等しいとき、解を記録
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // すべての選択肢を走査
        // 剪定二：startから走査を開始し、重複する部分集合の生成を回避
        // 剪定三：startから走査を開始し、同じ要素の繰り返し選択を回避
        for (int i = start; i < choices.size(); i++) {
            // 剪定一：部分集合の和がtargetを超えた場合、即座にループを終了
            // 配列がソートされているため、後の要素はさらに大きく、部分集合の和は必ずtargetを超える
            if (target - choices[i] < 0) {
                break;
            }
            // 剪定四：要素が左の要素と等しい場合、検索ブランチの重複を示すのでスキップ
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 試行：選択を行い、target、startを更新
            state.push_back(choices[i]);
            // 次のラウンドの選択に進む
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：選択を取り消し、前の状態に復元
            state.pop_back();
        }
    }

    /* 部分集合和 II を解く */
    vector<vector<int>> subsetSumII(vector<int> nums, int target) {
        vector<int> state;              // 状態（部分集合）
        sort(nums.begin(), nums.end()); // nums をソート
        int start = 0;                  // 走査の開始点
        vector<vector<int>> res;        // 結果リスト（部分集合リスト）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_ii.java"
    /* バックトラッキングアルゴリズム：部分集合和 II */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 部分集合の和がtargetと等しいとき、解を記録
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // すべての選択肢を走査
        // 剪定二：startから走査を開始し、重複する部分集合の生成を回避
        // 剪定三：startから走査を開始し、同じ要素の繰り返し選択を回避
        for (int i = start; i < choices.length; i++) {
            // 剪定一：部分集合の和がtargetを超えた場合、即座にループを終了
            // 配列がソートされているため、後の要素はさらに大きく、部分集合の和は必ずtargetを超える
            if (target - choices[i] < 0) {
                break;
            }
            // 剪定四：要素が左の要素と等しい場合、検索ブランチの重複を示すのでスキップ
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 試行：選択を行い、target、startを更新
            state.add(choices[i]);
            // 次のラウンドの選択に進む
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：選択を取り消し、前の状態に復元
            state.remove(state.size() - 1);
        }
    }

    /* 部分集合和 II を解く */
    List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状態（部分集合）
        Arrays.sort(nums); // nums をソート
        int start = 0; // 走査の開始点
        List<List<Integer>> res = new ArrayList<>(); // 結果リスト（部分集合リスト）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_ii.cs"
    [class]{subset_sum_ii}-[func]{Backtrack}

    [class]{subset_sum_ii}-[func]{SubsetSumII}
    ```

=== "Go"

    ```go title="subset_sum_ii.go"
    [class]{}-[func]{backtrackSubsetSumII}

    [class]{}-[func]{subsetSumII}
    ```

=== "Swift"

    ```swift title="subset_sum_ii.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "JS"

    ```javascript title="subset_sum_ii.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "TS"

    ```typescript title="subset_sum_ii.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "Dart"

    ```dart title="subset_sum_ii.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "Rust"

    ```rust title="subset_sum_ii.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_ii}
    ```

=== "C"

    ```c title="subset_sum_ii.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_ii.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "Ruby"

    ```ruby title="subset_sum_ii.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_ii}
    ```

以下の図は、配列 $[4, 4, 5]$ とターゲット要素 $9$ のバックトラッキングプロセスを示し、4種類の剪定操作が含まれています。図とコードのコメントを組み合わせて、検索プロセス全体と各種類の剪定操作の動作を理解してください。

![部分集合和 II のバックトラッキングプロセス](subset_sum_problem.assets/subset_sum_ii.png){ class="animation-figure" }

<p align="center"> 図 13-14 &nbsp; 部分集合和 II のバックトラッキングプロセス </p>
