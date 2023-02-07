---
comments: true
---

# 5.2. 队列

「队列 Queue」是一种遵循「先入先出 first in, first out」数据操作规则的线性数据结构。顾名思义，队列模拟的是排队现象，即外面的人不断加入队列尾部，而处于队列头部的人不断地离开。

我们将队列头部称为「队首」，队列尾部称为「队尾」，将把元素加入队尾的操作称为「入队」，删除队首元素的操作称为「出队」。

![queue_operations](queue.assets/queue_operations.png)

<p align="center"> Fig. 队列的先入先出特性 </p>

## 5.2.1. 队列常用操作

队列的常用操作见下表，方法名需根据特定语言来确定。

<p align="center"> Table. 队列的常用操作 </p>

<div class="center-table" markdown>

| 方法名     | 描述                        | 时间复杂度 |
| --------- | -------------------------- | -------- |
| push()    | 元素入队，即将元素添加至队尾    | $O(1)$   |
| poll()    | 队首元素出队                 | $O(1)$   |
| front()   | 访问队首元素                 | $O(1)$   |
| size()    | 获取队列的长度               | $O(1)$   |
| isEmpty() | 判断队列是否为空              | $O(1)$   |

</div>

我们可以直接使用编程语言实现好的队列类。

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
    int poll = queue.poll();
    
    /* 获取队列的长度 */
    int size = queue.size();
    
    /* 判断队列是否为空 */
    boolean isEmpty = queue.isEmpty();
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

=== "Python"

    ```python title="queue.py"
    """ 初始化队列 """
    # 在 Python 中，我们一般将双向队列类 deque 看作队列使用
    # 虽然 queue.Queue() 是纯正的队列类，但不太好用，因此不建议
    que = collections.deque()
    
    """ 元素入队 """
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    
    """ 访问队首元素 """
    front = que[0];
    
    """ 元素出队 """
    pop = que.popleft()
    
    """ 获取队列的长度 """
    size = len(que)
    
    """ 判断队列是否为空 """
    is_empty = len(que) == 0
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
    poll := queue.Front()
    queue.Remove(poll)
    
    /* 获取队列的长度 */
    size := queue.Len()
    
    /* 判断队列是否为空 */
    isEmpty := queue.Len() == 0
    ```

=== "JavaScript"

    ```js title="queue.js"
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
    const poll = queue.shift();
    
    /* 获取队列的长度 */
    const size = queue.length;
    
    /* 判断队列是否为空 */
    const empty = queue.length === 0;
    ```

