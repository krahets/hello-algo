---
comments: true
---

# 5.3 &nbsp; 双向队列

在队列中，我们仅能删除头部元素或在尾部添加元素。如图 5-7 所示，「双向队列 double-ended queue」提供了更高的灵活性，允许在头部和尾部执行元素的添加或删除操作。

![双向队列的操作](deque.assets/deque_operations.png){ class="animation-figure" }

<p align="center"> 图 5-7 &nbsp; 双向队列的操作 </p>

## 5.3.1 &nbsp; 双向队列常用操作

双向队列的常用操作如表 5-3 所示，具体的方法名称需要根据所使用的编程语言来确定。

<p align="center"> 表 5-3 &nbsp; 双向队列操作效率 </p>

<div class="center-table" markdown>

| 方法名         | 描述             | 时间复杂度 |
| -------------- | ---------------- | ---------- |
| `push_first()` | 将元素添加至队首 | $O(1)$     |
| `push_last()`  | 将元素添加至队尾 | $O(1)$     |
| `pop_first()`  | 删除队首元素     | $O(1)$     |
| `pop_last()`   | 删除队尾元素     | $O(1)$     |
| `peek_first()` | 访问队首元素     | $O(1)$     |
| `peek_last()`  | 访问队尾元素     | $O(1)$     |

</div>

同样地，我们可以直接使用编程语言中已实现的双向队列类：

=== "Python"

    ```python title="deque.py"
    from collections import deque

    # 初始化双向队列
    deque: deque[int] = deque()
    
    # 元素入队
    deque.append(2)      # 添加至队尾
    deque.append(5)
    deque.append(4)
    deque.appendleft(3)  # 添加至队首
    deque.appendleft(1)
    
    # 访问元素
    front: int = deque[0]  # 队首元素
    rear: int = deque[-1]  # 队尾元素
    
    # 元素出队
    pop_front: int = deque.popleft()  # 队首元素出队
    pop_rear: int = deque.pop()       # 队尾元素出队
    
    # 获取双向队列的长度
    size: int = len(deque)
    
    # 判断双向队列是否为空
    is_empty: bool = len(deque) == 0
    ```

=== "C++"

    ```cpp title="deque.cpp"
    /* 初始化双向队列 */
    deque<int> deque;
    
    /* 元素入队 */
    deque.push_back(2);   // 添加至队尾
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);  // 添加至队首
    deque.push_front(1);
    
    /* 访问元素 */
    int front = deque.front(); // 队首元素
    int back = deque.back();   // 队尾元素
    
    /* 元素出队 */
    deque.pop_front();  // 队首元素出队
    deque.pop_back();   // 队尾元素出队
    
    /* 获取双向队列的长度 */
    int size = deque.size();
    
    /* 判断双向队列是否为空 */
    bool empty = deque.empty();
    ```

=== "Java"

    ```java title="deque.java"
    /* 初始化双向队列 */
    Deque<Integer> deque = new LinkedList<>();
    
    /* 元素入队 */
    deque.offerLast(2);   // 添加至队尾
    deque.offerLast(5);
    deque.offerLast(4);
    deque.offerFirst(3);  // 添加至队首
    deque.offerFirst(1);
    
    /* 访问元素 */
    int peekFirst = deque.peekFirst();  // 队首元素
    int peekLast = deque.peekLast();    // 队尾元素
    
    /* 元素出队 */
    int popFirst = deque.pollFirst();  // 队首元素出队
    int popLast = deque.pollLast();    // 队尾元素出队
    
    /* 获取双向队列的长度 */
    int size = deque.size();
    
    /* 判断双向队列是否为空 */
    boolean isEmpty = deque.isEmpty();
    ```

=== "C#"

    ```csharp title="deque.cs"
    /* 初始化双向队列 */
    // 在 C# 中，将链表 LinkedList 看作双向队列来使用
    LinkedList<int> deque = new();
    
    /* 元素入队 */
    deque.AddLast(2);   // 添加至队尾
    deque.AddLast(5);
    deque.AddLast(4);
    deque.AddFirst(3);  // 添加至队首
    deque.AddFirst(1);
    
    /* 访问元素 */
    int peekFirst = deque.First.Value;  // 队首元素
    int peekLast = deque.Last.Value;    // 队尾元素
    
    /* 元素出队 */
    deque.RemoveFirst();  // 队首元素出队
    deque.RemoveLast();   // 队尾元素出队
    
    /* 获取双向队列的长度 */
    int size = deque.Count;
    
    /* 判断双向队列是否为空 */
    bool isEmpty = deque.Count == 0;
    ```

=== "Go"

    ```go title="deque_test.go"
    /* 初始化双向队列 */
    // 在 Go 中，将 list 作为双向队列使用
    deque := list.New()
    
    /* 元素入队 */
    deque.PushBack(2)      // 添加至队尾
    deque.PushBack(5)
    deque.PushBack(4)
    deque.PushFront(3)     // 添加至队首
    deque.PushFront(1)
    
    /* 访问元素 */
    front := deque.Front() // 队首元素
    rear := deque.Back()   // 队尾元素
    
    /* 元素出队 */
    deque.Remove(front)    // 队首元素出队
    deque.Remove(rear)     // 队尾元素出队
    
    /* 获取双向队列的长度 */
    size := deque.Len()
    
    /* 判断双向队列是否为空 */
    isEmpty := deque.Len() == 0
    ```

=== "Swift"

    ```swift title="deque.swift"
    /* 初始化双向队列 */
    // Swift 没有内置的双向队列类，可以把 Array 当作双向队列来使用
    var deque: [Int] = []

    /* 元素入队 */
    deque.append(2) // 添加至队尾
    deque.append(5)
    deque.append(4)
    deque.insert(3, at: 0) // 添加至队首
    deque.insert(1, at: 0)

    /* 访问元素 */
    let peekFirst = deque.first! // 队首元素
    let peekLast = deque.last! // 队尾元素

    /* 元素出队 */
    // 使用 Array 模拟时 popFirst 的复杂度为 O(n)
    let popFirst = deque.removeFirst() // 队首元素出队
    let popLast = deque.removeLast() // 队尾元素出队

    /* 获取双向队列的长度 */
    let size = deque.count

    /* 判断双向队列是否为空 */
    let isEmpty = deque.isEmpty
    ```

=== "JS"

    ```javascript title="deque.js"
    /* 初始化双向队列 */
    // JavaScript 没有内置的双端队列，只能把 Array 当作双端队列来使用
    const deque = [];

    /* 元素入队 */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // 请注意，由于是数组，unshift() 方法的时间复杂度为 O(n)
    deque.unshift(3);
    deque.unshift(1);

    /* 访问元素 */
    const peekFirst = deque[0];
    const peekLast = deque[deque.length - 1];

    /* 元素出队 */
    // 请注意，由于是数组，shift() 方法的时间复杂度为 O(n)
    const popFront = deque.shift();
    const popBack = deque.pop();

    /* 获取双向队列的长度 */
    const size = deque.length;

    /* 判断双向队列是否为空 */
    const isEmpty = size === 0;
    ```

=== "TS"

    ```typescript title="deque.ts"
    /* 初始化双向队列 */
    // TypeScript 没有内置的双端队列，只能把 Array 当作双端队列来使用
    const deque: number[] = [];

    /* 元素入队 */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // 请注意，由于是数组，unshift() 方法的时间复杂度为 O(n)
    deque.unshift(3);
    deque.unshift(1);

    /* 访问元素 */
    const peekFirst: number = deque[0];
    const peekLast: number = deque[deque.length - 1];

    /* 元素出队 */
    // 请注意，由于是数组，shift() 方法的时间复杂度为 O(n)
    const popFront: number = deque.shift() as number;
    const popBack: number = deque.pop() as number;

    /* 获取双向队列的长度 */
    const size: number = deque.length;

    /* 判断双向队列是否为空 */
    const isEmpty: boolean = size === 0;
    ```

=== "Dart"

    ```dart title="deque.dart"
    /* 初始化双向队列 */
    // 在 Dart 中，Queue 被定义为双向队列
    Queue<int> deque = Queue<int>();

    /* 元素入队 */
    deque.addLast(2);  // 添加至队尾
    deque.addLast(5);
    deque.addLast(4);
    deque.addFirst(3); // 添加至队首
    deque.addFirst(1);

    /* 访问元素 */
    int peekFirst = deque.first; // 队首元素
    int peekLast = deque.last;   // 队尾元素

    /* 元素出队 */
    int popFirst = deque.removeFirst(); // 队首元素出队
    int popLast = deque.removeLast();   // 队尾元素出队

    /* 获取双向队列的长度 */
    int size = deque.length;

    /* 判断双向队列是否为空 */
    bool isEmpty = deque.isEmpty;W
    ```

=== "Rust"

    ```rust title="deque.rs"
    /* 初始化双向队列 */
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* 元素入队 */
    deque.push_back(2);  // 添加至队尾
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // 添加至队首
    deque.push_front(1);

    /* 访问元素 */
    if let Some(front) = deque.front() { // 队首元素
    }
    if let Some(rear) = deque.back() {   // 队尾元素
    }

    /* 元素出队 */
    if let Some(pop_front) = deque.pop_front() { // 队首元素出队
    }
    if let Some(pop_rear) = deque.pop_back() {   // 队尾元素出队
    }

    /* 获取双向队列的长度 */
    let size = deque.len();

    /* 判断双向队列是否为空 */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="deque.c"
    // C 未提供内置双向队列
    ```

