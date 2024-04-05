# 回溯演算法

<u>回溯演算法（backtracking algorithm）</u>是一種透過窮舉來解決問題的方法，它的核心思想是從一個初始狀態出發，暴力搜尋所有可能的解決方案，當遇到正確的解則將其記錄，直到找到解或者嘗試了所有可能的選擇都無法找到解為止。

回溯演算法通常採用“深度優先搜尋”來走訪解空間。在“二元樹”章節中，我們提到前序、中序和後序走訪都屬於深度優先搜尋。接下來，我們利用前序走訪構造一個回溯問題，逐步瞭解回溯演算法的工作原理。

!!! question "例題一"

    給定一棵二元樹，搜尋並記錄所有值為 $7$ 的節點，請返回節點串列。

對於此題，我們前序走訪這棵樹，並判斷當前節點的值是否為 $7$ ，若是，則將該節點的值加入結果串列 `res` 之中。相關過程實現如下圖和以下程式碼所示：

```src
[file]{preorder_traversal_i_compact}-[class]{}-[func]{pre_order}
```

![在前序走訪中搜索節點](backtracking_algorithm.assets/preorder_find_nodes.png)

## 嘗試與回退

**之所以稱之為回溯演算法，是因為該演算法在搜尋解空間時會採用“嘗試”與“回退”的策略**。當演算法在搜尋過程中遇到某個狀態無法繼續前進或無法得到滿足條件的解時，它會撤銷上一步的選擇，退回到之前的狀態，並嘗試其他可能的選擇。

對於例題一，訪問每個節點都代表一次“嘗試”，而越過葉節點或返回父節點的 `return` 則表示“回退”。

值得說明的是，**回退並不僅僅包括函式返回**。為解釋這一點，我們對例題一稍作拓展。

!!! question "例題二"

    在二元樹中搜索所有值為 $7$ 的節點，**請返回根節點到這些節點的路徑**。

在例題一程式碼的基礎上，我們需要藉助一個串列 `path` 記錄訪問過的節點路徑。當訪問到值為 $7$ 的節點時，則複製 `path` 並新增進結果串列 `res` 。走訪完成後，`res` 中儲存的就是所有的解。程式碼如下所示：

```src
[file]{preorder_traversal_ii_compact}-[class]{}-[func]{pre_order}
```

在每次“嘗試”中，我們透過將當前節點新增進 `path` 來記錄路徑；而在“回退”前，我們需要將該節點從 `path` 中彈出，**以恢復本次嘗試之前的狀態**。

觀察下圖所示的過程，**我們可以將嘗試和回退理解為“前進”與“撤銷”**，兩個操作互為逆向。

=== "<1>"
    ![嘗試與回退](backtracking_algorithm.assets/preorder_find_paths_step1.png)

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

## 剪枝

複雜的回溯問題通常包含一個或多個約束條件，**約束條件通常可用於“剪枝”**。

!!! question "例題三"

    在二元樹中搜索所有值為 $7$ 的節點，請返回根節點到這些節點的路徑，**並要求路徑中不包含值為 $3$ 的節點**。

為了滿足以上約束條件，**我們需要新增剪枝操作**：在搜尋過程中，若遇到值為 $3$ 的節點，則提前返回，不再繼續搜尋。程式碼如下所示：

```src
[file]{preorder_traversal_iii_compact}-[class]{}-[func]{pre_order}
```

“剪枝”是一個非常形象的名詞。如下圖所示，在搜尋過程中，**我們“剪掉”了不滿足約束條件的搜尋分支**，避免許多無意義的嘗試，從而提高了搜尋效率。

![根據約束條件剪枝](backtracking_algorithm.assets/preorder_find_constrained_paths.png)

## 框架程式碼

接下來，我們嘗試將回溯的“嘗試、回退、剪枝”的主體框架提煉出來，提升程式碼的通用性。

在以下框架程式碼中，`state` 表示問題的當前狀態，`choices` 表示當前狀態下可以做出的選擇：

