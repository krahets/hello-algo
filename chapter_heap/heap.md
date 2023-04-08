---
comments: true
---

# 8.1. &nbsp; 堆

「堆 Heap」是一棵限定条件下的「完全二叉树」。根据成立条件，堆主要分为两种类型：

- 「大顶堆 Max Heap」，任意节点的值 $\geq$ 其子节点的值；
- 「小顶堆 Min Heap」，任意节点的值 $\leq$ 其子节点的值；

![小顶堆与大顶堆](heap.assets/min_heap_and_max_heap.png)

<p align="center"> Fig. 小顶堆与大顶堆 </p>

## 8.1.1. &nbsp; 堆术语与性质

- 由于堆是完全二叉树，因此最底层节点靠左填充，其它层节点皆被填满。
- 二叉树中的根节点对应「堆顶」，底层最靠右节点对应「堆底」。
- 对于大顶堆 / 小顶堆，其堆顶元素（即根节点）的值最大 / 最小。

## 8.1.2. &nbsp; 堆常用操作

值得说明的是，多数编程语言提供的是「优先队列 Priority Queue」，其是一种抽象数据结构，**定义为具有出队优先级的队列**。

而恰好，**堆的定义与优先队列的操作逻辑完全吻合**，大顶堆就是一个元素从大到小出队的优先队列。从使用角度看，我们可以将「优先队列」和「堆」理解为等价的数据结构。因此，本文与代码对两者不做特别区分，统一使用「堆」来命名。

堆的常用操作见下表，方法名需根据编程语言确定。

<div class="center-table" markdown>

| 方法名     | 描述                                         | 时间复杂度  |
| --------- | ------------------------------------------ | ----------- |
| push()    | 元素入堆                                    | $O(\log n)$ |
| pop()     | 堆顶元素出堆                                   | $O(\log n)$ |
| peek()    | 访问堆顶元素（大 / 小顶堆分别为最大 / 小值）       | $O(1)$      |
| size()    | 获取堆的元素数量                               | $O(1)$      |
| isEmpty() | 判断堆是否为空                                 | $O(1)$      |

</div>

我们可以直接使用编程语言提供的堆类（或优先队列类）。

!!! tip

    类似于排序中“从小到大排列”和“从大到小排列”，“大顶堆”和“小顶堆”可仅通过修改 Comparator 来互相转换。

=== "Java"

    ```java title="heap.java"
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
    peek = heap.poll();  // 5
    peek = heap.poll();  // 4
    peek = heap.poll();  // 3
    peek = heap.poll();  // 2
    peek = heap.poll();  // 1
    
    /* 获取堆大小 */
    int size = maxHeap.size();
    
    /* 判断堆是否为空 */
    boolean isEmpty = maxHeap.isEmpty();
    
    /* 输入列表并建堆 */
    minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
    ```

=== "C++"

    ```cpp title="heap.cpp"
    /* 初始化堆 */
    // 初始化小顶堆
    priority_queue<int, vector<int>, greater<int>> minHeap;
    // 初始化大顶堆
    priority_queue<int, vector<int>, less<int>> maxHeap;

    /* 元素入堆 */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);

    /* 获取堆顶元素 */
    int peek = maxHeap.top(); // 5

    /* 堆顶元素出堆 */
    // 出堆元素会形成一个从大到小的序列
    maxHeap.pop(); // 5
    maxHeap.pop(); // 4
    maxHeap.pop(); // 3
    maxHeap.pop(); // 2
    maxHeap.pop(); // 1

    /* 获取堆大小 */
    int size = maxHeap.size();

    /* 判断堆是否为空 */
    bool isEmpty = maxHeap.empty();

    /* 输入列表并建堆 */
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    ```

