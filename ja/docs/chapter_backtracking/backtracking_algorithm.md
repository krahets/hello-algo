# バックトラッキングアルゴリズム

<u>バックトラッキングアルゴリズム（backtracking algorithm）</u>は、総当たりによって問題を解く手法です。その中核となる考え方は、初期状態から出発し、あり得るすべての解を力任せに探索し、正しい解に到達したらそれを記録し、解を見つけるか、考えられるすべての選択を試しても解が見つからなくなるまで続ける、というものです。

バックトラッキングアルゴリズムでは、通常「深さ優先探索」を用いて解空間をたどります。「二分木」の章で述べたように、前順・中順・後順走査はいずれも深さ優先探索に属します。ここでは前順走査を使ってバックトラッキング問題を構成し、その仕組みを段階的に理解していきます。

!!! question "例題1"

    1 本の二分木が与えられたとき、値が $7$ のノードをすべて探索して記録し、そのノードのリストを返してください。

この問題では、この木を前順走査し、現在のノードの値が $7$ かどうかを判定します。該当する場合は、そのノードの値を結果リスト `res` に追加します。関連する処理は下図と次のコードのとおりです。

```src
[file]{preorder_traversal_i_compact}-[class]{}-[func]{pre_order}
```

![前順走査でノードを探索する](backtracking_algorithm.assets/preorder_find_nodes.png)

## 試行と戻る

**バックトラッキングアルゴリズムと呼ばれるのは、解空間を探索する際に「試行」と「戻る」という戦略を取るためです**。探索中に、ある状態から先へ進めない、または条件を満たす解を得られないと分かった場合、アルゴリズムは直前の選択を取り消して前の状態へ戻り、別の選択肢を試します。

例題1では、各ノードへの訪問が 1 回の「試行」に対応し、葉ノードを越えるか親ノードへ戻る `return` は「戻る」を表します。

ここで強調しておきたいのは、**戻るとは関数の return だけを指すわけではない**という点です。これを説明するために、例題1を少し拡張します。

!!! question "例題2"

    二分木の中で値が $7$ のノードをすべて探索し、**根ノードからそれらのノードまでの経路を返してください**。

例題1のコードを土台に、訪問済みノードの経路を記録するためのリスト `path` を導入します。値が $7$ のノードに到達したら、`path` をコピーして結果リスト `res` に追加します。走査が完了すると、`res` にはすべての解が保存されています。コードは次のとおりです。

```src
[file]{preorder_traversal_ii_compact}-[class]{}-[func]{pre_order}
```

各「試行」で現在のノードを `path` に追加して経路を記録し、「戻る」前にはそのノードを `path` から取り除き、**今回の試行前の状態を復元する**必要があります。

次の図に示す過程を見ると、**試行と戻るは「前進」と「取り消し」として理解できます**。この 2 つの操作は互いに逆向きです。

=== "<1>"
    ![試行と戻る](backtracking_algorithm.assets/preorder_find_paths_step1.png)

=== "<2>"
    ![preorder_find_paths_step2](backtracking_algorithm.assets/preorder_find_paths_step2.png)

=== "<3>"
    ![preorder_find_paths_step3](backtracking_algorithm.assets/preorder_find_paths_step3.png)

=== "<4>"
    ![preorder_find_paths_step4](backtracking_algorithm.assets/preorder_find_paths_step4.png)

=== "<5>"
    ![preorder_find_paths_step5](backtracking_algorithm.assets/preorder_find_paths_step5.png)

=== "<6>"
    ![preorder_find_paths_step6](backtracking_algorithm.assets/preorder_find_paths_step6.png)

=== "<7>"
    ![preorder_find_paths_step7](backtracking_algorithm.assets/preorder_find_paths_step7.png)

=== "<8>"
    ![preorder_find_paths_step8](backtracking_algorithm.assets/preorder_find_paths_step8.png)

=== "<9>"
    ![preorder_find_paths_step9](backtracking_algorithm.assets/preorder_find_paths_step9.png)

=== "<10>"
    ![preorder_find_paths_step10](backtracking_algorithm.assets/preorder_find_paths_step10.png)

=== "<11>"
    ![preorder_find_paths_step11](backtracking_algorithm.assets/preorder_find_paths_step11.png)

## 枝刈り

複雑なバックトラッキング問題には、通常 1 つ以上の制約条件が含まれます。**制約条件は多くの場合「枝刈り」に利用できます**。

