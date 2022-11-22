---
comments: true
---

# 队列

「队列 Queue」是一种遵循「先入先出 first in, first out」数据操作规则的线性数据结构。顾名思义，队列模拟的是排队现象，即外面的人不断加入队列尾部，而处于队列头部的人不断地离开。

我们将队列头部称为「队首」，队列尾部称为「队尾」，将把元素加入队尾的操作称为「入队」，删除队首元素的操作称为「出队」。

![queue_operations](queue.assets/queue_operations.png)

<p style="text-align:center"> Fig. 队列的先入先出特性 </p>

## 队列常用操作

队列的常用操作见下表，方法命名需根据编程语言的设定来具体确定。

<p style="text-align:center"> Table. 队列的常用操作 </p>

<div class="center-table" markdown>

| 方法      | 描述                         |
| --------- | ---------------------------- |
| offer()   | 元素入队，即将元素添加至队尾 |
| poll()    | 队首元素出队                 |
| front()   | 访问队首元素                 |
| size()    | 获取队列的长度               |
| isEmpty() | 判断队列是否为空             |

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
    System.out.println("队列 queue = " + queue);

    /* 访问队首元素 */
    int peek = queue.peek();
    System.out.println("队首元素 peek = " + peek);

    /* 元素出队 */
    int poll = queue.poll();
    System.out.println("出队元素 poll = " + poll + "，出队后 queue = " + queue);

    /* 获取队列的长度 */
    int size = queue.size();
    System.out.println("队列长度 size = " + size);

    /* 判断队列是否为空 */
    boolean isEmpty = queue.isEmpty();
    ```

=== "C++"

    ```cpp title="queue.cpp"
    
    ```

=== "Python"

    ```python title="queue.py"
    
    ```

## 队列实现

队列需要一种可以在一端添加，并在另一端删除的数据结构，也可以使用链表或数组来实现。

### 基于链表的实现

我们将链表的「头结点」和「尾结点」分别看作是队首和队尾，并规定队尾只可添加结点，队首只可删除结点。

=== "Java"

    ```java title="linkedlist_queue.java"
    /* 基于链表实现的队列 */
    class LinkedListQueue {
        LinkedList<Integer> list;

        public LinkedListQueue() {
            // 初始化链表
            list = new LinkedList<>();
        }
        /* 获取队列的长度 */
        public int size() {
            return list.size();
        }
        /* 判断队列是否为空 */
        public boolean isEmpty() {
            return list.size() == 0;
        }
        /* 入队 */
        public void offer(int num) {
            // 尾结点后添加 num
            list.addLast(num);
        }
        /* 出队 */
        public int poll() {
            // 删除头结点
            return list.removeFirst();
        }
        /* 访问队首元素 */
        public int peek() {
            return list.getFirst();
        }
    }
    ```

=== "C++"

    ```cpp title="linkedlist_queue.cpp"
    
    ```

=== "Python"

    ```python title="linkedlist_queue.py"
    
    ```

### 基于数组的实现

数组的删除首元素的时间复杂度为 $O(n)$ ，因此不适合直接用来实现队列。然而，我们可以借助两个指针 `front` , `rear` 来分别记录队首和队尾的索引位置，在入队 / 出队时分别将 `front` / `rear` 向后移动一位即可，这样每次仅需操作一个元素，时间复杂度降至 $O(1)$ 。

还有一个问题，在入队与出队的过程中，两个指针都在向后移动，而到达尾部后则无法继续移动了。为了解决此问题，我们可以采取一个取巧方案，即将数组看作是 “环形” 的。具体做法是规定指针越过数组尾部后，再次回到头部接续遍历，这样相当于使数组 “首尾相连” 了。

为了适应环形数组的设定，获取长度 `size()` 、入队 `offer()` 、出队 `poll()` 方法都需要做相应的取余操作处理，使得当尾指针绕回数组头部时，仍然可以正确处理操作。

基于数组实现的队列有一个缺点，即长度不可变。但这点我们可以通过动态数组来解决，有兴趣的同学可以自行实现。

=== "Java"

    ```java title="array_queue.java"
    /* 基于环形数组实现的队列 */
    class ArrayQueue {
        int[] nums; // 用于存储队列元素的数组
        int size = 0; // 队列长度（即元素个数）
        int front = 0; // 头指针，指向队首
        int rear = 0; // 尾指针，指向队尾 + 1

        public ArrayQueue(int capacity) {
            // 初始化数组
            nums = new int[capacity];
        }
        /* 获取队列的容量 */
        public int capacity() {
            return nums.length;
        }
        /* 获取队列的长度 */
        public int size() {
            int capacity = capacity();
            // 由于将数组看作为环形，可能 rear < front ，因此需要取余数
            return (capacity + rear - front) % capacity;
        }
        /* 判断队列是否为空 */
        public boolean isEmpty() {
            return rear - front == 0;
        }
        /* 入队 */
        public void offer(int num) {
            if (size() == capacity()) {
                System.out.println("队列已满");
                return;
            }
            // 尾结点后添加 num
            nums[rear] = num;
            // 尾指针向后移动一位，越过尾部后返回到数组头部
            rear = (rear + 1) % capacity();
        }
        /* 出队 */
        public int poll() {
            // 删除头结点
            if (isEmpty())
                throw new EmptyStackException();
            int num = nums[front];
            // 队头指针向后移动，越过尾部后返回到数组头部
            front = (front + 1) % capacity();
            return num;
        }
        /* 访问队首元素 */
        public int peek() {
            // 删除头结点
            if (isEmpty())
                throw new EmptyStackException();
            return nums[front];
        }
    }
    ```

=== "C++"

    ```cpp title="array_queue.cpp"
    
    ```

=== "Python"

    ```python title="array_queue.py"
    
    ```

## 队列典型应用

- **淘宝订单。** 购物者下单后，订单就被加入到队列之中，随后系统再根据顺序依次处理队列中的订单。在双十一时，在短时间内会产生海量的订单，如何处理「高并发」则是工程师们需要重点思考的问题。

- **各种待办事项。** 例如打印机的任务队列、餐厅的出餐队列等等。