=== "Python"

    ```python title="heap.py"
    # 初始化小顶堆
    min_heap, flag = [], 1
    # 初始化大顶堆
    max_heap, flag = [], -1

    # Python 的 heapq 模块默认实现小顶堆
    # 考虑将“元素取负”后再入堆，这样就可以将大小关系颠倒，从而实现大顶堆
    # 在本示例中，flag = 1 时对应小顶堆，flag = -1 时对应大顶堆
    """ 元素入堆 """
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)

    """ 获取堆顶元素 """
    peek: int = flag * max_heap[0] # 5

    """ 堆顶元素出堆 """
    # 出堆元素会形成一个从大到小的序列
    val = flag * heapq.heappop(max_heap) # 5
    val = flag * heapq.heappop(max_heap) # 4
    val = flag * heapq.heappop(max_heap) # 3
    val = flag * heapq.heappop(max_heap) # 2
    val = flag * heapq.heappop(max_heap) # 1

    """ 获取堆大小 """
    size: int = len(max_heap)

    """ 判断堆是否为空 """
    is_empty: bool = not max_heap

    """ 输入列表并建堆 """
    min_heap: List[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    ```

=== "Go"

    ```go title="heap.go"
    // Go 语言中可以通过实现 heap.Interface 来构建整数大顶堆
    // 实现 heap.Interface 需要同时实现 sort.Interface
    type intHeap []any

    // Push heap.Interface 的方法，实现推入元素到堆
    func (h *intHeap) Push(x any) {
        // Push 和 Pop 使用 pointer receiver 作为参数
        // 因为它们不仅会对切片的内容进行调整，还会修改切片的长度。
        *h = append(*h, x.(int))
    }

    // Pop heap.Interface 的方法，实现弹出堆顶元素
    func (h *intHeap) Pop() any {
        // 待出堆元素存放在最后
        last := (*h)[len(*h)-1]
        *h = (*h)[:len(*h)-1]
        return last
    }

    // Len sort.Interface 的方法
    func (h *intHeap) Len() int {
        return len(*h)
    }

    // Less sort.Interface 的方法
    func (h *intHeap) Less(i, j int) bool {
        // 如果实现小顶堆，则需要调整为小于号
        return (*h)[i].(int) > (*h)[j].(int)
    }

    // Swap sort.Interface 的方法
    func (h *intHeap) Swap(i, j int) {
        (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
    }

    // Top 获取堆顶元素
    func (h *intHeap) Top() any {
        return (*h)[0]
    }

    /* Driver Code */
    func TestHeap(t *testing.T) {
        /* 初始化堆 */
        // 初始化大顶堆
        maxHeap := &intHeap{}
        heap.Init(maxHeap)
        /* 元素入堆 */
        // 调用 heap.Interface 的方法，来添加元素
        heap.Push(maxHeap, 1)
        heap.Push(maxHeap, 3)
        heap.Push(maxHeap, 2)
        heap.Push(maxHeap, 4)
        heap.Push(maxHeap, 5)

        /* 获取堆顶元素 */
        top := maxHeap.Top()
        fmt.Printf("堆顶元素为 %d\n", top)

        /* 堆顶元素出堆 */
        // 调用 heap.Interface 的方法，来移除元素
        heap.Pop(maxHeap) // 5
        heap.Pop(maxHeap) // 4
        heap.Pop(maxHeap) // 3
        heap.Pop(maxHeap) // 2
        heap.Pop(maxHeap) // 1

        /* 获取堆大小 */
        size := len(*maxHeap)
        fmt.Printf("堆元素数量为 %d\n", size)

        /* 判断堆是否为空 */
        isEmpty := len(*maxHeap) == 0
        fmt.Printf("堆是否为空 %t\n", isEmpty)
    }
    ```

=== "JavaScript"

    ```javascript title="heap.js"
    // JavaScript 未提供内置 Heap 类
    ```

=== "TypeScript"

    ```typescript title="heap.ts"
    // TypeScript 未提供内置 Heap 类
    ```

=== "C"

    ```c title="heap.c"

    ```

