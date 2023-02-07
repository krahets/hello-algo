---
comments: true
---

# 5.3. 双向队列

对于队列，我们只能在头部删除或在尾部添加元素，而「双向队列 Deque」更加灵活，在其头部和尾部都能执行元素添加或删除操作。

![deque_operations](deque.assets/deque_operations.png)

<p align="center"> Fig. 双向队列的操作 </p>

## 5.3.1. 双向队列常用操作

双向队列的常用操作见下表，方法名需根据特定语言来确定。

<p align="center"> Table. 双向队列的常用操作 </p>

<div class="center-table" markdown>

| 方法名        | 描述             | 时间复杂度 |
| ------------ | ---------------- | ---------- |
| pushFirst() | 将元素添加至队首 | $O(1)$     |
| pushLast()  | 将元素添加至队尾 | $O(1)$     |
| pollFirst()  | 删除队首元素     | $O(1)$     |
| pollLast()   | 删除队尾元素     | $O(1)$     |
| peekFirst()  | 访问队首元素     | $O(1)$     |
| peekLast()   | 访问队尾元素     | $O(1)$     |
| size()       | 获取队列的长度   | $O(1)$     |
| isEmpty()    | 判断队列是否为空 | $O(1)$     |

</div>

相同地，我们可以直接使用编程语言实现好的双向队列类。

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
    int pollFirst = deque.pollFirst();  // 队首元素出队
    int pollLast = deque.pollLast();    // 队尾元素出队
    
    /* 获取双向队列的长度 */
    int size = deque.size();
    
    /* 判断双向队列是否为空 */
    boolean isEmpty = deque.isEmpty();
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

=== "Python"

    ```python title="deque.py"
    """ 初始化双向队列 """
    duque = deque()
    
    """ 元素入队 """
    duque.append(2)      # 添加至队尾
    duque.append(5)
    duque.append(4)
    duque.appendleft(3)  # 添加至队首
    duque.appendleft(1)
    
    """ 访问元素 """
    front = duque[0]  # 队首元素
    rear = duque[-1]  # 队尾元素
    
    """ 元素出队 """
    pop_front = duque.popleft()  # 队首元素出队
    pop_rear = duque.pop()       # 队尾元素出队
    
    """ 获取双向队列的长度 """
    size = len(duque)
    
    """ 判断双向队列是否为空 """
    is_empty = len(duque) == 0
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

=== "JavaScript"

    ```js title="deque.js"
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
    console.log("双向队列 deque = ", deque);

    /* 访问元素 */
    const peekFirst = deque[0];
    console.log("队首元素 peekFirst = " + peekFirst);
    const peekLast = deque[deque.length - 1];
    console.log("队尾元素 peekLast = " + peekLast);

    /* 元素出队 */
    // 请注意，由于是数组，shift() 方法的时间复杂度为 O(n)
    const popFront = deque.shift();
    console.log("队首出队元素 popFront = " + popFront + "，队首出队后 deque = " + deque);
    const popBack = deque.pop();
    console.log("队尾出队元素 popBack = " + popBack + "，队尾出队后 deque = " + deque);

    /* 获取双向队列的长度 */
    const size = deque.length;
    console.log("双向队列长度 size = " + size);

    /* 判断双向队列是否为空 */
    const isEmpty = size === 0;
    console.log("双向队列是否为空 = " + isEmpty);
    ```

=== "TypeScript"

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
    console.log("双向队列 deque = ", deque);

    /* 访问元素 */
    const peekFirst: number = deque[0];
    console.log("队首元素 peekFirst = " + peekFirst);
    const peekLast: number = deque[deque.length - 1];
    console.log("队尾元素 peekLast = " + peekLast);

    /* 元素出队 */
    // 请注意，由于是数组，shift() 方法的时间复杂度为 O(n)
    const popFront: number = deque.shift() as number;
    console.log("队首出队元素 popFront = " + popFront + "，队首出队后 deque = " + deque);
    const popBack: number = deque.pop() as number;
    console.log("队尾出队元素 popBack = " + popBack + "，队尾出队后 deque = " + deque);

    /* 获取双向队列的长度 */
    const size: number = deque.length;
    console.log("双向队列长度 size = " + size);

    /* 判断双向队列是否为空 */
    const isEmpty: boolean = size === 0;
    console.log("双向队列是否为空 = " + isEmpty);
    ```