=== "Zig"

    ```zig title="deque.zig"

    ```

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E9%98%9F%0A%20%20%20%20deq.append%282%29%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%87%B3%E9%98%9F%E5%B0%BE%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%87%B3%E9%98%9F%E9%A6%96%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22,%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%20rear%20%3D%22,%20rear%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20%20pop_front%20%3D%22,%20pop_front%29%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%87%BA%E9%98%9F%E5%90%8E%20deque%20%3D%22,%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20%20pop_rear%20%3D%22,%20pop_rear%29%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%87%BA%E9%98%9F%E5%90%8E%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E9%98%9F%0A%20%20%20%20deq.append%282%29%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%87%B3%E9%98%9F%E5%B0%BE%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%87%B3%E9%98%9F%E9%A6%96%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22,%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%20rear%20%3D%22,%20rear%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20%20pop_front%20%3D%22,%20pop_front%29%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%87%BA%E9%98%9F%E5%90%8E%20deque%20%3D%22,%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20%20pop_rear%20%3D%22,%20pop_rear%29%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%87%BA%E9%98%9F%E5%90%8E%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

## 5.3.2 &nbsp; 双向队列实现 *

双向队列的实现与队列类似，可以选择链表或数组作为底层数据结构。

### 1. &nbsp; 基于双向链表的实现

回顾上一节内容，我们使用普通单向链表来实现队列，因为它可以方便地删除头节点（对应出队操作）和在尾节点后添加新节点（对应入队操作）。

对于双向队列而言，头部和尾部都可以执行入队和出队操作。换句话说，双向队列需要实现另一个对称方向的操作。为此，我们采用“双向链表”作为双向队列的底层数据结构。

如图 5-8 所示，我们将双向链表的头节点和尾节点视为双向队列的队首和队尾，同时实现在两端添加和删除节点的功能。

=== "LinkedListDeque"
    ![基于链表实现双向队列的入队出队操作](deque.assets/linkedlist_deque.png){ class="animation-figure" }

=== "push_last()"
    ![linkedlist_deque_push_last](deque.assets/linkedlist_deque_push_last.png){ class="animation-figure" }

=== "push_first()"
    ![linkedlist_deque_push_first](deque.assets/linkedlist_deque_push_first.png){ class="animation-figure" }

=== "pop_last()"
    ![linkedlist_deque_pop_last](deque.assets/linkedlist_deque_pop_last.png){ class="animation-figure" }

=== "pop_first()"
    ![linkedlist_deque_pop_first](deque.assets/linkedlist_deque_pop_first.png){ class="animation-figure" }

<p align="center"> 图 5-8 &nbsp; 基于链表实现双向队列的入队出队操作 </p>

实现代码如下所示：

=== "Python"

    ```python title="linkedlist_deque.py"
    class ListNode:
        """双向链表节点"""

        def __init__(self, val: int):
            """构造方法"""
            self.val: int = val
            self.next: ListNode | None = None  # 后继节点引用
            self.prev: ListNode | None = None  # 前驱节点引用

    class LinkedListDeque:
        """基于双向链表实现的双向队列"""

        def __init__(self):
            """构造方法"""
            self._front: ListNode | None = None  # 头节点 front
            self._rear: ListNode | None = None  # 尾节点 rear
            self._size: int = 0  # 双向队列的长度

        def size(self) -> int:
            """获取双向队列的长度"""
            return self._size

        def is_empty(self) -> bool:
            """判断双向队列是否为空"""
            return self.size() == 0

        def push(self, num: int, is_front: bool):
            """入队操作"""
            node = ListNode(num)
            # 若链表为空，则令 front 和 rear 都指向 node
            if self.is_empty():
                self._front = self._rear = node
            # 队首入队操作
            elif is_front:
                # 将 node 添加至链表头部
                self._front.prev = node
                node.next = self._front
                self._front = node  # 更新头节点
            # 队尾入队操作
            else:
                # 将 node 添加至链表尾部
                self._rear.next = node
                node.prev = self._rear
                self._rear = node  # 更新尾节点
            self._size += 1  # 更新队列长度

        def push_first(self, num: int):
            """队首入队"""
            self.push(num, True)

        def push_last(self, num: int):
            """队尾入队"""
            self.push(num, False)

        def pop(self, is_front: bool) -> int:
            """出队操作"""
            if self.is_empty():
                raise IndexError("双向队列为空")
            # 队首出队操作
            if is_front:
                val: int = self._front.val  # 暂存头节点值
                # 删除头节点
                fnext: ListNode | None = self._front.next
                if fnext != None:
                    fnext.prev = None
                    self._front.next = None
                self._front = fnext  # 更新头节点
            # 队尾出队操作
            else:
                val: int = self._rear.val  # 暂存尾节点值
                # 删除尾节点
                rprev: ListNode | None = self._rear.prev
                if rprev != None:
                    rprev.next = None
                    self._rear.prev = None
                self._rear = rprev  # 更新尾节点
            self._size -= 1  # 更新队列长度
            return val

        def pop_first(self) -> int:
            """队首出队"""
            return self.pop(True)

        def pop_last(self) -> int:
            """队尾出队"""
            return self.pop(False)

        def peek_first(self) -> int:
            """访问队首元素"""
            if self.is_empty():
                raise IndexError("双向队列为空")
            return self._front.val

        def peek_last(self) -> int:
            """访问队尾元素"""
            if self.is_empty():
                raise IndexError("双向队列为空")
            return self._rear.val

        def to_array(self) -> list[int]:
            """返回数组用于打印"""
            node = self._front
            res = [0] * self.size()
            for i in range(self.size()):
                res[i] = node.val
                node = node.next
            return res
    ```