=== "C#"

    ```csharp title="heap.cs"
    /* 初始化堆 */
    // 初始化小顶堆
    PriorityQueue<int, int> minHeap = new PriorityQueue<int, int>();
    // 初始化大顶堆（使用 lambda 表达式修改 Comparator 即可）
    PriorityQueue<int, int> maxHeap = new PriorityQueue<int, int>(Comparer<int>.Create((x, y) => y - x));

    /* 元素入堆 */
    maxHeap.Enqueue(1, 1);
    maxHeap.Enqueue(3, 3);
    maxHeap.Enqueue(2, 2);
    maxHeap.Enqueue(5, 5);
    maxHeap.Enqueue(4, 4);

    /* 获取堆顶元素 */
    int peek = maxHeap.Peek();//5

    /* 堆顶元素出堆 */
    // 出堆元素会形成一个从大到小的序列
    peek = maxHeap.Dequeue();  // 5
    peek = maxHeap.Dequeue();  // 4
    peek = maxHeap.Dequeue();  // 3
    peek = maxHeap.Dequeue();  // 2
    peek = maxHeap.Dequeue();  // 1

    /* 获取堆大小 */
    int size = maxHeap.Count;

    /* 判断堆是否为空 */
    bool isEmpty = maxHeap.Count == 0;

    /* 输入列表并建堆 */
    minHeap = new PriorityQueue<int, int>(new List<(int, int)> { (1, 1), (3, 3), (2, 2), (5, 5), (4, 4), });
    ```

=== "Swift"

    ```swift title="heap.swift"
    // Swift 未提供内置 Heap 类
    ```

=== "Zig"

    ```zig title="heap.zig"

    ```

## 8.1.3. &nbsp; 堆的实现

下文实现的是「大顶堆」，若想转换为「小顶堆」，将所有大小逻辑判断取逆（例如将 $\geq$ 替换为 $\leq$ ）即可，有兴趣的同学可自行实现。

### 堆的存储与表示

在二叉树章节我们学过，「完全二叉树」非常适合使用「数组」来表示，而堆恰好是一棵完全二叉树，**因而我们采用「数组」来存储「堆」**。

**二叉树指针**。使用数组表示二叉树时，元素代表节点值，索引代表节点在二叉树中的位置，**而节点指针通过索引映射公式来实现**。

具体地，给定索引 $i$ ，那么其左子节点索引为 $2i + 1$ 、右子节点索引为 $2i + 2$ 、父节点索引为 $(i - 1) / 2$ （向下整除）。当索引越界时，代表空节点或节点不存在。

![堆的表示与存储](heap.assets/representation_of_heap.png)

<p align="center"> Fig. 堆的表示与存储 </p>

我们将索引映射公式封装成函数，以便后续使用。

=== "Java"

    ```java title="my_heap.java"
    /* 获取左子节点索引 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 获取右子节点索引 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 获取父节点索引 */
    int parent(int i) {
        return (i - 1) / 2; // 向下整除
    }
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 获取左子节点索引 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 获取右子节点索引 */
    int right(int i) {
        return 2 * i + 2;
    } 

    /* 获取父节点索引 */
    int parent(int i) {
        return (i - 1) / 2; // 向下取整
    }
    ```

=== "Python"

    ```python title="my_heap.py"
    def left(self, i: int) -> int:
        """ 获取左子节点索引 """
        return 2 * i + 1

    def right(self, i: int) -> int:
        """ 获取右子节点索引 """
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """ 获取父节点索引 """
        return (i - 1) // 2  # 向下整除
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 获取左子节点索引 */
    func (h *maxHeap) left(i int) int {
        return 2*i + 1
    }

    /* 获取右子节点索引 */
    func (h *maxHeap) right(i int) int {
        return 2*i + 2
    }

    /* 获取父节点索引 */
    func (h *maxHeap) parent(i int) int {
        // 向下整除
        return (i - 1) / 2
    }
    ```

=== "JavaScript"

    ```javascript title="my_heap.js"
    /* 获取左子节点索引 */
    #left(i) {
        return 2 * i + 1;
    }

    /* 获取右子节点索引 */
    #right(i) {
        return 2 * i + 2;
    }

    /* 获取父节点索引 */
    #parent(i) {
        return Math.floor((i - 1) / 2); // 向下整除
    }
    ```

=== "TypeScript"

    ```typescript title="my_heap.ts"
    /* 获取左子节点索引 */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* 获取右子节点索引 */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* 获取父节点索引 */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // 向下整除
    }
    ```

