# 队列

「队列 queue」是一种遵循先入先出规则的线性数据结构。顾名思义，队列模拟了排队现象，即新来的人不断加入队列的尾部，而位于队列头部的人逐个离开。

如下图所示，我们将队列的头部称为“队首”，尾部称为“队尾”，将把元素加入队尾的操作称为“入队”，删除队首元素的操作称为“出队”。

![队列的先入先出规则](queue.assets/queue_operations.png)

## 队列常用操作

队列的常见操作如下表所示。需要注意的是，不同编程语言的方法名称可能会有所不同。我们在此采用与栈相同的方法命名。

<p align="center"> 表 <id> &nbsp; 队列操作效率 </p>

| 方法名     | 描述                        | 时间复杂度 |
| --------- | -------------------------- | -------- |
| push()    | 元素入队，即将元素添加至队尾    | $O(1)$   |
| pop()     | 队首元素出队                 | $O(1)$   |
| peek()    | 访问队首元素                 | $O(1)$   |

我们可以直接使用编程语言中现成的队列类。

=== "Python"

    ```python title="queue.py"
    # 初始化队列
    # 在 Python 中，我们一般将双向队列类 deque 看作队列使用
    # 虽然 queue.Queue() 是纯正的队列类，但不太好用，因此不建议
    que: deque[int] = collections.deque()
    
    # 元素入队
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    
    # 访问队首元素
    front: int = que[0];
    
    # 元素出队
    pop: int = que.popleft()
    
    # 获取队列的长度
    size: int = len(que)
    
    # 判断队列是否为空
    is_empty: bool = len(que) == 0
    ```

=== "C++"

    ```cpp title="queue.cpp"
    /* 初始化队列 */
    queue<int> queue;
    
    /* 元素入队 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    
    /* 访问队首元素 */
    int front = queue.front();
    
    /* 元素出队 */
    queue.pop();
    
    /* 获取队列的长度 */
    int size = queue.size();
    
    /* 判断队列是否为空 */
    bool empty = queue.empty();
    ```

=== "Java"

    ```java title="queue.java"
    /* 初始化队列 */
    Queue<Integer> queue = new LinkedList<>();
    
    /* 元素入队 */
    queue.offer(1);
    queue.offer(3);
    queue.offer(2);
    queue.offer(5);
    queue.offer(4);
    
    /* 访问队首元素 */
    int peek = queue.peek();
    
    /* 元素出队 */
    int pop = queue.poll();
    
    /* 获取队列的长度 */
    int size = queue.size();
    
    /* 判断队列是否为空 */
    boolean isEmpty = queue.isEmpty();
    ```

=== "C#"

    ```csharp title="queue.cs"
    /* 初始化队列 */
    Queue<int> queue = new();
    
    /* 元素入队 */
    queue.Enqueue(1);
    queue.Enqueue(3);
    queue.Enqueue(2);
    queue.Enqueue(5);
    queue.Enqueue(4);
    
    /* 访问队首元素 */
    int peek = queue.Peek();
    
    /* 元素出队 */
    int pop = queue.Dequeue();
    
    /* 获取队列的长度 */
    int size = queue.Count;
    
    /* 判断队列是否为空 */
    bool isEmpty = queue.Count == 0;
    ```

=== "Go"

    ```go title="queue_test.go"
    /* 初始化队列 */
    // 在 Go 中，将 list 作为队列来使用
    queue := list.New()
    
    /* 元素入队 */
    queue.PushBack(1)
    queue.PushBack(3)
    queue.PushBack(2)
    queue.PushBack(5)
    queue.PushBack(4)
    
    /* 访问队首元素 */
    peek := queue.Front()
    
    /* 元素出队 */
    pop := queue.Front()
    queue.Remove(pop)
    
    /* 获取队列的长度 */
    size := queue.Len()
    
    /* 判断队列是否为空 */
    isEmpty := queue.Len() == 0
    ```