!!! question "例題3"

    二分木の中で値が $7$ のノードをすべて探索し、根ノードからそれらのノードまでの経路を返してください。**ただし、経路には値が $3$ のノードを含めてはいけません**。

上の制約条件を満たすために、**枝刈り操作を追加する必要があります**。探索中に値が $3$ のノードに出会った場合は、そこで早めに return し、それ以上探索を続けません。コードは次のとおりです。

```src
[file]{preorder_traversal_iii_compact}-[class]{}-[func]{pre_order}
```

「枝刈り」は非常にイメージしやすい名称です。次の図のように、探索中に**制約条件を満たさない探索分岐を切り落とす**ことで、多くの無意味な試行を避け、探索効率を高められます。

![制約条件にもとづく枝刈り](backtracking_algorithm.assets/preorder_find_constrained_paths.png)

## フレームワークコード

次に、バックトラッキングにおける「試行・戻る・枝刈り」の本体部分を抽出し、汎用性の高いコードフレームワークへまとめてみます。

以下のフレームワークコードでは、`state` は問題の現在状態、`choices` はその状態で取り得る選択肢を表します。

=== "Python"

    ```python title=""
    def backtrack(state: State, choices: list[choice], res: list[state]):
        """バックトラッキングアルゴリズムのフレームワーク"""
        # 解かどうかを判定
        if is_solution(state):
            # 解を記録
            record_solution(state, res)
            # これ以上探索しない
            return
        # すべての選択肢を走査
        for choice in choices:
            # 枝刈り: 選択が妥当かを判定
            if is_valid(state, choice):
                # 試行: 選択を行い、状態を更新
                make_choice(state, choice)
                backtrack(state, choices, res)
                # 戻る: 選択を取り消し、前の状態に戻す
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を走査
        for (Choice choice : choices) {
            // 枝刈り: 選択が妥当かを判定
            if (isValid(state, choice)) {
                // 試行: 選択を行い、状態を更新
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 戻る: 選択を取り消し、前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    void backtrack(State state, List<Choice> choices, List<State> res) {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を走査
        for (Choice choice : choices) {
            // 枝刈り: 選択が妥当かを判定
            if (isValid(state, choice)) {
                // 試行: 選択を行い、状態を更新
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 戻る: 選択を取り消し、前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    void Backtrack(State state, List<Choice> choices, List<State> res) {
        // 解かどうかを判定
        if (IsSolution(state)) {
            // 解を記録
            RecordSolution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を走査
        foreach (Choice choice in choices) {
            // 枝刈り: 選択が妥当かを判定
            if (IsValid(state, choice)) {
                // 試行: 選択を行い、状態を更新
                MakeChoice(state, choice);
                Backtrack(state, choices, res);
                // 戻る: 選択を取り消し、前の状態に戻す
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    func backtrack(state *State, choices []Choice, res *[]State) {
        // 解かどうかを判定
        if isSolution(state) {
            // 解を記録
            recordSolution(state, res)
            // これ以上探索しない
            return
        }
        // すべての選択肢を走査
        for _, choice := range choices {
            // 枝刈り: 選択が妥当かを判定
            if isValid(state, choice) {
                // 試行: 選択を行い、状態を更新
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // 戻る: 選択を取り消し、前の状態に戻す
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
        // 解かどうかを判定
        if isSolution(state: state) {
            // 解を記録
            recordSolution(state: state, res: &res)
            // これ以上探索しない
            return
        }
        // すべての選択肢を走査
        for choice in choices {
            // 枝刈り: 選択が妥当かを判定
            if isValid(state: state, choice: choice) {
                // 試行: 選択を行い、状態を更新
                makeChoice(state: &state, choice: choice)
                backtrack(state: &state, choices: choices, res: &res)
                // 戻る: 選択を取り消し、前の状態に戻す
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    function backtrack(state, choices, res) {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を走査
        for (let choice of choices) {
            // 枝刈り: 選択が妥当かを判定
            if (isValid(state, choice)) {
                // 試行: 選択を行い、状態を更新
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 戻る: 選択を取り消し、前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    function backtrack(state: State, choices: Choice[], res: State[]): void {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を走査
        for (let choice of choices) {
            // 枝刈り: 選択が妥当かを判定
            if (isValid(state, choice)) {
                // 試行: 選択を行い、状態を更新
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 戻る: 選択を取り消し、前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    void backtrack(State state, List<Choice>, List<State> res) {
      // 解かどうかを判定
      if (isSolution(state)) {
        // 解を記録
        recordSolution(state, res);
        // これ以上探索しない
        return;
      }
      // すべての選択肢を走査
      for (Choice choice in choices) {
        // 枝刈り: 選択が妥当かを判定
        if (isValid(state, choice)) {
          // 試行: 選択を行い、状態を更新
          makeChoice(state, choice);
          backtrack(state, choices, res);
          // 戻る: 選択を取り消し、前の状態に戻す
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
        // 解かどうかを判定
        if is_solution(state) {
            // 解を記録
            record_solution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を走査
        for choice in choices {
            // 枝刈り: 選択が妥当かを判定
            if is_valid(state, choice) {
                // 試行: 選択を行い、状態を更新
                make_choice(state, choice);
                backtrack(state, choices, res);
                // 戻る: 選択を取り消し、前の状態に戻す
                undo_choice(state, choice);
            }
        }
    }
    ```

