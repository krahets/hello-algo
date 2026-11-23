<!-- [snippet]{backtrack_framework} -->
```python title=""
def backtrack(state: State, choices: list[Choice], res: list[State]):
    """백트래킹 알고리즘의 기본 틀"""
    # 해인지 확인
    if is_solution(state):
        # 해 기록
        record_solution(state, res)
        # 더 이상 탐색하지 않는다
        return
    # 모든 선택지 순회
    for choice in choices:
        # 가지치기: 선택이 유효한지 확인
        if is_valid(state, choice):
            # 시도: 선택하고 상태 갱신
            make_choice(state, choice)
            backtrack(state, choices, res)
            # 되돌리기: 선택을 취소하고 이전 상태 복원
            undo_choice(state, choice)
```

```cpp title=""
/* 백트래킹 알고리즘의 기본 틀 */
void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
    // 해인지 확인
    if (isSolution(state)) {
        // 해 기록
        recordSolution(state, res);
        // 더 이상 탐색하지 않는다
        return;
    }
    // 모든 선택지 순회
    for (Choice *choice : choices) {
        // 가지치기: 선택이 유효한지 확인
        if (isValid(state, choice)) {
            // 시도: 선택하고 상태 갱신
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태 복원
            undoChoice(state, choice);
        }
    }
}
```

```java title=""
/* 백트래킹 알고리즘의 기본 틀 */
void backtrack(State state, List<Choice> choices, List<State> res) {
    // 해인지 확인
    if (isSolution(state)) {
        // 해 기록
        recordSolution(state, res);
        // 더 이상 탐색하지 않는다
        return;
    }
    // 모든 선택지 순회
    for (Choice choice : choices) {
        // 가지치기: 선택이 유효한지 확인
        if (isValid(state, choice)) {
            // 시도: 선택하고 상태 갱신
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태 복원
            undoChoice(state, choice);
        }
    }
}
```

```csharp title=""
/* 백트래킹 알고리즘의 기본 틀 */
void Backtrack(State state, List<Choice> choices, List<State> res) {
    // 해인지 확인
    if (IsSolution(state)) {
        // 해 기록
        RecordSolution(state, res);
        // 더 이상 탐색하지 않는다
        return;
    }
    // 모든 선택지 순회
    foreach (Choice choice in choices) {
        // 가지치기: 선택이 유효한지 확인
        if (IsValid(state, choice)) {
            // 시도: 선택하고 상태 갱신
            MakeChoice(state, choice);
            Backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태 복원
            UndoChoice(state, choice);
        }
    }
}
```

```go title=""
/* 백트래킹 알고리즘의 기본 틀 */
func backtrack(state *State, choices []Choice, res *[]State) {
    // 해인지 확인
    if isSolution(state) {
        // 해 기록
        recordSolution(state, res)
        // 더 이상 탐색하지 않는다
        return
    }
    // 모든 선택지 순회
    for _, choice := range choices {
        // 가지치기: 선택이 유효한지 확인
        if isValid(state, choice) {
            // 시도: 선택하고 상태 갱신
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // 되돌리기: 선택을 취소하고 이전 상태 복원
            undoChoice(state, choice)
        }
    }
}
```

```swift title=""
/* 백트래킹 알고리즘의 기본 틀 */
func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
    // 해인지 확인
    if isSolution(state: state) {
        // 해 기록
        recordSolution(state: state, res: &res)
        // 더 이상 탐색하지 않는다
        return
    }
    // 모든 선택지 순회
    for choice in choices {
        // 가지치기: 선택이 유효한지 확인
        if isValid(state: state, choice: choice) {
            // 시도: 선택하고 상태 갱신
            makeChoice(state: &state, choice: choice)
            backtrack(state: &state, choices: choices, res: &res)
            // 되돌리기: 선택을 취소하고 이전 상태 복원
            undoChoice(state: &state, choice: choice)
        }
    }
}
```

