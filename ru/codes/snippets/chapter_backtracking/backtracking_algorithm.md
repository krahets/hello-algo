<!-- [snippet]{backtrack_framework} -->
```python title=""
def backtrack(state: State, choices: list[Choice], res: list[State]):
    """Каркас алгоритма поиска с возвратом"""
    # Проверка, является ли текущее состояние решением
    if is_solution(state):
        # Запись решения
        record_solution(state, res)
        # Дальше не продолжаем поиск
        return
    # Перебор всех возможных выборов
    for choice in choices:
        # Обрезка: проверка допустимости выбора
        if is_valid(state, choice):
            # Попытка: сделать выбор и обновить состояние
            make_choice(state, choice)
            backtrack(state, choices, res)
            # Откат: отменить выбор и восстановить предыдущее состояние
            undo_choice(state, choice)
```

```cpp title=""
/* Каркас алгоритма поиска с возвратом */
void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
    // Проверка, является ли текущее состояние решением
    if (isSolution(state)) {
        // Запись решения
        recordSolution(state, res);
        // Дальше не продолжаем поиск
        return;
    }
    // Перебор всех возможных выборов
    for (Choice *choice : choices) {
        // Обрезка: проверка допустимости выбора
        if (isValid(state, choice)) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state, choice);
        }
    }
}
```

```java title=""
/* Каркас алгоритма поиска с возвратом */
void backtrack(State state, List<Choice> choices, List<State> res) {
    // Проверка, является ли текущее состояние решением
    if (isSolution(state)) {
        // Запись решения
        recordSolution(state, res);
        // Дальше не продолжаем поиск
        return;
    }
    // Перебор всех возможных выборов
    for (Choice choice : choices) {
        // Обрезка: проверка допустимости выбора
        if (isValid(state, choice)) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state, choice);
        }
    }
}
```

```csharp title=""
/* Каркас алгоритма поиска с возвратом */
void Backtrack(State state, List<Choice> choices, List<State> res) {
    // Проверка, является ли текущее состояние решением
    if (IsSolution(state)) {
        // Запись решения
        RecordSolution(state, res);
        // Дальше не продолжаем поиск
        return;
    }
    // Перебор всех возможных выборов
    foreach (Choice choice in choices) {
        // Обрезка: проверка допустимости выбора
        if (IsValid(state, choice)) {
            // Попытка: сделать выбор и обновить состояние
            MakeChoice(state, choice);
            Backtrack(state, choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            UndoChoice(state, choice);
        }
    }
}
```

```go title=""
/* Каркас алгоритма поиска с возвратом */
func backtrack(state *State, choices []Choice, res *[]State) {
    // Проверка, является ли текущее состояние решением
    if isSolution(state) {
        // Запись решения
        recordSolution(state, res)
        // Дальше не продолжаем поиск
        return
    }
    // Перебор всех возможных выборов
    for _, choice := range choices {
        // Обрезка: проверка допустимости выбора
        if isValid(state, choice) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state, choice)
        }
    }
}
```

```swift title=""
/* Каркас алгоритма поиска с возвратом */
func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
    // Проверка, является ли текущее состояние решением
    if isSolution(state: state) {
        // Запись решения
        recordSolution(state: state, res: &res)
        // Дальше не продолжаем поиск
        return
    }
    // Перебор всех возможных выборов
    for choice in choices {
        // Обрезка: проверка допустимости выбора
        if isValid(state: state, choice: choice) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state: &state, choice: choice)
            backtrack(state: &state, choices: choices, res: &res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state: &state, choice: choice)
        }
    }
}
```

```javascript title=""
/* Каркас алгоритма поиска с возвратом */
function backtrack(state, choices, res) {
    // Проверка, является ли текущее состояние решением
    if (isSolution(state)) {
        // Запись решения
        recordSolution(state, res);
        // Дальше не продолжаем поиск
        return;
    }
    // Перебор всех возможных выборов
    for (let choice of choices) {
        // Обрезка: проверка допустимости выбора
        if (isValid(state, choice)) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state, choice);
        }
    }
}
```

```typescript title=""
/* Каркас алгоритма поиска с возвратом */
function backtrack(state: State, choices: Choice[], res: State[]): void {
    // Проверка, является ли текущее состояние решением
    if (isSolution(state)) {
        // Запись решения
        recordSolution(state, res);
        // Дальше не продолжаем поиск
        return;
    }
    // Перебор всех возможных выборов
    for (let choice of choices) {
        // Обрезка: проверка допустимости выбора
        if (isValid(state, choice)) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state, choice);
        }
    }
}
```

```dart title=""
/* Каркас алгоритма поиска с возвратом */
void backtrack(State state, List<Choice> choices, List<State> res) {
  // Проверка, является ли текущее состояние решением
  if (isSolution(state)) {
    // Запись решения
    recordSolution(state, res);
    // Дальше не продолжаем поиск
    return;
  }
  // Перебор всех возможных выборов
  for (Choice choice in choices) {
    // Обрезка: проверка допустимости выбора
    if (isValid(state, choice)) {
      // Попытка: сделать выбор и обновить состояние
      makeChoice(state, choice);
      backtrack(state, choices, res);
      // Откат: отменить выбор и восстановить предыдущее состояние
      undoChoice(state, choice);
    }
  }
}
```

```rust title=""
/* Каркас алгоритма поиска с возвратом */
fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
    // Проверка, является ли текущее состояние решением
    if is_solution(state) {
        // Запись решения
        record_solution(state, res);
        // Дальше не продолжаем поиск
        return;
    }
    // Перебор всех возможных выборов
    for choice in choices {
        // Обрезка: проверка допустимости выбора
        if is_valid(state, choice) {
            // Попытка: сделать выбор и обновить состояние
            make_choice(state, choice);
            backtrack(state, choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            undo_choice(state, choice);
        }
    }
}
```

```c title=""
/* Каркас алгоритма поиска с возвратом */
void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
    // Проверка, является ли текущее состояние решением
    if (isSolution(state)) {
        // Запись решения
        recordSolution(state, res, numRes);
        // Дальше не продолжаем поиск
        return;
    }
    // Перебор всех возможных выборов
    for (int i = 0; i < numChoices; i++) {
        // Обрезка: проверка допустимости выбора
        if (isValid(state, &choices[i])) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state, &choices[i]);
            backtrack(state, choices, numChoices, res, numRes);
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state, &choices[i]);
        }
    }
}
```

```kotlin title=""
/* Каркас алгоритма поиска с возвратом */
fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
    // Проверка, является ли текущее состояние решением
    if (isSolution(state)) {
        // Запись решения
        recordSolution(state, res)
        // Дальше не продолжаем поиск
        return
    }
    // Перебор всех возможных выборов
    for (choice in choices) {
        // Обрезка: проверка допустимости выбора
        if (isValid(state, choice)) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state, choice)
        }
    }
}
```

```ruby title=""
### Каркас алгоритма поиска с возвратом ###
def backtrack(state, choices, res)
    # Проверка, является ли текущее состояние решением
    if is_solution?(state)
        # Запись решения
        record_solution(state, res)
        return
    end

    # Перебор всех возможных выборов
    for choice in choices
        # Обрезка: проверка допустимости выбора
        if is_valid?(state, choice)
            # Попытка: сделать выбор и обновить состояние
            make_choice(state, choice)
            backtrack(state, choices, res)
            # Откат: отменить выбор и восстановить предыдущее состояние
            undo_choice(state, choice)
        end
    end
end
```