=== "C"

    ```c title="my_heap.c"
    [class]{maxHeap}-[func]{left}

    [class]{maxHeap}-[func]{right}

    [class]{maxHeap}-[func]{parent}
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 获取左子节点索引 */
    int left(int i)
    {
        return 2 * i + 1;
    }

    /* 获取右子节点索引 */
    int right(int i)
    {
        return 2 * i + 2;
    }

    /* 获取父节点索引 */
    int parent(int i)
    {
        return (i - 1) / 2; // 向下整除
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 获取左子节点索引 */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 获取右子节点索引 */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 获取父节点索引 */
    func parent(i: Int) -> Int {
        (i - 1) / 2 // 向下整除
    }
    ```

=== "Zig"

    ```zig title="my_heap.zig"
    // 获取左子节点索引
    fn left(i: usize) usize {
        return 2 * i + 1;
    }

    // 获取右子节点索引
    fn right(i: usize) usize {
        return 2 * i + 2;
    }

    // 获取父节点索引
    fn parent(i: usize) usize {
        // return (i - 1) / 2; // 向下整除
        return @divFloor(i - 1, 2);
    }
    ```

### 访问堆顶元素

堆顶元素是二叉树的根节点，即列表首元素。

=== "Java"

    ```java title="my_heap.java"
    /* 访问堆顶元素 */
    int peek() {
        return maxHeap.get(0);
    }
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 访问堆顶元素 */
    int peek() {
        return maxHeap[0];
    }
    ```

=== "Python"

    ```python title="my_heap.py"
    def peek(self) -> int:
        """ 访问堆顶元素 """
        return self.max_heap[0]
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 访问堆顶元素 */
    func (h *maxHeap) peek() any {
        return h.data[0]
    }
    ```

=== "JavaScript"

    ```javascript title="my_heap.js"
    /* 访问堆顶元素 */
    peek() {
        return this.#maxHeap[0];
    }
    ```

=== "TypeScript"

    ```typescript title="my_heap.ts"
    /* 访问堆顶元素 */
    peek(): number {
        return this.maxHeap[0];
    }
    ```

=== "C"

    ```c title="my_heap.c"
    [class]{maxHeap}-[func]{peek}
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 访问堆顶元素 */
    int peek()
    {
        return maxHeap[0];
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 访问堆顶元素 */
    func peek() -> Int {
        maxHeap[0]
    }
    ```

=== "Zig"

    ```zig title="my_heap.zig"
    // 访问堆顶元素
    fn peek(self: *Self) T {
        return self.max_heap.?.items[0];
    }  
    ```

### 元素入堆

给定元素 `val` ，我们先将其添加到堆底。添加后，由于 `val` 可能大于堆中其它元素，此时堆的成立条件可能已经被破坏，**因此需要修复从插入节点到根节点这条路径上的各个节点**，该操作被称为「堆化 Heapify」。

考虑从入堆节点开始，**从底至顶执行堆化**。具体地，比较插入节点与其父节点的值，若插入节点更大则将它们交换；并循环以上操作，从底至顶地修复堆中的各个节点；直至越过根节点时结束，或当遇到无需交换的节点时提前结束。

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

设节点总数为 $n$ ，则树的高度为 $O(\log n)$ ，易得堆化操作的循环轮数最多为 $O(\log n)$ ，**因而元素入堆操作的时间复杂度为 $O(\log n)$** 。

=== "Java"

    ```java title="my_heap.java"
    /* 元素入堆 */
    void push(int val) {
        // 添加节点
        maxHeap.add(val);
        // 从底至顶堆化
        siftUp(size() - 1);
    }

    /* 从节点 i 开始，从底至顶堆化 */
    void siftUp(int i) {
        while (true) {
            // 获取节点 i 的父节点
            int p = parent(i);
            // 当“越过根节点”或“节点无需修复”时，结束堆化
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 交换两节点
            swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 元素入堆 */
    void push(int val) {
        // 添加节点
        maxHeap.push_back(val);
        // 从底至顶堆化
        siftUp(size() - 1);
    }

    /* 从节点 i 开始，从底至顶堆化 */
    void siftUp(int i) {
        while (true) {
            // 获取节点 i 的父节点
            int p =  parent(i);
            // 当“越过根节点”或“节点无需修复”时，结束堆化
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 交换两节点
            swap(maxHeap[i], maxHeap[p]);
            // 循环向上堆化
            i = p;
        }
    }
    ```