=== "Swift"

    ```swift title="queue.swift"
    /* 初始化队列 */
    // Swift 没有内置的队列类，可以把 Array 当作队列来使用
    var queue: [Int] = []
    
    /* 元素入队 */
    queue.append(1)
    queue.append(3)
    queue.append(2)
    queue.append(5)
    queue.append(4)
    
    /* 访问队首元素 */
    let peek = queue.first!
    
    /* 元素出队 */
    // 由于是数组，因此 removeFirst 的复杂度为 O(n)
    let pool = queue.removeFirst()
    
    /* 获取队列的长度 */
    let size = queue.count
    
    /* 判断队列是否为空 */
    let isEmpty = queue.isEmpty
    ```

=== "JS"

    ```javascript title="queue.js"
    /* 初始化队列 */
    // JavaScript 没有内置的队列，可以把 Array 当作队列来使用
    const queue = [];
    
    /* 元素入队 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    
    /* 访问队首元素 */
    const peek = queue[0];
    
    /* 元素出队 */
    // 底层是数组，因此 shift() 方法的时间复杂度为 O(n)
    const pop = queue.shift();
    
    /* 获取队列的长度 */
    const size = queue.length;
    
    /* 判断队列是否为空 */
    const empty = queue.length === 0;
    ```

=== "TS"

    ```typescript title="queue.ts"
    /* 初始化队列 */
    // TypeScript 没有内置的队列，可以把 Array 当作队列来使用 
    const queue: number[] = [];
    
    /* 元素入队 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    
    /* 访问队首元素 */
    const peek = queue[0];
    
    /* 元素出队 */
    // 底层是数组，因此 shift() 方法的时间复杂度为 O(n)
    const pop = queue.shift();
    
    /* 获取队列的长度 */
    const size = queue.length;
    
    /* 判断队列是否为空 */
    const empty = queue.length === 0;
    ```

=== "Dart"

    ```dart title="queue.dart"
    /* 初始化队列 */
    // 在 Dart 中，队列类 Qeque 是双向队列，也可作为队列使用
    Queue<int> queue = Queue();

    /* 元素入队 */
    queue.add(1);
    queue.add(3);
    queue.add(2);
    queue.add(5);
    queue.add(4);

    /* 访问队首元素 */
    int peek = queue.first;

    /* 元素出队 */
    int pop = queue.removeFirst();

    /* 获取队列的长度 */
    int size = queue.length;

    /* 判断队列是否为空 */
    bool isEmpty = queue.isEmpty;
    ```

=== "Rust"

    ```rust title="queue.rs"

    ```

=== "C"

    ```c title="queue.c"
    // C 未提供内置队列
    ```

=== "Zig"

    ```zig title="queue.zig"

    ```

## 队列实现

为了实现队列，我们需要一种数据结构，可以在一端添加元素，并在另一端删除元素。因此，链表和数组都可以用来实现队列。

### 基于链表的实现

如下图所示，我们可以将链表的“头节点”和“尾节点”分别视为“队首”和“队尾”，规定队尾仅可添加节点，队首仅可删除节点。

=== "LinkedListQueue"
    ![基于链表实现队列的入队出队操作](queue.assets/linkedlist_queue.png)

=== "push()"
    ![linkedlist_queue_push](queue.assets/linkedlist_queue_push.png)

=== "pop()"
    ![linkedlist_queue_pop](queue.assets/linkedlist_queue_pop.png)

以下是用链表实现队列的代码。

=== "Python"

    ```python title="linkedlist_queue.py"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "C++"

    ```cpp title="linkedlist_queue.cpp"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Java"

    ```java title="linkedlist_queue.java"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "C#"

    ```csharp title="linkedlist_queue.cs"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Go"

    ```go title="linkedlist_queue.go"
    [class]{linkedListQueue}-[func]{}
    ```