=== "C"

    ```c title="deque.c"
    
    ```

=== "C#"

    ```csharp title="deque.cs"
    /* 初始化双向队列 */
    // 在 C# 中，将链表 LinkedList 看作双向队列来使用
    LinkedList<int> deque = new LinkedList<int>();
    
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
    // 使用 Array 模拟时 pollFirst 的复杂度为 O(n)
    let pollFirst = deque.removeFirst() // 队首元素出队
    let pollLast = deque.removeLast() // 队尾元素出队

    /* 获取双向队列的长度 */
    let size = deque.count

    /* 判断双向队列是否为空 */
    let isEmpty = deque.isEmpty
    ```

=== "Zig"

    ```zig title="deque.zig"

    ```

## 5.3.2. 双向队列实现

双向队列需要一种可以在两端添加、两端删除的数据结构。与队列的实现方法类似，双向队列也可以使用双向链表和循环数组来实现。

### 基于双向链表的实现

我们将双向链表的头结点和尾结点分别看作双向队列的队首和队尾，并且实现在两端都能添加与删除结点。

=== "LinkedListDeque"
    ![linkedlist_deque](deque.assets/linkedlist_deque.png)

=== "pushLast()"
    ![linkedlist_deque_push_last](deque.assets/linkedlist_deque_push_last.png)

=== "pushFirst()"
    ![linkedlist_deque_push_first](deque.assets/linkedlist_deque_push_first.png)

=== "pollLast()"
    ![linkedlist_deque_poll_last](deque.assets/linkedlist_deque_poll_last.png)

=== "pollFirst()"
    ![linkedlist_deque_poll_first](deque.assets/linkedlist_deque_poll_first.png)

以下是使用双向链表实现双向队列的示例代码。

=== "Java"

    ```java title="linkedlist_deque.java"
    [class]{ListNode}-[func]{}

    [class]{LinkedListDeque}-[func]{}
    ```

=== "C++"

    ```cpp title="linkedlist_deque.cpp"

    ```

=== "Python"

    ```python title="linkedlist_deque.py"

    ```

=== "Go"

    ```go title="linkedlist_deque.go"

    ```

=== "JavaScript"

    ```js title="linkedlist_deque.js"
    /* 双向链表结点 */
    class ListNode {
        prev;   // 前驱结点引用 (指针)
        next;   // 后继结点引用 (指针)
        val;    // 结点值
        
        constructor(val) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* 基于双向链表实现的双向队列 */
    class LinkedListDeque {
        front;  // 头结点 front
        rear;   // 尾结点 rear
        len;    // 双向队列的长度

        constructor() {
            this.front = null;
            this.rear = null;
            this.len = 0;
        }

        /* 队尾入队操作 */
        pushLast(val) {
            const node = new ListNode(val);
            // 若链表为空，则令 front, rear 都指向 node
            if (this.len === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // 将 node 添加至链表尾部
                this.rear.next = node;
                node.prev = this.rear;
                this.rear = node; // 更新尾结点
            }
            this.len++;
        }

        /* 队首入队操作 */
        pushFirst(val) {
            const node = new ListNode(val);
            // 若链表为空，则令 front, rear 都指向 node
            if (this.len === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // 将 node 添加至链表头部
                this.front.prev = node;
                node.next = this.front;
                this.front = node; // 更新头结点
            }
            this.len++;
        }

        /* 队尾出队操作 */
        pollLast() {
            if (this.len === 0) {
                return null;
            }
            const value = this.rear.val; // 存储尾结点值
            // 删除尾结点
            let temp = this.rear.prev;
            if (temp !== null) {
                temp.next = null;
                this.rear.prev = null;
            }
            this.rear = temp;   // 更新尾结点
            this.len--;
            return value;
        }

        /* 队首出队操作 */
        pollFirst() {
            if (this.len === 0) {
                return null;
            }
            const value = this.front.val; // 存储尾结点值
            // 删除头结点
            let temp = this.front.next;
            if (temp !== null) {
                temp.prev = null;
                this.front.next = null;
            }
            this.front = temp;   // 更新头结点
            this.len--;
            return value;
        }

        /* 访问队尾元素 */
        peekLast() {
            return this.len === 0 ? null : this.rear.val;
        }

        /* 访问队首元素 */
        peekFirst() {
            return this.len === 0 ? null : this.front.val;
        }

        /* 获取双向队列的长度 */
        size() {
            return this.len;
        }

        /* 判断双向队列是否为空 */
        isEmpty() {
            return this.len === 0;
        }

        /* 打印双向队列 */
        print() {
            const arr = [];
            let temp = this.front;
            while (temp !== null) {
                arr.push(temp.val);
                temp = temp.next;
            }
            console.log("[" + arr.join(", ") + "]");
        }
    }
    ```