=== "TypeScript"

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
    const poll = queue.shift();
    
    /* 获取队列的长度 */
    const size = queue.length;
    
    /* 判断队列是否为空 */
    const empty = queue.length === 0;
    ```

=== "C"

    ```c title="queue.c"
    
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
    int poll = queue.Dequeue();
    
    /* 获取队列的长度 */
    int size = queue.Count();
    
    /* 判断队列是否为空 */
    bool isEmpty = queue.Count() == 0;
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
    // 使用 Array 模拟时 poll 的复杂度为 O(n)
    let pool = queue.removeFirst()
    
    /* 获取队列的长度 */
    let size = queue.count
    
    /* 判断队列是否为空 */
    let isEmpty = queue.isEmpty
    ```

=== "Zig"

    ```zig title="queue.zig"

    ```

## 5.2.2. 队列实现

队列需要一种可以在一端添加，并在另一端删除的数据结构，也可以使用链表或数组来实现。

### 基于链表的实现

我们将链表的「头结点」和「尾结点」分别看作是队首和队尾，并规定队尾只可添加结点，队首只可删除结点。

=== "LinkedListQueue"
    ![linkedlist_queue](queue.assets/linkedlist_queue.png)

=== "push()"
    ![linkedlist_queue_push](queue.assets/linkedlist_queue_push.png)

=== "poll()"
    ![linkedlist_queue_poll](queue.assets/linkedlist_queue_poll.png)

以下是使用链表实现队列的示例代码。

=== "Java"

    ```java title="linkedlist_queue.java"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "C++"

    ```cpp title="linkedlist_queue.cpp"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Python"

    ```python title="linkedlist_queue.py"
    [class]{LinkedListQueue}-[func]{}
    ```

=== "Go"

    ```go title="linkedlist_queue.go"
    /* 基于链表实现的队列 */
    type linkedListQueue struct {
        // 使用内置包 list 来实现队列
        data *list.List
    }
    
    // newLinkedListQueue 初始化链表
    func newLinkedListQueue() *linkedListQueue {
        return &linkedListQueue{
            data: list.New(),
        }
    }
    
    // push 入队
    func (s *linkedListQueue) push(value any) {
        s.data.PushBack(value)
    }
    
    // poll 出队
    func (s *linkedListQueue) poll() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        s.data.Remove(e)
        return e.Value
    }
    
    // peek 访问队首元素
    func (s *linkedListQueue) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        return e.Value
    }
    
    // size 获取队列的长度
    func (s *linkedListQueue) size() int {
        return s.data.Len()
    }
    
    // isEmpty 判断队列是否为空
    func (s *linkedListQueue) isEmpty() bool {
        return s.data.Len() == 0
    }
    ```

=== "JavaScript"

    ```js title="linkedlist_queue.js"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
        #front;  // 头结点 #front
        #rear;   // 尾结点 #rear
        #queSize = 0;
        constructor() {
            this.#front = null;
            this.#rear = null;
        }
        /* 获取队列的长度 */
        get size() {
            return this.#queSize;
        }
        /* 判断队列是否为空 */
        isEmpty() {
            return this.size === 0;
        }
        /* 入队 */
        push(num) {
            // 尾结点后添加 num
            const node = new ListNode(num);
            // 如果队列为空，则令头、尾结点都指向该结点
            if (!this.#front) {
                this.#front = node;
                this.#rear = node;
                // 如果队列不为空，则将该结点添加到尾结点后
            } else {
                this.#rear.next = node;
                this.#rear = node;
            }
            this.#queSize++;
        }
        /* 出队 */
        poll() {
            const num = this.peek();
            // 删除头结点
            this.#front = this.#front.next;
            this.#queSize--;
            return num;
        }
        /* 访问队首元素 */
        peek() {
            if (this.size === 0)
                throw new Error("队列为空");
            return this.#front.val;
        }
    }
    ```

=== "TypeScript"

    ```typescript title="linkedlist_queue.ts"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
        private front: ListNode | null; // 头结点 front
        private rear: ListNode | null;  // 尾结点 rear
        private queSize: number = 0;
        constructor() {
            this.front = null;
            this.rear = null;
        }
        /* 获取队列的长度 */
        get size(): number {
            return this.queSize;
        }
        /* 判断队列是否为空 */
        isEmpty(): boolean {
            return this.size === 0;
        }
        /* 入队 */
        push(num: number): void {
            // 尾结点后添加 num
            const node = new ListNode(num);
            // 如果队列为空，则令头、尾结点都指向该结点
            if (!this.front) {
                this.front = node;
                this.rear = node;
                // 如果队列不为空，则将该结点添加到尾结点后
            } else {
                this.rear!.next = node;
                this.rear = node;
            }
            this.queSize++;
        }
        /* 出队 */
        poll(): number {
            const num = this.peek();
            if (!this.front)
                throw new Error("队列为空")
            // 删除头结点
            this.front = this.front.next;
            this.queSize--;
            return num;
        }
        /* 访问队首元素 */
        peek(): number {
            if (this.size === 0)
                throw new Error("队列为空");
            return this.front!.val;
        }
    }
    ```

=== "C"

    ```c title="linkedlist_queue.c"
    
    ```

=== "C#"

    ```csharp title="linkedlist_queue.cs"
    /* 基于链表实现的队列 */
    class LinkedListQueue
    {
        private ListNode? front, rear;  // 头结点 front ，尾结点 rear 
        private int queSize = 0;
        public LinkedListQueue()
        {
            front = null;
            rear = null;
        }
        /* 获取队列的长度 */
        public int size()
        {
            return queSize;
        }
        /* 判断队列是否为空 */
        public bool isEmpty()
        {
            return size() == 0;
        }
        /* 入队 */
        public void push(int num)
        {
            // 尾结点后添加 num
            ListNode node = new ListNode(num);
            // 如果队列为空，则令头、尾结点都指向该结点
            if (front == null)
            {
                front = node;
                rear = node;
                // 如果队列不为空，则将该结点添加到尾结点后
            }
            else if (rear != null)
            {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }
        /* 出队 */
        public int poll()
        {
            int num = peek();
            // 删除头结点
            front = front?.next;
            queSize--;
            return num;
        }
        /* 访问队首元素 */
        public int peek()
        {
            if (size() == 0 || front == null)
                throw new Exception();
            return front.val;
        }
    }
    ```

=== "Swift"

    ```swift title="linkedlist_queue.swift"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
        private var front: ListNode? // 头结点
        private var rear: ListNode? // 尾结点
        private var _size = 0
    
        init() {}
    
        /* 获取队列的长度 */
        func size() -> Int {
            _size
        }
    
        /* 判断队列是否为空 */
        func isEmpty() -> Bool {
            size() == 0
        }
    
        /* 入队 */
        func push(num: Int) {
            // 尾结点后添加 num
            let node = ListNode(x: num)
            // 如果队列为空，则令头、尾结点都指向该结点
            if front == nil {
                front = node
                rear = node
            }
            // 如果队列不为空，则将该结点添加到尾结点后
            else {
                rear?.next = node
                rear = node
            }
            _size += 1
        }
    
        /* 出队 */
        @discardableResult
        func poll() -> Int {
            let num = peek()
            // 删除头结点
            front = front?.next
            _size -= 1
            return num
        }
    
        /* 访问队首元素 */
        func peek() -> Int {
            if isEmpty() {
                fatalError("队列为空")
            }
            return front!.val
        }
    }
    ```

=== "Zig"

    ```zig title="linkedlist_queue.zig"

    ```

### 基于数组的实现

数组的删除首元素的时间复杂度为 $O(n)$ ，因此不适合直接用来实现队列。然而，我们可以借助两个指针 `front` , `rear` 来分别记录队首和队尾的索引位置，在入队 / 出队时分别将 `front` / `rear` 向后移动一位即可，这样每次仅需操作一个元素，时间复杂度降至 $O(1)$ 。

=== "ArrayQueue"
    ![array_queue](queue.assets/array_queue.png)

=== "push()"
    ![array_queue_push](queue.assets/array_queue_push.png)

=== "poll()"
    ![array_queue_poll](queue.assets/array_queue_poll.png)

细心的同学可能会发现一个问题，即在入队与出队的过程中，两个指针都在向后移动，**在到达尾部后则无法继续移动了**。

为了解决此问题，我们可以采取一个取巧方案，**即将数组看作是“环形”的**。具体做法是规定指针越过数组尾部后，再次回到头部接续遍历，这样相当于使数组“首尾相连”了。在环形数组的设定下，获取长度 `size()` 、入队 `push()` 、出队 `poll()` 方法都需要做相应的取余操作处理，使得当尾指针绕回数组头部时，仍然可以正确处理操作。

=== "Java"

    ```java title="array_queue.java"
    [class]{ArrayQueue}-[func]{}
    ```

=== "C++"

    ```cpp title="array_queue.cpp"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Python"

    ```python title="array_queue.py"
    [class]{ArrayQueue}-[func]{}
    ```