=== "C++"

    ```cpp title="linkedlist_deque.cpp"
    /* 双向链表节点 */
    struct DoublyListNode {
        int val;              // 节点值
        DoublyListNode *next; // 后继节点指针
        DoublyListNode *prev; // 前驱节点指针
        DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
        }
    };

    /* 基于双向链表实现的双向队列 */
    class LinkedListDeque {
      private:
        DoublyListNode *front, *rear; // 头节点 front ，尾节点 rear
        int queSize = 0;              // 双向队列的长度

      public:
        /* 构造方法 */
        LinkedListDeque() : front(nullptr), rear(nullptr) {
        }

        /* 析构方法 */
        ~LinkedListDeque() {
            // 遍历链表删除节点，释放内存
            DoublyListNode *pre, *cur = front;
            while (cur != nullptr) {
                pre = cur;
                cur = cur->next;
                delete pre;
            }
        }

        /* 获取双向队列的长度 */
        int size() {
            return queSize;
        }

        /* 判断双向队列是否为空 */
        bool isEmpty() {
            return size() == 0;
        }

        /* 入队操作 */
        void push(int num, bool isFront) {
            DoublyListNode *node = new DoublyListNode(num);
            // 若链表为空，则令 front 和 rear 都指向 node
            if (isEmpty())
                front = rear = node;
            // 队首入队操作
            else if (isFront) {
                // 将 node 添加至链表头部
                front->prev = node;
                node->next = front;
                front = node; // 更新头节点
            // 队尾入队操作
            } else {
                // 将 node 添加至链表尾部
                rear->next = node;
                node->prev = rear;
                rear = node; // 更新尾节点
            }
            queSize++; // 更新队列长度
        }

        /* 队首入队 */
        void pushFirst(int num) {
            push(num, true);
        }

        /* 队尾入队 */
        void pushLast(int num) {
            push(num, false);
        }

        /* 出队操作 */
        int pop(bool isFront) {
            if (isEmpty())
                throw out_of_range("队列为空");
            int val;
            // 队首出队操作
            if (isFront) {
                val = front->val; // 暂存头节点值
                // 删除头节点
                DoublyListNode *fNext = front->next;
                if (fNext != nullptr) {
                    fNext->prev = nullptr;
                    front->next = nullptr;
                }
                delete front;
                front = fNext; // 更新头节点
            // 队尾出队操作
            } else {
                val = rear->val; // 暂存尾节点值
                // 删除尾节点
                DoublyListNode *rPrev = rear->prev;
                if (rPrev != nullptr) {
                    rPrev->next = nullptr;
                    rear->prev = nullptr;
                }
                delete rear;
                rear = rPrev; // 更新尾节点
            }
            queSize--; // 更新队列长度
            return val;
        }

        /* 队首出队 */
        int popFirst() {
            return pop(true);
        }

        /* 队尾出队 */
        int popLast() {
            return pop(false);
        }

        /* 访问队首元素 */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("双向队列为空");
            return front->val;
        }

        /* 访问队尾元素 */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("双向队列为空");
            return rear->val;
        }

        /* 返回数组用于打印 */
        vector<int> toVector() {
            DoublyListNode *node = front;
            vector<int> res(size());
            for (int i = 0; i < res.size(); i++) {
                res[i] = node->val;
                node = node->next;
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="linkedlist_deque.java"
    /* 双向链表节点 */
    class ListNode {
        int val; // 节点值
        ListNode next; // 后继节点引用
        ListNode prev; // 前驱节点引用

        ListNode(int val) {
            this.val = val;
            prev = next = null;
        }
    }

    /* 基于双向链表实现的双向队列 */
    class LinkedListDeque {
        private ListNode front, rear; // 头节点 front ，尾节点 rear
        private int queSize = 0; // 双向队列的长度

        public LinkedListDeque() {
            front = rear = null;
        }

        /* 获取双向队列的长度 */
        public int size() {
            return queSize;
        }

        /* 判断双向队列是否为空 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* 入队操作 */
        private void push(int num, boolean isFront) {
            ListNode node = new ListNode(num);
            // 若链表为空，则令 front 和 rear 都指向 node
            if (isEmpty())
                front = rear = node;
            // 队首入队操作
            else if (isFront) {
                // 将 node 添加至链表头部
                front.prev = node;
                node.next = front;
                front = node; // 更新头节点
            // 队尾入队操作
            } else {
                // 将 node 添加至链表尾部
                rear.next = node;
                node.prev = rear;
                rear = node; // 更新尾节点
            }
            queSize++; // 更新队列长度
        }

        /* 队首入队 */
        public void pushFirst(int num) {
            push(num, true);
        }

        /* 队尾入队 */
        public void pushLast(int num) {
            push(num, false);
        }

        /* 出队操作 */
        private int pop(boolean isFront) {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            int val;
            // 队首出队操作
            if (isFront) {
                val = front.val; // 暂存头节点值
                // 删除头节点
                ListNode fNext = front.next;
                if (fNext != null) {
                    fNext.prev = null;
                    front.next = null;
                }
                front = fNext; // 更新头节点
            // 队尾出队操作
            } else {
                val = rear.val; // 暂存尾节点值
                // 删除尾节点
                ListNode rPrev = rear.prev;
                if (rPrev != null) {
                    rPrev.next = null;
                    rear.prev = null;
                }
                rear = rPrev; // 更新尾节点
            }
            queSize--; // 更新队列长度
            return val;
        }

        /* 队首出队 */
        public int popFirst() {
            return pop(true);
        }

        /* 队尾出队 */
        public int popLast() {
            return pop(false);
        }

        /* 访问队首元素 */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* 访问队尾元素 */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return rear.val;
        }

        /* 返回数组用于打印 */
        public int[] toArray() {
            ListNode node = front;
            int[] res = new int[size()];
            for (int i = 0; i < res.length; i++) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="linkedlist_deque.cs"
    /* 双向链表节点 */
    class ListNode(int val) {
        public int val = val;       // 节点值
        public ListNode? next = null; // 后继节点引用
        public ListNode? prev = null; // 前驱节点引用
    }

    /* 基于双向链表实现的双向队列 */
    class LinkedListDeque {
        ListNode? front, rear; // 头节点 front, 尾节点 rear
        int queSize = 0;      // 双向队列的长度

        public LinkedListDeque() {
            front = null;
            rear = null;
        }

        /* 获取双向队列的长度 */
        public int Size() {
            return queSize;
        }

        /* 判断双向队列是否为空 */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* 入队操作 */
        void Push(int num, bool isFront) {
            ListNode node = new(num);
            // 若链表为空，则令 front 和 rear 都指向 node
            if (IsEmpty()) {
                front = node;
                rear = node;
            }
            // 队首入队操作
            else if (isFront) {
                // 将 node 添加至链表头部
                front!.prev = node;
                node.next = front;
                front = node; // 更新头节点                           
            }
            // 队尾入队操作
            else {
                // 将 node 添加至链表尾部
                rear!.next = node;
                node.prev = rear;
                rear = node;  // 更新尾节点
            }

            queSize++; // 更新队列长度
        }

        /* 队首入队 */
        public void PushFirst(int num) {
            Push(num, true);
        }

        /* 队尾入队 */
        public void PushLast(int num) {
            Push(num, false);
        }

        /* 出队操作 */
        int? Pop(bool isFront) {
            if (IsEmpty())
                throw new Exception();
            int? val;
            // 队首出队操作
            if (isFront) {
                val = front?.val; // 暂存头节点值
                // 删除头节点
                ListNode? fNext = front?.next;
                if (fNext != null) {
                    fNext.prev = null;
                    front!.next = null;
                }
                front = fNext;   // 更新头节点
            }
            // 队尾出队操作
            else {
                val = rear?.val;  // 暂存尾节点值
                // 删除尾节点
                ListNode? rPrev = rear?.prev;
                if (rPrev != null) {
                    rPrev.next = null;
                    rear!.prev = null;
                }
                rear = rPrev;    // 更新尾节点
            }

            queSize--; // 更新队列长度
            return val;
        }

        /* 队首出队 */
        public int? PopFirst() {
            return Pop(true);
        }

        /* 队尾出队 */
        public int? PopLast() {
            return Pop(false);
        }

        /* 访问队首元素 */
        public int? PeekFirst() {
            if (IsEmpty())
                throw new Exception();
            return front?.val;
        }

        /* 访问队尾元素 */
        public int? PeekLast() {
            if (IsEmpty())
                throw new Exception();
            return rear?.val;
        }

        /* 返回数组用于打印 */
        public int?[] ToArray() {
            ListNode? node = front;
            int?[] res = new int?[Size()];
            for (int i = 0; i < res.Length; i++) {
                res[i] = node?.val;
                node = node?.next;
            }

            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_deque.go"
    /* 基于双向链表实现的双向队列 */
    type linkedListDeque struct {
        // 使用内置包 list
        data *list.List
    }

    /* 初始化双端队列 */
    func newLinkedListDeque() *linkedListDeque {
        return &linkedListDeque{
            data: list.New(),
        }
    }

    /* 队首元素入队 */
    func (s *linkedListDeque) pushFirst(value any) {
        s.data.PushFront(value)
    }

    /* 队尾元素入队 */
    func (s *linkedListDeque) pushLast(value any) {
        s.data.PushBack(value)
    }

    /* 队首元素出队 */
    func (s *linkedListDeque) popFirst() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        s.data.Remove(e)
        return e.Value
    }

    /* 队尾元素出队 */
    func (s *linkedListDeque) popLast() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    /* 访问队首元素 */
    func (s *linkedListDeque) peekFirst() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        return e.Value
    }

    /* 访问队尾元素 */
    func (s *linkedListDeque) peekLast() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* 获取队列的长度 */
    func (s *linkedListDeque) size() int {
        return s.data.Len()
    }

    /* 判断队列是否为空 */
    func (s *linkedListDeque) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* 获取 List 用于打印 */
    func (s *linkedListDeque) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_deque.swift"
    /* 双向链表节点 */
    class ListNode {
        var val: Int // 节点值
        var next: ListNode? // 后继节点引用
        weak var prev: ListNode? // 前驱节点引用

        init(val: Int) {
            self.val = val
        }
    }

    /* 基于双向链表实现的双向队列 */
    class LinkedListDeque {
        private var front: ListNode? // 头节点 front
        private var rear: ListNode? // 尾节点 rear
        private var queSize: Int // 双向队列的长度

        init() {
            queSize = 0
        }

        /* 获取双向队列的长度 */
        func size() -> Int {
            queSize
        }

        /* 判断双向队列是否为空 */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* 入队操作 */
        private func push(num: Int, isFront: Bool) {
            let node = ListNode(val: num)
            // 若链表为空，则令 front 和 rear 都指向 node
            if isEmpty() {
                front = node
                rear = node
            }
            // 队首入队操作
            else if isFront {
                // 将 node 添加至链表头部
                front?.prev = node
                node.next = front
                front = node // 更新头节点
            }
            // 队尾入队操作
            else {
                // 将 node 添加至链表尾部
                rear?.next = node
                node.prev = rear
                rear = node // 更新尾节点
            }
            queSize += 1 // 更新队列长度
        }

        /* 队首入队 */
        func pushFirst(num: Int) {
            push(num: num, isFront: true)
        }

        /* 队尾入队 */
        func pushLast(num: Int) {
            push(num: num, isFront: false)
        }

        /* 出队操作 */
        private func pop(isFront: Bool) -> Int {
            if isEmpty() {
                fatalError("双向队列为空")
            }
            let val: Int
            // 队首出队操作
            if isFront {
                val = front!.val // 暂存头节点值
                // 删除头节点
                let fNext = front?.next
                if fNext != nil {
                    fNext?.prev = nil
                    front?.next = nil
                }
                front = fNext // 更新头节点
            }
            // 队尾出队操作
            else {
                val = rear!.val // 暂存尾节点值
                // 删除尾节点
                let rPrev = rear?.prev
                if rPrev != nil {
                    rPrev?.next = nil
                    rear?.prev = nil
                }
                rear = rPrev // 更新尾节点
            }
            queSize -= 1 // 更新队列长度
            return val
        }

        /* 队首出队 */
        func popFirst() -> Int {
            pop(isFront: true)
        }

        /* 队尾出队 */
        func popLast() -> Int {
            pop(isFront: false)
        }

        /* 访问队首元素 */
        func peekFirst() -> Int? {
            isEmpty() ? nil : front?.val
        }

        /* 访问队尾元素 */
        func peekLast() -> Int? {
            isEmpty() ? nil : rear?.val
        }

        /* 返回数组用于打印 */
        func toArray() -> [Int] {
            var node = front
            var res = Array(repeating: 0, count: size())
            for i in res.indices {
                res[i] = node!.val
                node = node?.next
            }
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="linkedlist_deque.js"
    /* 双向链表节点 */
    class ListNode {
        prev; // 前驱节点引用 (指针)
        next; // 后继节点引用 (指针)
        val; // 节点值

        constructor(val) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* 基于双向链表实现的双向队列 */
    class LinkedListDeque {
        #front; // 头节点 front
        #rear; // 尾节点 rear
        #queSize; // 双向队列的长度

        constructor() {
            this.#front = null;
            this.#rear = null;
            this.#queSize = 0;
        }

        /* 队尾入队操作 */
        pushLast(val) {
            const node = new ListNode(val);
            // 若链表为空，则令 front 和 rear 都指向 node
            if (this.#queSize === 0) {
                this.#front = node;
                this.#rear = node;
            } else {
                // 将 node 添加至链表尾部
                this.#rear.next = node;
                node.prev = this.#rear;
                this.#rear = node; // 更新尾节点
            }
            this.#queSize++;
        }

        /* 队首入队操作 */
        pushFirst(val) {
            const node = new ListNode(val);
            // 若链表为空，则令 front 和 rear 都指向 node
            if (this.#queSize === 0) {
                this.#front = node;
                this.#rear = node;
            } else {
                // 将 node 添加至链表头部
                this.#front.prev = node;
                node.next = this.#front;
                this.#front = node; // 更新头节点
            }
            this.#queSize++;
        }

        /* 队尾出队操作 */
        popLast() {
            if (this.#queSize === 0) {
                return null;
            }
            const value = this.#rear.val; // 存储尾节点值
            // 删除尾节点
            let temp = this.#rear.prev;
            if (temp !== null) {
                temp.next = null;
                this.#rear.prev = null;
            }
            this.#rear = temp; // 更新尾节点
            this.#queSize--;
            return value;
        }

        /* 队首出队操作 */
        popFirst() {
            if (this.#queSize === 0) {
                return null;
            }
            const value = this.#front.val; // 存储尾节点值
            // 删除头节点
            let temp = this.#front.next;
            if (temp !== null) {
                temp.prev = null;
                this.#front.next = null;
            }
            this.#front = temp; // 更新头节点
            this.#queSize--;
            return value;
        }

        /* 访问队尾元素 */
        peekLast() {
            return this.#queSize === 0 ? null : this.#rear.val;
        }

        /* 访问队首元素 */
        peekFirst() {
            return this.#queSize === 0 ? null : this.#front.val;
        }

        /* 获取双向队列的长度 */
        size() {
            return this.#queSize;
        }

        /* 判断双向队列是否为空 */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* 打印双向队列 */
        print() {
            const arr = [];
            let temp = this.#front;
            while (temp !== null) {
                arr.push(temp.val);
                temp = temp.next;
            }
            console.log('[' + arr.join(', ') + ']');
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_deque.ts"
    /* 双向链表节点 */
    class ListNode {
        prev: ListNode; // 前驱节点引用 (指针)
        next: ListNode; // 后继节点引用 (指针)
        val: number; // 节点值

        constructor(val: number) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* 基于双向链表实现的双向队列 */
    class LinkedListDeque {
        private front: ListNode; // 头节点 front
        private rear: ListNode; // 尾节点 rear
        private queSize: number; // 双向队列的长度

        constructor() {
            this.front = null;
            this.rear = null;
            this.queSize = 0;
        }

        /* 队尾入队操作 */
        pushLast(val: number): void {
            const node: ListNode = new ListNode(val);
            // 若链表为空，则令 front 和 rear 都指向 node
            if (this.queSize === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // 将 node 添加至链表尾部
                this.rear.next = node;
                node.prev = this.rear;
                this.rear = node; // 更新尾节点
            }
            this.queSize++;
        }

        /* 队首入队操作 */
        pushFirst(val: number): void {
            const node: ListNode = new ListNode(val);
            // 若链表为空，则令 front 和 rear 都指向 node
            if (this.queSize === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // 将 node 添加至链表头部
                this.front.prev = node;
                node.next = this.front;
                this.front = node; // 更新头节点
            }
            this.queSize++;
        }

        /* 队尾出队操作 */
        popLast(): number {
            if (this.queSize === 0) {
                return null;
            }
            const value: number = this.rear.val; // 存储尾节点值
            // 删除尾节点
            let temp: ListNode = this.rear.prev;
            if (temp !== null) {
                temp.next = null;
                this.rear.prev = null;
            }
            this.rear = temp; // 更新尾节点
            this.queSize--;
            return value;
        }

        /* 队首出队操作 */
        popFirst(): number {
            if (this.queSize === 0) {
                return null;
            }
            const value: number = this.front.val; // 存储尾节点值
            // 删除头节点
            let temp: ListNode = this.front.next;
            if (temp !== null) {
                temp.prev = null;
                this.front.next = null;
            }
            this.front = temp; // 更新头节点
            this.queSize--;
            return value;
        }

        /* 访问队尾元素 */
        peekLast(): number {
            return this.queSize === 0 ? null : this.rear.val;
        }

        /* 访问队首元素 */
        peekFirst(): number {
            return this.queSize === 0 ? null : this.front.val;
        }

        /* 获取双向队列的长度 */
        size(): number {
            return this.queSize;
        }

        /* 判断双向队列是否为空 */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* 打印双向队列 */
        print(): void {
            const arr: number[] = [];
            let temp: ListNode = this.front;
            while (temp !== null) {
                arr.push(temp.val);
                temp = temp.next;
            }
            console.log('[' + arr.join(', ') + ']');
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_deque.dart"
    /* 双向链表节点 */
    class ListNode {
      int val; // 节点值
      ListNode? next; // 后继节点引用
      ListNode? prev; // 前驱节点引用

      ListNode(this.val, {this.next, this.prev});
    }

    /* 基于双向链表实现的双向对列 */
    class LinkedListDeque {
      late ListNode? _front; // 头节点 _front
      late ListNode? _rear; // 尾节点 _rear
      int _queSize = 0; // 双向队列的长度

      LinkedListDeque() {
        this._front = null;
        this._rear = null;
      }

      /* 获取双向队列长度 */
      int size() {
        return this._queSize;
      }

      /* 判断双向队列是否为空 */
      bool isEmpty() {
        return size() == 0;
      }

      /* 入队操作 */
      void push(int _num, bool isFront) {
        final ListNode node = ListNode(_num);
        if (isEmpty()) {
          // 若链表为空，则令 _front 和 _rear 都指向 node
          _front = _rear = node;
        } else if (isFront) {
          // 队首入队操作
          // 将 node 添加至链表头部
          _front!.prev = node;
          node.next = _front;
          _front = node; // 更新头节点
        } else {
          // 队尾入队操作
          // 将 node 添加至链表尾部
          _rear!.next = node;
          node.prev = _rear;
          _rear = node; // 更新尾节点
        }
        _queSize++; // 更新队列长度
      }

      /* 队首入队 */
      void pushFirst(int _num) {
        push(_num, true);
      }

      /* 队尾入队 */
      void pushLast(int _num) {
        push(_num, false);
      }

      /* 出队操作 */
      int? pop(bool isFront) {
        // 若队列为空，直接返回 null
        if (isEmpty()) {
          return null;
        }
        final int val;
        if (isFront) {
          // 队首出队操作
          val = _front!.val; // 暂存头节点值
          // 删除头节点
          ListNode? fNext = _front!.next;
          if (fNext != null) {
            fNext.prev = null;
            _front!.next = null;
          }
          _front = fNext; // 更新头节点
        } else {
          // 队尾出队操作
          val = _rear!.val; // 暂存尾节点值
          // 删除尾节点
          ListNode? rPrev = _rear!.prev;
          if (rPrev != null) {
            rPrev.next = null;
            _rear!.prev = null;
          }
          _rear = rPrev; // 更新尾节点
        }
        _queSize--; // 更新队列长度
        return val;
      }

      /* 队首出队 */
      int? popFirst() {
        return pop(true);
      }

      /* 队尾出队 */
      int? popLast() {
        return pop(false);
      }

      /* 访问队首元素 */
      int? peekFirst() {
        return _front?.val;
      }

      /* 访问队尾元素 */
      int? peekLast() {
        return _rear?.val;
      }

      /* 返回数组用于打印 */
      List<int> toArray() {
        ListNode? node = _front;
        final List<int> res = [];
        for (int i = 0; i < _queSize; i++) {
          res.add(node!.val);
          node = node.next;
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_deque.rs"
    /* 双向链表节点 */
    pub struct ListNode<T> {
        pub val: T,                                 // 节点值
        pub next: Option<Rc<RefCell<ListNode<T>>>>, // 后继节点指针
        pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 前驱节点指针
    }

    impl<T> ListNode<T> {
        pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
            Rc::new(RefCell::new(ListNode {
                val,
                next: None,
                prev: None,
            }))
        }
    }

    /* 基于双向链表实现的双向队列 */
    #[allow(dead_code)]
    pub struct LinkedListDeque<T> {
        front: Option<Rc<RefCell<ListNode<T>>>>,    // 头节点 front
        rear: Option<Rc<RefCell<ListNode<T>>>>,     // 尾节点 rear 
        que_size: usize,                            // 双向队列的长度
    }

    impl<T: Copy> LinkedListDeque<T> {
        pub fn new() -> Self {
            Self {
                front: None,
                rear: None,
                que_size: 0, 
            }
        }

        /* 获取双向队列的长度 */
        pub fn size(&self) -> usize {
            return self.que_size;
        }

        /* 判断双向队列是否为空 */
        pub fn is_empty(&self) -> bool {
            return self.size() == 0;
        }

        /* 入队操作 */
        pub fn push(&mut self, num: T, is_front: bool) {
            let node = ListNode::new(num);
            // 队首入队操作
            if is_front {
                match self.front.take() {
                    // 若链表为空，则令 front 和 rear 都指向 node
                    None => {
                        self.rear = Some(node.clone());
                        self.front = Some(node);
                    }
                    // 将 node 添加至链表头部
                    Some(old_front) => {
                        old_front.borrow_mut().prev = Some(node.clone());
                        node.borrow_mut().next = Some(old_front);
                        self.front = Some(node); // 更新头节点
                    }
                }
            } 
            // 队尾入队操作
            else {
                match self.rear.take() {
                    // 若链表为空，则令 front 和 rear 都指向 node
                    None => {
                        self.front = Some(node.clone());
                        self.rear = Some(node);
                    }
                    // 将 node 添加至链表尾部
                    Some(old_rear) => {
                        old_rear.borrow_mut().next = Some(node.clone());
                        node.borrow_mut().prev = Some(old_rear);
                        self.rear = Some(node); // 更新尾节点
                    }
                }
            }
            self.que_size += 1; // 更新队列长度
        }

        /* 队首入队 */
        pub fn push_first(&mut self, num: T) {
            self.push(num, true);
        }

        /* 队尾入队 */
        pub fn push_last(&mut self, num: T) {
            self.push(num, false);
        }

        /* 出队操作 */
        pub fn pop(&mut self, is_front: bool) -> Option<T> {
            // 若队列为空，直接返回 None
            if self.is_empty() { 
                return None 
            };
            // 队首出队操作
            if is_front {
                self.front.take().map(|old_front| {
                    match old_front.borrow_mut().next.take() {
                        Some(new_front) => {
                            new_front.borrow_mut().prev.take();
                            self.front = Some(new_front);   // 更新头节点
                        }
                        None => {
                            self.rear.take();
                        }
                    }
                    self.que_size -= 1; // 更新队列长度
                    Rc::try_unwrap(old_front).ok().unwrap().into_inner().val
                })
            
            } 
            // 队尾出队操作
            else {
                self.rear.take().map(|old_rear| {
                    match old_rear.borrow_mut().prev.take() {
                        Some(new_rear) => {
                            new_rear.borrow_mut().next.take();
                            self.rear = Some(new_rear);     // 更新尾节点
                        }
                        None => {
                            self.front.take();
                        }
                    }
                    self.que_size -= 1; // 更新队列长度
                    Rc::try_unwrap(old_rear).ok().unwrap().into_inner().val
                })
            }
        }

        /* 队首出队 */
        pub fn pop_first(&mut self) -> Option<T> {
            return self.pop(true);
        }

        /* 队尾出队 */
        pub fn pop_last(&mut self) -> Option<T> {
            return self.pop(false);
        }

        /* 访问队首元素 */
        pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.front.as_ref()
        }

        /* 访问队尾元素 */
        pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.rear.as_ref()
        }

        /* 返回数组用于打印 */
        pub fn to_array(&self, head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
            if let Some(node) = head {
                let mut nums = self.to_array(node.borrow().next.as_ref());
                nums.insert(0, node.borrow().val);
                return nums;
            }
            return Vec::new();
        }
    }
    ```

