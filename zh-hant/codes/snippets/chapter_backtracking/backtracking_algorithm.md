<!-- [snippet]{backtrack_framework} -->
```python title=""
def backtrack(state: State, choices: list[Choice], res: list[State]):
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
    for (Choice *choice : choices) {
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

```dart title=""
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

```ruby title=""
### 回溯演算法框架 ###
def backtrack(state, choices, res)
    # 判斷是否為解
    if is_solution?(state)
        # 記錄解
        record_solution(state, res)
        return
    end

    # 走訪所有選擇
    for choice in choices
        # 剪枝：判斷選擇是否合法
        if is_valid?(state, choice)
            # 嘗試：做出選擇，更新狀態
            make_choice(state, choice)
            backtrack(state, choices, res)
            # 回退：撤銷選擇，恢復到之前的狀態
            undo_choice(state, choice)
        end
    end
end
```