=== "Go"

    ```go title="array_queue.go"
    /* 基于环形数组实现的队列 */
    type arrayQueue struct {
        nums        []int // 用于存储队列元素的数组
        front       int   // 队首指针，指向队首元素
        queSize     int   // 队列长度
        queCapacity int   // 队列容量（即最大容纳元素数量）
    }

    // newArrayQueue 基于环形数组实现的队列
    func newArrayQueue(queCapacity int) *arrayQueue {
        return &arrayQueue{
            nums:        make([]int, queCapacity),
            queCapacity: queCapacity,
            front:       0,
            queSize:     0,
        }
    }

    // size 获取队列的长度
    func (q *arrayQueue) size() int {
        return q.queSize
    }

    // isEmpty 判断队列是否为空
    func (q *arrayQueue) isEmpty() bool {
        return q.queSize == 0
    }

    // push 入队
    func (q *arrayQueue) push(num int) {
        // 当 rear == queCapacity 表示队列已满
        if q.queSize == q.queCapacity {
            return
        }
        // 计算尾指针，指向队尾索引 + 1
        // 通过取余操作，实现 rear 越过数组尾部后回到头部
        rear := (q.front + q.queSize) % q.queCapacity
        // 尾结点后添加 num
        q.nums[rear] = num
        q.queSize++
    }

    // poll 出队
    func (q *arrayQueue) poll() any {
        num := q.peek()
        // 队首指针向后移动一位，若越过尾部则返回到数组头部
        q.front = (q.front + 1) % q.queCapacity
        q.queSize--
        return num
    }

    // peek 访问队首元素
    func (q *arrayQueue) peek() any {
        if q.isEmpty() {
            return nil
        }
        return q.nums[q.front]
    }

    // 获取 Slice 用于打印
    func (q *arrayQueue) toSlice() []int {
        rear := (q.front + q.queSize)
        if rear >= q.queCapacity {
            rear %= q.queCapacity
            return append(q.nums[q.front:], q.nums[:rear]...)
        }
        return q.nums[q.front:rear]
    }
    ```

