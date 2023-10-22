# 堆

「堆 heap」是一种满足特定条件的完全二叉树，主要可分为下图所示的两种类型。

- 「大顶堆 max heap」：任意节点的值 $\geq$ 其子节点的值。
- 「小顶堆 min heap」：任意节点的值 $\leq$ 其子节点的值。

![小顶堆与大顶堆](heap.assets/min_heap_and_max_heap.png)

堆作为完全二叉树的一个特例，具有以下特性。

- 最底层节点靠左填充，其他层的节点都被填满。
- 我们将二叉树的根节点称为“堆顶”，将底层最靠右的节点称为“堆底”。
- 对于大顶堆（小顶堆），堆顶元素（即根节点）的值分别是最大（最小）的。

## 堆常用操作

需要指出的是，许多编程语言提供的是「优先队列 priority queue」，这是一种抽象数据结构，定义为具有优先级排序的队列。

实际上，**堆通常用作实现优先队列，大顶堆相当于元素按从大到小顺序出队的优先队列**。从使用角度来看，我们可以将“优先队列”和“堆”看作等价的数据结构。因此，本书对两者不做特别区分，统一使用“堆“来命名。

堆的常用操作见下表，方法名需要根据编程语言来确定。

<p align="center"> 表 <id> &nbsp; 堆的操作效率 </p>

| 方法名     | 描述                                         | 时间复杂度  |
| --------- | ------------------------------------------ | ----------- |
| push()    | 元素入堆                                    | $O(\log n)$ |
| pop()     | 堆顶元素出堆                                   | $O(\log n)$ |
| peek()    | 访问堆顶元素（大 / 小顶堆分别为最大 / 小值）       | $O(1)$      |
| size()    | 获取堆的元素数量                               | $O(1)$      |
| isEmpty() | 判断堆是否为空                                 | $O(1)$      |

在实际应用中，我们可以直接使用编程语言提供的堆类（或优先队列类）。

!!! tip

    类似于排序算法中的“从小到大排列”和“从大到小排列”，我们可以通过修改 Comparator 来实现“小顶堆”与“大顶堆”之间的转换。

Python

```python
    # 初始化小顶堆
    min_heap, flag = [], 1
    # 初始化大顶堆
    max_heap, flag = [], -1

    # Python 的 heapq 模块默认实现小顶堆
    # 考虑将“元素取负”后再入堆，这样就可以将大小关系颠倒，从而实现大顶堆
    # 在本示例中，flag = 1 时对应小顶堆，flag = -1 时对应大顶堆

    # 元素入堆
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)

    # 获取堆顶元素
    peek: int = flag * max_heap[0] # 5

    # 堆顶元素出堆
    # 出堆元素会形成一个从大到小的序列
    val = flag * heapq.heappop(max_heap) # 5
    val = flag * heapq.heappop(max_heap) # 4
    val = flag * heapq.heappop(max_heap) # 3
    val = flag * heapq.heappop(max_heap) # 2
    val = flag * heapq.heappop(max_heap) # 1

    # 获取堆大小
    size: int = len(max_heap)

    # 判断堆是否为空
    is_empty: bool = not max_heap

    # 输入列表并建堆
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
```


Java

```java
    /* 初始化堆 */
    // 初始化小顶堆
    Queue<Integer> minHeap = new PriorityQueue<>();
    // 初始化大顶堆（使用 lambda 表达式修改 Comparator 即可）
    Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);
    
    /* 元素入堆 */
    maxHeap.offer(1);
    maxHeap.offer(3);
    maxHeap.offer(2);
    maxHeap.offer(5);
    maxHeap.offer(4);
    
    /* 获取堆顶元素 */
    int peek = maxHeap.peek(); // 5
    
    /* 堆顶元素出堆 */
    // 出堆元素会形成一个从大到小的序列
    peek = maxHeap.poll(); // 5
    peek = maxHeap.poll(); // 4
    peek = maxHeap.poll(); // 3
    peek = maxHeap.poll(); // 2
    peek = maxHeap.poll(); // 1
    
    /* 获取堆大小 */
    int size = maxHeap.size();
    
    /* 判断堆是否为空 */
    boolean isEmpty = maxHeap.isEmpty();
    
    /* 输入列表并建堆 */
    minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
```










## 堆的实现

下文实现的是大顶堆。若要将其转换为小顶堆，只需将所有大小逻辑判断取逆（例如，将 $\geq$ 替换为 $\leq$ ）。感兴趣的读者可以自行实现。

### 堆的存储与表示

我们在二叉树章节中学习到，完全二叉树非常适合用数组来表示。由于堆正是一种完全二叉树，**我们将采用数组来存储堆**。

当使用数组表示二叉树时，元素代表节点值，索引代表节点在二叉树中的位置。**节点指针通过索引映射公式来实现**。

如下图所示，给定索引 $i$ ，其左子节点索引为 $2i + 1$ ，右子节点索引为 $2i + 2$ ，父节点索引为 $(i - 1) / 2$（向下取整）。当索引越界时，表示空节点或节点不存在。