=== "Swift"

    ```swift title="linkedlist_queue.swift"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "JS"

    ```javascript title="linkedlist_queue.js"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "TS"

    ```typescript title="linkedlist_queue.ts"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Dart"

    ```dart title="linkedlist_queue.dart"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Rust"

    ```rust title="linkedlist_queue.rs"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "C"

    ```c title="linkedlist_queue.c"
    [class]{linkedListQueue}-[func]{}
    ```

=== "Zig"

    ```zig title="linkedlist_queue.zig"
    [class]{LinkedListQueue}-[func]{}
    ```

### 基于数组的实现

由于数组删除首元素的时间复杂度为 $O(n)$ ，这会导致出队操作效率较低。然而，我们可以采用以下巧妙方法来避免这个问题。

我们可以使用一个变量 `front` 指向队首元素的索引，并维护一个变量 `size` 用于记录队列长度。定义 `rear = front + size` ，这个公式计算出的 `rear` 指向队尾元素之后的下一个位置。

基于此设计，**数组中包含元素的有效区间为 `[front, rear - 1]`**，各种操作的实现方法如下图所示。

- 入队操作：将输入元素赋值给 `rear` 索引处，并将 `size` 增加 1 。
- 出队操作：只需将 `front` 增加 1 ，并将 `size` 减少 1 。

可以看到，入队和出队操作都只需进行一次操作，时间复杂度均为 $O(1)$ 。

=== "ArrayQueue"
    ![基于数组实现队列的入队出队操作](queue.assets/array_queue.png)

=== "push()"
    ![array_queue_push](queue.assets/array_queue_push.png)

=== "pop()"
    ![array_queue_pop](queue.assets/array_queue_pop.png)

你可能会发现一个问题：在不断进行入队和出队的过程中，`front` 和 `rear` 都在向右移动，**当它们到达数组尾部时就无法继续移动了**。为解决此问题，我们可以将数组视为首尾相接的“环形数组”。

对于环形数组，我们需要让 `front` 或 `rear` 在越过数组尾部时，直接回到数组头部继续遍历。这种周期性规律可以通过“取余操作”来实现，代码如下所示。

=== "Python"

    ```python title="array_queue.py"
    [class]{ArrayQueue}-[func]{}
    ```

=== "C++"

    ```cpp title="array_queue.cpp"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Java"

    ```java title="array_queue.java"
    [class]{ArrayQueue}-[func]{}
    ```

=== "C#"

    ```csharp title="array_queue.cs"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Go"

    ```go title="array_queue.go"
    [class]{arrayQueue}-[func]{}
    ```

=== "Swift"

    ```swift title="array_queue.swift"
    [class]{ArrayQueue}-[func]{}
    ```

=== "JS"

    ```javascript title="array_queue.js"
    [class]{ArrayQueue}-[func]{}
    ```

=== "TS"

    ```typescript title="array_queue.ts"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Dart"

    ```dart title="array_queue.dart"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Rust"

    ```rust title="array_queue.rs"
    [class]{ArrayQueue}-[func]{}
    ```

=== "C"

    ```c title="array_queue.c"
    [class]{arrayQueue}-[func]{}
    ```

=== "Zig"

    ```zig title="array_queue.zig"
    [class]{ArrayQueue}-[func]{}
    ```

以上实现的队列仍然具有局限性，即其长度不可变。然而，这个问题不难解决，我们可以将数组替换为动态数组，从而引入扩容机制。有兴趣的同学可以尝试自行实现。

两种实现的对比结论与栈一致，在此不再赘述。

## 队列典型应用

- **淘宝订单**。购物者下单后，订单将加入队列中，系统随后会根据顺序依次处理队列中的订单。在双十一期间，短时间内会产生海量订单，高并发成为工程师们需要重点攻克的问题。
- **各类待办事项**。任何需要实现“先来后到”功能的场景，例如打印机的任务队列、餐厅的出餐队列等。队列在这些场景中可以有效地维护处理顺序。