=== "JavaScript"

    ```js title="array_queue.js"
    /* 基于环形数组实现的队列 */
    class ArrayQueue {
        #nums;         // 用于存储队列元素的数组
        #front = 0;    // 队首指针，指向队首元素
        #queSize = 0;  // 队列长度

        constructor(capacity) {
            this.#nums = new Array(capacity);
        }

        /* 获取队列的容量 */
        get capacity() {
            return this.#nums.length;
        }

        /* 获取队列的长度 */
        get size() {
            return this.#queSize;
        }

        /* 判断队列是否为空 */
        empty() {
            return this.#queSize == 0;
        }

        /* 入队 */
        push(num) {
            if (this.size == this.capacity) {
                console.log("队列已满");
                return;
            }
            // 计算尾指针，指向队尾索引 + 1
            // 通过取余操作，实现 rear 越过数组尾部后回到头部
            const rear = (this.#front + this.size) % this.capacity;
            // 尾结点后添加 num
            this.#nums[rear] = num;
            this.#queSize++;
        }

        /* 出队 */
        poll() {
            const num = this.peek();
            // 队首指针向后移动一位，若越过尾部则返回到数组头部
            this.#front = (this.#front + 1) % this.capacity;
            this.#queSize--;
            return num;
        }

        /* 访问队首元素 */
        peek() {
            if (this.empty())
                throw new Error("队列为空");
            return this.#nums[this.#front];
        }
    }
    ```

=== "TypeScript"

    ```typescript title="array_queue.ts"
    /* 基于环形数组实现的队列 */
    class ArrayQueue {
        private nums: number[];  // 用于存储队列元素的数组
        private front: number;   // 队首指针，指向队首元素
        private queSize: number; // 队列长度

        constructor(capacity: number) {
            this.nums = new Array(capacity);
            this.front = this.queSize = 0;
        }

        /* 获取队列的容量 */
        get capacity(): number {
            return this.nums.length;
        }

        /* 获取队列的长度 */
        get size(): number {
            return this.queSize;
        }

        /* 判断队列是否为空 */
        empty(): boolean {
            return this.queSize == 0;
        }

        /* 入队 */
        push(num: number): void {
            if (this.size == this.capacity) {
                console.log("队列已满");
                return;
            }
            // 计算尾指针，指向队尾索引 + 1
            // 通过取余操作，实现 rear 越过数组尾部后回到头部
            const rear = (this.front + this.queSize) % this.capacity;
            // 尾结点后添加 num
            this.nums[rear] = num;
            this.queSize++;
        }

        /* 出队 */
        poll(): number {
            const num = this.peek();
            // 队首指针向后移动一位，若越过尾部则返回到数组头部
            this.front = (this.front + 1) % this.capacity;
            this.queSize--;
            return num;
        }

        /* 访问队首元素 */
        peek(): number {
            if (this.empty())
                throw new Error("队列为空");
            return this.nums[this.front];
        }
    }
    ```