=== "C"

    ```c title="linkedlist_deque.c"
    /* 双向链表节点 */
    typedef struct DoublyListNode {
        int val;                     // 节点值
        struct DoublyListNode *next; // 后继节点
        struct DoublyListNode *prev; // 前驱节点
    } DoublyListNode;

    /* 构造函数 */
    DoublyListNode *newDoublyListNode(int num) {
        DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
        new->val = num;
        new->next = NULL;
        new->prev = NULL;
        return new;
    }

    /* 析构函数 */
    void delDoublyListNode(DoublyListNode *node) {
        free(node);
    }

    /* 基于双向链表实现的双向队列 */
    typedef struct {
        DoublyListNode *front, *rear; // 头节点 front ，尾节点 rear
        int queSize;                  // 双向队列的长度
    } LinkedListDeque;

    /* 构造函数 */
    LinkedListDeque *newLinkedListDeque() {
        LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
        deque->front = NULL;
        deque->rear = NULL;
        deque->queSize = 0;
        return deque;
    }

    /* 析构函数 */
    void delLinkedListdeque(LinkedListDeque *deque) {
        // 释放所有节点
        for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
            DoublyListNode *tmp = deque->front;
            deque->front = deque->front->next;
            free(tmp);
        }
        // 释放 deque 结构体
        free(deque);
    }

    /* 获取队列的长度 */
    int size(LinkedListDeque *deque) {
        return deque->queSize;
    }

    /* 判断队列是否为空 */
    bool empty(LinkedListDeque *deque) {
        return (size(deque) == 0);
    }

    /* 入队 */
    void push(LinkedListDeque *deque, int num, bool isFront) {
        DoublyListNode *node = newDoublyListNode(num);
        // 若链表为空，则令 front 和 rear 都指向node
        if (empty(deque)) {
            deque->front = deque->rear = node;
        }
        // 队首入队操作
        else if (isFront) {
            // 将 node 添加至链表头部
            deque->front->prev = node;
            node->next = deque->front;
            deque->front = node; // 更新头节点
        }
        // 队尾入队操作
        else {
            // 将 node 添加至链表尾部
            deque->rear->next = node;
            node->prev = deque->rear;
            deque->rear = node;
        }
        deque->queSize++; // 更新队列长度
    }

    /* 队首入队 */
    void pushFirst(LinkedListDeque *deque, int num) {
        push(deque, num, true);
    }

    /* 队尾入队 */
    void pushLast(LinkedListDeque *deque, int num) {
        push(deque, num, false);
    }

    /* 访问队首元素 */
    int peekFirst(LinkedListDeque *deque) {
        assert(size(deque) && deque->front);
        return deque->front->val;
    }

    /* 访问队尾元素 */
    int peekLast(LinkedListDeque *deque) {
        assert(size(deque) && deque->rear);
        return deque->rear->val;
    }

    /* 出队 */
    int pop(LinkedListDeque *deque, bool isFront) {
        if (empty(deque))
            return -1;
        int val;
        // 队首出队操作
        if (isFront) {
            val = peekFirst(deque); // 暂存头节点值
            DoublyListNode *fNext = deque->front->next;
            if (fNext) {
                fNext->prev = NULL;
                deque->front->next = NULL;
                delDoublyListNode(deque->front);
            }
            deque->front = fNext; // 更新头节点
        }
        // 队尾出队操作
        else {
            val = peekLast(deque); // 暂存尾节点值
            DoublyListNode *rPrev = deque->rear->prev;
            if (rPrev) {
                rPrev->next = NULL;
                deque->rear->prev = NULL;
                delDoublyListNode(deque->rear);
            }
            deque->rear = rPrev; // 更新尾节点
        }
        deque->queSize--; // 更新队列长度
        return val;
    }

    /* 队首出队 */
    int popFirst(LinkedListDeque *deque) {
        return pop(deque, true);
    }

    /* 队尾出队 */
    int popLast(LinkedListDeque *deque) {
        return pop(deque, false);
    }

    /* 打印队列 */
    void printLinkedListDeque(LinkedListDeque *deque) {
        int *arr = malloc(sizeof(int) * deque->queSize);
        // 拷贝链表中的数据到数组
        int i;
        DoublyListNode *node;
        for (i = 0, node = deque->front; i < deque->queSize; i++) {
            arr[i] = node->val;
            node = node->next;
        }
        printArray(arr, deque->queSize);
        free(arr);
    }
    ```

