---
comments: true
---

# 栈

「栈 Stack」是一种遵循「先入后出 first in, last out」数据操作规则的线性数据结构。我们可以将栈类比为放在桌面上的一摞盘子，如果需要拿出底部的盘子，则需要先将上面的盘子依次取出。

“盘子”是一种形象比喻，我们将盘子替换为任意一种元素（例如整数、字符、对象等），就得到了栈数据结构。

我们将这一摞元素的顶部称为「栈顶」，将底部称为「栈底」，将把元素添加到栈顶的操作称为「入栈」，将删除栈顶元素的操作称为「出栈」。

![stack_operations](stack.assets/stack_operations.png)

<p align="center"> Fig. 栈的先入后出特性 </p>

## 栈常用操作

栈的常用操作见下表（方法命名以 Java 为例）。

<p align="center"> Table. 栈的常用操作 </p>

<div class="center-table" markdown>

| 方法      | 描述                   | 时间复杂度 |
| --------- | ---------------------- | ---------- |
| push()    | 元素入栈（添加至栈顶） | $O(1)$     |
| pop()     | 栈顶元素出栈           | $O(1)$     |
| peek()    | 访问栈顶元素           | $O(1)$     |
| size()    | 获取栈的长度           | $O(1)$     |
| isEmpty() | 判断栈是否为空         | $O(1)$     |

</div>

我们可以直接使用编程语言实现好的栈类。

=== "Java"

    ```java title="stack.java"
    /* 初始化栈 */
    // 在 Java 中，推荐将 LinkedList 当作栈来使用
    LinkedList<Integer> stack = new LinkedList<>();
    
    /* 元素入栈 */
    stack.addLast(1);
    stack.addLast(3);
    stack.addLast(2);
    stack.addLast(5);
    stack.addLast(4);
    
    /* 访问栈顶元素 */
    int peek = stack.peekLast();
    
    /* 元素出栈 */
    int pop = stack.removeLast();
    
    /* 获取栈的长度 */
    int size = stack.size();
    
    /* 判断是否为空 */
    boolean isEmpty = stack.isEmpty();
    ```

=== "C++"

    ```cpp title="stack.cpp"
    /* 初始化栈 */
    stack<int> stack;
    
    /* 元素入栈 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    
    /* 访问栈顶元素 */
    int top = stack.top();
    
    /* 元素出栈 */
    stack.pop();
    
    /* 获取栈的长度 */
    int size = stack.size();
    
    /* 判断是否为空 */
    bool empty = stack.empty();
    ```

=== "Python"

    ```python title="stack.py"
    """ 初始化栈 """
    # Python 没有内置的栈类，可以把 List 当作栈来使用 
    stack = []
    
    """ 元素入栈 """
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    
    """ 访问栈顶元素 """
    peek = stack[-1]
    
    """ 元素出栈 """
    pop = stack.pop()
    
    """ 获取栈的长度 """
    size = len(stack)
    
    """ 判断是否为空 """
    is_empty = len(stack) == 0
    ```

=== "Go"

    ```go title="stack_test.go"
    /* 初始化栈 */
    // 在 Go 中，推荐将 Slice 当作栈来使用
    var stack []int
    
    /* 元素入栈 */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)
    
    /* 访问栈顶元素 */
    peek := stack[len(stack)-1]
    
    /* 元素出栈 */
    pop := stack[len(stack)-1]
    stack = stack[:len(stack)-1]
    
    /* 获取栈的长度 */
    size := len(stack)
    
    /* 判断是否为空 */
    isEmpty := len(stack) == 0
    ```

=== "JavaScript"

    ```js title="stack.js"
    /* 初始化栈 */
    // Javascript 没有内置的栈类，可以把 Array 当作栈来使用 
    const stack = [];
    
    /* 元素入栈 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    
    /* 访问栈顶元素 */
    const peek = stack[stack.length-1];
    
    /* 元素出栈 */
    const pop = stack.pop();
    
    /* 获取栈的长度 */
    const size = stack.length;
    
    /* 判断是否为空 */
    const is_empty = stack.length === 0;
    ```

=== "TypeScript"

    ```typescript title="stack.ts"
    /* 初始化栈 */
    // Typescript 没有内置的栈类，可以把 Array 当作栈来使用 
    const stack: number[] = [];
    
    /* 元素入栈 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    
    /* 访问栈顶元素 */
    const peek = stack[stack.length - 1];
    
    /* 元素出栈 */
    const pop = stack.pop();
    
    /* 获取栈的长度 */
    const size = stack.length;
    
    /* 判断是否为空 */
    const is_empty = stack.length === 0;
    ```