![堆的表示与存储](heap.assets/representation_of_heap.png)

我们可以将索引映射公式封装成函数，方便后续使用。

```src
[file]{my_heap}-[class]{max_heap}-[func]{parent}
```

### 访问堆顶元素

堆顶元素即为二叉树的根节点，也就是列表的首个元素。

```src
[file]{my_heap}-[class]{max_heap}-[func]{peek}
```

### 元素入堆

给定元素 `val` ，我们首先将其添加到堆底。添加之后，由于 val 可能大于堆中其他元素，堆的成立条件可能已被破坏。因此，**需要修复从插入节点到根节点的路径上的各个节点**，这个操作被称为「堆化 heapify」。

考虑从入堆节点开始，**从底至顶执行堆化**。如下图所示，我们比较插入节点与其父节点的值，如果插入节点更大，则将它们交换。然后继续执行此操作，从底至顶修复堆中的各个节点，直至越过根节点或遇到无须交换的节点时结束。

=== "<1>"
    ![元素入堆步骤](heap.assets/heap_push_step1.png)

=== "<2>"
    ![heap_push_step2](heap.assets/heap_push_step2.png)

=== "<3>"
    ![heap_push_step3](heap.assets/heap_push_step3.png)

=== "<4>"
    ![heap_push_step4](heap.assets/heap_push_step4.png)

=== "<5>"
    ![heap_push_step5](heap.assets/heap_push_step5.png)

=== "<6>"
    ![heap_push_step6](heap.assets/heap_push_step6.png)

=== "<7>"
    ![heap_push_step7](heap.assets/heap_push_step7.png)

=== "<8>"
    ![heap_push_step8](heap.assets/heap_push_step8.png)

=== "<9>"
    ![heap_push_step9](heap.assets/heap_push_step9.png)

设节点总数为 $n$ ，则树的高度为 $O(\log n)$ 。由此可知，堆化操作的循环轮数最多为 $O(\log n)$ ，**元素入堆操作的时间复杂度为 $O(\log n)$** 。

```src
[file]{my_heap}-[class]{max_heap}-[func]{sift_up}
```

### 堆顶元素出堆

堆顶元素是二叉树的根节点，即列表首元素。如果我们直接从列表中删除首元素，那么二叉树中所有节点的索引都会发生变化，这将使得后续使用堆化修复变得困难。为了尽量减少元素索引的变动，我们采用以下操作步骤。

1. 交换堆顶元素与堆底元素（即交换根节点与最右叶节点）。
2. 交换完成后，将堆底从列表中删除（注意，由于已经交换，实际上删除的是原来的堆顶元素）。
3. 从根节点开始，**从顶至底执行堆化**。

如下图所示，**“从顶至底堆化”的操作方向与“从底至顶堆化”相反**，我们将根节点的值与其两个子节点的值进行比较，将最大的子节点与根节点交换。然后循环执行此操作，直到越过叶节点或遇到无须交换的节点时结束。

=== "<1>"
    ![堆顶元素出堆步骤](heap.assets/heap_pop_step1.png)

=== "<2>"
    ![heap_pop_step2](heap.assets/heap_pop_step2.png)

=== "<3>"
    ![heap_pop_step3](heap.assets/heap_pop_step3.png)

=== "<4>"
    ![heap_pop_step4](heap.assets/heap_pop_step4.png)

=== "<5>"
    ![heap_pop_step5](heap.assets/heap_pop_step5.png)

=== "<6>"
    ![heap_pop_step6](heap.assets/heap_pop_step6.png)

=== "<7>"
    ![heap_pop_step7](heap.assets/heap_pop_step7.png)

=== "<8>"
    ![heap_pop_step8](heap.assets/heap_pop_step8.png)

=== "<9>"
    ![heap_pop_step9](heap.assets/heap_pop_step9.png)

=== "<10>"
    ![heap_pop_step10](heap.assets/heap_pop_step10.png)

与元素入堆操作相似，堆顶元素出堆操作的时间复杂度也为 $O(\log n)$ 。

```src
[file]{my_heap}-[class]{max_heap}-[func]{sift_down}
```

## 堆常见应用

- **优先队列**：堆通常作为实现优先队列的首选数据结构，其入队和出队操作的时间复杂度均为 $O(\log n)$ ，而建队操作为 $O(n)$ ，这些操作都非常高效。
- **堆排序**：给定一组数据，我们可以用它们建立一个堆，然后不断地执行元素出堆操作，从而得到有序数据。然而，我们通常会使用一种更优雅的方式实现堆排序，详见后续的堆排序章节。
- **获取最大的 $k$ 个元素**：这是一个经典的算法问题，同时也是一种典型应用，例如选择热度前 10 的新闻作为微博热搜，选取销量前 10 的商品等。



-----------------------------------------------------------------