=== "Python"

    ```python title=""
    def backtrack(state: State, choices: list[choice], res: list[state]):
        """回溯演算法框架"""
        # 判斷是否為解
        if is_solution(state):
            # 記錄解
            record_solution(state, res)
            # 不再繼續搜尋
            return
        # 走訪所有選擇
        for choice in choices:
            # 剪枝：判斷選擇是否合法
            if is_valid(state, choice):
                # 嘗試：做出選擇，更新狀態
                make_choice(state, choice)
                backtrack(state, choices, res)
                # 回退：撤銷選擇，恢復到之前的狀態
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title=""
    /* 回溯演算法框架 */
    void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
        // 判斷是否為解
        if (isSolution(state)) {
            // 記錄解
            recordSolution(state, res);
            // 不再繼續搜尋
            return;
        }
        // 走訪所有選擇
        for (Choice choice : choices) {
            // 剪枝：判斷選擇是否合法
            if (isValid(state, choice)) {
                // 嘗試：做出選擇，更新狀態
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 回退：撤銷選擇，恢復到之前的狀態
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title=""
    /* 回溯演算法框架 */
    void backtrack(State state, List<Choice> choices, List<State> res) {
        // 判斷是否為解
        if (isSolution(state)) {
            // 記錄解
            recordSolution(state, res);
            // 不再繼續搜尋
            return;
        }
        // 走訪所有選擇
        for (Choice choice : choices) {
            // 剪枝：判斷選擇是否合法
            if (isValid(state, choice)) {
                // 嘗試：做出選擇，更新狀態
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 回退：撤銷選擇，恢復到之前的狀態
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title=""
    /* 回溯演算法框架 */
    void Backtrack(State state, List<Choice> choices, List<State> res) {
        // 判斷是否為解
        if (IsSolution(state)) {
            // 記錄解
            RecordSolution(state, res);
            // 不再繼續搜尋
            return;
        }
        // 走訪所有選擇
        foreach (Choice choice in choices) {
            // 剪枝：判斷選擇是否合法
            if (IsValid(state, choice)) {
                // 嘗試：做出選擇，更新狀態
                MakeChoice(state, choice);
                Backtrack(state, choices, res);
                // 回退：撤銷選擇，恢復到之前的狀態
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title=""
    /* 回溯演算法框架 */
    func backtrack(state *State, choices []Choice, res *[]State) {
        // 判斷是否為解
        if isSolution(state) {
            // 記錄解
            recordSolution(state, res)
            // 不再繼續搜尋
            return
        }
        // 走訪所有選擇
        for _, choice := range choices {
            // 剪枝：判斷選擇是否合法
            if isValid(state, choice) {
                // 嘗試：做出選擇，更新狀態
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // 回退：撤銷選擇，恢復到之前的狀態
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* 回溯演算法框架 */
    func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
        // 判斷是否為解
        if isSolution(state: state) {
            // 記錄解
            recordSolution(state: state, res: &res)
            // 不再繼續搜尋
            return
        }
        // 走訪所有選擇
        for choice in choices {
            // 剪枝：判斷選擇是否合法
            if isValid(state: state, choice: choice) {
                // 嘗試：做出選擇，更新狀態
                makeChoice(state: &state, choice: choice)
                backtrack(state: &state, choices: choices, res: &res)
                // 回退：撤銷選擇，恢復到之前的狀態
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* 回溯演算法框架 */
    function backtrack(state, choices, res) {
        // 判斷是否為解
        if (isSolution(state)) {
            // 記錄解
            recordSolution(state, res);
            // 不再繼續搜尋
            return;
        }
        // 走訪所有選擇
        for (let choice of choices) {
            // 剪枝：判斷選擇是否合法
            if (isValid(state, choice)) {
                // 嘗試：做出選擇，更新狀態
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 回退：撤銷選擇，恢復到之前的狀態
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* 回溯演算法框架 */
    function backtrack(state: State, choices: Choice[], res: State[]): void {
        // 判斷是否為解
        if (isSolution(state)) {
            // 記錄解
            recordSolution(state, res);
            // 不再繼續搜尋
            return;
        }
        // 走訪所有選擇
        for (let choice of choices) {
            // 剪枝：判斷選擇是否合法
            if (isValid(state, choice)) {
                // 嘗試：做出選擇，更新狀態
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 回退：撤銷選擇，恢復到之前的狀態
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* 回溯演算法框架 */
    void backtrack(State state, List<Choice>, List<State> res) {
      // 判斷是否為解
      if (isSolution(state)) {
        // 記錄解
        recordSolution(state, res);
        // 不再繼續搜尋
        return;
      }
      // 走訪所有選擇
      for (Choice choice in choices) {
        // 剪枝：判斷選擇是否合法
        if (isValid(state, choice)) {
          // 嘗試：做出選擇，更新狀態
          makeChoice(state, choice);
          backtrack(state, choices, res);
          // 回退：撤銷選擇，恢復到之前的狀態
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title=""
    /* 回溯演算法框架 */
    fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
        // 判斷是否為解
        if is_solution(state) {
            // 記錄解
            record_solution(state, res);
            // 不再繼續搜尋
            return;
        }
        // 走訪所有選擇
        for choice in choices {
            // 剪枝：判斷選擇是否合法
            if is_valid(state, choice) {
                // 嘗試：做出選擇，更新狀態
                make_choice(state, choice);
                backtrack(state, choices, res);
                // 回退：撤銷選擇，恢復到之前的狀態
                undo_choice(state, choice);
            }
        }
    }
    ```

