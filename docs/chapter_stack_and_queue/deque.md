---
comments: true
---

# 双向队列

对于队列，我们只能在头部删除或在尾部添加元素，而「双向队列 Deque」更加灵活，在其头部和尾部都能执行元素添加或删除操作。

![deque_operations](deque.assets/deque_operations.png)

<p align="center"> Fig. 双向队列的操作 </p>

## 双向队列常用操作

双向队列的常用操作见下表（方法命名以 Java 为例）。

<p align="center"> Table. 双向队列的常用操作 </p>

<div class="center-table" markdown>

| 方法         | 描述             | 时间复杂度 |
| ------------ | ---------------- | ---------- |
| offerFirst() | 将元素添加至队首 | $O(1)$     |
| offerLast()  | 将元素添加至队尾 | $O(1)$     |
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
    
    ```

=== "TypeScript"

    ```typescript title="deque.ts"
    
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

## 双向队列实现

双向队列需要一种可以在两端添加、两端删除的数据结构，可以使用双向链表和数组来实现。

### 基于双向链表的实现
我们将双向链表的「头结点」和「尾结点」分别看作双向队列的队首和队尾，并且队首和队尾都能添加和删除结点。

配图

以下是使用双向链表实现双向队列的示例代码。

=== "Java"

    ```java title="linkedlist_deque.java"
    /* 基于双向链表实现的双向队列 */
    class LinkedListDeque {
    
        /* 双向链表结点 */
        private static class ListNode {
            int val; // 结点值
            ListNode next; // 下一个结点的指针
            ListNode prev; // 前一个结点的指针
    
            ListNode(ListNode prev, int val, ListNode next) {
                this.prev = prev;
                this.val = val;
                this.next = next;
            }
        }
    
        private ListNode front, rear; // 头结点 front ，尾结点 rear
        private int size = 0; // 双向队列的长度
    
        public LinkedListDeque() {
            front = null;
            rear = null;
        }
    
        /* 获取双向队列的长度 */
        public int size() {
            return size;
        }
    
        /* 判断双向队列是否为空 */
        public boolean isEmpty() {
            return size() == 0;
        }
    
        /* 从头入队 */
        public void offerFirst(int num) {
            // 记录原头结点
            ListNode first = front;
            // 创建结点作为新的头结点，将原头结点作为新头结点的下一个结点
            ListNode newNode = new ListNode(null, num, first);
            // 头结点指向新头结点
            front = newNode;
    
            // 如果队列为空，需令尾结点指向该结点
            if (first == null)
                rear = newNode;
            else
                // 如果队列不为空，则需将原头结点的前指针指向该结点
                first.prev = newNode;
    
            size++;
        }
    
        /* 从尾入队 */
        public void offerLast(int num) {
            // 记录原尾结点
            ListNode last = rear;
            // 创建结点作为新的尾结点，将原尾结点作为新尾结点的前一个结点
            ListNode newNode = new ListNode(last, num, null);
            // 尾结点指向新尾结点
            rear = newNode;
    
            // 如果队列为空，需令头结点指向该结点
            if (last == null)
                front = newNode;
            else
                // 如果队列不为空，则需将原尾结点的后指针指向该结点
                last.next = newNode;
    
            size++;
        }
    
        /* 从头出队 */
        public Integer pollFirst() {
            if (!isEmpty()) {
                // 记录头结点的下一个结点，它将作为新头结点
                ListNode next = front.next;
                // 删除头节点(1): 即头结点的后指针指向null
                front.next = null;
    
                int num = peekFirst();
                // 头结点指向新的头结点
                front = next;
    
                // 如果双向队列出队后队列长度为0，需令尾结点为null
                if (next == null)
                    rear = null;
                else
                    // 如果双向队列出队后队列长度不为0，则需要完成删除头结点操作
                    // 删除头结点(2): 新头结点前指针指向null
                    next.prev = null;
    
                size--;
    
                return num;
            }
    
            return null;
        }
    
        /* 从尾出队 */
        public Integer pollLast() {
            if (!isEmpty()) {
                // 记录尾结点的前一个结点，它将作为新尾结点
                ListNode prev = rear.prev;
                // 删除尾结点(1): 即尾结点的前指针指向null
                rear.prev = null;
    
                int num = peekLast();
                // 尾结点指向新的尾结点
                rear = prev;
    
                // 如果双向队列出队后队列长度为0，需令头结点为null
                if (prev == null)
                    front = null;
                else
                    // 如果双向队列出队后队列长度不为0，则需要完成删除尾结点操作
                    // 删除头结点(2): 新尾结点后指针指向null
                    prev.next = null;
    
                size--;
    
                return num;
            }
    
            return null;
        }
    
        /* 访问队首元素 */
        public Integer peekFirst() {
            return front != null ? front.val : null;
        }
    
        /* 访问队尾元素 */
        public Integer peekLast() {
            return rear != null ? rear.val : null;
        }
    
    }
    ```

=== "C++"


=== "Python"


=== "Go"


=== "JavaScript"


=== "TypeScript"


=== "C"


=== "C#"


=== "Swift"