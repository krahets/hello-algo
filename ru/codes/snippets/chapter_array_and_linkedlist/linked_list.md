<!-- [snippet]{list_node_class} -->
```python title=""
[file]{modules/list_node}-[region]{list_node}
```

```cpp title=""
[file]{utils/list_node.hpp}-[region]{list_node}
```

```java title=""
[file]{utils/ListNode}-[region]{list_node}
[file]{utils/ListNode}-[region]{list_node_end}
```

```csharp title=""
[file]{utils/ListNode}-[region]{list_node}
[file]{utils/ListNode}-[region]{list_node_end}
```

```go title=""
[file]{pkg/list_node}-[region]{list_node}
```

```swift title=""
/* Класс узла связного списка */
class ListNode {
    var val: Int // Значение узла
    var next: ListNode? // Ссылка на следующий узел

    init(x: Int) { // Конструктор
        val = x
    }
}
```

```javascript title=""
[file]{modules/ListNode}-[region]{list_node}
```

```typescript title=""
[file]{modules/ListNode}-[region]{list_node}
```

```dart title=""
[file]{utils/list_node}-[region]{list_node}
```

```rust title=""
[file]{src/include/list_node}-[region]{import_cell}
[file]{src/include/list_node}-[region]{import_rc}

[file]{src/include/list_node}-[region]{list_node}
[file]{src/include/list_node}-[region]{list_node_end}
```

```c title=""
[file]{utils/list_node.h}-[region]{list_node}
```

```kotlin title=""
[file]{utils/ListNode}-[region]{list_node}
[file]{utils/ListNode}-[region]{list_node_end}
```

```ruby title=""
[file]{utils/list_node}-[region]{list_node}
```

<!-- [snippet]{init_linked_list} -->
```python title="linked_list.py"
[file]{linked_list}-[region]{init_linked_list}
```

```cpp title="linked_list.cpp"
[file]{linked_list}-[region]{init_linked_list}
```

```java title="linked_list.java"
[file]{linked_list}-[region]{init_linked_list}
```

```csharp title="linked_list.cs"
[file]{linked_list}-[region]{init_linked_list}
```

```go title="linked_list.go"
[file]{linked_list_test}-[region]{init_linked_list}
```

```swift title="linked_list.swift"
[file]{linked_list}-[region]{init_linked_list}
```

```javascript title="linked_list.js"
[file]{linked_list}-[region]{init_linked_list}
```

```typescript title="linked_list.ts"
[file]{linked_list}-[region]{init_linked_list}
```

```dart title="linked_list.dart"
[file]{linked_list}-[region]{init_linked_list}
```

```rust title="linked_list.rs"
[file]{linked_list}-[region]{init_linked_list}
```

```c title="linked_list.c"
[file]{linked_list}-[region]{init_linked_list}
```

```kotlin title="linked_list.kt"
[file]{linked_list}-[region]{init_linked_list}
```

```ruby title="linked_list.rb"
[file]{linked_list}-[region]{init_linked_list}
```

<!-- [tutor]{init_linked_list_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%D1%83%D0%B7%D0%B5%D0%BB%D0%BA%D0%BB%D0%B0%D1%81%D1%81%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D1%8B%D0%B9%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BA%D0%B0%D0%B6%D0%B4%D1%8B%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B8%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20%D1%83%D0%B7%D0%BB%D0%B0%D0%BC%D0%B8%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{doubly_list_node_class} -->
```python title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```cpp title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```java title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```csharp title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```go title=""
/* Структура узла двусвязного списка */
type DoublyListNode struct {
    Val  int             // Значение узла
    Next *DoublyListNode // Указатель на узел-преемник
    Prev *DoublyListNode // Указатель на узел-предшественник
}

// NewDoublyListNode инициализирует узел двусвязного списка.
func NewDoublyListNode(val int) *DoublyListNode {
    return &DoublyListNode{
        Val:  val,
        Next: nil,
        Prev: nil,
    }
}
```

```swift title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```javascript title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```typescript title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```dart title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```rust title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{import}

[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```c title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```kotlin title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```

```ruby title=""
[file]{chapter_stack_and_queue/linkedlist_deque}-[region]{doubly_list_node}
```