=== "C"

    ```c title=""
    /* 回溯演算法框架 */
    void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
        // 判斷是否為解
        if (isSolution(state)) {
            // 記錄解
            recordSolution(state, res, numRes);
            // 不再繼續搜尋
            return;
        }
        // 走訪所有選擇
        for (int i = 0; i < numChoices; i++) {
            // 剪枝：判斷選擇是否合法
            if (isValid(state, &choices[i])) {
                // 嘗試：做出選擇，更新狀態
                makeChoice(state, &choices[i]);
                backtrack(state, choices, numChoices, res, numRes);
                // 回退：撤銷選擇，恢復到之前的狀態
                undoChoice(state, &choices[i]);
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* 回溯演算法框架 */
    fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
        // 判斷是否為解
        if (isSolution(state)) {
            // 記錄解
            recordSolution(state, res)
            // 不再繼續搜尋
            return
        }
        // 走訪所有選擇
        for (choice in choices) {
            // 剪枝：判斷選擇是否合法
            if (isValid(state, choice)) {
                // 嘗試：做出選擇，更新狀態
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // 回退：撤銷選擇，恢復到之前的狀態
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title=""

    ```

=== "Zig"

    ```zig title=""

    ```

接下來，我們基於框架程式碼來解決例題三。狀態 `state` 為節點走訪路徑，選擇 `choices` 為當前節點的左子節點和右子節點，結果 `res` 是路徑串列：

```src
[file]{preorder_traversal_iii_template}-[class]{}-[func]{backtrack}
```

根據題意，我們在找到值為 $7$ 的節點後應該繼續搜尋，**因此需要將記錄解之後的 `return` 語句刪除**。下圖對比了保留或刪除 `return` 語句的搜尋過程。

![保留與刪除 return 的搜尋過程對比](backtracking_algorithm.assets/backtrack_remove_return_or_not.png)

相比基於前序走訪的程式碼實現，基於回溯演算法框架的程式碼實現雖然顯得囉唆，但通用性更好。實際上，**許多回溯問題可以在該框架下解決**。我們只需根據具體問題來定義 `state` 和 `choices` ，並實現框架中的各個方法即可。

## 常用術語

為了更清晰地分析演算法問題，我們總結一下回溯演算法中常用術語的含義，並對照例題三給出對應示例，如下表所示。

<p align="center"> 表 <id> &nbsp; 常見的回溯演算法術語 </p>