=== "Zig"

    ```zig title="linkedlist_deque.zig"
    // 双向链表节点
    fn ListNode(comptime T: type) type {
        return struct {
            const Self = @This();
            
            val: T = undefined,     // 节点值
            next: ?*Self = null,    // 后继节点指针
            prev: ?*Self = null,    // 前驱节点指针

            // Initialize a list node with specific value
            pub fn init(self: *Self, x: i32) void {
                self.val = x;
                self.next = null;
                self.prev = null;
            }
        };
    }

    // 基于双向链表实现的双向队列
    fn LinkedListDeque(comptime T: type) type {
        return struct {
            const Self = @This();

            front: ?*ListNode(T) = null,                    // 头节点 front
            rear: ?*ListNode(T) = null,                     // 尾节点 rear
            que_size: usize = 0,                             // 双向队列的长度
            mem_arena: ?std.heap.ArenaAllocator = null,
            mem_allocator: std.mem.Allocator = undefined,   // 内存分配器

            // 构造函数（分配内存+初始化队列）
            pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
                if (self.mem_arena == null) {
                    self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                    self.mem_allocator = self.mem_arena.?.allocator();
                }
                self.front = null;
                self.rear = null;
                self.que_size = 0;
            }

            // 析构函数（释放内存）
            pub fn deinit(self: *Self) void {
                if (self.mem_arena == null) return;
                self.mem_arena.?.deinit();
            }

            // 获取双向队列的长度
            pub fn size(self: *Self) usize {
                return self.que_size;
            }

            // 判断双向队列是否为空
            pub fn isEmpty(self: *Self) bool {
                return self.size() == 0;
            }

            // 入队操作
            pub fn push(self: *Self, num: T, is_front: bool) !void {
                var node = try self.mem_allocator.create(ListNode(T));
                node.init(num);
                // 若链表为空，则令 front 和 rear 都指向 node
                if (self.isEmpty()) {
                    self.front = node;
                    self.rear = node;
                // 队首入队操作
                } else if (is_front) {
                    // 将 node 添加至链表头部
                    self.front.?.prev = node;
                    node.next = self.front;
                    self.front = node;  // 更新头节点
                // 队尾入队操作
                } else {
                    // 将 node 添加至链表尾部
                    self.rear.?.next = node;
                    node.prev = self.rear;
                    self.rear = node;   // 更新尾节点
                }
                self.que_size += 1;      // 更新队列长度
            } 

            // 队首入队
            pub fn pushFirst(self: *Self, num: T) !void {
                try self.push(num, true);
            } 

            // 队尾入队
            pub fn pushLast(self: *Self, num: T) !void {
                try self.push(num, false);
            } 
            
            // 出队操作
            pub fn pop(self: *Self, is_front: bool) T {
                if (self.isEmpty()) @panic("双向队列为空");
                var val: T = undefined;
                // 队首出队操作
                if (is_front) {
                    val = self.front.?.val;     // 暂存头节点值
                    // 删除头节点
                    var fNext = self.front.?.next;
                    if (fNext != null) {
                        fNext.?.prev = null;
                        self.front.?.next = null;
                    }
                    self.front = fNext;         // 更新头节点
                // 队尾出队操作
                } else {
                    val = self.rear.?.val;      // 暂存尾节点值
                    // 删除尾节点
                    var rPrev = self.rear.?.prev;
                    if (rPrev != null) {
                        rPrev.?.next = null;
                        self.rear.?.prev = null;
                    }
                    self.rear = rPrev;          // 更新尾节点
                }
                self.que_size -= 1;              // 更新队列长度
                return val;
            } 

            // 队首出队
            pub fn popFirst(self: *Self) T {
                return self.pop(true);
            } 

            // 队尾出队
            pub fn popLast(self: *Self) T {
                return self.pop(false);
            } 

            // 访问队首元素
            pub fn peekFirst(self: *Self) T {
                if (self.isEmpty()) @panic("双向队列为空");
                return self.front.?.val;
            }  

            // 访问队尾元素
            pub fn peekLast(self: *Self) T {
                if (self.isEmpty()) @panic("双向队列为空");
                return self.rear.?.val;
            }

            // 返回数组用于打印
            pub fn toArray(self: *Self) ![]T {
                var node = self.front;
                var res = try self.mem_allocator.alloc(T, self.size());
                @memset(res, @as(T, 0));
                var i: usize = 0;
                while (i < res.len) : (i += 1) {
                    res[i] = node.?.val;
                    node = node.?.next;
                }
                return res;
            }
        };
    }
    ```

### 2. &nbsp; 基于数组的实现

如图 5-9 所示，与基于数组实现队列类似，我们也可以使用环形数组来实现双向队列。