=== "TypeScript"

    ```typescript title="linkedlist_deque.ts"
    /* 双向链表结点 */
    class ListNode {
        prev: ListNode;     // 前驱结点引用 (指针)
        next: ListNode;     // 后继结点引用 (指针)
        val: number;        // 结点值

        constructor(val: number) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* 基于双向链表实现的双向队列 */
    class LinkedListDeque {
        front: ListNode;    // 头结点 front
        rear: ListNode;     // 尾结点 rear
        len: number;        // 双向队列的长度

        constructor() {
            this.front = null;
            this.rear = null;
            this.len = 0;
        }
        
        /* 队尾入队操作 */
        pushLast(val: number): void {
            const node: ListNode = new ListNode(val);
            // 若链表为空，则令 front, rear 都指向 node
            if (this.len === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // 将 node 添加至链表尾部
                this.rear.next = node;
                node.prev = this.rear;
                this.rear = node; // 更新尾结点
            }
            this.len++;
        }

        /* 队首入队操作 */
        pushFirst(val: number): void {
            const node: ListNode = new ListNode(val);
            // 若链表为空，则令 front, rear 都指向 node
            if (this.len === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // 将 node 添加至链表头部
                this.front.prev = node;
                node.next = this.front;
                this.front = node; // 更新头结点
            }
            this.len++;
        }

        /* 队尾出队操作 */
        pollLast(): number {
            if (this.len === 0) {
                return null;
            }
            const value: number = this.rear.val; // 存储尾结点值
            // 删除尾结点
            let temp: ListNode = this.rear.prev;
            if (temp !== null) {
                temp.next = null;
                this.rear.prev = null;
            }
            this.rear = temp;   // 更新尾结点
            this.len--;
            return value;
        }

        /* 队首出队操作 */
        pollFirst(): number {
            if (this.len === 0) {
                return null;
            }
            const value: number = this.front.val; // 存储尾结点值
            // 删除头结点
            let temp: ListNode = this.front.next;
            if (temp !== null) {
                temp.prev = null;
                this.front.next = null;
            }
            this.front = temp;   // 更新头结点
            this.len--;
            return value;
        }

        /* 访问队尾元素 */
        peekLast(): number {
            return this.len === 0 ? null : this.rear.val;
        }

        /* 访问队首元素 */
        peekFirst(): number {
            return this.len === 0 ? null : this.front.val;
        }

        /* 获取双向队列的长度 */
        size(): number {
            return this.len;
        }

        /* 判断双向队列是否为空 */
        isEmpty(): boolean {
            return this.len === 0;
        }

        /* 打印双向队列 */
        print(): void {
            const arr: number[] = [];
            let temp: ListNode = this.front;
            while (temp !== null) {
                arr.push(temp.val);
                temp = temp.next;
            }
            console.log("[" + arr.join(", ") + "]");
        }
    }
    ```

=== "C"

    ```c title="linkedlist_deque.c"

    ```

=== "C#"

    ```csharp title="linkedlist_deque.cs"

    ```

=== "Swift"

    ```swift title="linkedlist_deque.swift"

    ```