## MY_HEAP
Python: `my_heap.py`
```python

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap


class MaxHeap:
    """大顶堆"""

    def __init__(self, nums: list[int]):
        """构造方法，根据输入列表建堆"""
        # 将列表元素原封不动添加进堆
        self.max_heap = nums
        # 堆化除叶节点以外的其他所有节点
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """获取左子节点索引"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """获取右子节点索引"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """获取父节点索引"""
        return (i - 1) // 2  # 向下整除

    def swap(self, i: int, j: int):
        """交换元素"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """获取堆大小"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """判断堆是否为空"""
        return self.size() == 0

    def peek(self) -> int:
        """访问堆顶元素"""
        return self.max_heap[0]

    def push(self, val: int):
        """元素入堆"""
        # 添加节点
        self.max_heap.append(val)
        # 从底至顶堆化
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """从节点 i 开始，从底至顶堆化"""
        while True:
            # 获取节点 i 的父节点
            p = self.parent(i)
            # 当“越过根节点”或“节点无须修复”时，结束堆化
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 交换两节点
            self.swap(i, p)
            # 循环向上堆化
            i = p

    def pop(self) -> int:
        """元素出堆"""
        # 判空处理
        if self.is_empty():
            raise IndexError("堆为空")
        # 交换根节点与最右叶节点（即交换首元素与尾元素）
        self.swap(0, self.size() - 1)
        # 删除节点
        val = self.max_heap.pop()
        # 从顶至底堆化
        self.sift_down(0)
        # 返回堆顶元素
        return val

    def sift_down(self, i: int):
        """从节点 i 开始，从顶至底堆化"""
        while True:
            # 判断节点 i, l, r 中值最大的节点，记为 ma
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
            if ma == i:
                break
            # 交换两节点
            self.swap(i, ma)
            # 循环向下堆化
            i = ma

    def print(self):
        """打印堆（二叉树）"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # 初始化大顶堆
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\n输入列表并建堆后")
    max_heap.print()

    # 获取堆顶元素
    peek = max_heap.peek()
    print(f"\n堆顶元素为 {peek}")

    # 元素入堆
    val = 7
    max_heap.push(val)
    print(f"\n元素 {val} 入堆后")
    max_heap.print()

    # 堆顶元素出堆
    peek = max_heap.pop()
    print(f"\n堆顶元素 {peek} 出堆后")
    max_heap.print()

    # 获取堆大小
    size = max_heap.size()
    print(f"\n堆元素数量为 {size}")

    # 判断堆是否为空
    is_empty = max_heap.is_empty()
    print(f"\n堆是否为空 {is_empty}")
```

Java: `my_heap.java`
```java

package chapter_heap;

import utils.*;
import java.util.*;

/* 大顶堆 */
class MaxHeap {
    // 使用列表而非数组，这样无须考虑扩容问题
    private List<Integer> maxHeap;

    /* 构造方法，根据输入列表建堆 */
    public MaxHeap(List<Integer> nums) {
        // 将列表元素原封不动添加进堆
        maxHeap = new ArrayList<>(nums);
        // 堆化除叶节点以外的其他所有节点
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 获取左子节点索引 */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 获取右子节点索引 */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* 获取父节点索引 */
    private int parent(int i) {
        return (i - 1) / 2; // 向下整除
    }

    /* 交换元素 */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* 获取堆大小 */
    public int size() {
        return maxHeap.size();
    }

    /* 判断堆是否为空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 访问堆顶元素 */
    public int peek() {
        return maxHeap.get(0);
    }

    /* 元素入堆 */
    public void push(int val) {
        // 添加节点
        maxHeap.add(val);
        // 从底至顶堆化
        siftUp(size() - 1);
    }

    /* 从节点 i 开始，从底至顶堆化 */
    private void siftUp(int i) {
        while (true) {
            // 获取节点 i 的父节点
            int p = parent(i);
            // 当“越过根节点”或“节点无须修复”时，结束堆化
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 交换两节点
            swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }

    /* 元素出堆 */
    public int pop() {
        // 判空处理
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 交换根节点与最右叶节点（即交换首元素与尾元素）
        swap(0, size() - 1);
        // 删除节点
        int val = maxHeap.remove(size() - 1);
        // 从顶至底堆化
        siftDown(0);
        // 返回堆顶元素
        return val;
    }

    /* 从节点 i 开始，从顶至底堆化 */
    private void siftDown(int i) {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
            if (ma == i)
                break;
            // 交换两节点
            swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }

    /* 打印堆（二叉树） */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* 初始化大顶堆 */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\n输入列表并建堆后");
        maxHeap.print();

        /* 获取堆顶元素 */
        int peek = maxHeap.peek();
        System.out.format("\n堆顶元素为 %d\n", peek);

        /* 元素入堆 */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\n元素 %d 入堆后\n", val);
        maxHeap.print();

        /* 堆顶元素出堆 */
        peek = maxHeap.pop();
        System.out.format("\n堆顶元素 %d 出堆后\n", peek);
        maxHeap.print();

        /* 获取堆大小 */
        int size = maxHeap.size();
        System.out.format("\n堆元素数量为 %d\n", size);

        /* 判断堆是否为空 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n堆是否为空 %b\n", isEmpty);
    }
}
```




-----------------------------------------------------------------

