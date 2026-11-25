<!-- [snippet]{backtrack_framework} -->
```python title=""
def backtrack(state: State, choices: list[Choice], res: list[State]):
    """Общая схема поиска с возвратом"""
    # Проверяем, найдено ли решение
    if is_solution(state):
        # Сохраняем решение
        record_solution(state, res)
        # Завершаем поиск в этой ветви
        return
    # Перебираем все варианты
    for choice in choices:
        # Отсечение: проверяем допустимость выбора
        if is_valid(state, choice):
            # Пробуем вариант и обновляем состояние
            make_choice(state, choice)
            backtrack(state, choices, res)
            # Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undo_choice(state, choice)
```

```cpp title=""
/* Общая схема поиска с возвратом */
void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
    // Проверяем, найдено ли решение
    if (isSolution(state)) {
        // Сохраняем решение
        recordSolution(state, res);
        // Завершаем поиск в этой ветви
        return;
    }
    // Перебираем все варианты
    for (Choice *choice : choices) {
        // Отсечение: проверяем допустимость выбора
        if (isValid(state, choice)) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state, choice);
        }
    }
}
```

```java title=""
/* Общая схема поиска с возвратом */
void backtrack(State state, List<Choice> choices, List<State> res) {
    // Проверяем, найдено ли решение
    if (isSolution(state)) {
        // Сохраняем решение
        recordSolution(state, res);
        // Завершаем поиск в этой ветви
        return;
    }
    // Перебираем все варианты
    for (Choice choice : choices) {
        // Отсечение: проверяем допустимость выбора
        if (isValid(state, choice)) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state, choice);
        }
    }
}
```

```csharp title=""
/* Общая схема поиска с возвратом */
void Backtrack(State state, List<Choice> choices, List<State> res) {
    // Проверяем, найдено ли решение
    if (IsSolution(state)) {
        // Сохраняем решение
        RecordSolution(state, res);
        // Завершаем поиск в этой ветви
        return;
    }
    // Перебираем все варианты
    foreach (Choice choice in choices) {
        // Отсечение: проверяем допустимость выбора
        if (IsValid(state, choice)) {
            // Пробуем вариант и обновляем состояние
            MakeChoice(state, choice);
            Backtrack(state, choices, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            UndoChoice(state, choice);
        }
    }
}
```

```go title=""
/* Общая схема поиска с возвратом */
func backtrack(state *State, choices []Choice, res *[]State) {
    // Проверяем, найдено ли решение
    if isSolution(state) {
        // Сохраняем решение
        recordSolution(state, res)
        // Завершаем поиск в этой ветви
        return
    }
    // Перебираем все варианты
    for _, choice := range choices {
        // Отсечение: проверяем допустимость выбора
        if isValid(state, choice) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state, choice)
        }
    }
}
```

```swift title=""
/* Общая схема поиска с возвратом */
func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
    // Проверяем, найдено ли решение
    if isSolution(state: state) {
        // Сохраняем решение
        recordSolution(state: state, res: &res)
        // Завершаем поиск в этой ветви
        return
    }
    // Перебираем все варианты
    for choice in choices {
        // Отсечение: проверяем допустимость выбора
        if isValid(state: state, choice: choice) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state: &state, choice: choice)
            backtrack(state: &state, choices: choices, res: &res)
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state: &state, choice: choice)
        }
    }
}
```

```javascript title=""
/* Общая схема поиска с возвратом */
function backtrack(state, choices, res) {
    // Проверяем, найдено ли решение
    if (isSolution(state)) {
        // Сохраняем решение
        recordSolution(state, res);
        // Завершаем поиск в этой ветви
        return;
    }
    // Перебираем все варианты
    for (let choice of choices) {
        // Отсечение: проверяем допустимость выбора
        if (isValid(state, choice)) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state, choice);
        }
    }
}
```

```typescript title=""
/* Общая схема поиска с возвратом */
function backtrack(state: State, choices: Choice[], res: State[]): void {
    // Проверяем, найдено ли решение
    if (isSolution(state)) {
        // Сохраняем решение
        recordSolution(state, res);
        // Завершаем поиск в этой ветви
        return;
    }
    // Перебираем все варианты
    for (let choice of choices) {
        // Отсечение: проверяем допустимость выбора
        if (isValid(state, choice)) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state, choice);
            backtrack(state, choices, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state, choice);
        }
    }
}
```

```dart title=""
/* Общая схема поиска с возвратом */
void backtrack(State state, List<Choice> choices, List<State> res) {
  // Проверяем, найдено ли решение
  if (isSolution(state)) {
    // Сохраняем решение
    recordSolution(state, res);
    // Завершаем поиск в этой ветви
    return;
  }
  // Перебираем все варианты
  for (Choice choice in choices) {
    // Отсечение: проверяем допустимость выбора
    if (isValid(state, choice)) {
      // Пробуем вариант и обновляем состояние
      makeChoice(state, choice);
      backtrack(state, choices, res);
      // Возврат: отменяем выбор и восстанавливаем прежнее состояние
      undoChoice(state, choice);
    }
  }
}
```

```rust title=""
/* Общая схема поиска с возвратом */
fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
    // Проверяем, найдено ли решение
    if is_solution(state) {
        // Сохраняем решение
        record_solution(state, res);
        // Завершаем поиск в этой ветви
        return;
    }
    // Перебираем все варианты
    for choice in choices {
        // Отсечение: проверяем допустимость выбора
        if is_valid(state, choice) {
            // Пробуем вариант и обновляем состояние
            make_choice(state, choice);
            backtrack(state, choices, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undo_choice(state, choice);
        }
    }
}
```

```c title=""
/* Общая схема поиска с возвратом */
void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
    // Проверяем, найдено ли решение
    if (isSolution(state)) {
        // Сохраняем решение
        recordSolution(state, res, numRes);
        // Завершаем поиск в этой ветви
        return;
    }
    // Перебираем все варианты
    for (int i = 0; i < numChoices; i++) {
        // Отсечение: проверяем допустимость выбора
        if (isValid(state, &choices[i])) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state, &choices[i]);
            backtrack(state, choices, numChoices, res, numRes);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state, &choices[i]);
        }
    }
}
```

```kotlin title=""
/* Общая схема поиска с возвратом */
fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
    // Проверяем, найдено ли решение
    if (isSolution(state)) {
        // Сохраняем решение
        recordSolution(state, res)
        // Завершаем поиск в этой ветви
        return
    }
    // Перебираем все варианты
    for (choice in choices) {
        // Отсечение: проверяем допустимость выбора
        if (isValid(state, choice)) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state, choice)
            backtrack(state, choices, res)
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state, choice)
        }
    }
}
```

```ruby title=""
### Общая схема поиска с возвратом ###
def backtrack(state, choices, res)
    # Проверяем, найдено ли решение
    if is_solution?(state)
        # Сохраняем решение
        record_solution(state, res)
        return
    end

    # Перебираем все варианты
    for choice in choices
        # Отсечение: проверяем допустимость выбора
        if is_valid?(state, choice)
            # Пробуем вариант и обновляем состояние
            make_choice(state, choice)
            backtrack(state, choices, res)
            # Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undo_choice(state, choice)
        end
    end
end
```