=== "ArrayDeque"
    ![基于数组实现双向队列的入队出队操作](deque.assets/array_deque.png){ class="animation-figure" }

=== "push_last()"
    ![array_deque_push_last](deque.assets/array_deque_push_last.png){ class="animation-figure" }

=== "push_first()"
    ![array_deque_push_first](deque.assets/array_deque_push_first.png){ class="animation-figure" }

=== "pop_last()"
    ![array_deque_pop_last](deque.assets/array_deque_pop_last.png){ class="animation-figure" }

=== "pop_first()"
    ![array_deque_pop_first](deque.assets/array_deque_pop_first.png){ class="animation-figure" }

<p align="center"> 图 5-9 &nbsp; 基于数组实现双向队列的入队出队操作 </p>

在队列的实现基础上，仅需增加“队首入队”和“队尾出队”的方法：

=== "Python"

    ```python title="array_deque.py"
    class ArrayDeque:
        """基于环形数组实现的双向队列"""

        def __init__(self, capacity: int):
            """构造方法"""
            self._nums: list[int] = [0] * capacity
            self._front: int = 0
            self._size: int = 0

        def capacity(self) -> int:
            """获取双向队列的容量"""
            return len(self._nums)

        def size(self) -> int:
            """获取双向队列的长度"""
            return self._size

        def is_empty(self) -> bool:
            """判断双向队列是否为空"""
            return self._size == 0

        def index(self, i: int) -> int:
            """计算环形数组索引"""
            # 通过取余操作实现数组首尾相连
            # 当 i 越过数组尾部后，回到头部
            # 当 i 越过数组头部后，回到尾部
            return (i + self.capacity()) % self.capacity()

        def push_first(self, num: int):
            """队首入队"""
            if self._size == self.capacity():
                print("双向队列已满")
                return
            # 队首指针向左移动一位
            # 通过取余操作实现 front 越过数组头部后回到尾部
            self._front = self.index(self._front - 1)
            # 将 num 添加至队首
            self._nums[self._front] = num
            self._size += 1

        def push_last(self, num: int):
            """队尾入队"""
            if self._size == self.capacity():
                print("双向队列已满")
                return
            # 计算队尾指针，指向队尾索引 + 1
            rear = self.index(self._front + self._size)
            # 将 num 添加至队尾
            self._nums[rear] = num
            self._size += 1

        def pop_first(self) -> int:
            """队首出队"""
            num = self.peek_first()
            # 队首指针向后移动一位
            self._front = self.index(self._front + 1)
            self._size -= 1
            return num

        def pop_last(self) -> int:
            """队尾出队"""
            num = self.peek_last()
            self._size -= 1
            return num

        def peek_first(self) -> int:
            """访问队首元素"""
            if self.is_empty():
                raise IndexError("双向队列为空")
            return self._nums[self._front]

        def peek_last(self) -> int:
            """访问队尾元素"""
            if self.is_empty():
                raise IndexError("双向队列为空")
            # 计算尾元素索引
            last = self.index(self._front + self._size - 1)
            return self._nums[last]

        def to_array(self) -> list[int]:
            """返回数组用于打印"""
            # 仅转换有效长度范围内的列表元素
            res = []
            for i in range(self._size):
                res.append(self._nums[self.index(self._front + i)])
            return res
    ```