=== "Python"

    ```python title="my_heap.py"
    def push(self, val: int):
        """ 元素入堆 """
        # 添加节点
        self.max_heap.append(val)
        # 从底至顶堆化
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """ 从节点 i 开始，从底至顶堆化 """
        while True:
            # 获取节点 i 的父节点
            p = self.parent(i)
            # 当“越过根节点”或“节点无需修复”时，结束堆化
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 交换两节点
            self.swap(i, p)
            # 循环向上堆化
            i = p
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 元素入堆 */
    func (h *maxHeap) push(val any) {
        // 添加节点
        h.data = append(h.data, val)
        // 从底至顶堆化
        h.siftUp(len(h.data) - 1)
    }

    /* 从节点 i 开始，从底至顶堆化 */
    func (h *maxHeap) siftUp(i int) {
        for true {
            // 获取节点 i 的父节点
            p := h.parent(i)
            // 当“越过根节点”或“节点无需修复”时，结束堆化
            if p < 0 || h.data[i].(int) <= h.data[p].(int) {
                break
            }
            // 交换两节点
            h.swap(i, p)
            // 循环向上堆化
            i = p
        }
    }
    ```

=== "JavaScript"

    ```javascript title="my_heap.js"
    /* 元素入堆 */
    push(val) {
        // 添加节点
        this.#maxHeap.push(val);
        // 从底至顶堆化
        this.#siftUp(this.size() - 1);
    }

    /* 从节点 i 开始，从底至顶堆化 */
    #siftUp(i) {
        while (true) {
            // 获取节点 i 的父节点
            const p = this.#parent(i);
            // 当“越过根节点”或“节点无需修复”时，结束堆化
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // 交换两节点
            this.#swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }
    ```

=== "TypeScript"

    ```typescript title="my_heap.ts"
    /* 元素入堆 */
    push(val: number): void {
        // 添加节点
        this.maxHeap.push(val);
        // 从底至顶堆化
        this.siftUp(this.size() - 1);
    }

    /* 从节点 i 开始，从底至顶堆化 */
    siftUp(i: number): void {
        while (true) {
            // 获取节点 i 的父节点
            const p = this.parent(i);
            // 当“越过根节点”或“节点无需修复”时，结束堆化
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // 交换两节点
            this.swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    [class]{maxHeap}-[func]{push}

    [class]{maxHeap}-[func]{siftUp}
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 元素入堆 */
    void push(int val)
    {
        // 添加节点
        maxHeap.Add(val);
        // 从底至顶堆化
        siftUp(size() - 1);
    }

    /* 从节点 i 开始，从底至顶堆化 */
    void siftUp(int i)
    {
        while (true)
        {
            // 获取节点 i 的父节点
            int p = parent(i);
            // 若“越过根节点”或“节点无需修复”，则结束堆化
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 交换两节点
            swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 元素入堆 */
    func push(val: Int) {
        // 添加节点
        maxHeap.append(val)
        // 从底至顶堆化
        siftUp(i: size() - 1)
    }

    /* 从节点 i 开始，从底至顶堆化 */
    func siftUp(i: Int) {
        var i = i
        while true {
            // 获取节点 i 的父节点
            let p = parent(i: i)
            // 当“越过根节点”或“节点无需修复”时，结束堆化
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 交换两节点
            swap(i: i, j: p)
            // 循环向上堆化
            i = p
        }
    }
    ```

=== "Zig"

    ```zig title="my_heap.zig"
    // 元素入堆
    fn push(self: *Self, val: T) !void {
        // 添加节点
        try self.max_heap.?.append(val);
        // 从底至顶堆化
        try self.siftUp(self.size() - 1);
    }  

    // 从节点 i 开始，从底至顶堆化
    fn siftUp(self: *Self, i_: usize) !void {
        var i = i_;
        while (true) {
            // 获取节点 i 的父节点
            var p = parent(i);
            // 当“越过根节点”或“节点无需修复”时，结束堆化
            if (p < 0 or self.max_heap.?.items[i] <= self.max_heap.?.items[p]) break;
            // 交换两节点
            try self.swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }
    ```

