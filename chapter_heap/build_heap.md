---
comments: true
---

# 8.2. &nbsp; 建堆操作 *

如果我们想要根据输入列表来生成一个堆，这样的操作被称为「建堆」。

## 8.2.1. &nbsp; 两种建堆方法

### 借助入堆方法实现

最直接地，考虑借助「元素入堆」方法，先建立一个空堆，**再将列表元素依次入堆即可**。

### 基于堆化操作实现

然而，**存在一种更加高效的建堆方法**。设元素数量为 $n$ ，我们先将列表所有元素原封不动添加进堆，**然后迭代地对各个结点执行「从顶至底堆化」**。当然，**无需对叶结点执行堆化**，因为其没有子结点。

=== "Java"

    ```java title="my_heap.java"
    /* 构造方法，根据输入列表建堆 */
    MaxHeap(List<Integer> nums) {
        // 将列表元素原封不动添加进堆
        maxHeap = new ArrayList<>(nums);
        // 堆化除叶结点以外的其他所有结点
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "C++"

    ```cpp title="my_heap.cpp"
    /* 构造方法，根据输入列表建堆 */
    MaxHeap(vector<int> nums) {
        // 将列表元素原封不动添加进堆
        maxHeap = nums;
        // 堆化除叶结点以外的其他所有结点
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }
    ```

=== "Python"

    ```python title="my_heap.py"
    def __init__(self, nums: List[int]):
        """ 构造方法 """
        # 将列表元素原封不动添加进堆
        self.max_heap = nums
        # 堆化除叶结点以外的其他所有结点
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)
    ```

=== "Go"

    ```go title="my_heap.go"
    /* 构造方法，根据切片建堆 */
    func newMaxHeap(nums []any) *maxHeap {
        // 将列表元素原封不动添加进堆
        h := &maxHeap{data: nums}
        for i := len(h.data) - 1; i >= 0; i-- {
            // 堆化除叶结点以外的其他所有结点
            h.siftDown(i)
        }
        return h
    }
    ```

=== "JavaScript"

    ```javascript title="my_heap.js"
    /* 构造方法，建立空堆或根据输入列表建堆 */
    constructor(nums) {
        // 将列表元素原封不动添加进堆
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // 堆化除叶结点以外的其他所有结点
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }
    ```

=== "TypeScript"

    ```typescript title="my_heap.ts"
    /* 构造方法，建立空堆或根据输入列表建堆 */
    constructor(nums?: number[]) {
        // 将列表元素原封不动添加进堆
        this.maxHeap = nums === undefined ? [] : [...nums];
        // 堆化除叶结点以外的其他所有结点
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }
    ```

=== "C"

    ```c title="my_heap.c"
    [class]{maxHeap}-[func]{newMaxHeap}
    ```

=== "C#"

    ```csharp title="my_heap.cs"
    /* 构造函数，根据输入列表建堆 */
    MaxHeap(IEnumerable<int> nums)
    {
        // 将列表元素原封不动添加进堆
        maxHeap = new List<int>(nums);
        // 堆化除叶结点以外的其他所有结点
        var size = parent(this.size() - 1);
        for (int i = size; i >= 0; i--)
        {
            siftDown(i);
        }
    }
    ```

=== "Swift"

    ```swift title="my_heap.swift"
    /* 构造方法，根据输入列表建堆 */
    init(nums: [Int]) {
        // 将列表元素原封不动添加进堆
        maxHeap = nums
        // 堆化除叶结点以外的其他所有结点
        for i in stride(from: parent(i: size() - 1), through: 0, by: -1) {
            siftDown(i: i)
        }
    }
    ```

=== "Zig"

    ```zig title="my_heap.zig"
    // 构造方法，根据输入列表建堆
    fn init(self: *Self, allocator: std.mem.Allocator, nums: []const T) !void {
        if (self.maxHeap != null) return;
        self.maxHeap = std.ArrayList(T).init(allocator);
        // 将列表元素原封不动添加进堆
        try self.maxHeap.?.appendSlice(nums);
        // 堆化除叶结点以外的其他所有结点
        var i: usize = parent(self.size() - 1) + 1;
        while (i > 0) : (i -= 1) {
            try self.siftDown(i - 1);
        }
    }
    ```

## 8.2.2. &nbsp; 复杂度分析

对于第一种建堆方法，元素入堆的时间复杂度为 $O(\log n)$ ，而平均长度为 $\frac{n}{2}$ ，因此该方法的总体时间复杂度为 $O(n \log n)$ 。

那么，第二种建堆方法的时间复杂度是多少呢？我们来展开推算一下。

- 完全二叉树中，设结点总数为 $n$ ，则叶结点数量为 $(n + 1) / 2$ ，其中 $/$ 为向下整除。因此在排除叶结点后，需要堆化结点数量为 $(n - 1)/2$ ，即为 $O(n)$ ；
- 从顶至底堆化中，每个结点最多堆化至叶结点，因此最大迭代次数为二叉树高度 $O(\log n)$ ；

将上述两者相乘，可得时间复杂度为 $O(n \log n)$ 。然而，该估算结果仍不够准确，因为我们没有考虑到 **二叉树底层结点远多于顶层结点** 的性质。

下面我们来尝试展开计算。为了减小计算难度，我们假设树是一个「完美二叉树」，该假设不会影响计算结果的正确性。设二叉树（即堆）结点数量为 $n$ ，树高度为 $h$ 。上文提到，**结点堆化最大迭代次数等于该结点到叶结点的距离，而这正是“结点高度”**。因此，我们将各层的“结点数量 $\times$ 结点高度”求和，即可得到所有结点的堆化的迭代次数总和。

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \cdots + 2^{(h-1)}\times1
$$

![完美二叉树的各层结点数量](build_heap.assets/heapify_operations_count.png)

<p align="center"> Fig. 完美二叉树的各层结点数量 </p>

化简上式需要借助中学的数列知识，先对 $T(h)$ 乘以 $2$ ，易得

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \cdots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \cdots + 2^{h}\times1 \newline
\end{aligned}
$$

**使用错位相减法**，令下式 $2 T(h)$ 减去上式 $T(h)$ ，可得

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \cdots + 2^{h-1} + 2^h
$$

观察上式，$T(h)$ 是一个等比数列，可直接使用求和公式，得到时间复杂度为

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h \newline
& = O(2^h)
\end{aligned}
$$

进一步地，高度为 $h$ 的完美二叉树的结点数量为 $n = 2^{h+1} - 1$ ，易得复杂度为 $O(2^h) = O(n)$。以上推算表明，**输入列表并建堆的时间复杂度为 $O(n)$ ，非常高效**。