=== "C"

    ```c title="stack.c"
    
    ```

=== "C#"

    ```csharp title="stack.cs"
    /* 初始化栈 */
    Stack<int> stack = new ();
    
    /* 元素入栈 */
    stack.Push(1);
    stack.Push(3);
    stack.Push(2);
    stack.Push(5);
    stack.Push(4);
    
    /* 访问栈顶元素 */
    int peek = stack.Peek();
    
    /* 元素出栈 */
    int pop = stack.Pop();
    
    /* 获取栈的长度 */
    int size = stack.Count();
    
    /* 判断是否为空 */
    bool isEmpty = stack.Count()==0;
    ```

=== "Swift"

    ```swift title="stack.swift"
    /* 初始化栈 */
    // Swift 没有内置的栈类，可以把 Array 当作栈来使用
    var stack: [Int] = []

    /* 元素入栈 */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    /* 访问栈顶元素 */
    let peek = stack.last!

    /* 元素出栈 */
    let pop = stack.removeLast()

    /* 获取栈的长度 */
    let size = stack.count

    /* 判断是否为空 */
    let isEmpty = stack.isEmpty
    ```

## 栈的实现

为了更加清晰地了解栈的运行机制，接下来我们来自己动手实现一个栈类。

栈规定元素是先入后出的，因此我们只能在栈顶添加或删除元素。然而，数组或链表都可以在任意位置添加删除元素，因此 **栈可被看作是一种受约束的数组或链表**。换言之，我们可以“屏蔽”数组或链表的部分无关操作，使之对外的表现逻辑符合栈的规定即可。

### 基于链表的实现

使用「链表」实现栈时，将链表的头结点看作栈顶，尾结点看作栈底。

对于入栈操作，将元素插入到链表头部即可，这种结点添加方式被称为“头插法”。而对于出栈操作，则将头结点从链表中删除即可。

受益于链表的离散存储方式，栈的扩容更加灵活，删除元素的内存也会被系统自动回收；缺点是无法像数组一样高效地随机访问，并且由于链表结点需存储指针，导致单个元素占用空间更大。

=== "Java"

    ```java title="linkedlist_stack.java"
    /* 基于链表实现的栈 */
    class LinkedListStack {
        private ListNode stackPeek;  // 将头结点作为栈顶
        private int stkSize = 0;   // 栈的长度
        public LinkedListStack() {
            stackPeek = null;
        }
        /* 获取栈的长度 */
        public int size() {
            return stkSize;
        }
        /* 判断栈是否为空 */
        public boolean isEmpty() {
            return size() == 0;
        }
        /* 入栈 */
        public void push(int num) {
            ListNode node = new ListNode(num);
            node.next = stackPeek;
            stackPeek = node;
            stkSize++;
        }
        /* 出栈 */
        public int pop() {
            int num = peek();
            stackPeek = stackPeek.next;
            stkSize--;
            return num;
        }
        /* 访问栈顶元素 */
        public int peek() {
            if (size() == 0)
                throw new EmptyStackException();
            return stackPeek.val;
        }
    }
    ```

=== "C++"

    ```cpp title="linkedlist_stack.cpp"
    /* 基于链表实现的栈 */
    class LinkedListStack {
    private:
        ListNode* stackTop; // 将头结点作为栈顶
        int stkSize;        // 栈的长度
    
    public:
        LinkedListStack() {
            stackTop = nullptr;
            stkSize = 0;
        }
        ~LinkedListStack() {
            freeMemoryLinkedList(stackTop);
        }
        /* 获取栈的长度 */
        int size() {
            return stkSize;
        }
        /* 判断栈是否为空 */
        bool empty() {
            return size() == 0;
        }
        /* 入栈 */
        void push(int num) {
            ListNode* node = new ListNode(num);
            node->next = stackTop;
            stackTop = node;
            stkSize++;
        }
        /* 出栈 */
        void pop() {
            int num = top();
            ListNode *tmp = stackTop;
            stackTop = stackTop->next;
            // 释放内存
            delete tmp;
            stkSize--;
        }
        /* 访问栈顶元素 */
        int top() {
            if (size() == 0)
                throw out_of_range("栈为空");
            return stackTop->val;
        }
    };
    ```