| 名詞                   | 定義                                                                       | 例題三                                                               |
| ---------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| 解（solution）         | 解是滿足問題特定條件的答案，可能有一個或多個                               | 根節點到節點 $7$ 的滿足約束條件的所有路徑                            |
| 約束條件（constraint） | 約束條件是問題中限制解的可行性的條件，通常用於剪枝                         | 路徑中不包含節點 $3$                                                 |
| 狀態（state）          | 狀態表示問題在某一時刻的情況，包括已經做出的選擇                           | 當前已訪問的節點路徑，即 `path` 節點串列                             |
| 嘗試（attempt）        | 嘗試是根據可用選擇來探索解空間的過程，包括做出選擇，更新狀態，檢查是否為解 | 遞迴訪問左（右）子節點，將節點新增進 `path` ，判斷節點的值是否為 $7$ |
| 回退（backtracking）   | 回退指遇到不滿足約束條件的狀態時，撤銷前面做出的選擇，回到上一個狀態       | 當越過葉節點、結束節點訪問、遇到值為 $3$ 的節點時終止搜尋，函式返回  |
| 剪枝（pruning）        | 剪枝是根據問題特性和約束條件避免無意義的搜尋路徑的方法，可提高搜尋效率     | 當遇到值為 $3$ 的節點時，則不再繼續搜尋                              |

!!! tip

    問題、解、狀態等概念是通用的，在分治、回溯、動態規劃、貪婪等演算法中都有涉及。

## 優點與侷限性

回溯演算法本質上是一種深度優先搜尋演算法，它嘗試所有可能的解決方案直到找到滿足條件的解。這種方法的優點在於能夠找到所有可能的解決方案，而且在合理的剪枝操作下，具有很高的效率。

然而，在處理大規模或者複雜問題時，**回溯演算法的執行效率可能難以接受**。

- **時間**：回溯演算法通常需要走訪狀態空間的所有可能，時間複雜度可以達到指數階或階乘階。
- **空間**：在遞迴呼叫中需要儲存當前的狀態（例如路徑、用於剪枝的輔助變數等），當深度很大時，空間需求可能會變得很大。

即便如此，**回溯演算法仍然是某些搜尋問題和約束滿足問題的最佳解決方案**。對於這些問題，由於無法預測哪些選擇可生成有效的解，因此我們必須對所有可能的選擇進行走訪。在這種情況下，**關鍵是如何最佳化效率**，常見的效率最佳化方法有兩種。

- **剪枝**：避免搜尋那些肯定不會產生解的路徑，從而節省時間和空間。
- **啟發式搜尋**：在搜尋過程中引入一些策略或者估計值，從而優先搜尋最有可能產生有效解的路徑。

## 回溯典型例題

回溯演算法可用於解決許多搜尋問題、約束滿足問題和組合最佳化問題。

**搜尋問題**：這類問題的目標是找到滿足特定條件的解決方案。

- 全排列問題：給定一個集合，求出其所有可能的排列組合。
- 子集和問題：給定一個集合和一個目標和，找到集合中所有和為目標和的子集。
- 河內塔問題：給定三根柱子和一系列大小不同的圓盤，要求將所有圓盤從一根柱子移動到另一根柱子，每次只能移動一個圓盤，且不能將大圓盤放在小圓盤上。

**約束滿足問題**：這類問題的目標是找到滿足所有約束條件的解。

- $n$ 皇后：在 $n \times n$ 的棋盤上放置 $n$ 個皇后，使得它們互不攻擊。
- 數獨：在 $9 \times 9$ 的網格中填入數字 $1$ ~ $9$ ，使得每行、每列和每個 $3 \times 3$ 子網格中的數字不重複。
- 圖著色問題：給定一個無向圖，用最少的顏色給圖的每個頂點著色，使得相鄰頂點顏色不同。

**組合最佳化問題**：這類問題的目標是在一個組合空間中找到滿足某些條件的最優解。

- 0-1 背包問題：給定一組物品和一個背包，每個物品有一定的價值和重量，要求在背包容量限制內，選擇物品使得總價值最大。
- 旅行商問題：在一個圖中，從一個點出發，訪問所有其他點恰好一次後返回起點，求最短路徑。
- 最大團問題：給定一個無向圖，找到最大的完全子圖，即子圖中的任意兩個頂點之間都有邊相連。

請注意，對於許多組合最佳化問題，回溯不是最優解決方案。

- 0-1 背包問題通常使用動態規劃解決，以達到更高的時間效率。
- 旅行商是一個著名的 NP-Hard 問題，常用解法有遺傳演算法和蟻群演算法等。
- 最大團問題是圖論中的一個經典問題，可用貪婪演算法等啟發式演算法來解決。
