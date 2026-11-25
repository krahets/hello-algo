<!-- [snippet]{backtrack_framework} -->
```python title=""
def backtrack(state: State, choices: list[Choice], res: list[State]):
    """백트래킹 알고리즘의 기본 구조"""
    # 해인지 확인한다
    if is_solution(state):
        # 해를 기록한다
        record_solution(state, res)
        # 탐색을 끝낸다
        return
    # 모든 선택지를 순회한다
    for choice in choices:
        # 가지치기: 선택이 유효한지 확인한다
        if is_valid(state, choice):
            # 시도: 하나를 선택하고 상태를 갱신한다
            make_choice(state, choice)
            backtrack(state, choices, res)
            # 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undo_choice(state, choice)
```

```cpp title=""
/* 백트래킹 알고리즘의 기본 구조 */
void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
    // 해인지 확인한다
    if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res);
        // 탐색을 끝낸다
        return;
    }
    // 모든 선택지를 순회한다
    for (Choice *choice : choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state, choice);
        }
    }
}
```

```java title=""
/* 백트래킹 알고리즘의 기본 구조 */
void backtrack(State state, List<Choice> choices, List<State> res) {
    // 해인지 확인한다
    if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res);
        // 탐색을 끝낸다
        return;
    }
    // 모든 선택지를 순회한다
    for (Choice choice : choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state, choice);
        }
    }
}
```

```csharp title=""
/* 백트래킹 알고리즘의 기본 구조 */
void Backtrack(State state, List<Choice> choices, List<State> res) {
    // 해인지 확인한다
    if (IsSolution(state)) {
        // 해를 기록한다
        RecordSolution(state, res);
        // 탐색을 끝낸다
        return;
    }
    // 모든 선택지를 순회한다
    foreach (Choice choice in choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (IsValid(state, choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            MakeChoice(state, choice);
            Backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            UndoChoice(state, choice);
        }
    }
}
```

```go title=""
/* 백트래킹 알고리즘의 기본 구조 */
func backtrack(state *State, choices []Choice, res *[]State) {
    // 해인지 확인한다
    if isSolution(state) {
        // 해를 기록한다
        recordSolution(state, res)
        // 탐색을 끝낸다
        return
    }
    // 모든 선택지를 순회한다
    for _, choice := range choices {
        // 가지치기: 선택이 유효한지 확인한다
        if isValid(state, choice) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state, choice)
        }
    }
}
```

```swift title=""
/* 백트래킹 알고리즘의 기본 구조 */
func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
    // 해인지 확인한다
    if isSolution(state: state) {
        // 해를 기록한다
        recordSolution(state: state, res: &res)
        // 탐색을 끝낸다
        return
    }
    // 모든 선택지를 순회한다
    for choice in choices {
        // 가지치기: 선택이 유효한지 확인한다
        if isValid(state: state, choice: choice) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state: &state, choice: choice)
            backtrack(state: &state, choices: choices, res: &res)
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state: &state, choice: choice)
        }
    }
}
```

```javascript title=""
/* 백트래킹 알고리즘의 기본 구조 */
function backtrack(state, choices, res) {
    // 해인지 확인한다
    if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res);
        // 탐색을 끝낸다
        return;
    }
    // 모든 선택지를 순회한다
    for (let choice of choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state, choice);
        }
    }
}
```

```typescript title=""
/* 백트래킹 알고리즘의 기본 구조 */
function backtrack(state: State, choices: Choice[], res: State[]): void {
    // 해인지 확인한다
    if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res);
        // 탐색을 끝낸다
        return;
    }
    // 모든 선택지를 순회한다
    for (let choice of choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state, choice);
        }
    }
}
```

```dart title=""
/* 백트래킹 알고리즘의 기본 구조 */
void backtrack(State state, List<Choice> choices, List<State> res) {
  // 해인지 확인한다
  if (isSolution(state)) {
    // 해를 기록한다
    recordSolution(state, res);
    // 탐색을 끝낸다
    return;
  }
  // 모든 선택지를 순회한다
  for (Choice choice in choices) {
    // 가지치기: 선택이 유효한지 확인한다
    if (isValid(state, choice)) {
      // 시도: 하나를 선택하고 상태를 갱신한다
      makeChoice(state, choice);
      backtrack(state, choices, res);
      // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
      undoChoice(state, choice);
    }
  }
}
```

```rust title=""
/* 백트래킹 알고리즘의 기본 구조 */
fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
    // 해인지 확인한다
    if is_solution(state) {
        // 해를 기록한다
        record_solution(state, res);
        // 탐색을 끝낸다
        return;
    }
    // 모든 선택지를 순회한다
    for choice in choices {
        // 가지치기: 선택이 유효한지 확인한다
        if is_valid(state, choice) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            make_choice(state, choice);
            backtrack(state, choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undo_choice(state, choice);
        }
    }
}
```

```c title=""
/* 백트래킹 알고리즘의 기본 구조 */
void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
    // 해인지 확인한다
    if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res, numRes);
        // 탐색을 끝낸다
        return;
    }
    // 모든 선택지를 순회한다
    for (int i = 0; i < numChoices; i++) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, &choices[i])) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state, &choices[i]);
            backtrack(state, choices, numChoices, res, numRes);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state, &choices[i]);
        }
    }
}
```

```kotlin title=""
/* 백트래킹 알고리즘의 기본 구조 */
fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
    // 해인지 확인한다
    if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res)
        // 탐색을 끝낸다
        return
    }
    // 모든 선택지를 순회한다
    for (choice in choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state, choice)
        }
    }
}
```

```ruby title=""
### 백트래킹 알고리즘의 기본 구조 ###
def backtrack(state, choices, res)
    # 해인지 확인한다
    if is_solution?(state)
        # 해를 기록한다
        record_solution(state, res)
        return
    end

    # 모든 선택지를 순회한다
    for choice in choices
        # 가지치기: 선택이 유효한지 확인한다
        if is_valid?(state, choice)
            # 시도: 하나를 선택하고 상태를 갱신한다
            make_choice(state, choice)
            backtrack(state, choices, res)
            # 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undo_choice(state, choice)
        end
    end
end
```