=== "Zig"

    ```zig title="linkedlist_deque.zig"

    ```

### 基于数组的实现

数组删除首元素和删除尾元素的时间复杂度为 $O(n)$，因此不适合直接用来实现双向队列。然而，我们可以借助两个指针 `front`, `rear` 来分别记录队首和队尾的索引位置，
在队首入队/队首出队时将 `front` 向前/向后移动一位，在队尾入队/队尾出队时将 `rear` 向后/向前移动一位即可，这样每次仅需操作一个元素，时间复杂度降至 $O(1)$。

=== "ArrayDeque"

=== "pushLast()"

=== "pushFirst()"

=== "pollLast()"

=== "pollFirst()"

与数组实现队列类似，两个指针在向前/向后移动时，**在到达队首/队尾后就无法继续移动了**，为了解决这个问题，我们同样采用将数组看作"环形"的方法，
使得队首/队尾指针到达数组头部/尾部时，仍然可以正确处理操作。

=== "Java"

    ```java title="array_deque.java"
    /* 基于数组实现的双向队列 */
    class ArrayDeque {
    private final int[] nums; // 用于存储队列元素的数组
    private int front; // 队首指针，指向队首元素
    private int rear; // 队尾指针，指向队尾元素
    private int queSize; // 双向队列长度
    
        public ArrayDeque(int capacity) {
            this.nums = new int[capacity];
            front = rear = 0;
            queSize = 0;
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
    
        /* 队首入队 */
        public void pushFirst(int num) {
            if (queSize == capacity()) {
                System.out.println("双向队列已满");
                return;
            }
    
            queSize++;
            // 队首指针先向队首移动一位，越过队首后，通过取余操作返回到队尾
            front = (front - 1 + capacity()) % capacity();
            // 队首前添加num，这里与从队尾进行操作的方法需要区分：队尾操作是先添加num，再进行指针移动，如果都是先移动、再添加则会产生值覆盖的情况
            nums[front] = num;
        }
    
        /* 队尾入队 */
        public void pushLast(int num) {
            if (queSize == capacity()) {
                System.out.println("双向队列已满");
                return;
            }
    
            queSize++;
            // 队尾入队先在队尾添加num
            nums[rear] = num;
            // 队尾指针再向队尾移动一位，越过尾部则返回队首
            rear = (rear + 1) % capacity();
        }
    
        /* 队首出队 */
        public Integer pollFirst() {
            int num = peekFirst();
    
            // 队首元素出队，队首指针需要向队尾移动一位，越过尾部返回队首
            front = (front + 1) % capacity();
            queSize--;
    
            return num;
        }
    
        /* 队尾出队 */
        public Integer pollLast() {
            int num = peekLast();
    
            // 队尾元素出队，队尾指针需要向队首移动一位，越过队首返回队尾
            rear = (rear - 1 + capacity()) % capacity();
            queSize--;
    
            return num;
        }
    
        /* 访问队首元素 */
        public Integer peekFirst() {
            return isEmpty() ? null : nums[front];
        }
    
        /* 访问队尾元素 */
        public Integer peekLast() {
            // 队尾指针所在的位置是队尾元素的后一位，取值时需要取队尾指针前一位，越过队首则返回队尾
            return isEmpty() ? null : nums[(rear - 1 + capacity()) % capacity()];
        }
    }
    ```

=== "C++"

    ```cpp title="array_deque.cpp"

    ```

=== "Python"

    ```python title="array_deque.py"

    ```

=== "Go"

    ```go title="array_deque.go"

    ```

=== "JavaScript"

    ```js title="array_deque.js"

    ```

=== "TypeScript"

    ```typescript title="array_deque.ts"

    ```

=== "C"

    ```c title="array_deque.c"

    ```

=== "C#"

    ```csharp title="array_deque.cs"

    ```

=== "Swift"

    ```swift title="array_deque.swift"

    ```

=== "Zig"

    ```zig title="array_deque.zig"

    ```

以上代码仍存在局限性，即长度不可变。然而，我们可以通过将数组替换为列表（即动态数组）来引入扩容机制，有兴趣的同学可以尝试实现。