=== "C++"

    ```cpp title="array_deque.cpp"
    /* 基于环形数组实现的双向队列 */
    class ArrayDeque {
      private:
        vector<int> nums; // 用于存储双向队列元素的数组
        int front;        // 队首指针，指向队首元素
        int queSize;      // 双向队列长度

      public:
        /* 构造方法 */
        ArrayDeque(int capacity) {
            nums.resize(capacity);
            front = queSize = 0;
        }

        /* 获取双向队列的容量 */
        int capacity() {
            return nums.size();
        }

        /* 获取双向队列的长度 */
        int size() {
            return queSize;
        }

        /* 判断双向队列是否为空 */
        bool isEmpty() {
            return queSize == 0;
        }

        /* 计算环形数组索引 */
        int index(int i) {
            // 通过取余操作实现数组首尾相连
            // 当 i 越过数组尾部后，回到头部
            // 当 i 越过数组头部后，回到尾部
            return (i + capacity()) % capacity();
        }

        /* 队首入队 */
        void pushFirst(int num) {
            if (queSize == capacity()) {
                cout << "双向队列已满" << endl;
                return;
            }
            // 队首指针向左移动一位
            // 通过取余操作实现 front 越过数组头部后回到尾部
            front = index(front - 1);
            // 将 num 添加至队首
            nums[front] = num;
            queSize++;
        }

        /* 队尾入队 */
        void pushLast(int num) {
            if (queSize == capacity()) {
                cout << "双向队列已满" << endl;
                return;
            }
            // 计算队尾指针，指向队尾索引 + 1
            int rear = index(front + queSize);
            // 将 num 添加至队尾
            nums[rear] = num;
            queSize++;
        }

        /* 队首出队 */
        int popFirst() {
            int num = peekFirst();
            // 队首指针向后移动一位
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* 队尾出队 */
        int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* 访问队首元素 */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("双向队列为空");
            return nums[front];
        }

        /* 访问队尾元素 */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("双向队列为空");
            // 计算尾元素索引
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* 返回数组用于打印 */
        vector<int> toVector() {
            // 仅转换有效长度范围内的列表元素
            vector<int> res(queSize);
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[index(j)];
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="array_deque.java"
    /* 基于环形数组实现的双向队列 */
    class ArrayDeque {
        private int[] nums; // 用于存储双向队列元素的数组
        private int front; // 队首指针，指向队首元素
        private int queSize; // 双向队列长度

        /* 构造方法 */
        public ArrayDeque(int capacity) {
            this.nums = new int[capacity];
            front = queSize = 0;
        }

        /* 获取双向队列的容量 */
        public int capacity() {
            return nums.length;
        }

        /* 获取双向队列的长度 */
        public int size() {
            return queSize;
        }

        /* 判断双向队列是否为空 */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* 计算环形数组索引 */
        private int index(int i) {
            // 通过取余操作实现数组首尾相连
            // 当 i 越过数组尾部后，回到头部
            // 当 i 越过数组头部后，回到尾部
            return (i + capacity()) % capacity();
        }

        /* 队首入队 */
        public void pushFirst(int num) {
            if (queSize == capacity()) {
                System.out.println("双向队列已满");
                return;
            }
            // 队首指针向左移动一位
            // 通过取余操作实现 front 越过数组头部后回到尾部
            front = index(front - 1);
            // 将 num 添加至队首
            nums[front] = num;
            queSize++;
        }

        /* 队尾入队 */
        public void pushLast(int num) {
            if (queSize == capacity()) {
                System.out.println("双向队列已满");
                return;
            }
            // 计算队尾指针，指向队尾索引 + 1
            int rear = index(front + queSize);
            // 将 num 添加至队尾
            nums[rear] = num;
            queSize++;
        }

        /* 队首出队 */
        public int popFirst() {
            int num = peekFirst();
            // 队首指针向后移动一位
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* 队尾出队 */
        public int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* 访问队首元素 */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* 访问队尾元素 */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            // 计算尾元素索引
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* 返回数组用于打印 */
        public int[] toArray() {
            // 仅转换有效长度范围内的列表元素
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[index(j)];
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_deque.cs"
    /* 基于环形数组实现的双向队列 */
    class ArrayDeque {
        int[] nums;  // 用于存储双向队列元素的数组
        int front;   // 队首指针，指向队首元素
        int queSize; // 双向队列长度

        /* 构造方法 */
        public ArrayDeque(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* 获取双向队列的容量 */
        int Capacity() {
            return nums.Length;
        }

        /* 获取双向队列的长度 */
        public int Size() {
            return queSize;
        }

        /* 判断双向队列是否为空 */
        public bool IsEmpty() {
            return queSize == 0;
        }

        /* 计算环形数组索引 */
        int Index(int i) {
            // 通过取余操作实现数组首尾相连
            // 当 i 越过数组尾部后，回到头部
            // 当 i 越过数组头部后，回到尾部
            return (i + Capacity()) % Capacity();
        }

        /* 队首入队 */
        public void PushFirst(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("双向队列已满");
                return;
            }
            // 队首指针向左移动一位
            // 通过取余操作实现 front 越过数组头部后回到尾部
            front = Index(front - 1);
            // 将 num 添加至队首
            nums[front] = num;
            queSize++;
        }

        /* 队尾入队 */
        public void PushLast(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("双向队列已满");
                return;
            }
            // 计算队尾指针，指向队尾索引 + 1
            int rear = Index(front + queSize);
            // 将 num 添加至队尾
            nums[rear] = num;
            queSize++;
        }

        /* 队首出队 */
        public int PopFirst() {
            int num = PeekFirst();
            // 队首指针向后移动一位
            front = Index(front + 1);
            queSize--;
            return num;
        }

        /* 队尾出队 */
        public int PopLast() {
            int num = PeekLast();
            queSize--;
            return num;
        }

        /* 访问队首元素 */
        public int PeekFirst() {
            if (IsEmpty()) {
                throw new InvalidOperationException();
            }
            return nums[front];
        }

        /* 访问队尾元素 */
        public int PeekLast() {
            if (IsEmpty()) {
                throw new InvalidOperationException();
            }
            // 计算尾元素索引
            int last = Index(front + queSize - 1);
            return nums[last];
        }

        /* 返回数组用于打印 */
        public int[] ToArray() {
            // 仅转换有效长度范围内的列表元素
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[Index(j)];
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_deque.go"
    /* 基于环形数组实现的双向队列 */
    type arrayDeque struct {
        nums        []int // 用于存储双向队列元素的数组
        front       int   // 队首指针，指向队首元素
        queSize     int   // 双向队列长度
        queCapacity int   // 队列容量（即最大容纳元素数量）
    }

    /* 初始化队列 */
    func newArrayDeque(queCapacity int) *arrayDeque {
        return &arrayDeque{
            nums:        make([]int, queCapacity),
            queCapacity: queCapacity,
            front:       0,
            queSize:     0,
        }
    }

    /* 获取双向队列的长度 */
    func (q *arrayDeque) size() int {
        return q.queSize
    }

    /* 判断双向队列是否为空 */
    func (q *arrayDeque) isEmpty() bool {
        return q.queSize == 0
    }

    /* 计算环形数组索引 */
    func (q *arrayDeque) index(i int) int {
        // 通过取余操作实现数组首尾相连
        // 当 i 越过数组尾部后，回到头部
        // 当 i 越过数组头部后，回到尾部
        return (i + q.queCapacity) % q.queCapacity
    }

    /* 队首入队 */
    func (q *arrayDeque) pushFirst(num int) {
        if q.queSize == q.queCapacity {
            fmt.Println("双向队列已满")
            return
        }
        // 队首指针向左移动一位
        // 通过取余操作实现 front 越过数组头部后回到尾部
        q.front = q.index(q.front - 1)
        // 将 num 添加至队首
        q.nums[q.front] = num
        q.queSize++
    }

    /* 队尾入队 */
    func (q *arrayDeque) pushLast(num int) {
        if q.queSize == q.queCapacity {
            fmt.Println("双向队列已满")
            return
        }
        // 计算队尾指针，指向队尾索引 + 1
        rear := q.index(q.front + q.queSize)
        // 将 num 添加至队首
        q.nums[rear] = num
        q.queSize++
    }

    /* 队首出队 */
    func (q *arrayDeque) popFirst() any {
        num := q.peekFirst()
        // 队首指针向后移动一位
        q.front = q.index(q.front + 1)
        q.queSize--
        return num
    }

    /* 队尾出队 */
    func (q *arrayDeque) popLast() any {
        num := q.peekLast()
        q.queSize--
        return num
    }

    /* 访问队首元素 */
    func (q *arrayDeque) peekFirst() any {
        if q.isEmpty() {
            return nil
        }
        return q.nums[q.front]
    }

    /* 访问队尾元素 */
    func (q *arrayDeque) peekLast() any {
        if q.isEmpty() {
            return nil
        }
        // 计算尾元素索引
        last := q.index(q.front + q.queSize - 1)
        return q.nums[last]
    }

    /* 获取 Slice 用于打印 */
    func (q *arrayDeque) toSlice() []int {
        // 仅转换有效长度范围内的列表元素
        res := make([]int, q.queSize)
        for i, j := 0, q.front; i < q.queSize; i++ {
            res[i] = q.nums[q.index(j)]
            j++
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="array_deque.swift"
    /* 基于环形数组实现的双向队列 */
    class ArrayDeque {
        private var nums: [Int] // 用于存储双向队列元素的数组
        private var front: Int // 队首指针，指向队首元素
        private var queSize: Int // 双向队列长度

        /* 构造方法 */
        init(capacity: Int) {
            nums = Array(repeating: 0, count: capacity)
            front = 0
            queSize = 0
        }

        /* 获取双向队列的容量 */
        func capacity() -> Int {
            nums.count
        }

        /* 获取双向队列的长度 */
        func size() -> Int {
            queSize
        }

        /* 判断双向队列是否为空 */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* 计算环形数组索引 */
        private func index(i: Int) -> Int {
            // 通过取余操作实现数组首尾相连
            // 当 i 越过数组尾部后，回到头部
            // 当 i 越过数组头部后，回到尾部
            (i + capacity()) % capacity()
        }

        /* 队首入队 */
        func pushFirst(num: Int) {
            if size() == capacity() {
                print("双向队列已满")
                return
            }
            // 队首指针向左移动一位
            // 通过取余操作实现 front 越过数组头部后回到尾部
            front = index(i: front - 1)
            // 将 num 添加至队首
            nums[front] = num
            queSize += 1
        }

        /* 队尾入队 */
        func pushLast(num: Int) {
            if size() == capacity() {
                print("双向队列已满")
                return
            }
            // 计算队尾指针，指向队尾索引 + 1
            let rear = index(i: front + size())
            // 将 num 添加至队尾
            nums[rear] = num
            queSize += 1
        }

        /* 队首出队 */
        func popFirst() -> Int {
            let num = peekFirst()
            // 队首指针向后移动一位
            front = index(i: front + 1)
            queSize -= 1
            return num
        }

        /* 队尾出队 */
        func popLast() -> Int {
            let num = peekLast()
            queSize -= 1
            return num
        }

        /* 访问队首元素 */
        func peekFirst() -> Int {
            if isEmpty() {
                fatalError("双向队列为空")
            }
            return nums[front]
        }

        /* 访问队尾元素 */
        func peekLast() -> Int {
            if isEmpty() {
                fatalError("双向队列为空")
            }
            // 计算尾元素索引
            let last = index(i: front + size() - 1)
            return nums[last]
        }

        /* 返回数组用于打印 */
        func toArray() -> [Int] {
            // 仅转换有效长度范围内的列表元素
            var res = Array(repeating: 0, count: size())
            for (i, j) in sequence(first: (0, front), next: { $0 < self.size() - 1 ? ($0 + 1, $1 + 1) : nil }) {
                res[i] = nums[index(i: j)]
            }
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="array_deque.js"
    /* 基于环形数组实现的双向队列 */
    class ArrayDeque {
        #nums; // 用于存储双向队列元素的数组
        #front; // 队首指针，指向队首元素
        #queSize; // 双向队列长度

        /* 构造方法 */
        constructor(capacity) {
            this.#nums = new Array(capacity);
            this.#front = 0;
            this.#queSize = 0;
        }

        /* 获取双向队列的容量 */
        capacity() {
            return this.#nums.length;
        }

        /* 获取双向队列的长度 */
        size() {
            return this.#queSize;
        }

        /* 判断双向队列是否为空 */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* 计算环形数组索引 */
        index(i) {
            // 通过取余操作实现数组首尾相连
            // 当 i 越过数组尾部后，回到头部
            // 当 i 越过数组头部后，回到尾部
            return (i + this.capacity()) % this.capacity();
        }

        /* 队首入队 */
        pushFirst(num) {
            if (this.#queSize === this.capacity()) {
                console.log('双向队列已满');
                return;
            }
            // 队首指针向左移动一位
            // 通过取余操作实现 front 越过数组头部后回到尾部
            this.#front = this.index(this.#front - 1);
            // 将 num 添加至队首
            this.#nums[this.#front] = num;
            this.#queSize++;
        }

        /* 队尾入队 */
        pushLast(num) {
            if (this.#queSize === this.capacity()) {
                console.log('双向队列已满');
                return;
            }
            // 计算队尾指针，指向队尾索引 + 1
            const rear = this.index(this.#front + this.#queSize);
            // 将 num 添加至队尾
            this.#nums[rear] = num;
            this.#queSize++;
        }

        /* 队首出队 */
        popFirst() {
            const num = this.peekFirst();
            // 队首指针向后移动一位
            this.#front = this.index(this.#front + 1);
            this.#queSize--;
            return num;
        }

        /* 队尾出队 */
        popLast() {
            const num = this.peekLast();
            this.#queSize--;
            return num;
        }

        /* 访问队首元素 */
        peekFirst() {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            return this.#nums[this.#front];
        }

        /* 访问队尾元素 */
        peekLast() {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            // 计算尾元素索引
            const last = this.index(this.#front + this.#queSize - 1);
            return this.#nums[last];
        }

        /* 返回数组用于打印 */
        toArray() {
            // 仅转换有效长度范围内的列表元素
            const res = [];
            for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
                res[i] = this.#nums[this.index(j)];
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="array_deque.ts"
    /* 基于环形数组实现的双向队列 */
    class ArrayDeque {
        private nums: number[]; // 用于存储双向队列元素的数组
        private front: number; // 队首指针，指向队首元素
        private queSize: number; // 双向队列长度

        /* 构造方法 */
        constructor(capacity: number) {
            this.nums = new Array(capacity);
            this.front = 0;
            this.queSize = 0;
        }

        /* 获取双向队列的容量 */
        capacity(): number {
            return this.nums.length;
        }

        /* 获取双向队列的长度 */
        size(): number {
            return this.queSize;
        }

        /* 判断双向队列是否为空 */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* 计算环形数组索引 */
        index(i: number): number {
            // 通过取余操作实现数组首尾相连
            // 当 i 越过数组尾部后，回到头部
            // 当 i 越过数组头部后，回到尾部
            return (i + this.capacity()) % this.capacity();
        }

        /* 队首入队 */
        pushFirst(num: number): void {
            if (this.queSize === this.capacity()) {
                console.log('双向队列已满');
                return;
            }
            // 队首指针向左移动一位
            // 通过取余操作实现 front 越过数组头部后回到尾部
            this.front = this.index(this.front - 1);
            // 将 num 添加至队首
            this.nums[this.front] = num;
            this.queSize++;
        }

        /* 队尾入队 */
        pushLast(num: number): void {
            if (this.queSize === this.capacity()) {
                console.log('双向队列已满');
                return;
            }
            // 计算队尾指针，指向队尾索引 + 1
            const rear: number = this.index(this.front + this.queSize);
            // 将 num 添加至队尾
            this.nums[rear] = num;
            this.queSize++;
        }

        /* 队首出队 */
        popFirst(): number {
            const num: number = this.peekFirst();
            // 队首指针向后移动一位
            this.front = this.index(this.front + 1);
            this.queSize--;
            return num;
        }

        /* 队尾出队 */
        popLast(): number {
            const num: number = this.peekLast();
            this.queSize--;
            return num;
        }

        /* 访问队首元素 */
        peekFirst(): number {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            return this.nums[this.front];
        }

        /* 访问队尾元素 */
        peekLast(): number {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            // 计算尾元素索引
            const last = this.index(this.front + this.queSize - 1);
            return this.nums[last];
        }

        /* 返回数组用于打印 */
        toArray(): number[] {
            // 仅转换有效长度范围内的列表元素
            const res: number[] = [];
            for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
                res[i] = this.nums[this.index(j)];
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="array_deque.dart"
    /* 基于环形数组实现的双向队列 */
    class ArrayDeque {
      late List<int> _nums; // 用于存储双向队列元素的数组
      late int _front; // 队首指针，指向队首元素
      late int _queSize; // 双向队列长度

      /* 构造方法 */
      ArrayDeque(int capacity) {
        this._nums = List.filled(capacity, 0);
        this._front = this._queSize = 0;
      }

      /* 获取双向队列的容量 */
      int capacity() {
        return _nums.length;
      }

      /* 获取双向队列的长度 */
      int size() {
        return _queSize;
      }

      /* 判断双向队列是否为空 */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* 计算环形数组索引 */
      int index(int i) {
        // 通过取余操作实现数组首尾相连
        // 当 i 越过数组尾部后，回到头部
        // 当 i 越过数组头部后，回到尾部
        return (i + capacity()) % capacity();
      }

      /* 队首入队 */
      void pushFirst(int _num) {
        if (_queSize == capacity()) {
          throw Exception("双向队列已满");
        }
        // 队首指针向左移动一位
        // 通过取余操作实现 _front 越过数组头部后回到尾部
        _front = index(_front - 1);
        // 将 _num 添加至队首
        _nums[_front] = _num;
        _queSize++;
      }

      /* 队尾入队 */
      void pushLast(int _num) {
        if (_queSize == capacity()) {
          throw Exception("双向队列已满");
        }
        // 计算队尾指针，指向队尾索引 + 1
        int rear = index(_front + _queSize);
        // 将 _num 添加至队尾
        _nums[rear] = _num;
        _queSize++;
      }

      /* 队首出队 */
      int popFirst() {
        int _num = peekFirst();
        // 队首指针向右移动一位
        _front = index(_front + 1);
        _queSize--;
        return _num;
      }

      /* 队尾出队 */
      int popLast() {
        int _num = peekLast();
        _queSize--;
        return _num;
      }

      /* 访问队首元素 */
      int peekFirst() {
        if (isEmpty()) {
          throw Exception("双向队列为空");
        }
        return _nums[_front];
      }

      /* 访问队尾元素 */
      int peekLast() {
        if (isEmpty()) {
          throw Exception("双向队列为空");
        }
        // 计算尾元素索引
        int last = index(_front + _queSize - 1);
        return _nums[last];
      }

      /* 返回数组用于打印 */
      List<int> toArray() {
        // 仅转换有效长度范围内的列表元素
        List<int> res = List.filled(_queSize, 0);
        for (int i = 0, j = _front; i < _queSize; i++, j++) {
          res[i] = _nums[index(j)];
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_deque.rs"
    /* 基于环形数组实现的双向队列 */
    struct ArrayDeque {
        nums: Vec<i32>,     // 用于存储双向队列元素的数组
        front: usize,       // 队首指针，指向队首元素
        que_size: usize,    // 双向队列长度
    }

    impl ArrayDeque {
        /* 构造方法 */
        pub fn new(capacity: usize) -> Self {
            Self {
                nums: vec![0; capacity],
                front: 0,
                que_size: 0,
            }
        }

        /* 获取双向队列的容量 */
        pub fn capacity(&self) -> usize {
            self.nums.len()
        }

        /* 获取双向队列的长度 */
        pub fn size(&self) -> usize {
            self.que_size
        }

        /* 判断双向队列是否为空 */
        pub fn is_empty(&self) -> bool {
            self.que_size == 0
        }

        /* 计算环形数组索引 */
        fn index(&self, i: i32) -> usize {
            // 通过取余操作实现数组首尾相连
            // 当 i 越过数组尾部后，回到头部
            // 当 i 越过数组头部后，回到尾部
            return ((i + self.capacity() as i32) % self.capacity() as i32) as usize;
        }

        /* 队首入队 */
        pub fn push_first(&mut self, num: i32) {
            if self.que_size == self.capacity() {
                println!("双向队列已满");
                return
            }
            // 队首指针向左移动一位
            // 通过取余操作实现 front 越过数组头部后回到尾部
            self.front = self.index(self.front as i32 - 1);
            // 将 num 添加至队首
            self.nums[self.front] = num;
            self.que_size += 1;
        }

        /* 队尾入队 */
        pub fn push_last(&mut self, num: i32) {
            if self.que_size == self.capacity() {
                println!("双向队列已满");
                return
            }
            // 计算队尾指针，指向队尾索引 + 1
            let rear = self.index(self.front as i32 + self.que_size as i32);
            // 将 num 添加至队尾
            self.nums[rear] = num;
            self.que_size += 1;
        }

        /* 队首出队 */
        fn pop_first(&mut self) -> i32 {
            let num = self.peek_first();
            // 队首指针向后移动一位
            self.front = self.index(self.front as i32 + 1);
            self.que_size -= 1;
            num
        }

        /* 队尾出队 */
        fn pop_last(&mut self) -> i32 {
            let num = self.peek_last();
            self.que_size -= 1;
            num
        }

        /* 访问队首元素 */
        fn peek_first(&self) -> i32 {
            if self.is_empty() { panic!("双向队列为空") };
            self.nums[self.front]
        }

        /* 访问队尾元素 */
        fn peek_last(&self) -> i32 {
            if self.is_empty() { panic!("双向队列为空") };
            // 计算尾元素索引
            let last = self.index(self.front as i32 + self.que_size as i32 - 1);
            self.nums[last]
        }
        
        /* 返回数组用于打印 */
        fn to_array(&self) -> Vec<i32> {
            // 仅转换有效长度范围内的列表元素
            let mut res = vec![0; self.que_size];
            let mut j = self.front;
            for i in 0..self.que_size {
                res[i] = self.nums[self.index(j as i32)];
                j += 1;
            }
            res
        }
    }
    ```

