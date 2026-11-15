<!-- [snippet]{backtrack_framework} -->
```python title=""
def backtrack(state: State, choices: list[Choice], res: list[State]):
    """回溯算法框架"""
    # 判断是否为解
    if is_solution(state):
        # 记录解
        record_solution(state, res)
        # 不再继续搜索
        return
    # 遍历所有选择
    for choice in choices:
        # 剪枝：判断选择是否合法
        if is_valid(state, choice):
            # 尝试：做出选择，更新状态
            make_choice(state, choice)
            backtrack(state, choices, res)
            # 回退：撤销选择，恢复到之前的状态
            undo_choice(state, choice)
```

```cpp title=""
/* 回溯算法框架 */
void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
    // 判断是否为解
    if (isSolution(state)) {
        // 记录解
        recordSolution(state, res);
        // 不再继续搜索
        return;
    }
    // 遍历所有选择
    for (Choice *choice : choices) {
        // 剪枝：判断选择是否合法
        if (isValid(state, choice)) {
            // 尝试：做出选择，更新状态
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state, choice);
        }
    }
}
```

```java title=""
/* 回溯算法框架 */
void backtrack(State state, List<Choice> choices, List<State> res) {
    // 判断是否为解
    if (isSolution(state)) {
        // 记录解
        recordSolution(state, res);
        // 不再继续搜索
        return;
    }
    // 遍历所有选择
    for (Choice choice : choices) {
        // 剪枝：判断选择是否合法
        if (isValid(state, choice)) {
            // 尝试：做出选择，更新状态
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state, choice);
        }
    }
}
```

```csharp title=""
/* 回溯算法框架 */
void Backtrack(State state, List<Choice> choices, List<State> res) {
    // 判断是否为解
    if (IsSolution(state)) {
        // 记录解
        RecordSolution(state, res);
        // 不再继续搜索
        return;
    }
    // 遍历所有选择
    foreach (Choice choice in choices) {
        // 剪枝：判断选择是否合法
        if (IsValid(state, choice)) {
            // 尝试：做出选择，更新状态
            MakeChoice(state, choice);
            Backtrack(state, choices, res);
            // 回退：撤销选择，恢复到之前的状态
            UndoChoice(state, choice);
        }
    }
}
```

```go title=""
/* 回溯算法框架 */
func backtrack(state *State, choices []Choice, res *[]State) {
    // 判断是否为解
    if isSolution(state) {
        // 记录解
        recordSolution(state, res)
        // 不再继续搜索
        return
    }
    // 遍历所有选择
    for _, choice := range choices {
        // 剪枝：判断选择是否合法
        if isValid(state, choice) {
            // 尝试：做出选择，更新状态
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state, choice)
        }
    }
}
```

```swift title=""
/* 回溯算法框架 */
func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
    // 判断是否为解
    if isSolution(state: state) {
        // 记录解
        recordSolution(state: state, res: &res)
        // 不再继续搜索
        return
    }
    // 遍历所有选择
    for choice in choices {
        // 剪枝：判断选择是否合法
        if isValid(state: state, choice: choice) {
            // 尝试：做出选择，更新状态
            makeChoice(state: &state, choice: choice)
            backtrack(state: &state, choices: choices, res: &res)
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state: &state, choice: choice)
        }
    }
}
```

```javascript title=""
/* 回溯算法框架 */
function backtrack(state, choices, res) {
    // 判断是否为解
    if (isSolution(state)) {
        // 记录解
        recordSolution(state, res);
        // 不再继续搜索
        return;
    }
    // 遍历所有选择
    for (let choice of choices) {
        // 剪枝：判断选择是否合法
        if (isValid(state, choice)) {
            // 尝试：做出选择，更新状态
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state, choice);
        }
    }
}
```

```typescript title=""
/* 回溯算法框架 */
function backtrack(state: State, choices: Choice[], res: State[]): void {
    // 判断是否为解
    if (isSolution(state)) {
        // 记录解
        recordSolution(state, res);
        // 不再继续搜索
        return;
    }
    // 遍历所有选择
    for (let choice of choices) {
        // 剪枝：判断选择是否合法
        if (isValid(state, choice)) {
            // 尝试：做出选择，更新状态
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state, choice);
        }
    }
}
```

```dart title=""
/* 回溯算法框架 */
void backtrack(State state, List<Choice> choices, List<State> res) {
  // 判断是否为解
  if (isSolution(state)) {
    // 记录解
    recordSolution(state, res);
    // 不再继续搜索
    return;
  }
  // 遍历所有选择
  for (Choice choice in choices) {
    // 剪枝：判断选择是否合法
    if (isValid(state, choice)) {
      // 尝试：做出选择，更新状态
      makeChoice(state, choice);
      backtrack(state, choices, res);
      // 回退：撤销选择，恢复到之前的状态
      undoChoice(state, choice);
    }
  }
}
```

```rust title=""
/* 回溯算法框架 */
fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
    // 判断是否为解
    if is_solution(state) {
        // 记录解
        record_solution(state, res);
        // 不再继续搜索
        return;
    }
    // 遍历所有选择
    for choice in choices {
        // 剪枝：判断选择是否合法
        if is_valid(state, choice) {
            // 尝试：做出选择，更新状态
            make_choice(state, choice);
            backtrack(state, choices, res);
            // 回退：撤销选择，恢复到之前的状态
            undo_choice(state, choice);
        }
    }
}
```

```c title=""
/* 回溯算法框架 */
void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
    // 判断是否为解
    if (isSolution(state)) {
        // 记录解
        recordSolution(state, res, numRes);
        // 不再继续搜索
        return;
    }
    // 遍历所有选择
    for (int i = 0; i < numChoices; i++) {
        // 剪枝：判断选择是否合法
        if (isValid(state, &choices[i])) {
            // 尝试：做出选择，更新状态
            makeChoice(state, &choices[i]);
            backtrack(state, choices, numChoices, res, numRes);
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state, &choices[i]);
        }
    }
}
```

```kotlin title=""
/* 回溯算法框架 */
fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
    // 判断是否为解
    if (isSolution(state)) {
        // 记录解
        recordSolution(state, res)
        // 不再继续搜索
        return
    }
    // 遍历所有选择
    for (choice in choices) {
        // 剪枝：判断选择是否合法
        if (isValid(state, choice)) {
            // 尝试：做出选择，更新状态
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state, choice)
        }
    }
}
```

```ruby title=""
### 回溯算法框架 ###
def backtrack(state, choices, res)
    # 判断是否为解
    if is_solution?(state)
        # 记录解
        record_solution(state, res)
        return
    end

    # 遍历所有选择
    for choice in choices
        # 剪枝：判断选择是否合法
        if is_valid?(state, choice)
            # 尝试：做出选择，更新状态
            make_choice(state, choice)
            backtrack(state, choices, res)
            # 回退：撤销选择，恢复到之前的状态
            undo_choice(state, choice)
        end
    end
end
```
