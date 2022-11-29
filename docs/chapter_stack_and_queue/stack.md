---
comments: true
---

# 栈

「栈 Stack」是一种遵循「先入后出 first in, last out」数据操作规则的线性数据结构。我们可以将栈类比为放在桌面上的一摞盘子，如果需要拿出底部的盘子，则需要先将上面的盘子依次取出。

我们将顶部盘子称为「栈顶」，底部盘子称为「栈底」，将把元素添加到栈顶的操作称为「入栈」，将删除栈顶元素的操作称为「出栈」。

![stack_operations](stack.assets/stack_operations.png)

<p align="center"> Fig. 栈的先入后出特性 </p>

## 栈常用操作

栈的常用操作见下表，方法名需根据编程语言设定来具体确定。

<p align="center"> Table. 栈的常用操作 </p>

<div class="center-table" markdown>

| 方法      | 描述                   |
| --------- | ---------------------- |
| push()    | 元素入栈（添加至栈顶） |
| pop()     | 栈顶元素出栈           |
| peek()    | 访问栈顶元素           |
| size()    | 获取栈的长度           |
| isEmpty() | 判断栈是否为空         |

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
    System.out.println("栈 stack = " + stack);

    /* 访问栈顶元素 */
    int peek = stack.peekLast();
    System.out.println("栈顶元素 peek = " + peek);

    /* 元素出栈 */
    int pop = stack.removeLast();
    System.out.println("出栈元素 pop = " + pop + "，出栈后 stack = " + stack);

    /* 获取栈的长度 */
    int size = stack.size();
    System.out.println("栈的长度 size = " + size);

    /* 判断是否为空 */
    boolean isEmpty = stack.isEmpty();
    System.out.println("栈是否为空 = " + isEmpty);
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
    cout << "栈 stack = ";
    PrintUtil::printStack(stack);

    /* 访问栈顶元素 */
    int top = stack.top();
    cout << "栈顶元素 top = " << top << endl;

    /* 元素出栈 */
    stack.pop();
    cout << "出栈元素 pop = " << top << "，出栈后 stack = ";
    PrintUtil::printStack(stack);

    /* 获取栈的长度 */
    int size = stack.size();
    cout << "栈的长度 size = " << size << endl;

    /* 判断是否为空 */
    bool empty = stack.empty();
    cout << "栈是否为空 = " << empty << endl;
    ```

=== "Python"

    ```python title="stack.py"
    """ 初始化栈 """
    # Python 没有内置的栈类，可以把 list 当作栈来使用 
    stack = []

    """ 元素入栈 """
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("栈 stack =", stack)

    """ 访问栈顶元素 """
    peek = stack[-1]
    print("栈顶元素 peek =", peek)

    """ 元素出栈 """
    pop = stack.pop()
    print("出栈元素 pop =", pop)
    print("出栈后 stack =", stack)

    """ 获取栈的长度 """
    size = len(stack)
    print("栈的长度 size =", size)

    """ 判断是否为空 """
    is_empty = len(stack) == 0
    print("栈是否为空 =", is_empty)
    ```

## 栈的实现

为了更加清晰地了解栈的运行机制，接下来我们来自己动手实现一个栈类。

栈规定元素是先入后出的，因此我们只能在栈顶添加或删除元素。然而，数组或链表都可以在任意位置添加删除元素，因此 **栈可被看作是一种受约束的数组或链表**。换言之，我们可以 “屏蔽” 数组或链表的部分无关操作，使之对外的表现逻辑符合栈的规定即可。

### 基于链表的实现

使用「链表」实现栈时，将链表的尾结点看作栈顶即可。

受益于链表的离散存储方式，栈的扩容更加灵活，删除元素的内存也会被系统自动回收；缺点是无法像数组一样高效地随机访问，并且由于链表结点需存储指针，导致单个元素占用空间更大。

=== "Java"

    ```java title="linkedlist_stack.java"
    /* 基于链表实现的栈 */
    class LinkedListStack {
        private ListNode stackPeek;  // 将头结点作为栈顶
        private int stackSize = 0;   // 栈的长度
        
        public LinkedListStack() {
            stackPeek = null;
        }
        /* 获取栈的长度 */
        public int size() {
            return stackSize;
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
            stackSize++;
        }
        /* 出栈 */
        public int pop() {
            if (size() == 0)
                throw new IndexOutOfBoundsException();
            int num = peek();
            stackPeek = stackPeek.next;
            stackSize--;
            return num;
        }
        /* 访问栈顶元素 */
        public int peek() {
            if (size() == 0)
                throw new IndexOutOfBoundsException();
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
        int stackSize;      // 栈的长度

    public:
        LinkedListStack() {
            stackTop = nullptr;
            stackSize = 0;
        }
        /* 获取栈的长度 */
        int size() {
            return stackSize;
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
            stackSize++;
        }
        /* 出栈 */
        int pop() {
            if (size() == 0)
                throw out_of_range("栈为空");
            int num = stackTop->val;
            stackTop = stackTop->next;
            stackSize--;
            return num;
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
            # 判空处理
            if not self.__peek: return None
            pop = self.__peek.val
            self.__peek = self.__peek.next
            self.__size -= 1
            return pop

        """ 访问栈顶元素 """
        def peek(self):
            # 判空处理
            if not self.__peek: return None
            return self.__peek.val
    ```

### 基于数组的实现

使用「数组」实现栈时，将数组的尾部当作栈顶。准确地说，我们需要使用「列表」，因为入栈的元素可能是源源不断的，因此使用动态数组可以方便扩容。

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
            return stack.remove(size() - 1);
        }
        /* 访问栈顶元素 */
        public int peek() {
            return stack.get(size() - 1);
        }
        /* 访问索引 index 处元素 */
        public int get(int index) {
            return stack.get(index);
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
        int pop() {
            int oldTop = stack.back();
            stack.pop_back();
            return oldTop;
        }
        /* 访问栈顶元素 */
        int top() {
            return stack.back();
        }
        /* 访问索引 index 处元素 */
        int get(int index) {
            return stack[index];
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
            return self.__stack.pop()

        """ 访问栈顶元素 """
        def peek(self):
            return self.__stack[-1]

        """ 访问索引 index 处元素 """
        def get(self, index):
            return self.__stack[index]
    ```

!!! tip

    实际编程中，我们一般直接将 `ArrayList` 或 `LinkedList` 当作「栈」来使用。我们仅需通过脑补来屏蔽无关操作，而不用专门去包装它。

## 栈典型应用

- **浏览器中的后退与前进、软件中的撤销与反撤销。** 每当我们打开新的网页，浏览器就讲上一个网页执行入栈，这样我们就可以通过「后退」操作来回到上一页面，后退操作实际上是在执行出栈。如果要同时支持后退和前进，那么则需要两个栈来配合实现。
- **程序内存管理。** 每当调用函数时，系统就会在栈顶添加一个栈帧，用来记录函数的上下文信息。在递归函数中，向下递推会不断执行入栈，向上回溯阶段时出栈。
