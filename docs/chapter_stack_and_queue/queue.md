---
comments: true
---

# 5.2 &nbsp; 队列

「队列 queue」是一种遵循先入先出规则的线性数据结构。顾名思义，队列模拟了排队现象，即新来的人不断加入队列的尾部，而位于队列头部的人逐个离开。

如图 5-4 所示，我们将队列的头部称为“队首”，尾部称为“队尾”，将把元素加入队尾的操作称为“入队”，删除队首元素的操作称为“出队”。

![队列的先入先出规则](queue.assets/queue_operations.png){ class="animation-figure" }

<p align="center"> 图 5-4 &nbsp; 队列的先入先出规则 </p>

## 5.2.1 &nbsp; 队列常用操作

队列的常见操作如表 5-2 所示。需要注意的是，不同编程语言的方法名称可能会有所不同。我们在此采用与栈相同的方法命名。

<p align="center"> 表 5-2 &nbsp; 队列操作效率 </p>

<div class="center-table" markdown>

| 方法名 | 描述                         | 时间复杂度 |
| ------ | ---------------------------- | ---------- |
| push() | 元素入队，即将元素添加至队尾 | $O(1)$     |
| pop()  | 队首元素出队                 | $O(1)$     |
| peek() | 访问队首元素                 | $O(1)$     |

