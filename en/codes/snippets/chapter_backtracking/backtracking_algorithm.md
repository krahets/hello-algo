<!-- [snippet]{backtrack_framework} -->
```python title=""
def backtrack(state: State, choices: list[Choice], res: list[State]):
    """Backtracking framework"""
    # Check for a solution
    if is_solution(state):
        # Record the solution
        record_solution(state, res)
        # Stop searching
        return
    # Try each choice
    for choice in choices:
        # Prune: check whether the choice is valid
        if is_valid(state, choice):
            # Make a choice and update the state
            make_choice(state, choice)
            backtrack(state, choices, res)
            # Backtrack: undo the choice to restore the previous state
            undo_choice(state, choice)
```

```cpp title=""
/* Backtracking framework */
void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
    // Check for a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
        // Stop searching
        return;
    }
    // Try each choice
    for (Choice *choice : choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Make a choice and update the state
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Backtrack: undo the choice to restore the previous state
            undoChoice(state, choice);
        }
    }
}
```

```java title=""
/* Backtracking framework */
void backtrack(State state, List<Choice> choices, List<State> res) {
    // Check for a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
        // Stop searching
        return;
    }
    // Try each choice
    for (Choice choice : choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Make a choice and update the state
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Backtrack: undo the choice to restore the previous state
            undoChoice(state, choice);
        }
    }
}
```

```csharp title=""
/* Backtracking framework */
void Backtrack(State state, List<Choice> choices, List<State> res) {
    // Check for a solution
    if (IsSolution(state)) {
        // Record the solution
        RecordSolution(state, res);
        // Stop searching
        return;
    }
    // Try each choice
    foreach (Choice choice in choices) {
        // Prune: check whether the choice is valid
        if (IsValid(state, choice)) {
            // Make a choice and update the state
            MakeChoice(state, choice);
            Backtrack(state, choices, res);
            // Backtrack: undo the choice to restore the previous state
            UndoChoice(state, choice);
        }
    }
}
```

```go title=""
/* Backtracking framework */
func backtrack(state *State, choices []Choice, res *[]State) {
    // Check for a solution
    if isSolution(state) {
        // Record the solution
        recordSolution(state, res)
        // Stop searching
        return
    }
    // Try each choice
    for _, choice := range choices {
        // Prune: check whether the choice is valid
        if isValid(state, choice) {
            // Make a choice and update the state
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // Backtrack: undo the choice to restore the previous state
            undoChoice(state, choice)
        }
    }
}
```

```swift title=""
/* Backtracking framework */
func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
    // Check for a solution
    if isSolution(state: state) {
        // Record the solution
        recordSolution(state: state, res: &res)
        // Stop searching
        return
    }
    // Try each choice
    for choice in choices {
        // Prune: check whether the choice is valid
        if isValid(state: state, choice: choice) {
            // Make a choice and update the state
            makeChoice(state: &state, choice: choice)
            backtrack(state: &state, choices: choices, res: &res)
            // Backtrack: undo the choice to restore the previous state
            undoChoice(state: &state, choice: choice)
        }
    }
}
```

```javascript title=""
/* Backtracking framework */
function backtrack(state, choices, res) {
    // Check for a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
        // Stop searching
        return;
    }
    // Try each choice
    for (let choice of choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Make a choice and update the state
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Backtrack: undo the choice to restore the previous state
            undoChoice(state, choice);
        }
    }
}
```

```typescript title=""
/* Backtracking framework */
function backtrack(state: State, choices: Choice[], res: State[]): void {
    // Check for a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
        // Stop searching
        return;
    }
    // Try each choice
    for (let choice of choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Make a choice and update the state
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Backtrack: undo the choice to restore the previous state
            undoChoice(state, choice);
        }
    }
}
```

```dart title=""
/* Backtracking framework */
void backtrack(State state, List<Choice> choices, List<State> res) {
  // Check for a solution
  if (isSolution(state)) {
    // Record the solution
    recordSolution(state, res);
    // Stop searching
    return;
  }
  // Try each choice
  for (Choice choice in choices) {
    // Prune: check whether the choice is valid
    if (isValid(state, choice)) {
      // Make a choice and update the state
      makeChoice(state, choice);
      backtrack(state, choices, res);
      // Backtrack: undo the choice to restore the previous state
      undoChoice(state, choice);
    }
  }
}
```

```rust title=""
/* Backtracking framework */
fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
    // Check for a solution
    if is_solution(state) {
        // Record the solution
        record_solution(state, res);
        // Stop searching
        return;
    }
    // Try each choice
    for choice in choices {
        // Prune: check whether the choice is valid
        if is_valid(state, choice) {
            // Make a choice and update the state
            make_choice(state, choice);
            backtrack(state, choices, res);
            // Backtrack: undo the choice to restore the previous state
            undo_choice(state, choice);
        }
    }
}
```

```c title=""
/* Backtracking framework */
void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
    // Check for a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res, numRes);
        // Stop searching
        return;
    }
    // Try each choice
    for (int i = 0; i < numChoices; i++) {
        // Prune: check whether the choice is valid
        if (isValid(state, &choices[i])) {
            // Make a choice and update the state
            makeChoice(state, &choices[i]);
            backtrack(state, choices, numChoices, res, numRes);
            // Backtrack: undo the choice to restore the previous state
            undoChoice(state, &choices[i]);
        }
    }
}
```

```kotlin title=""
/* Backtracking framework */
fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
    // Check for a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res)
        // Stop searching
        return
    }
    // Try each choice
    for (choice in choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Make a choice and update the state
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // Backtrack: undo the choice to restore the previous state
            undoChoice(state, choice)
        }
    }
}
```

```ruby title=""
### Backtracking framework ###
def backtrack(state, choices, res)
    # Check for a solution
    if is_solution?(state)
        # Record the solution
        record_solution(state, res)
        return
    end

    # Try each choice
    for choice in choices
        # Prune: check whether the choice is valid
        if is_valid?(state, choice)
            # Make a choice and update the state
            make_choice(state, choice)
            backtrack(state, choices, res)
            # Backtrack: undo the choice to restore the previous state
            undo_choice(state, choice)
        end
    end
end
```