=== "C"

    ```c title="array_queue.c"
    
    ```

=== "C#"

    ```csharp title="array_queue.cs"
    /* 基于环形数组实现的队列 */
    class ArrayQueue
    {
        private int[] nums;  // 用于存储队列元素的数组
        private int front;   // 队首指针，指向队首元素
        private int queSize; // 队列长度

        public ArrayQueue(int capacity)
        {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* 获取队列的容量 */
        public int capacity()
        {
            return nums.Length;
        }

        /* 获取队列的长度 */
        public int size()
        {
            return queSize;
        }

        /* 判断队列是否为空 */
        public bool isEmpty()
        {
            return queSize == 0;
        }

        /* 入队 */
        public void push(int num)
        {
            if (queSize == capacity())
            {
                Console.WriteLine("队列已满");
                return;
            }
            // 计算尾指针，指向队尾索引 + 1
            // 通过取余操作，实现 rear 越过数组尾部后回到头部
            int rear = (front + queSize) % capacity();
            // 尾结点后添加 num
            nums[rear] = num;
            queSize++;
        }

        /* 出队 */
        public int poll()
        {
            int num = peek();
            // 队首指针向后移动一位，若越过尾部则返回到数组头部
            front = (front + 1) % capacity();
            queSize--;
            return num;
        }

        /* 访问队首元素 */
        public int peek()
        {
            if (isEmpty())
                throw new Exception();
            return nums[front];
        }
    }
    ```

=== "Swift"

    ```swift title="array_queue.swift"
    /* 基于环形数组实现的队列 */
    class ArrayQueue {
        private var nums: [Int] // 用于存储队列元素的数组
        private var front = 0 // 队首指针，指向队首元素
        private var queSize = 0 // 队列长度

        init(capacity: Int) {
            // 初始化数组
            nums = Array(repeating: 0, count: capacity)
        }

        /* 获取队列的容量 */
        func capacity() -> Int {
            nums.count
        }

        /* 获取队列的长度 */
        func size() -> Int {
            queSize
        }

        /* 判断队列是否为空 */
        func isEmpty() -> Bool {
            queSize == 0
        }

        /* 入队 */
        func push(num: Int) {
            if size() == capacity() {
                print("队列已满")
                return
            }
            // 计算尾指针，指向队尾索引 + 1
            // 通过取余操作，实现 rear 越过数组尾部后回到头部
            let rear = (front + queSize) % capacity()
            // 尾结点后添加 num
            nums[rear] = num
            queSize += 1
        }

        /* 出队 */
        @discardableResult
        func poll() -> Int {
            let num = peek()
            // 队首指针向后移动一位，若越过尾部则返回到数组头部
            front = (front + 1) % capacity()
            queSize -= 1
            return num
        }

        /* 访问队首元素 */
        func peek() -> Int {
            if isEmpty() {
                fatalError("队列为空")
            }
            return nums[front]
        }
    }
    ```

=== "Zig"

    ```zig title="array_queue.zig"

    ```

以上代码仍存在局限性，即长度不可变。然而，我们可以通过将数组替换为列表（即动态数组）来引入扩容机制，有兴趣的同学可以尝试实现。

## 5.2.3. 两种实现对比

与栈的结论一致，在此不再赘述。

## 5.2.4. 队列典型应用

- **淘宝订单**。购物者下单后，订单就被加入到队列之中，随后系统再根据顺序依次处理队列中的订单。在双十一时，在短时间内会产生海量的订单，如何处理「高并发」则是工程师们需要重点思考的问题。
- **各种待办事项**。例如打印机的任务队列、餐厅的出餐队列等等。