=== "Python"

    ```python title="linkedlist_stack.py"
    """ 基于链表实现的栈 """
    class LinkedListStack:
        def __init__(self):
            self.__peek = None
            self.__size = 0
    
        """ 获取栈的长度 """
        def size(self):
            return self.__size
    
        """ 判断栈是否为空 """
        def is_empty(self):
            return not self.__peek
    
        """ 入栈 """
        def push(self, val):
            node = ListNode(val)
            node.next = self.__peek
            self.__peek = node
            self.__size += 1
    
        """ 出栈 """
        def pop(self):
            num = self.peek()
            self.__peek = self.__peek.next
            self.__size -= 1
            return num
    
        """ 访问栈顶元素 """
        def peek(self):
            # 判空处理
            if not self.__peek: return None
            return self.__peek.val
    ```

=== "Go"

    ```go title="linkedlist_stack.go"
    /* 基于链表实现的栈 */
    type linkedListStack struct {
        // 使用内置包 list 来实现栈
        data *list.List
    }

    // newLinkedListStack 初始化链表
    func newLinkedListStack() *linkedListStack {
        return &linkedListStack{
            data: list.New(),
        }
    }

    // push 入栈
    func (s *linkedListStack) push(value int) {
        s.data.PushBack(value)
    }

    // pop 出栈
    func (s *linkedListStack) pop() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    // peek 访问栈顶元素
    func (s *linkedListStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    // size 获取栈的长度
    func (s *linkedListStack) size() int {
        return s.data.Len()
    }

    // isEmpty 判断栈是否为空
    func (s *linkedListStack) isEmpty() bool {
        return s.data.Len() == 0
    }
    ```