</div>

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
    /* 初始化双向队列 */
    // 在 Rust 中使用双向队列作为普通队列来使用
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* 元素入队 */
    deque.push_back(1);
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);

    /* 访问队首元素 */
    if let Some(front) = deque.front() {
    }

    /* 元素出队 */
    if let Some(pop) = deque.pop_front() {
    }

    /* 获取队列的长度 */
    let size = deque.len();

    /* 判断队列是否为空 */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="queue.c"
    // C 未提供内置队列
    ```

=== "Zig"

    ```zig title="queue.zig"

    ```

## 5.2.2 &nbsp; 队列实现

为了实现队列，我们需要一种数据结构，可以在一端添加元素，并在另一端删除元素。因此，链表和数组都可以用来实现队列。

### 1. &nbsp; 基于链表的实现

如图 5-5 所示，我们可以将链表的“头节点”和“尾节点”分别视为“队首”和“队尾”，规定队尾仅可添加节点，队首仅可删除节点。

=== "LinkedListQueue"
    ![基于链表实现队列的入队出队操作](queue.assets/linkedlist_queue.png){ class="animation-figure" }

=== "push()"
    ![linkedlist_queue_push](queue.assets/linkedlist_queue_push.png){ class="animation-figure" }

=== "pop()"
    ![linkedlist_queue_pop](queue.assets/linkedlist_queue_pop.png){ class="animation-figure" }

<p align="center"> 图 5-5 &nbsp; 基于链表实现队列的入队出队操作 </p>

以下是用链表实现队列的代码。

=== "Python"

    ```python title="linkedlist_queue.py"
    class LinkedListQueue:
        """基于链表实现的队列"""

        def __init__(self):
            """构造方法"""
            self._front: ListNode | None = None  # 头节点 front
            self._rear: ListNode | None = None  # 尾节点 rear
            self._size: int = 0

        def size(self) -> int:
            """获取队列的长度"""
            return self._size

        def is_empty(self) -> bool:
            """判断队列是否为空"""
            return not self._front

        def push(self, num: int):
            """入队"""
            # 尾节点后添加 num
            node = ListNode(num)
            # 如果队列为空，则令头、尾节点都指向该节点
            if self._front is None:
                self._front = node
                self._rear = node
            # 如果队列不为空，则将该节点添加到尾节点后
            else:
                self._rear.next = node
                self._rear = node
            self._size += 1

        def pop(self) -> int:
            """出队"""
            num = self.peek()
            # 删除头节点
            self._front = self._front.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """访问队首元素"""
            if self.is_empty():
                raise IndexError("队列为空")
            return self._front.val

        def to_list(self) -> list[int]:
            """转化为列表用于打印"""
            queue = []
            temp = self._front
            while temp:
                queue.append(temp.val)
                temp = temp.next
            return queue
    ```

=== "C++"

    ```cpp title="linkedlist_queue.cpp"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
      private:
        ListNode *front, *rear; // 头节点 front ，尾节点 rear
        int queSize;

      public:
        LinkedListQueue() {
            front = nullptr;
            rear = nullptr;
            queSize = 0;
        }

        ~LinkedListQueue() {
            // 遍历链表删除节点，释放内存
            freeMemoryLinkedList(front);
        }

        /* 获取队列的长度 */
        int size() {
            return queSize;
        }

        /* 判断队列是否为空 */
        bool isEmpty() {
            return queSize == 0;
        }

        /* 入队 */
        void push(int num) {
            // 尾节点后添加 num
            ListNode *node = new ListNode(num);
            // 如果队列为空，则令头、尾节点都指向该节点
            if (front == nullptr) {
                front = node;
                rear = node;
            }
            // 如果队列不为空，则将该节点添加到尾节点后
            else {
                rear->next = node;
                rear = node;
            }
            queSize++;
        }

        /* 出队 */
        void pop() {
            int num = peek();
            // 删除头节点
            ListNode *tmp = front;
            front = front->next;
            // 释放内存
            delete tmp;
            queSize--;
        }

        /* 访问队首元素 */
        int peek() {
            if (size() == 0)
                throw out_of_range("队列为空");
            return front->val;
        }

        /* 将链表转化为 Vector 并返回 */
        vector<int> toVector() {
            ListNode *node = front;
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

    ```java title="linkedlist_queue.java"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
        private ListNode front, rear; // 头节点 front ，尾节点 rear
        private int queSize = 0;

        public LinkedListQueue() {
            front = null;
            rear = null;
        }

        /* 获取队列的长度 */
        public int size() {
            return queSize;
        }

        /* 判断队列是否为空 */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* 入队 */
        public void push(int num) {
            // 尾节点后添加 num
            ListNode node = new ListNode(num);
            // 如果队列为空，则令头、尾节点都指向该节点
            if (front == null) {
                front = node;
                rear = node;
            // 如果队列不为空，则将该节点添加到尾节点后
            } else {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }

        /* 出队 */
        public int pop() {
            int num = peek();
            // 删除头节点
            front = front.next;
            queSize--;
            return num;
        }

        /* 访问队首元素 */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* 将链表转化为 Array 并返回 */
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

    ```csharp title="linkedlist_queue.cs"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
        private ListNode? front, rear;  // 头节点 front ，尾节点 rear 
        private int queSize = 0;

        public LinkedListQueue() {
            front = null;
            rear = null;
        }

        /* 获取队列的长度 */
        public int Size() {
            return queSize;
        }

        /* 判断队列是否为空 */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* 入队 */
        public void Push(int num) {
            // 尾节点后添加 num
            ListNode node = new(num);
            // 如果队列为空，则令头、尾节点都指向该节点
            if (front == null) {
                front = node;
                rear = node;
                // 如果队列不为空，则将该节点添加到尾节点后
            } else if (rear != null) {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }

        /* 出队 */
        public int Pop() {
            int num = Peek();
            // 删除头节点
            front = front?.next;
            queSize--;
            return num;
        }

        /* 访问队首元素 */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return front.val;
        }

        /* 将链表转化为 Array 并返回 */
        public int[] ToArray() {
            if (front == null)
                return Array.Empty<int>();

            ListNode node = front;
            int[] res = new int[Size()];
            for (int i = 0; i < res.Length; i++) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_queue.go"
    /* 基于链表实现的队列 */
    type linkedListQueue struct {
        // 使用内置包 list 来实现队列
        data *list.List
    }

    /* 初始化队列 */
    func newLinkedListQueue() *linkedListQueue {
        return &linkedListQueue{
            data: list.New(),
        }
    }

    /* 入队 */
    func (s *linkedListQueue) push(value any) {
        s.data.PushBack(value)
    }

    /* 出队 */
    func (s *linkedListQueue) pop() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        s.data.Remove(e)
        return e.Value
    }

    /* 访问队首元素 */
    func (s *linkedListQueue) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        return e.Value
    }

    /* 获取队列的长度 */
    func (s *linkedListQueue) size() int {
        return s.data.Len()
    }

    /* 判断队列是否为空 */
    func (s *linkedListQueue) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* 获取 List 用于打印 */
    func (s *linkedListQueue) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_queue.swift"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
        private var front: ListNode? // 头节点
        private var rear: ListNode? // 尾节点
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
            // 尾节点后添加 num
            let node = ListNode(x: num)
            // 如果队列为空，则令头、尾节点都指向该节点
            if front == nil {
                front = node
                rear = node
            }
            // 如果队列不为空，则将该节点添加到尾节点后
            else {
                rear?.next = node
                rear = node
            }
            _size += 1
        }

        /* 出队 */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            // 删除头节点
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

        /* 将链表转化为 Array 并返回 */
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

    ```javascript title="linkedlist_queue.js"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
        #front; // 头节点 #front
        #rear; // 尾节点 #rear
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
            // 尾节点后添加 num
            const node = new ListNode(num);
            // 如果队列为空，则令头、尾节点都指向该节点
            if (!this.#front) {
                this.#front = node;
                this.#rear = node;
                // 如果队列不为空，则将该节点添加到尾节点后
            } else {
                this.#rear.next = node;
                this.#rear = node;
            }
            this.#queSize++;
        }

        /* 出队 */
        pop() {
            const num = this.peek();
            // 删除头节点
            this.#front = this.#front.next;
            this.#queSize--;
            return num;
        }

        /* 访问队首元素 */
        peek() {
            if (this.size === 0) throw new Error('队列为空');
            return this.#front.val;
        }

        /* 将链表转化为 Array 并返回 */
        toArray() {
            let node = this.#front;
            const res = new Array(this.size);
            for (let i = 0; i < res.length; i++) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_queue.ts"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
        private front: ListNode | null; // 头节点 front
        private rear: ListNode | null; // 尾节点 rear
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
            // 尾节点后添加 num
            const node = new ListNode(num);
            // 如果队列为空，则令头、尾节点都指向该节点
            if (!this.front) {
                this.front = node;
                this.rear = node;
                // 如果队列不为空，则将该节点添加到尾节点后
            } else {
                this.rear!.next = node;
                this.rear = node;
            }
            this.queSize++;
        }

        /* 出队 */
        pop(): number {
            const num = this.peek();
            if (!this.front) throw new Error('队列为空');
            // 删除头节点
            this.front = this.front.next;
            this.queSize--;
            return num;
        }

        /* 访问队首元素 */
        peek(): number {
            if (this.size === 0) throw new Error('队列为空');
            return this.front!.val;
        }

        /* 将链表转化为 Array 并返回 */
        toArray(): number[] {
            let node = this.front;
            const res = new Array<number>(this.size);
            for (let i = 0; i < res.length; i++) {
                res[i] = node!.val;
                node = node!.next;
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_queue.dart"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
      ListNode? _front; // 头节点 _front
      ListNode? _rear; // 尾节点 _rear
      int _queSize = 0; // 队列长度

      LinkedListQueue() {
        _front = null;
        _rear = null;
      }

      /* 获取队列的长度 */
      int size() {
        return _queSize;
      }

      /* 判断队列是否为空 */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* 入队 */
      void push(int _num) {
        // 尾节点后添加 _num
        final node = ListNode(_num);
        // 如果队列为空，则令头、尾节点都指向该节点
        if (_front == null) {
          _front = node;
          _rear = node;
        } else {
          // 如果队列不为空，则将该节点添加到尾节点后
          _rear!.next = node;
          _rear = node;
        }
        _queSize++;
      }

      /* 出队 */
      int pop() {
        final int _num = peek();
        // 删除头节点
        _front = _front!.next;
        _queSize--;
        return _num;
      }

      /* 访问队首元素 */
      int peek() {
        if (_queSize == 0) {
          throw Exception('队列为空');
        }
        return _front!.val;
      }

      /* 将链表转化为 Array 并返回 */
      List<int> toArray() {
        ListNode? node = _front;
        final List<int> queue = [];
        while (node != null) {
          queue.add(node.val);
          node = node.next;
        }
        return queue;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_queue.rs"
    /* 基于链表实现的队列 */
    #[allow(dead_code)]
    pub struct LinkedListQueue<T> {
        front: Option<Rc<RefCell<ListNode<T>>>>,    // 头节点 front
        rear: Option<Rc<RefCell<ListNode<T>>>>,     // 尾节点 rear 
        que_size: usize,                            // 队列的长度
    }

    impl<T: Copy> LinkedListQueue<T> {
        pub fn new() -> Self {
            Self {
                front: None,
                rear: None,
                que_size: 0, 
            }
        }

        /* 获取队列的长度 */
        pub fn size(&self) -> usize {
            return self.que_size;
        }

        /* 判断队列是否为空 */
        pub fn is_empty(&self) -> bool {
            return self.size() == 0;
        }

        /* 入队 */
        pub fn push(&mut self, num: T) {
            // 尾节点后添加 num
            let new_rear = ListNode::new(num);
            match self.rear.take() {
                // 如果队列不为空，则将该节点添加到尾节点后
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(new_rear.clone());
                    self.rear = Some(new_rear);
                }
                // 如果队列为空，则令头、尾节点都指向该节点
                None => {
                    self.front = Some(new_rear.clone());
                    self.rear = Some(new_rear);
                }
            }
            self.que_size += 1;
        }

        /* 出队 */
        pub fn pop(&mut self) -> Option<T> {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        self.front = Some(new_front);
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1;
                Rc::try_unwrap(old_front).ok().unwrap().into_inner().val
            })
        }

        /* 访问队首元素 */
        pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.front.as_ref()
        }

        /* 将链表转化为 Array 并返回 */
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

    ```c title="linkedlist_queue.c"
    /* 基于链表实现的队列 */
    typedef struct {
        ListNode *front, *rear;
        int queSize;
    } LinkedListQueue;

    /* 构造函数 */
    LinkedListQueue *newLinkedListQueue() {
        LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
        queue->front = NULL;
        queue->rear = NULL;
        queue->queSize = 0;
        return queue;
    }

    /* 析构函数 */
    void delLinkedListQueue(LinkedListQueue *queue) {
        // 释放所有节点
        for (int i = 0; i < queue->queSize && queue->front != NULL; i++) {
            ListNode *tmp = queue->front;
            queue->front = queue->front->next;
            free(tmp);
        }
        // 释放 queue 结构体
        free(queue);
    }

    /* 获取队列的长度 */
    int size(LinkedListQueue *queue) {
        return queue->queSize;
    }

    /* 判断队列是否为空 */
    bool empty(LinkedListQueue *queue) {
        return (size(queue) == 0);
    }

    /* 入队 */
    void push(LinkedListQueue *queue, int num) {
        // 尾节点处添加 node
        ListNode *node = newListNode(num);
        // 如果队列为空，则令头、尾节点都指向该节点
        if (queue->front == NULL) {
            queue->front = node;
            queue->rear = node;
        }
        // 如果队列不为空，则将该节点添加到尾节点后
        else {
            queue->rear->next = node;
            queue->rear = node;
        }
        queue->queSize++;
    }

    /* 访问队首元素 */
    int peek(LinkedListQueue *queue) {
        assert(size(queue) && queue->front);
        return queue->front->val;
    }

    /* 出队 */
    void pop(LinkedListQueue *queue) {
        int num = peek(queue);
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
        queue->queSize--;
    }

    /* 打印队列 */
    void printLinkedListQueue(LinkedListQueue *queue) {
        int *arr = malloc(sizeof(int) * queue->queSize);
        // 拷贝链表中的数据到数组
        int i;
        ListNode *node;
        for (i = 0, node = queue->front; i < queue->queSize; i++) {
            arr[i] = node->val;
            node = node->next;
        }
        printArray(arr, queue->queSize);
        free(arr);
    }
    ```

=== "Zig"

    ```zig title="linkedlist_queue.zig"
    // 基于链表实现的队列
    fn LinkedListQueue(comptime T: type) type {
        return struct {
            const Self = @This();

            front: ?*inc.ListNode(T) = null,                // 头节点 front
            rear: ?*inc.ListNode(T) = null,                 // 尾节点 rear
            que_size: usize = 0,                            // 队列的长度
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

            // 获取队列的长度
            pub fn size(self: *Self) usize {
                return self.que_size;
            }

            // 判断队列是否为空
            pub fn isEmpty(self: *Self) bool {
                return self.size() == 0;
            }

            // 访问队首元素
            pub fn peek(self: *Self) T {
                if (self.size() == 0) @panic("队列为空");
                return self.front.?.val;
            }  

            // 入队
            pub fn push(self: *Self, num: T) !void {
                // 尾节点后添加 num
                var node = try self.mem_allocator.create(inc.ListNode(T));
                node.init(num);
                // 如果队列为空，则令头、尾节点都指向该节点
                if (self.front == null) {
                    self.front = node;
                    self.rear = node;
                // 如果队列不为空，则将该节点添加到尾节点后
                } else {
                    self.rear.?.next = node;
                    self.rear = node;
                }
                self.que_size += 1;
            } 

            // 出队
            pub fn pop(self: *Self) T {
                var num = self.peek();
                // 删除头节点
                self.front = self.front.?.next;
                self.que_size -= 1;
                return num;
            } 

            // 将链表转换为数组
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

由于数组删除首元素的时间复杂度为 $O(n)$ ，这会导致出队操作效率较低。然而，我们可以采用以下巧妙方法来避免这个问题。

我们可以使用一个变量 `front` 指向队首元素的索引，并维护一个变量 `size` 用于记录队列长度。定义 `rear = front + size` ，这个公式计算出的 `rear` 指向队尾元素之后的下一个位置。

基于此设计，**数组中包含元素的有效区间为 `[front, rear - 1]`**，各种操作的实现方法如图 5-6 所示。

- 入队操作：将输入元素赋值给 `rear` 索引处，并将 `size` 增加 1 。
- 出队操作：只需将 `front` 增加 1 ，并将 `size` 减少 1 。

可以看到，入队和出队操作都只需进行一次操作，时间复杂度均为 $O(1)$ 。

=== "ArrayQueue"
    ![基于数组实现队列的入队出队操作](queue.assets/array_queue.png){ class="animation-figure" }

=== "push()"
    ![array_queue_push](queue.assets/array_queue_push.png){ class="animation-figure" }

=== "pop()"
    ![array_queue_pop](queue.assets/array_queue_pop.png){ class="animation-figure" }

<p align="center"> 图 5-6 &nbsp; 基于数组实现队列的入队出队操作 </p>

你可能会发现一个问题：在不断进行入队和出队的过程中，`front` 和 `rear` 都在向右移动，**当它们到达数组尾部时就无法继续移动了**。为解决此问题，我们可以将数组视为首尾相接的“环形数组”。

对于环形数组，我们需要让 `front` 或 `rear` 在越过数组尾部时，直接回到数组头部继续遍历。这种周期性规律可以通过“取余操作”来实现，代码如下所示。

=== "Python"

    ```python title="array_queue.py"
    class ArrayQueue:
        """基于环形数组实现的队列"""

        def __init__(self, size: int):
            """构造方法"""
            self._nums: list[int] = [0] * size  # 用于存储队列元素的数组
            self._front: int = 0  # 队首指针，指向队首元素
            self._size: int = 0  # 队列长度

        def capacity(self) -> int:
            """获取队列的容量"""
            return len(self._nums)

        def size(self) -> int:
            """获取队列的长度"""
            return self._size

        def is_empty(self) -> bool:
            """判断队列是否为空"""
            return self._size == 0

        def push(self, num: int):
            """入队"""
            if self._size == self.capacity():
                raise IndexError("队列已满")
            # 计算尾指针，指向队尾索引 + 1
            # 通过取余操作，实现 rear 越过数组尾部后回到头部
            rear: int = (self._front + self._size) % self.capacity()
            # 将 num 添加至队尾
            self._nums[rear] = num
            self._size += 1

        def pop(self) -> int:
            """出队"""
            num: int = self.peek()
            # 队首指针向后移动一位，若越过尾部则返回到数组头部
            self._front = (self._front + 1) % self.capacity()
            self._size -= 1
            return num

        def peek(self) -> int:
            """访问队首元素"""
            if self.is_empty():
                raise IndexError("队列为空")
            return self._nums[self._front]

        def to_list(self) -> list[int]:
            """返回列表用于打印"""
            res = [0] * self.size()
            j: int = self._front
            for i in range(self.size()):
                res[i] = self._nums[(j % self.capacity())]
                j += 1
            return res
    ```

=== "C++"

    ```cpp title="array_queue.cpp"
    /* 基于环形数组实现的队列 */
    class ArrayQueue {
      private:
        int *nums;       // 用于存储队列元素的数组
        int front;       // 队首指针，指向队首元素
        int queSize;     // 队列长度
        int queCapacity; // 队列容量

      public:
        ArrayQueue(int capacity) {
            // 初始化数组
            nums = new int[capacity];
            queCapacity = capacity;
            front = queSize = 0;
        }

        ~ArrayQueue() {
            delete[] nums;
        }

        /* 获取队列的容量 */
        int capacity() {
            return queCapacity;
        }

        /* 获取队列的长度 */
        int size() {
            return queSize;
        }

        /* 判断队列是否为空 */
        bool isEmpty() {
            return size() == 0;
        }

        /* 入队 */
        void push(int num) {
            if (queSize == queCapacity) {
                cout << "队列已满" << endl;
                return;
            }
            // 计算队尾指针，指向队尾索引 + 1
            // 通过取余操作，实现 rear 越过数组尾部后回到头部
            int rear = (front + queSize) % queCapacity;
            // 将 num 添加至队尾
            nums[rear] = num;
            queSize++;
        }

        /* 出队 */
        void pop() {
            int num = peek();
            // 队首指针向后移动一位，若越过尾部则返回到数组头部
            front = (front + 1) % queCapacity;
            queSize--;
        }

        /* 访问队首元素 */
        int peek() {
            if (isEmpty())
                throw out_of_range("队列为空");
            return nums[front];
        }

        /* 将数组转化为 Vector 并返回 */
        vector<int> toVector() {
            // 仅转换有效长度范围内的列表元素
            vector<int> arr(queSize);
            for (int i = 0, j = front; i < queSize; i++, j++) {
                arr[i] = nums[j % queCapacity];
            }
            return arr;
        }
    };
    ```

=== "Java"

    ```java title="array_queue.java"
    /* 基于环形数组实现的队列 */
    class ArrayQueue {
        private int[] nums; // 用于存储队列元素的数组
        private int front; // 队首指针，指向队首元素
        private int queSize; // 队列长度

        public ArrayQueue(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* 获取队列的容量 */
        public int capacity() {
            return nums.length;
        }

        /* 获取队列的长度 */
        public int size() {
            return queSize;
        }

        /* 判断队列是否为空 */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* 入队 */
        public void push(int num) {
            if (queSize == capacity()) {
                System.out.println("队列已满");
                return;
            }
            // 计算尾指针，指向队尾索引 + 1
            // 通过取余操作，实现 rear 越过数组尾部后回到头部
            int rear = (front + queSize) % capacity();
            // 将 num 添加至队尾
            nums[rear] = num;
            queSize++;
        }

        /* 出队 */
        public int pop() {
            int num = peek();
            // 队首指针向后移动一位，若越过尾部则返回到数组头部
            front = (front + 1) % capacity();
            queSize--;
            return num;
        }

        /* 访问队首元素 */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* 返回数组 */
        public int[] toArray() {
            // 仅转换有效长度范围内的列表元素
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[j % capacity()];
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_queue.cs"
    /* 基于环形数组实现的队列 */
    class ArrayQueue {
        private readonly int[] nums;  // 用于存储队列元素的数组
        private int front;   // 队首指针，指向队首元素
        private int queSize; // 队列长度

        public ArrayQueue(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* 获取队列的容量 */
        public int Capacity() {
            return nums.Length;
        }

        /* 获取队列的长度 */
        public int Size() {
            return queSize;
        }

        /* 判断队列是否为空 */
        public bool IsEmpty() {
            return queSize == 0;
        }

        /* 入队 */
        public void Push(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("队列已满");
                return;
            }
            // 计算尾指针，指向队尾索引 + 1
            // 通过取余操作，实现 rear 越过数组尾部后回到头部
            int rear = (front + queSize) % Capacity();
            // 将 num 添加至队尾
            nums[rear] = num;
            queSize++;
        }

        /* 出队 */
        public int Pop() {
            int num = Peek();
            // 队首指针向后移动一位，若越过尾部则返回到数组头部
            front = (front + 1) % Capacity();
            queSize--;
            return num;
        }

        /* 访问队首元素 */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return nums[front];
        }

        /* 返回数组 */
        public int[] ToArray() {
            // 仅转换有效长度范围内的列表元素
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[j % this.Capacity()];
            }
            return res;
        }
    }
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

    /* 初始化队列 */
    func newArrayQueue(queCapacity int) *arrayQueue {
        return &arrayQueue{
            nums:        make([]int, queCapacity),
            queCapacity: queCapacity,
            front:       0,
            queSize:     0,
        }
    }

    /* 获取队列的长度 */
    func (q *arrayQueue) size() int {
        return q.queSize
    }

    /* 判断队列是否为空 */
    func (q *arrayQueue) isEmpty() bool {
        return q.queSize == 0
    }

    /* 入队 */
    func (q *arrayQueue) push(num int) {
        // 当 rear == queCapacity 表示队列已满
        if q.queSize == q.queCapacity {
            return
        }
        // 计算尾指针，指向队尾索引 + 1
        // 通过取余操作，实现 rear 越过数组尾部后回到头部
        rear := (q.front + q.queSize) % q.queCapacity
        // 将 num 添加至队尾
        q.nums[rear] = num
        q.queSize++
    }

    /* 出队 */
    func (q *arrayQueue) pop() any {
        num := q.peek()
        // 队首指针向后移动一位，若越过尾部则返回到数组头部
        q.front = (q.front + 1) % q.queCapacity
        q.queSize--
        return num
    }

    /* 访问队首元素 */
    func (q *arrayQueue) peek() any {
        if q.isEmpty() {
            return nil
        }
        return q.nums[q.front]
    }

    /* 获取 Slice 用于打印 */
    func (q *arrayQueue) toSlice() []int {
        rear := (q.front + q.queSize)
        if rear >= q.queCapacity {
            rear %= q.queCapacity
            return append(q.nums[q.front:], q.nums[:rear]...)
        }
        return q.nums[q.front:rear]
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
            // 将 num 添加至队尾
            nums[rear] = num
            queSize += 1
        }

        /* 出队 */
        @discardableResult
        func pop() -> Int {
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

        /* 返回数组 */
        func toArray() -> [Int] {
            // 仅转换有效长度范围内的列表元素
            var res = Array(repeating: 0, count: queSize)
            for (i, j) in sequence(first: (0, front), next: { $0 < self.queSize - 1 ? ($0 + 1, $1 + 1) : nil }) {
                res[i] = nums[j % capacity()]
            }
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="array_queue.js"
    /* 基于环形数组实现的队列 */
    class ArrayQueue {
        #nums; // 用于存储队列元素的数组
        #front = 0; // 队首指针，指向队首元素
        #queSize = 0; // 队列长度

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
        isEmpty() {
            return this.#queSize === 0;
        }

        /* 入队 */
        push(num) {
            if (this.size === this.capacity) {
                console.log('队列已满');
                return;
            }
            // 计算尾指针，指向队尾索引 + 1
            // 通过取余操作，实现 rear 越过数组尾部后回到头部
            const rear = (this.#front + this.size) % this.capacity;
            // 将 num 添加至队尾
            this.#nums[rear] = num;
            this.#queSize++;
        }

        /* 出队 */
        pop() {
            const num = this.peek();
            // 队首指针向后移动一位，若越过尾部则返回到数组头部
            this.#front = (this.#front + 1) % this.capacity;
            this.#queSize--;
            return num;
        }

        /* 访问队首元素 */
        peek() {
            if (this.isEmpty()) throw new Error('队列为空');
            return this.#nums[this.#front];
        }

        /* 返回 Array */
        toArray() {
            // 仅转换有效长度范围内的列表元素
            const arr = new Array(this.size);
            for (let i = 0, j = this.#front; i < this.size; i++, j++) {
                arr[i] = this.#nums[j % this.capacity];
            }
            return arr;
        }
    }
    ```

=== "TS"

    ```typescript title="array_queue.ts"
    /* 基于环形数组实现的队列 */
    class ArrayQueue {
        private nums: number[]; // 用于存储队列元素的数组
        private front: number; // 队首指针，指向队首元素
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
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* 入队 */
        push(num: number): void {
            if (this.size === this.capacity) {
                console.log('队列已满');
                return;
            }
            // 计算尾指针，指向队尾索引 + 1
            // 通过取余操作，实现 rear 越过数组尾部后回到头部
            const rear = (this.front + this.queSize) % this.capacity;
            // 将 num 添加至队尾
            this.nums[rear] = num;
            this.queSize++;
        }

        /* 出队 */
        pop(): number {
            const num = this.peek();
            // 队首指针向后移动一位，若越过尾部则返回到数组头部
            this.front = (this.front + 1) % this.capacity;
            this.queSize--;
            return num;
        }

        /* 访问队首元素 */
        peek(): number {
            if (this.isEmpty()) throw new Error('队列为空');
            return this.nums[this.front];
        }

        /* 返回 Array */
        toArray(): number[] {
            // 仅转换有效长度范围内的列表元素
            const arr = new Array(this.size);
            for (let i = 0, j = this.front; i < this.size; i++, j++) {
                arr[i] = this.nums[j % this.capacity];
            }
            return arr;
        }
    }
    ```

=== "Dart"

    ```dart title="array_queue.dart"
    /* 基于环形数组实现的队列 */
    class ArrayQueue {
      late List<int> _nums; // 用于储存队列元素的数组
      late int _front; // 队首指针，指向队首元素
      late int _queSize; // 队列长度

      ArrayQueue(int capacity) {
        _nums = List.filled(capacity, 0);
        _front = _queSize = 0;
      }

      /* 获取队列的容量 */
      int capaCity() {
        return _nums.length;
      }

      /* 获取队列的长度 */
      int size() {
        return _queSize;
      }

      /* 判断队列是否为空 */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* 入队 */
      void push(int _num) {
        if (_queSize == capaCity()) {
          throw Exception("队列已满");
        }
        // 计算尾指针，指向队尾索引 + 1
        // 通过取余操作，实现 rear 越过数组尾部后回到头部
        int rear = (_front + _queSize) % capaCity();
        // 将 _num 添加至队尾
        _nums[rear] = _num;
        _queSize++;
      }

      /* 出队 */
      int pop() {
        int _num = peek();
        // 队首指针向后移动一位，若越过尾部则返回到数组头部
        _front = (_front + 1) % capaCity();
        _queSize--;
        return _num;
      }

      /* 访问队首元素 */
      int peek() {
        if (isEmpty()) {
          throw Exception("队列为空");
        }
        return _nums[_front];
      }

      /* 返回 Array */
      List<int> toArray() {
        // 仅转换有效长度范围内的列表元素
        final List<int> res = List.filled(_queSize, 0);
        for (int i = 0, j = _front; i < _queSize; i++, j++) {
          res[i] = _nums[j % capaCity()];
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_queue.rs"
    /* 基于环形数组实现的队列 */
    struct ArrayQueue {
        nums: Vec<i32>,     // 用于存储队列元素的数组
        front: i32,         // 队首指针，指向队首元素
        que_size: i32,      // 队列长度
        que_capacity: i32,  // 队列容量
    }

    impl ArrayQueue {
        /* 构造方法 */
        fn new(capacity: i32) -> ArrayQueue {
            ArrayQueue {
                nums: vec![0; capacity as usize],
                front: 0,
                que_size: 0,
                que_capacity: capacity,
            }
        }

        /* 获取队列的容量 */
        fn capacity(&self) -> i32 {
            self.que_capacity
        }

        /* 获取队列的长度 */
        fn size(&self) -> i32 {
            self.que_size
        }

        /* 判断队列是否为空 */
        fn is_empty(&self) -> bool {
            self.que_size == 0
        }

        /* 入队 */
        fn push(&mut self, num: i32) {
            if self.que_size == self.capacity() {
                println!("队列已满");
                return;
            }
            // 计算尾指针，指向队尾索引 + 1
            // 通过取余操作，实现 rear 越过数组尾部后回到头部
            let rear = (self.front + self.que_size) % self.que_capacity;
            // 将 num 添加至队尾
            self.nums[rear as usize] = num;
            self.que_size += 1;
        }

        /* 出队 */
        fn pop(&mut self) -> i32 {
            let num = self.peek();
            // 队首指针向后移动一位，若越过尾部则返回到数组头部
            self.front = (self.front + 1) % self.que_capacity;
            self.que_size -= 1;
            num
        }

        /* 访问队首元素 */
        fn peek(&self) -> i32 {
            if self.is_empty() {
                panic!("index out of bounds");
            }
            self.nums[self.front as usize]
        }

        /* 返回数组 */
        fn to_vector(&self) -> Vec<i32> {
            let cap = self.que_capacity;
            let mut j = self.front;
            let mut arr = vec![0; self.que_size as usize];
            for i in 0..self.que_size {
                arr[i as usize] = self.nums[(j % cap) as usize];
                j += 1;
            }
            arr
        }
    }
    ```

=== "C"

    ```c title="array_queue.c"
    /* 基于环形数组实现的队列 */
    typedef struct {
        int *nums;       // 用于存储队列元素的数组
        int front;       // 队首指针，指向队首元素
        int queSize;     // 尾指针，指向队尾 + 1
        int queCapacity; // 队列容量
    } ArrayQueue;

    /* 构造函数 */
    ArrayQueue *newArrayQueue(int capacity) {
        ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
        // 初始化数组
        queue->queCapacity = capacity;
        queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
        queue->front = queue->queSize = 0;
        return queue;
    }

    /* 析构函数 */
    void delArrayQueue(ArrayQueue *queue) {
        free(queue->nums);
        free(queue);
    }

    /* 获取队列的容量 */
    int capacity(ArrayQueue *queue) {
        return queue->queCapacity;
    }

    /* 获取队列的长度 */
    int size(ArrayQueue *queue) {
        return queue->queSize;
    }

    /* 判断队列是否为空 */
    bool empty(ArrayQueue *queue) {
        return queue->queSize == 0;
    }

    /* 访问队首元素 */
    int peek(ArrayQueue *queue) {
        assert(size(queue) != 0);
        return queue->nums[queue->front];
    }

    /* 入队 */
    void push(ArrayQueue *queue, int num) {
        if (size(queue) == capacity(queue)) {
            printf("队列已满\r\n");
            return;
        }
        // 计算队尾指针，指向队尾索引 + 1
        // 通过取余操作，实现 rear 越过数组尾部后回到头部
        int rear = (queue->front + queue->queSize) % queue->queCapacity;
        // 将 num 添加至队尾
        queue->nums[rear] = num;
        queue->queSize++;
    }

    /* 出队 */
    void pop(ArrayQueue *queue) {
        int num = peek(queue);
        // 队首指针向后移动一位，若越过尾部则返回到数组头部
        queue->front = (queue->front + 1) % queue->queCapacity;
        queue->queSize--;
    }
    ```

=== "Zig"

    ```zig title="array_queue.zig"
    // 基于环形数组实现的队列
    fn ArrayQueue(comptime T: type) type {
        return struct {
            const Self = @This();

            nums: []T = undefined,                          // 用于存储队列元素的数组     
            cap: usize = 0,                                 // 队列容量
            front: usize = 0,                               // 队首指针，指向队首元素
            queSize: usize = 0,                             // 尾指针，指向队尾 + 1
            mem_arena: ?std.heap.ArenaAllocator = null,
            mem_allocator: std.mem.Allocator = undefined,   // 内存分配器

            // 构造函数（分配内存+初始化数组）
            pub fn init(self: *Self, allocator: std.mem.Allocator, cap: usize) !void {
                if (self.mem_arena == null) {
                    self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                    self.mem_allocator = self.mem_arena.?.allocator();
                }
                self.cap = cap;
                self.nums = try self.mem_allocator.alloc(T, self.cap);
                @memset(self.nums, @as(T, 0));
            }
            
            // 析构函数（释放内存）
            pub fn deinit(self: *Self) void {
                if (self.mem_arena == null) return;
                self.mem_arena.?.deinit();
            }

            // 获取队列的容量
            pub fn capacity(self: *Self) usize {
                return self.cap;
            }

            // 获取队列的长度
            pub fn size(self: *Self) usize {
                return self.queSize;
            }

            // 判断队列是否为空
            pub fn isEmpty(self: *Self) bool {
                return self.queSize == 0;
            }

            // 入队
            pub fn push(self: *Self, num: T) !void {
                if (self.size() == self.capacity()) {
                    std.debug.print("队列已满\n", .{});
                    return;
                }
                // 计算尾指针，指向队尾索引 + 1
                // 通过取余操作，实现 rear 越过数组尾部后回到头部
                var rear = (self.front + self.queSize) % self.capacity();
                // 尾节点后添加 num
                self.nums[rear] = num;
                self.queSize += 1;
            } 

            // 出队
            pub fn pop(self: *Self) T {
                var num = self.peek();
                // 队首指针向后移动一位，若越过尾部则返回到数组头部
                self.front = (self.front + 1) % self.capacity();
                self.queSize -= 1;
                return num;
            } 

            // 访问队首元素
            pub fn peek(self: *Self) T {
                if (self.isEmpty()) @panic("队列为空");
                return self.nums[self.front];
            } 

            // 返回数组
            pub fn toArray(self: *Self) ![]T {
                // 仅转换有效长度范围内的列表元素
                var res = try self.mem_allocator.alloc(T, self.size());
                @memset(res, @as(T, 0));
                var i: usize = 0;
                var j: usize = self.front;
                while (i < self.size()) : ({ i += 1; j += 1; }) {
                    res[i] = self.nums[j % self.capacity()];
                }
                return res;
            }
        };
    }
    ```

以上实现的队列仍然具有局限性，即其长度不可变。然而，这个问题不难解决，我们可以将数组替换为动态数组，从而引入扩容机制。有兴趣的同学可以尝试自行实现。

两种实现的对比结论与栈一致，在此不再赘述。

## 5.2.3 &nbsp; 队列典型应用

- **淘宝订单**。购物者下单后，订单将加入队列中，系统随后会根据顺序依次处理队列中的订单。在双十一期间，短时间内会产生海量订单，高并发成为工程师们需要重点攻克的问题。
- **各类待办事项**。任何需要实现“先来后到”功能的场景，例如打印机的任务队列、餐厅的出餐队列等。队列在这些场景中可以有效地维护处理顺序。
