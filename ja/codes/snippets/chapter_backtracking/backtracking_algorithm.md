<!-- [snippet]{backtrack_framework} -->
```python title=""
def backtrack(state: State, choices: list[Choice], res: list[State]):
    """バックトラッキングの基本形"""
    # 解かどうか判定する
    if is_solution(state):
        # 解を記録する
        record_solution(state, res)
        # 探索を打ち切る
        return
    # すべての選択肢を調べる
    for choice in choices:
        # 枝刈り：その選択が可能か判定する
        if is_valid(state, choice):
            # 試行：選択して状態を更新する
            make_choice(state, choice)
            backtrack(state, choices, res)
            # 後戻り：選択を取り消し、元の状態に戻す
            undo_choice(state, choice)
```

```cpp title=""
/* バックトラッキングの基本形 */
void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
    // 解かどうか判定する
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res);
        // 探索を打ち切る
        return;
    }
    // すべての選択肢を調べる
    for (Choice *choice : choices) {
        // 枝刈り：その選択が可能か判定する
        if (isValid(state, choice)) {
            // 試行：選択して状態を更新する
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state, choice);
        }
    }
}
```

```java title=""
/* バックトラッキングの基本形 */
void backtrack(State state, List<Choice> choices, List<State> res) {
    // 解かどうか判定する
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res);
        // 探索を打ち切る
        return;
    }
    // すべての選択肢を調べる
    for (Choice choice : choices) {
        // 枝刈り：その選択が可能か判定する
        if (isValid(state, choice)) {
            // 試行：選択して状態を更新する
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state, choice);
        }
    }
}
```

```csharp title=""
/* バックトラッキングの基本形 */
void Backtrack(State state, List<Choice> choices, List<State> res) {
    // 解かどうか判定する
    if (IsSolution(state)) {
        // 解を記録する
        RecordSolution(state, res);
        // 探索を打ち切る
        return;
    }
    // すべての選択肢を調べる
    foreach (Choice choice in choices) {
        // 枝刈り：その選択が可能か判定する
        if (IsValid(state, choice)) {
            // 試行：選択して状態を更新する
            MakeChoice(state, choice);
            Backtrack(state, choices, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            UndoChoice(state, choice);
        }
    }
}
```

```go title=""
/* バックトラッキングの基本形 */
func backtrack(state *State, choices []Choice, res *[]State) {
    // 解かどうか判定する
    if isSolution(state) {
        // 解を記録する
        recordSolution(state, res)
        // 探索を打ち切る
        return
    }
    // すべての選択肢を調べる
    for _, choice := range choices {
        // 枝刈り：その選択が可能か判定する
        if isValid(state, choice) {
            // 試行：選択して状態を更新する
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state, choice)
        }
    }
}
```

```swift title=""
/* バックトラッキングの基本形 */
func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
    // 解かどうか判定する
    if isSolution(state: state) {
        // 解を記録する
        recordSolution(state: state, res: &res)
        // 探索を打ち切る
        return
    }
    // すべての選択肢を調べる
    for choice in choices {
        // 枝刈り：その選択が可能か判定する
        if isValid(state: state, choice: choice) {
            // 試行：選択して状態を更新する
            makeChoice(state: &state, choice: choice)
            backtrack(state: &state, choices: choices, res: &res)
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state: &state, choice: choice)
        }
    }
}
```

```javascript title=""
/* バックトラッキングの基本形 */
function backtrack(state, choices, res) {
    // 解かどうか判定する
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res);
        // 探索を打ち切る
        return;
    }
    // すべての選択肢を調べる
    for (let choice of choices) {
        // 枝刈り：その選択が可能か判定する
        if (isValid(state, choice)) {
            // 試行：選択して状態を更新する
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state, choice);
        }
    }
}
```

```typescript title=""
/* バックトラッキングの基本形 */
function backtrack(state: State, choices: Choice[], res: State[]): void {
    // 解かどうか判定する
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res);
        // 探索を打ち切る
        return;
    }
    // すべての選択肢を調べる
    for (let choice of choices) {
        // 枝刈り：その選択が可能か判定する
        if (isValid(state, choice)) {
            // 試行：選択して状態を更新する
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state, choice);
        }
    }
}
```

```dart title=""
/* バックトラッキングの基本形 */
void backtrack(State state, List<Choice> choices, List<State> res) {
  // 解かどうか判定する
  if (isSolution(state)) {
    // 解を記録する
    recordSolution(state, res);
    // 探索を打ち切る
    return;
  }
  // すべての選択肢を調べる
  for (Choice choice in choices) {
    // 枝刈り：その選択が可能か判定する
    if (isValid(state, choice)) {
      // 試行：選択して状態を更新する
      makeChoice(state, choice);
      backtrack(state, choices, res);
      // 後戻り：選択を取り消し、元の状態に戻す
      undoChoice(state, choice);
    }
  }
}
```

```rust title=""
/* バックトラッキングの基本形 */
fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
    // 解かどうか判定する
    if is_solution(state) {
        // 解を記録する
        record_solution(state, res);
        // 探索を打ち切る
        return;
    }
    // すべての選択肢を調べる
    for choice in choices {
        // 枝刈り：その選択が可能か判定する
        if is_valid(state, choice) {
            // 試行：選択して状態を更新する
            make_choice(state, choice);
            backtrack(state, choices, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            undo_choice(state, choice);
        }
    }
}
```

```c title=""
/* バックトラッキングの基本形 */
void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
    // 解かどうか判定する
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res, numRes);
        // 探索を打ち切る
        return;
    }
    // すべての選択肢を調べる
    for (int i = 0; i < numChoices; i++) {
        // 枝刈り：その選択が可能か判定する
        if (isValid(state, &choices[i])) {
            // 試行：選択して状態を更新する
            makeChoice(state, &choices[i]);
            backtrack(state, choices, numChoices, res, numRes);
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state, &choices[i]);
        }
    }
}
```

```kotlin title=""
/* バックトラッキングの基本形 */
fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
    // 解かどうか判定する
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res)
        // 探索を打ち切る
        return
    }
    // すべての選択肢を調べる
    for (choice in choices) {
        // 枝刈り：その選択が可能か判定する
        if (isValid(state, choice)) {
            // 試行：選択して状態を更新する
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state, choice)
        }
    }
}
```

```ruby title=""
### バックトラッキングの基本形 ###
def backtrack(state, choices, res)
    # 解かどうか判定する
    if is_solution?(state)
        # 解を記録する
        record_solution(state, res)
        return
    end

    # すべての選択肢を調べる
    for choice in choices
        # 枝刈り：その選択が可能か判定する
        if is_valid?(state, choice)
            # 試行：選択して状態を更新する
            make_choice(state, choice)
            backtrack(state, choices, res)
            # 後戻り：選択を取り消し、元の状態に戻す
            undo_choice(state, choice)
        end
    end
end
```
