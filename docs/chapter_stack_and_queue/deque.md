---
comments: true
---

# 双向队列

对于队列，我们只能在头部删除或在尾部添加元素，而「双向队列 Deque」更加灵活，在其头部和尾部都能执行元素添加或删除操作。

![deque_operations](deque.assets/deque_operations.png)

<p align="center"> Fig. 双向队列的操作 </p>

## 双向队列常用操作

双向队列的常用操作见下表，方法名需根据编程语言设定来具体确定。

<p align="center"> Table. 双向队列的常用操作 </p>

<div class="center-table" markdown>

| 方法         | 描述             |
| ------------ | ---------------- |
| offerFirst() | 将元素添加至队首 |
| offerLast()  | 将元素添加至队尾 |
| pollFirst()  | 删除队首元素     |
| pollLast()   | 删除队尾元素     |
| peekFirst()  | 访问队首元素     |
| peekLast()   | 访问队尾元素     |
| size()       | 获取队列的长度   |
| isEmpty()    | 判断队列是否为空 |

</div>

相同地，我们可以直接使用编程语言实现好的双向队列类。

=== "Java"

    ```java title="deque.java"
    /* 初始化双向队列 */
    Deque<Integer> deque = new LinkedList<>();

    /* 元素入队 */
    deque.offerLast(2);
    deque.offerLast(5);
    deque.offerLast(4);
    deque.offerFirst(3);
    deque.offerFirst(1);
    System.out.println("双向队列 deque = " + deque);

    /* 访问队首元素 */
    int peekFirst = deque.peekFirst();
    System.out.println("队首元素 peekFirst = " + peekFirst);
    int peekLast = deque.peekLast();
    System.out.println("队尾元素 peekLast = " + peekLast);

    /* 元素出队 */
    int pollFirst = deque.pollFirst();
    System.out.println("队首出队元素 pollFirst = " + pollFirst + "，队首出队后 deque = " + deque);
    int pollLast = deque.pollLast();
    System.out.println("队尾出队元素 pollLast = " + pollLast + "，队尾出队后 deque = " + deque);

    /* 获取双向队列的长度 */
    int size = deque.size();
    System.out.println("双向队列长度 size = " + size);

    /* 判断双向队列是否为空 */
    boolean isEmpty = deque.isEmpty();
    System.out.println("双向队列是否为空 = " + isEmpty);
    ```

=== "C++"

    ```cpp title="deque.cpp"
    
    ```

=== "Python"

    ```python title="deque.py"
    
    ```