=== "C"

    ```c title="array_deque.c"
    /* 基于环形数组实现的双向队列 */
    typedef struct {
        int *nums;       // 用于存储队列元素的数组
        int front;       // 队首指针，指向队首元素
        int queSize;     // 尾指针，指向队尾 + 1
        int queCapacity; // 队列容量
    } ArrayDeque;

    /* 构造函数 */
    ArrayDeque *newArrayDeque(int capacity) {
        ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
        // 初始化数组
        deque->queCapacity = capacity;
        deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
        deque->front = deque->queSize = 0;
        return deque;
    }

    /* 析构函数 */
    void delArrayDeque(ArrayDeque *deque) {
        free(deque->nums);
        free(deque);
    }

    /* 获取双向队列的容量 */
    int capacity(ArrayDeque *deque) {
        return deque->queCapacity;
    }

    /* 获取双向队列的长度 */
    int size(ArrayDeque *deque) {
        return deque->queSize;
    }

    /* 判断双向队列是否为空 */
    bool empty(ArrayDeque *deque) {
        return deque->queSize == 0;
    }

    /* 计算环形数组索引 */
    int dequeIndex(ArrayDeque *deque, int i) {
        // 通过取余操作实现数组首尾相连
        // 当 i 越过数组尾部时，回到头部
        // 当 i 越过数组头部后，回到尾部
        return ((i + capacity(deque)) % capacity(deque));
    }

    /* 队首入队 */
    void pushFirst(ArrayDeque *deque, int num) {
        if (deque->queSize == capacity(deque)) {
            printf("双向队列已满\r\n");
            return;
        }
        // 队首指针向左移动一位
        // 通过取余操作实现 front 越过数组头部回到尾部
        deque->front = dequeIndex(deque, deque->front - 1);
        // 将 num 添加到队首
        deque->nums[deque->front] = num;
        deque->queSize++;
    }

    /* 队尾入队 */
    void pushLast(ArrayDeque *deque, int num) {
        if (deque->queSize == capacity(deque)) {
            printf("双向队列已满\r\n");
            return;
        }
        // 计算队尾指针，指向队尾索引 + 1
        int rear = dequeIndex(deque, deque->front + deque->queSize);
        // 将 num 添加至队尾
        deque->nums[rear] = num;
        deque->queSize++;
    }

    /* 访问队首元素 */
    int peekFirst(ArrayDeque *deque) {
        // 访问异常：双向队列为空
        assert(empty(deque) == 0);
        return deque->nums[deque->front];
    }

    /* 访问队尾元素 */
    int peekLast(ArrayDeque *deque) {
        // 访问异常：双向队列为空
        assert(empty(deque) == 0);
        int last = dequeIndex(deque, deque->front + deque->queSize - 1);
        return deque->nums[last];
    }

    /* 队首出队 */
    int popFirst(ArrayDeque *deque) {
        int num = peekFirst(deque);
        // 队首指针向后移动一位
        deque->front = dequeIndex(deque, deque->front + 1);
        deque->queSize--;
        return num;
    }

    /* 队尾出队 */
    int popLast(ArrayDeque *deque) {
        int num = peekLast(deque);
        deque->queSize--;
        return num;
    }
    ```

=== "Zig"

    ```zig title="array_deque.zig"
    [class]{ArrayDeque}-[func]{}
    ```

## 5.3.3 &nbsp; 双向队列应用

双向队列兼具栈与队列的逻辑，**因此它可以实现这两者的所有应用场景，同时提供更高的自由度**。

我们知道，软件的“撤销”功能通常使用栈来实现：系统将每次更改操作 `push` 到栈中，然后通过 `pop` 实现撤销。然而，考虑到系统资源的限制，软件通常会限制撤销的步数（例如仅允许保存 $50$ 步）。当栈的长度超过 $50$ 时，软件需要在栈底（队首）执行删除操作。**但栈无法实现该功能，此时就需要使用双向队列来替代栈**。请注意，“撤销”的核心逻辑仍然遵循栈的先入后出原则，只是双向队列能够更加灵活地实现一些额外逻辑。
