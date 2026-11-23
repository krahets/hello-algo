<!-- [snippet]{backtrack_framework} -->
```python title=""
def backtrack(state: State, choices: list[Choice], res: list[State]):
    """Backtracking template"""
    # Check whether the state is a solution
    if is_solution(state):
        # Record the solution
        record_solution(state, res)
        # Stop searching this branch
        return
    # Try every choice
    for choice in choices:
        # Prune: check whether the choice is valid
        if is_valid(state, choice):
            # Try: make the choice and update the state
            make_choice(state, choice)
            backtrack(state, choices, res)
            # Backtrack: undo the choice and restore the previous state
            undo_choice(state, choice)
```

```cpp title=""
/* Backtracking template */
void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
    // Check whether the state is a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
        // Stop searching this branch
        return;
    }
    // Try every choice
    for (Choice *choice : choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Try: make the choice and update the state
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Backtrack: undo the choice and restore the previous state
            undoChoice(state, choice);
        }
    }
}
```

```java title=""
/* Backtracking template */
void backtrack(State state, List<Choice> choices, List<State> res) {
    // Check whether the state is a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
        // Stop searching this branch
        return;
    }
    // Try every choice
    for (Choice choice : choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Try: make the choice and update the state
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Backtrack: undo the choice and restore the previous state
            undoChoice(state, choice);
        }
    }
}
```

```csharp title=""
/* Backtracking template */
void Backtrack(State state, List<Choice> choices, List<State> res) {
    // Check whether the state is a solution
    if (IsSolution(state)) {
        // Record the solution
        RecordSolution(state, res);
        // Stop searching this branch
        return;
    }
    // Try every choice
    foreach (Choice choice in choices) {
        // Prune: check whether the choice is valid
        if (IsValid(state, choice)) {
            // Try: make the choice and update the state
            MakeChoice(state, choice);
            Backtrack(state, choices, res);
            // Backtrack: undo the choice and restore the previous state
            UndoChoice(state, choice);
        }
    }
}
```

```go title=""
/* Backtracking template */
func backtrack(state *State, choices []Choice, res *[]State) {
    // Check whether the state is a solution
    if isSolution(state) {
        // Record the solution
        recordSolution(state, res)
        // Stop searching this branch
        return
    }
    // Try every choice
    for _, choice := range choices {
        // Prune: check whether the choice is valid
        if isValid(state, choice) {
            // Try: make the choice and update the state
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // Backtrack: undo the choice and restore the previous state
            undoChoice(state, choice)
        }
    }
}
```

```swift title=""
/* Backtracking template */
func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
    // Check whether the state is a solution
    if isSolution(state: state) {
        // Record the solution
        recordSolution(state: state, res: &res)
        // Stop searching this branch
        return
    }
    // Try every choice
    for choice in choices {
        // Prune: check whether the choice is valid
        if isValid(state: state, choice: choice) {
            // Try: make the choice and update the state
            makeChoice(state: &state, choice: choice)
            backtrack(state: &state, choices: choices, res: &res)
            // Backtrack: undo the choice and restore the previous state
            undoChoice(state: &state, choice: choice)
        }
    }
}
```

```javascript title=""
/* Backtracking template */
function backtrack(state, choices, res) {
    // Check whether the state is a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
        // Stop searching this branch
        return;
    }
    // Try every choice
    for (let choice of choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Try: make the choice and update the state
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Backtrack: undo the choice and restore the previous state
            undoChoice(state, choice);
        }
    }
}
```

```typescript title=""
/* Backtracking template */
function backtrack(state: State, choices: Choice[], res: State[]): void {
    // Check whether the state is a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
        // Stop searching this branch
        return;
    }
    // Try every choice
    for (let choice of choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Try: make the choice and update the state
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Backtrack: undo the choice and restore the previous state
            undoChoice(state, choice);
        }
    }
}
```

```dart title=""
/* Backtracking template */
void backtrack(State state, List<Choice> choices, List<State> res) {
  // Check whether the state is a solution
  if (isSolution(state)) {
    // Record the solution
    recordSolution(state, res);
    // Stop searching this branch
    return;
  }
  // Try every choice
  for (Choice choice in choices) {
    // Prune: check whether the choice is valid
    if (isValid(state, choice)) {
      // Try: make the choice and update the state
      makeChoice(state, choice);
      backtrack(state, choices, res);
      // Backtrack: undo the choice and restore the previous state
      undoChoice(state, choice);
    }
  }
}
```

```rust title=""
/* Backtracking template */
fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
    // Check whether the state is a solution
    if is_solution(state) {
        // Record the solution
        record_solution(state, res);
        // Stop searching this branch
        return;
    }
    // Try every choice
    for choice in choices {
        // Prune: check whether the choice is valid
        if is_valid(state, choice) {
            // Try: make the choice and update the state
            make_choice(state, choice);
            backtrack(state, choices, res);
            // Backtrack: undo the choice and restore the previous state
            undo_choice(state, choice);
        }
    }
}
```

```c title=""
/* Backtracking template */
void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
    // Check whether the state is a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res, numRes);
        // Stop searching this branch
        return;
    }
    // Try every choice
    for (int i = 0; i < numChoices; i++) {
        // Prune: check whether the choice is valid
        if (isValid(state, &choices[i])) {
            // Try: make the choice and update the state
            makeChoice(state, &choices[i]);
            backtrack(state, choices, numChoices, res, numRes);
            // Backtrack: undo the choice and restore the previous state
            undoChoice(state, &choices[i]);
        }
    }
}
```

```kotlin title=""
/* Backtracking template */
fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
    // Check whether the state is a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res)
        // Stop searching this branch
        return
    }
    // Try every choice
    for (choice in choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Try: make the choice and update the state
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // Backtrack: undo the choice and restore the previous state
            undoChoice(state, choice)
        }
    }
}
```

```ruby title=""
### Backtracking template ###
def backtrack(state, choices, res)
    # Check whether the state is a solution
    if is_solution?(state)
        # Record the solution
        record_solution(state, res)
        return
    end

    # Try every choice
    for choice in choices
        # Prune: check whether the choice is valid
        if is_valid?(state, choice)
            # Try: make the choice and update the state
            make_choice(state, choice)
            backtrack(state, choices, res)
            # Backtrack: undo the choice and restore the previous state
            undo_choice(state, choice)
        end
    end
end
```