### 堆顶元素出堆

堆顶元素是二叉树根节点，即列表首元素，如果我们直接将首元素从列表中删除，则二叉树中所有节点都会随之发生移位（索引发生变化），这样后续使用堆化修复就很麻烦了。为了尽量减少元素索引变动，采取以下操作步骤：

1. 交换堆顶元素与堆底元素（即交换根节点与最右叶节点）；
2. 交换完成后，将堆底从列表中删除（注意，因为已经交换，实际上删除的是原来的堆顶元素）；
3. 从根节点开始，**从顶至底执行堆化**；

顾名思义，**从顶至底堆化的操作方向与从底至顶堆化相反**，我们比较根节点的值与其两个子节点的值，将最大的子节点与根节点执行交换，并循环以上操作，直到越过叶节点时结束，或当遇到无需交换的节点时提前结束。

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

与元素入堆操作类似，**堆顶元素出堆操作的时间复杂度为 $O(\log n)$** 。

=== "Java"

    ```java title="my_heap.java"
    /* 元素出堆 */
    int pop() {
        // 判空处理
        if (isEmpty())
            throw new EmptyStackException();
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
    void siftDown(int i) {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i) break;
            // 交换两节点
            swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 元素出堆 */
    void pop() {
        // 判空处理
        if (empty()) {
            throw out_of_range("堆为空");
        }
        // 交换根节点与最右叶节点（即交换首元素与尾元素）
        swap(maxHeap[0], maxHeap[size() - 1]);
        // 删除节点
        maxHeap.pop_back();
        // 从顶至底堆化
        siftDown(0);
    }

    /* 从节点 i 开始，从顶至底堆化 */
    void siftDown(int i) {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            int l = left(i), r = right(i), ma = i;
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (l < size() && maxHeap[l] > maxHeap[ma]) 
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i) 
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 循环向下堆化
            i = ma;
        }
    }
    ```

=== "Python"

    ```python title="my_heap.py"
    def pop(self) -> int:
        """ 元素出堆 """
        # 判空处理
        assert not self.is_empty()
        # 交换根节点与最右叶节点（即交换首元素与尾元素）
        self.swap(0, self.size() - 1)
        # 删除节点
        val = self.max_heap.pop()
        # 从顶至底堆化
        self.sift_down(0)
        # 返回堆顶元素
        return val

    def sift_down(self, i: int):
        """ 从节点 i 开始，从顶至底堆化 """
        while True:
            # 判断节点 i, l, r 中值最大的节点，记为 ma
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if ma == i:
                break
            # 交换两节点
            self.swap(i, ma)
            # 循环向下堆化
            i = ma
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 元素出堆 */
    func (h *maxHeap) pop() any {
        // 判空处理
        if h.isEmpty() {
            fmt.Println("error")
            return nil
        }
        // 交换根节点与最右叶节点（即交换首元素与尾元素）
        h.swap(0, h.size()-1)
        // 删除节点
        val := h.data[len(h.data)-1]
        h.data = h.data[:len(h.data)-1]
        // 从顶至底堆化
        h.siftDown(0)

        // 返回堆顶元素
        return val
    }

    /* 从节点 i 开始，从顶至底堆化 */
    func (h *maxHeap) siftDown(i int) {
        for true {
            // 判断节点 i, l, r 中值最大的节点，记为 max
            l, r, max := h.left(i), h.right(i), i
            if l < h.size() && h.data[l].(int) > h.data[max].(int) {
                max = l
            }
            if r < h.size() && h.data[r].(int) > h.data[max].(int) {
                max = r
            }
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if max == i {
                break
            }
            // 交换两节点
            h.swap(i, max)
            // 循环向下堆化
            i = max
        }
    }
    ```