=== "JavaScript"

    ```js title="linkedlist_stack.js"
    /* 基于链表实现的栈 */
    class LinkedListStack {
        #stackPeek;  // 将头结点作为栈顶
        #stkSize = 0;   // 栈的长度
    
        constructor() {
            this.#stackPeek = null;
        }
    
        /* 获取栈的长度 */
        get size() {
            return this.#stkSize;
        }
    
        /* 判断栈是否为空 */
        isEmpty() {
            return this.size == 0;
        }
    
        /* 入栈 */
        push(num) {
            const node = new ListNode(num);
            node.next = this.#stackPeek;
            this.#stackPeek = node;
            this.#stkSize++;
        }
    
        /* 出栈 */
        pop() {
            const num = this.peek();
            if (!this.#stackPeek) {
                throw new Error("栈为空！");
            }
            this.#stackPeek = this.#stackPeek.next;
            this.#stkSize--;
            return num;
        }
    
        /* 访问栈顶元素 */
        peek() {
            if (!this.#stackPeek) {
                throw new Error("栈为空！");
            }
            return this.#stackPeek.val;
        }
    
        /* 将链表转化为 Array 并返回 */
        toArray() {
            let node = this.#stackPeek;
            const res = new Array(this.size);
            for (let i = res.length - 1; i >= 0; i--) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "TypeScript"

    ```typescript title="linkedlist_stack.ts"
    /* 基于链表实现的栈 */
    class LinkedListStack {
        private stackPeek: ListNode | null;  // 将头结点作为栈顶
        private stkSize: number = 0;   // 栈的长度
    
        constructor() {
            this.stackPeek = null;
        }
    
        /* 获取栈的长度 */
        get size(): number {
            return this.stkSize;
        }
    
        /* 判断栈是否为空 */
        isEmpty(): boolean {
            return this.size == 0;
        }
    
        /* 入栈 */
        push(num: number): void {
            const node = new ListNode(num);
            node.next = this.stackPeek;
            this.stackPeek = node;
            this.stkSize++;
        }
    
        /* 出栈 */
        pop(): number {
            const num = this.peek();
            if (!this.stackPeek) {
                throw new Error("栈为空！");
            }
            this.stackPeek = this.stackPeek.next;
            this.stkSize--;
            return num;
        }
    
        /* 访问栈顶元素 */
        peek(): number {
            if (!this.stackPeek) {
                throw new Error("栈为空！");
            }
            return this.stackPeek.val;
        }
    
        /* 将链表转化为 Array 并返回 */
        toArray(): number[] {
            let node = this.stackPeek;
            const res = new Array<number>(this.size);
            for (let i = res.length - 1; i >= 0; i--) {
                res[i] = node!.val;
                node = node!.next;
            }
            return res;
        }
    }
    ```

=== "C"

    ```c title="linkedlist_stack.c"
    
    ```

=== "C#"

    ```csharp title="linkedlist_stack.cs"
    /* 基于链表实现的栈 */
    class LinkedListStack
    {
        private ListNode stackPeek;  // 将头结点作为栈顶
        private int stkSize = 0;   // 栈的长度
        public LinkedListStack()
        {
            stackPeek = null;
        }
        /* 获取栈的长度 */
        public int size()
        {
            return stkSize;
        }
        /* 判断栈是否为空 */
        public bool isEmpty()
        {
            return size() == 0;
        }
        /* 入栈 */
        public void push(int num)
        {
            ListNode node = new ListNode(num);
            node.next = stackPeek;
            stackPeek = node;
            stkSize++;
        }
        /* 出栈 */
        public int pop()
        {
            int num = peek();
            stackPeek = stackPeek?.next;
            stkSize--;
            return num;
        }
        /* 访问栈顶元素 */
        public int peek()
        {
            if (size() == 0)
                throw new Exception();
            return stackPeek.val;
        }
    }
    ```

=== "Swift"

    ```swift title="linkedlist_stack.swift"
    /* 基于链表实现的栈 */
    class LinkedListStack {
        private var _peek: ListNode? // 将头结点作为栈顶
        private var _size = 0 // 栈的长度

        init() {}

        /* 获取栈的长度 */
        func size() -> Int {
            _size
        }

        /* 判断栈是否为空 */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* 入栈 */
        func push(num: Int) {
            let node = ListNode(x: num)
            node.next = _peek
            _peek = node
            _size += 1
        }

        /* 出栈 */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            _peek = _peek?.next
            _size -= 1
            return num
        }

        /* 访问栈顶元素 */
        func peek() -> Int {
            if isEmpty() {
                fatalError("栈为空")
            }
            return _peek!.val
        }
    }
    ```

### 基于数组的实现

使用「数组」实现栈时，将数组的尾部当作栈顶，这样可以保证入栈与出栈操作的时间复杂度都为 $O(1)$ 。准确地说，由于入栈的元素可能是源源不断的，我们需要使用可以动态扩容的「列表」。

基于数组实现的栈，优点是支持随机访问，缺点是会造成一定的空间浪费，因为列表的容量始终 $\geq$ 元素数量。

=== "Java"

    ```java title="array_stack.java"
    /* 基于数组实现的栈 */
    class ArrayStack {
        private ArrayList<Integer> stack;
        public ArrayStack() {
            // 初始化列表（动态数组）
            stack = new ArrayList<>();
        }
        /* 获取栈的长度 */
        public int size() {
            return stack.size();
        }
        /* 判断栈是否为空 */
        public boolean isEmpty() {
            return size() == 0;
        }
        /* 入栈 */
        public void push(int num) {
            stack.add(num);
        }
        /* 出栈 */
        public int pop() {
            if (isEmpty())
                throw new EmptyStackException();
            return stack.remove(size() - 1);
        }
        /* 访问栈顶元素 */
        public int peek() {
            if (isEmpty())
                throw new EmptyStackException();
            return stack.get(size() - 1);
        }
    }
    ```

=== "C++"

    ```cpp title="array_stack.cpp"
    /* 基于数组实现的栈 */
    class ArrayStack {
    private:
        vector<int> stack;
        
    public:
        /* 获取栈的长度 */
        int size() {
            return stack.size();
        }
        /* 判断栈是否为空 */
        bool empty() {
            return stack.empty();
        }
        /* 入栈 */
        void push(int num) {
            stack.push_back(num);
        }
        /* 出栈 */
        void pop() {
            int oldTop = top();
            stack.pop_back();
        }
        /* 访问栈顶元素 */
        int top() {
            if(empty())
                throw out_of_range("栈为空");
            return stack.back();
        }
    };
    ```

=== "Python"

    ```python title="array_stack.py"
    """ 基于数组实现的栈 """
    class ArrayStack:
        def __init__(self):
            self.__stack = []
    
        """ 获取栈的长度 """
        def size(self):
            return len(self.__stack)
    
        """ 判断栈是否为空 """
        def is_empty(self):
            return self.__stack == []
    
        """ 入栈 """
        def push(self, item):
            self.__stack.append(item)
    
        """ 出栈 """
        def pop(self):
            assert not self.is_empty(), "栈为空"
            return self.__stack.pop()
    
        """ 访问栈顶元素 """
        def peek(self):
            assert not self.is_empty(), "栈为空"
            return self.__stack[-1]
    ```

=== "Go"

    ```go title="array_stack.go"
    /* 基于数组实现的栈 */
    type arrayStack struct {
        data []int // 数据
    }

    func newArrayStack() *arrayStack {
        return &arrayStack{
            // 设置栈的长度为 0，容量为 16
            data: make([]int, 0, 16),
        }
    }

    // size 栈的长度
    func (s *arrayStack) size() int {
        return len(s.data)
    }

    // isEmpty 栈是否为空
    func (s *arrayStack) isEmpty() bool {
        return s.size() == 0
    }

    // push 入栈
    func (s *arrayStack) push(v int) {
        // 切片会自动扩容
        s.data = append(s.data, v)
    }

    // pop 出栈
    func (s *arrayStack) pop() any {
        // 弹出栈前，先判断是否为空
        if s.isEmpty() {
            return nil
        }
        val := s.peek()
        s.data = s.data[:len(s.data)-1]
        return val
    }

    // peek 获取栈顶元素
    func (s *arrayStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        val := s.data[len(s.data)-1]
        return val
    }
    ```

=== "JavaScript"

    ```js title="array_stack.js"
    /* 基于数组实现的栈 */
    class ArrayStack {
        stack;
        constructor() {
            this.stack = [];
        }
        /* 获取栈的长度 */
        get size() {
            return this.stack.length;
        }
        /* 判断栈是否为空 */
        empty() {
            return this.stack.length === 0;
        }
        /* 入栈 */
        push(num) {
            this.stack.push(num);
        }
        /* 出栈 */
        pop() {
            if (this.empty())
                throw new Error("栈为空");
            return this.stack.pop();
        }
        /* 访问栈顶元素 */
        top() {
            if (this.empty())
                throw new Error("栈为空");
            return this.stack[this.stack.length - 1];
        }
    };
    ```

=== "TypeScript"

    ```typescript title="array_stack.ts"
    /* 基于数组实现的栈 */
    class ArrayStack {
        private stack: number[];
        constructor() {
            this.stack = [];
        }
        /* 获取栈的长度 */
        get size(): number {
            return this.stack.length;
        }
        /* 判断栈是否为空 */
        empty(): boolean {
            return this.stack.length === 0;
        }
        /* 入栈 */
        push(num: number): void {
            this.stack.push(num);
        }
        /* 出栈 */
        pop(): number | undefined {
            if (this.empty())
                throw new Error('栈为空');
            return this.stack.pop();
        }
        /* 访问栈顶元素 */
        top(): number | undefined {
            if (this.empty())
                throw new Error('栈为空');
            return this.stack[this.stack.length - 1];
        }
    };
    ```

=== "C"

    ```c title="array_stack.c"
    
    ```

=== "C#"

    ```csharp title="array_stack.cs"
    /* 基于数组实现的栈 */
    class ArrayStack
    {
        private List<int> stack;
        public ArrayStack()
        {
            // 初始化列表（动态数组）
            stack = new();
        }
        /* 获取栈的长度 */
        public int size()
        {
            return stack.Count();
        }
        /* 判断栈是否为空 */
        public bool isEmpty()
        {
            return size() == 0;
        }
        /* 入栈 */
        public void push(int num)
        {
            stack.Add(num);
        }
        /* 出栈 */
        public int pop()
        {
            if (isEmpty())
                throw new Exception();
            var val = peek();
            stack.RemoveAt(size() - 1);
            return val;
        }
        /* 访问栈顶元素 */
        public int peek()
        {
            if (isEmpty())
                throw new Exception();
            return stack[size() - 1];
        }
    }
    ```

=== "Swift"

    ```swift title="array_stack.swift"
    /* 基于数组实现的栈 */
    class ArrayStack {
        private var stack: [Int]

        init() {
            // 初始化列表（动态数组）
            stack = []
        }

        /* 获取栈的长度 */
        func size() -> Int {
            stack.count
        }

        /* 判断栈是否为空 */
        func isEmpty() -> Bool {
            stack.isEmpty
        }

        /* 入栈 */
        func push(num: Int) {
            stack.append(num)
        }

        /* 出栈 */
        @discardableResult
        func pop() -> Int {
            if isEmpty() {
                fatalError("栈为空")
            }
            return stack.removeLast()
        }

        /* 访问栈顶元素 */
        func peek() -> Int {
            if isEmpty() {
                fatalError("栈为空")
            }
            return stack.last!
        }
    }
    ```

!!! tip

    某些语言并未专门提供栈类，但我们可以直接把该语言的「数组」或「链表」看作栈来使用，并通过“脑补”来屏蔽无关操作，而无需像上述代码去特意包装一层。

## 栈典型应用

- **浏览器中的后退与前进、软件中的撤销与反撤销**。每当我们打开新的网页，浏览器就将上一个网页执行入栈，这样我们就可以通过「后退」操作来回到上一页面，后退操作实际上是在执行出栈。如果要同时支持后退和前进，那么则需要两个栈来配合实现。
- **程序内存管理**。每当调用函数时，系统就会在栈顶添加一个栈帧，用来记录函数的上下文信息。在递归函数中，向下递推会不断执行入栈，向上回溯阶段时出栈。