=== "C"

    ```c title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res, numRes);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を走査
        for (int i = 0; i < numChoices; i++) {
            // 枝刈り: 選択が妥当かを判定
            if (isValid(state, &choices[i])) {
                // 試行: 選択を行い、状態を更新
                makeChoice(state, &choices[i]);
                backtrack(state, choices, numChoices, res, numRes);
                // 戻る: 選択を取り消し、前の状態に戻す
                undoChoice(state, &choices[i]);
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* バックトラッキングアルゴリズムのフレームワーク */
    fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res)
            // これ以上探索しない
            return
        }
        // すべての選択肢を走査
        for (choice in choices) {
            // 枝刈り: 選択が妥当かを判定
            if (isValid(state, choice)) {
                // 試行: 選択を行い、状態を更新
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // 戻る: 選択を取り消し、前の状態に戻す
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### バックトラッキングアルゴリズムのフレームワーク ###
    def backtrack(state, choices, res)
        # 解かどうかを判定
        if is_solution?(state)
            # 解を記録
            record_solution(state, res)
            return
        end

        # すべての選択肢を走査
        for choice in choices
            # 枝刈り: 選択が妥当かを判定
            if is_valid?(state, choice)
                # 試行: 選択を行い、状態を更新
                make_choice(state, choice)
                backtrack(state, choices, res)
                # 戻る: 選択を取り消し、前の状態に戻す
                undo_choice(state, choice)
            end
        end
    end
    ```

次に、このフレームワークコードを用いて例題3を解きます。状態 `state` はノードの走査経路、選択肢 `choices` は現在のノードの左子ノードと右子ノード、結果 `res` は経路のリストです。

```src
[file]{preorder_traversal_iii_template}-[class]{}-[func]{backtrack}
```

問題の条件より、値が $7$ のノードを見つけた後も探索を続ける必要があります。**そのため、解を記録した後の `return` 文は削除しなければなりません**。次の図は、`return` 文を残す場合と削除する場合の探索過程を比較したものです。

![return を残す場合と削除する場合の探索過程の比較](backtracking_algorithm.assets/backtrack_remove_return_or_not.png)

前順走査にもとづく実装と比べると、バックトラッキングアルゴリズムのフレームワークにもとづく実装はやや冗長に見えますが、汎用性に優れています。実際、**多くのバックトラッキング問題はこのフレームワークで解けます**。具体的な問題に応じて `state` と `choices` を定義し、各メソッドを実装すれば十分です。

## よく使われる用語

アルゴリズム問題をより明確に分析するために、バックトラッキングでよく使われる用語の意味を整理し、例題3に対応する例を次の表にまとめます。

<p align="center"> 表 <id> &nbsp; よく使われるバックトラッキング用語 </p>

| 用語                   | 定義                                                                       | 例題3                                                                 |
| ---------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| 解（solution）         | 問題の特定の条件を満たす答えであり、1 つまたは複数存在し得る               | 根ノードからノード $7$ までの、制約条件を満たすすべての経路            |
| 制約条件（constraint） | 解の実現可能性を制限する条件であり、通常は枝刈りに用いられる               | 経路にノード $3$ を含まないこと                                         |
| 状態（state）          | ある時点における問題の状況を表し、すでに行った選択を含む                   | 現在までに訪問したノードの経路、すなわち `path` ノードリスト           |
| 試行（attempt）        | 利用可能な選択肢にもとづいて解空間を探索する過程であり、選択、状態更新、解判定を含む | 左右の子ノードを再帰的に訪問し、ノードを `path` に追加し、値が $7$ か判定する |
| 戻る（backtracking）   | 制約条件を満たさない状態に出会ったとき、それまでの選択を取り消して前の状態へ戻ること | 葉ノードを越えたとき、ノード訪問を終えたとき、値が $3$ のノードに出会ったときに探索を終了し、関数から戻る |
| 枝刈り（pruning）      | 問題の性質や制約条件にもとづき、無意味な探索経路を避ける方法であり、探索効率を高める | 値が $3$ のノードに出会ったら、それ以上探索しない                      |