=== "JavaScript"

    ```javascript title="my_heap.js"
    /* 元素出堆 */
    pop() {
        // 判空处理
        if (this.isEmpty()) throw new Error("堆为空");
        // 交换根节点与最右叶节点（即交换首元素与尾元素）
        this.#swap(0, this.size() - 1);
        // 删除节点
        const val = this.#maxHeap.pop();
        // 从顶至底堆化
        this.#siftDown(0);
        // 返回堆顶元素
        return val;
    }

    /* 从节点 i 开始，从顶至底堆化 */
    #siftDown(i) {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i) break;
            // 交换两节点
            this.#swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }
    ```

=== "TypeScript"

    ```typescript title="my_heap.ts"
    /* 元素出堆 */
    pop(): number {
        // 判空处理
        if (this.isEmpty()) throw new RangeError('Heap is empty.');
        // 交换根节点与最右叶节点（即交换首元素与尾元素）
        this.swap(0, this.size() - 1);
        // 删除节点
        const val = this.maxHeap.pop();
        // 从顶至底堆化
        this.siftDown(0);
        // 返回堆顶元素
        return val;
    }

    /* 从节点 i 开始，从顶至底堆化 */
    siftDown(i: number): void {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i) break;
            // 交换两节点
            this.swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    [class]{maxHeap}-[func]{pop}

    [class]{maxHeap}-[func]{siftDown}
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 元素出堆 */
    int pop()
    {
        // 判空处理
        if (isEmpty())
            throw new IndexOutOfRangeException();
        // 交换根节点与最右叶节点（即交换首元素与尾元素）
        swap(0, size() - 1);
        // 删除节点
        int val = maxHeap.Last();
        maxHeap.RemoveAt(size() - 1);
        // 从顶至底堆化
        siftDown(0);
        // 返回堆顶元素
        return val;
    }

    /* 从节点 i 开始，从顶至底堆化 */
    void siftDown(int i)
    {
        while (true)
        {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 若“节点 i 最大”或“越过叶节点”，则结束堆化
            if (ma == i) break;
            // 交换两节点
            swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 元素出堆 */
    func pop() -> Int {
        // 判空处理
        if isEmpty() {
            fatalError("堆为空")
        }
        // 交换根节点与最右叶节点（即交换首元素与尾元素）
        swap(i: 0, j: size() - 1)
        // 删除节点
        let val = maxHeap.remove(at: size() - 1)
        // 从顶至底堆化
        siftDown(i: 0)
        // 返回堆顶元素
        return val
    }

    /* 从节点 i 开始，从顶至底堆化 */
    func siftDown(i: Int) {
        var i = i
        while true {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if ma == i {
                break
            }
            // 交换两节点
            swap(i: i, j: ma)
            // 循环向下堆化
            i = ma
        }
    }
    ```

=== "Zig"

    ```zig title="my_heap.zig"
    // 元素出堆
    fn pop(self: *Self) !T {
        // 判断处理
        if (self.isEmpty()) unreachable;
        // 交换根节点与最右叶节点（即交换首元素与尾元素）
        try self.swap(0, self.size() - 1);
        // 删除节点
        var val = self.max_heap.?.pop();
        // 从顶至底堆化
        try self.siftDown(0);
        // 返回堆顶元素
        return val;
    } 

    // 从节点 i 开始，从顶至底堆化
    fn siftDown(self: *Self, i_: usize) !void {
        var i = i_;
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            var l = left(i);
            var r = right(i);
            var ma = i;
            if (l < self.size() and self.max_heap.?.items[l] > self.max_heap.?.items[ma]) ma = l;
            if (r < self.size() and self.max_heap.?.items[r] > self.max_heap.?.items[ma]) ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i) break;
            // 交换两节点
            try self.swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }
    ```

## 8.1.4. &nbsp; 堆常见应用

- **优先队列**。堆常作为实现优先队列的首选数据结构，入队和出队操作时间复杂度为 $O(\log n)$ ，建队操作为 $O(n)$ ，皆非常高效。
- **堆排序**。给定一组数据，我们使用其建堆，并依次全部弹出，则可以得到有序的序列。当然，堆排序一般无需弹出元素，仅需每轮将堆顶元素交换至数组尾部并减小堆的长度即可。
- **获取最大的 $k$ 个元素**。这既是一道经典算法题目，也是一种常见应用，例如选取热度前 10 的新闻作为微博热搜，选取前 10 销量的商品等。
