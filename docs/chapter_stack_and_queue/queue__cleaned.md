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

Python

```python
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


Java

```java
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










## 队列实现

为了实现队列，我们需要一种数据结构，可以在一端添加元素，并在另一端删除元素。因此，链表和数组都可以用来实现队列。

### 基于链表的实现

如下图所示，我们可以将链表的“头节点”和“尾节点”分别视为“队首”和“队尾”，规定队尾仅可添加节点，队首仅可删除节点。


### 基于数组的实现

由于数组删除首元素的时间复杂度为 $O(n)$ ，这会导致出队操作效率较低。然而，我们可以采用以下巧妙方法来避免这个问题。

我们可以使用一个变量 `front` 指向队首元素的索引，并维护一个变量 `size` 用于记录队列长度。定义 `rear = front + size` ，这个公式计算出的 `rear` 指向队尾元素之后的下一个位置。

基于此设计，**数组中包含元素的有效区间为 `[front, rear - 1]`**，各种操作的实现方法如下图所示。

- 入队操作：将输入元素赋值给 `rear` 索引处，并将 `size` 增加 1 。
- 出队操作：只需将 `front` 增加 1 ，并将 `size` 减少 1 。

可以看到，入队和出队操作都只需进行一次操作，时间复杂度均为 $O(1)$ 。


以上实现的队列仍然具有局限性，即其长度不可变。然而，这个问题不难解决，我们可以将数组替换为动态数组，从而引入扩容机制。有兴趣的同学可以尝试自行实现。

两种实现的对比结论与栈一致，在此不再赘述。

## 队列典型应用

- **淘宝订单**。购物者下单后，订单将加入队列中，系统随后会根据顺序依次处理队列中的订单。在双十一期间，短时间内会产生海量订单，高并发成为工程师们需要重点攻克的问题。
- **各类待办事项**。任何需要实现“先来后到”功能的场景，例如打印机的任务队列、餐厅的出餐队列等。队列在这些场景中可以有效地维护处理顺序。



-----------------------------------------------------------------

## LINKEDLIST_QUEUE
Python: `linkedlist_queue.py`
```python

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode


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


"""Driver Code"""
if __name__ == "__main__":
    # 初始化队列
    queue = LinkedListQueue()

    # 元素入队
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("队列 queue =", queue.to_list())

    # 访问队首元素
    peek: int = queue.peek()
    print("队首元素 front =", peek)

    # 元素出队
    pop_front: int = queue.pop()
    print("出队元素 pop =", pop_front)
    print("出队后 queue =", queue.to_list())

    # 获取队列的长度
    size: int = queue.size()
    print("队列长度 size =", size)

    # 判断队列是否为空
    is_empty: bool = queue.is_empty()
    print("队列是否为空 =", is_empty)
```

Java: `linkedlist_queue.java`
```java

package chapter_stack_and_queue;

import java.util.*;

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

public class linkedlist_queue {
    public static void main(String[] args) {
        /* 初始化队列 */
        LinkedListQueue queue = new LinkedListQueue();

        /* 元素入队 */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("队列 queue = " + Arrays.toString(queue.toArray()));

        /* 访问队首元素 */
        int peek = queue.peek();
        System.out.println("队首元素 peek = " + peek);

        /* 元素出队 */
        int pop = queue.pop();
        System.out.println("出队元素 pop = " + pop + "，出队后 queue = " + Arrays.toString(queue.toArray()));

        /* 获取队列的长度 */
        int size = queue.size();
        System.out.println("队列长度 size = " + size);

        /* 判断队列是否为空 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("队列是否为空 = " + isEmpty);
    }
}
```




-----------------------------------------------------------------

## ARRAY_QUEUE
Python: `array_queue.py`
```python


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


"""Driver Code"""
if __name__ == "__main__":
    # 初始化队列
    queue = ArrayQueue(10)

    # 元素入队
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("队列 queue =", queue.to_list())

    # 访问队首元素
    peek: int = queue.peek()
    print("队首元素 peek =", peek)

    # 元素出队
    pop: int = queue.pop()
    print("出队元素 pop =", pop)
    print("出队后 queue =", queue.to_list())

    # 获取队列的长度
    size: int = queue.size()
    print("队列长度 size =", size)

    # 判断队列是否为空
    is_empty: bool = queue.is_empty()
    print("队列是否为空 =", is_empty)

    # 测试环形数组
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("第", i, "轮入队 + 出队后 queue = ", queue.to_list())
```

Java: `array_queue.java`
```java

package chapter_stack_and_queue;

import java.util.*;

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

public class array_queue {
    public static void main(String[] args) {
        /* 初始化队列 */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

        /* 元素入队 */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("队列 queue = " + Arrays.toString(queue.toArray()));

        /* 访问队首元素 */
        int peek = queue.peek();
        System.out.println("队首元素 peek = " + peek);

        /* 元素出队 */
        int pop = queue.pop();
        System.out.println("出队元素 pop = " + pop + "，出队后 queue = " + Arrays.toString(queue.toArray()));

        /* 获取队列的长度 */
        int size = queue.size();
        System.out.println("队列长度 size = " + size);

        /* 判断队列是否为空 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("队列是否为空 = " + isEmpty);

        /* 测试环形数组 */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("第 " + i + " 轮入队 + 出队后 queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
```




-----------------------------------------------------------------