!!! tip

    問題、解、状態などの概念は汎用的であり、分割統治、バックトラッキング、動的計画法、貪欲法などのアルゴリズムにも共通して現れます。

## 利点と限界

バックトラッキングアルゴリズムの本質は深さ優先探索です。条件を満たす解を見つけるまで、あり得るすべての解を試します。この方法の利点は、考えられるすべての解を見つけられることであり、適切な枝刈りを行えば高い効率を発揮します。

しかし、大規模または複雑な問題を扱う場合、**バックトラッキングアルゴリズムの実行効率は受け入れがたいことがあります**。

- **時間**：バックトラッキングアルゴリズムでは通常、状態空間のすべての可能性をたどる必要があり、時間計算量は指数時間や階乗時間に達することがあります。
- **空間**：再帰呼び出しの過程では現在の状態（たとえば経路や枝刈り用の補助変数など）を保持する必要があり、深さが大きいと空間使用量も大きくなります。

それでもなお、**バックトラッキングアルゴリズムは一部の探索問題や制約充足問題に対する最良の解法です**。この種の問題では、どの選択が有効な解を生むかを事前に予測できないため、可能な選択肢をすべてたどる必要があります。このときの鍵は**いかに効率を最適化するか**であり、代表的な方法は 2 つあります。

- **枝刈り**：解が生じないことが確実な経路を探索しないことで、時間と空間を節約する。
- **ヒューリスティック探索**：探索中に何らかの戦略や推定値を導入し、有効な解を生みやすい経路を優先的に探索する。

## バックトラッキングの典型例題

バックトラッキングアルゴリズムは、多くの探索問題、制約充足問題、組合せ最適化問題の解決に利用できます。

**探索問題**：この種の問題の目標は、特定の条件を満たす解を見つけることです。

- 全順列問題：ある集合が与えられたとき、考えられるすべての順列を求める。
- 部分和問題：ある集合と目標和が与えられたとき、和が目標値となるすべての部分集合を見つける。
- ハノイの塔問題：3 本の柱と大きさの異なる複数の円盤が与えられたとき、すべての円盤を 1 本の柱から別の柱へ移動する。ただし 1 回に 1 枚しか動かせず、大きい円盤を小さい円盤の上に置いてはならない。

**制約充足問題**：この種の問題の目標は、すべての制約条件を満たす解を見つけることです。

- $n$ クイーン問題：$n \times n$ の盤面に $n$ 個のクイーンを配置し、互いに攻撃し合わないようにする。
- 数独：$9 \times 9$ のグリッドに数字 $1$ ~ $9$ を入れ、各行・各列・各 $3 \times 3$ の小区画で数字が重複しないようにする。
- グラフ彩色問題：無向グラフが与えられたとき、隣接する頂点が同じ色にならないように、できるだけ少ない色で各頂点を彩色する。

**組合せ最適化問題**：この種の問題の目標は、組合せ空間の中で条件を満たす最適解を見つけることです。

- 0-1 ナップサック問題：複数の品物とナップサックが与えられ、各品物には価値と重さがある。ナップサック容量の範囲内で総価値が最大になるように品物を選ぶ。
- 巡回セールスマン問題：グラフ内のある頂点から出発し、他のすべての頂点をちょうど 1 回ずつ訪れて出発点へ戻るときの最短経路を求める。
- 最大クリーク問題：無向グラフが与えられたとき、任意の 2 頂点間に辺が存在する最大の完全部分グラフを見つける。

多くの組合せ最適化問題では、バックトラッキングは最適な解法ではない点に注意してください。

- 0-1 ナップサック問題は通常、より高い時間効率を得るために動的計画法で解く。
- 巡回セールスマン問題は著名な NP-Hard 問題であり、よく用いられる解法には遺伝的アルゴリズムや蟻コロニー最適化などがある。
- 最大クリーク問題はグラフ理論における古典的問題であり、貪欲法などのヒューリスティックで解ける。
