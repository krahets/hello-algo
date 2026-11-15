<!-- [snippet]{deque_operations} -->
```python title="deque.py"
[file]{deque}-[region]{import_deque}

[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```cpp title="deque.cpp"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```java title="deque.java"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```csharp title="deque.cs"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```go title="deque_test.go"
[file]{deque_test}-[region]{init_deque}

[file]{deque_test}-[region]{push}

[file]{deque_test}-[region]{peek_first}
[file]{deque_test}-[region]{peek_last}

[file]{deque_test}-[region]{pop_first}
[file]{deque_test}-[region]{pop_last}

[file]{deque_test}-[region]{size}

[file]{deque_test}-[region]{is_empty}
```

```swift title="deque.swift"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```javascript title="deque.js"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```typescript title="deque.ts"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```dart title="deque.dart"
/* Инициализация двусторонней очереди */
// В Dart Queue определена как двусторонняя очередь
Queue<int> deque = Queue<int>();

/* Поместить элементы в очередь */
deque.addLast(2);  // Добавить в хвост
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // Добавить в голову
deque.addFirst(1);

/* Просмотреть элементы */
int peekFirst = deque.first; // Элемент в голове
int peekLast = deque.last;   // Элемент в хвосте

/* Извлечь элементы из очереди */
int popFirst = deque.removeFirst(); // Извлечь элемент из головы
int popLast = deque.removeLast();   // Извлечь элемент из хвоста

/* Получить длину двусторонней очереди */
int size = deque.length;

/* Проверить, пуста ли двусторонняя очередь */
bool isEmpty = deque.isEmpty;
```

```rust title="deque.rs"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```c title="deque.c"
// В C нет встроенной двусторонней очереди
```

```kotlin title="deque.kt"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```ruby title="deque.rb"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

<!-- [tutor]{deque_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8E%D1%8E%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20deq.append%282%29%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%83%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20front%20%3D%22%2C%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20print%28%22%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20rear%20%3D%22%2C%20rear%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%2C%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%8B%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%2C%20pop_front%20%3D%22%2C%20pop_front%29%0A%20%20%20%20print%28%22deque%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B8%D0%B7%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%8B%20%3D%22%2C%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%2C%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%2C%20pop_rear%20%3D%22%2C%20pop_rear%29%0A%20%20%20%20print%28%22deque%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B8%D0%B7%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B0%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%D0%B9%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%D0%B9%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