```javascript title=""
/* 백트래킹 알고리즘의 기본 틀 */
function backtrack(state, choices, res) {
    // 해인지 확인
    if (isSolution(state)) {
        // 해 기록
        recordSolution(state, res);
        // 더 이상 탐색하지 않는다
        return;
    }
    // 모든 선택지 순회
    for (let choice of choices) {
        // 가지치기: 선택이 유효한지 확인
        if (isValid(state, choice)) {
            // 시도: 선택하고 상태 갱신
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태 복원
            undoChoice(state, choice);
        }
    }
}
```

```typescript title=""
/* 백트래킹 알고리즘의 기본 틀 */
function backtrack(state: State, choices: Choice[], res: State[]): void {
    // 해인지 확인
    if (isSolution(state)) {
        // 해 기록
        recordSolution(state, res);
        // 더 이상 탐색하지 않는다
        return;
    }
    // 모든 선택지 순회
    for (let choice of choices) {
        // 가지치기: 선택이 유효한지 확인
        if (isValid(state, choice)) {
            // 시도: 선택하고 상태 갱신
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태 복원
            undoChoice(state, choice);
        }
    }
}
```

```dart title=""
/* 백트래킹 알고리즘의 기본 틀 */
void backtrack(State state, List<Choice> choices, List<State> res) {
  // 해인지 확인
  if (isSolution(state)) {
    // 해 기록
    recordSolution(state, res);
    // 더 이상 탐색하지 않는다
    return;
  }
  // 모든 선택지 순회
  for (Choice choice in choices) {
    // 가지치기: 선택이 유효한지 확인
    if (isValid(state, choice)) {
      // 시도: 선택하고 상태 갱신
      makeChoice(state, choice);
      backtrack(state, choices, res);
      // 되돌리기: 선택을 취소하고 이전 상태 복원
      undoChoice(state, choice);
    }
  }
}
```

```rust title=""
/* 백트래킹 알고리즘의 기본 틀 */
fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
    // 해인지 확인
    if is_solution(state) {
        // 해 기록
        record_solution(state, res);
        // 더 이상 탐색하지 않는다
        return;
    }
    // 모든 선택지 순회
    for choice in choices {
        // 가지치기: 선택이 유효한지 확인
        if is_valid(state, choice) {
            // 시도: 선택하고 상태 갱신
            make_choice(state, choice);
            backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태 복원
            undo_choice(state, choice);
        }
    }
}
```

```c title=""
/* 백트래킹 알고리즘의 기본 틀 */
void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
    // 해인지 확인
    if (isSolution(state)) {
        // 해 기록
        recordSolution(state, res, numRes);
        // 더 이상 탐색하지 않는다
        return;
    }
    // 모든 선택지 순회
    for (int i = 0; i < numChoices; i++) {
        // 가지치기: 선택이 유효한지 확인
        if (isValid(state, &choices[i])) {
            // 시도: 선택하고 상태 갱신
            makeChoice(state, &choices[i]);
            backtrack(state, choices, numChoices, res, numRes);
            // 되돌리기: 선택을 취소하고 이전 상태 복원
            undoChoice(state, &choices[i]);
        }
    }
}
```

```kotlin title=""
/* 백트래킹 알고리즘의 기본 틀 */
fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
    // 해인지 확인
    if (isSolution(state)) {
        // 해 기록
        recordSolution(state, res)
        // 더 이상 탐색하지 않는다
        return
    }
    // 모든 선택지 순회
    for (choice in choices) {
        // 가지치기: 선택이 유효한지 확인
        if (isValid(state, choice)) {
            // 시도: 선택하고 상태 갱신
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // 되돌리기: 선택을 취소하고 이전 상태 복원
            undoChoice(state, choice)
        }
    }
}
```

```ruby title=""
### 백트래킹 알고리즘의 기본 틀 ###
def backtrack(state, choices, res)
    # 해인지 확인
    if is_solution?(state)
        # 해 기록
        record_solution(state, res)
        return
    end

    # 모든 선택지 순회
    for choice in choices
        # 가지치기: 선택이 유효한지 확인
        if is_valid?(state, choice)
            # 시도: 선택하고 상태 갱신
            make_choice(state, choice)
            backtrack(state, choices, res)
            # 되돌리기: 선택을 취소하고 이전 상태 복원
            undo_choice(state, choice)
        end
    end
end
```
