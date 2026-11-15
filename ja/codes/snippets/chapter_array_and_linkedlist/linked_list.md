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
/* 連結リストのノードクラス */
class ListNode {
    var val: Int // ノードの値
    var next: ListNode? // 次のノードへの参照

    init(x: Int) { // コンストラクタ
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
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%90%84%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20n0%20%3D%20ListNode(1)%0A%20%20%20%20n1%20%3D%20ListNode(3)%0A%20%20%20%20n2%20%3D%20ListNode(2)%0A%20%20%20%20n3%20%3D%20ListNode(5)%0A%20%20%20%20n4%20%3D%20ListNode(4)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E9%96%93%E3%81%AE%E5%8F%82%E7%85%A7%E3%82%92%E8%A8%AD%E5%AE%9A%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
/* 双方向連結リストのノード構造体 */
type DoublyListNode struct {
    Val  int             // ノードの値
    Next *DoublyListNode // 後続ノードへのポインタ
    Prev *DoublyListNode // 先行ノードへのポインタ
}

// NewDoublyListNode で初期化
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
