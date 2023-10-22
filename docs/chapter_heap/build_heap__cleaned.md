# 建堆操作

在某些情况下，我们希望使用一个列表的所有元素来构建一个堆，这个过程被称为“建堆操作”。

## 借助入堆操作实现

我们首先创建一个空堆，然后遍历列表，依次对每个元素执行“入堆操作”，即先将元素添加至堆的尾部，再对该元素执行“从底至顶”堆化。

每当一个元素入堆，堆的长度就加一。由于节点是从顶到底依次被添加进二叉树的，因此堆是“自上而下”地构建的。

设元素数量为 $n$ ，每个元素的入堆操作使用 $O(\log{n})$ 时间，因此该建堆方法的时间复杂度为 $O(n \log n)$ 。

## 通过遍历堆化实现

实际上，我们可以实现一种更为高效的建堆方法，共分为两步。

1. 将列表所有元素原封不动添加到堆中，此时堆的性质尚未得到满足。
2. 倒序遍历堆（即层序遍历的倒序），依次对每个非叶节点执行“从顶至底堆化”。

**每当堆化一个节点后，以该节点为根节点的子树就形成一个合法的子堆**。而由于是倒序遍历，因此堆是“自下而上”地被构建的。

之所以选择倒序遍历，是因为这样能够保证当前节点之下的子树已经是合法的子堆，这样堆化当前节点才是有效的。

值得说明的是，**叶节点没有子节点，天然就是合法的子堆，因此无需堆化**。如以下代码所示，最后一个非叶节点是最后一个节点的父节点，我们从它开始倒序遍历并执行堆化。

```src
[file]{my_heap}-[class]{max_heap}-[func]{__init__}
```

## 复杂度分析

下面，我们来尝试推算第二种建堆方法的时间复杂度。

- 假设完全二叉树的节点数量为 $n$ ，则叶节点数量为 $(n + 1) / 2$ ，其中 $/$ 为向下整除。因此需要堆化的节点数量为 $(n - 1) / 2$ 。
- 在从顶至底堆化的过程中，每个节点最多堆化到叶节点，因此最大迭代次数为二叉树高度 $\log n$ 。

将上述两者相乘，可得到建堆过程的时间复杂度为 $O(n \log n)$ 。**但这个估算结果并不准确，因为我们没有考虑到二叉树底层节点数量远多于顶层节点的性质**。

接下来我们来进行更为准确的计算。为了减小计算难度，假设给定一个节点数量为 $n$ ，高度为 $h$ 的“完美二叉树”，该假设不会影响计算结果的正确性。

![完美二叉树的各层节点数量](build_heap.assets/heapify_operations_count.png)

如上图所示，节点“从顶至底堆化”的最大迭代次数等于该节点到叶节点的距离，而该距离正是“节点高度”。因此，我们可以将各层的“节点数量 $\times$ 节点高度”求和，**从而得到所有节点的堆化迭代次数的总和**。

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

化简上式需要借助中学的数列知识，先对 $T(h)$ 乘以 $2$ ，得到：

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \newline
2 T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^{h}\times1 \newline
\end{aligned}
$$

使用错位相减法，用下式 $2 T(h)$ 减去上式 $T(h)$ ，可得：

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

观察上式，发现 $T(h)$ 是一个等比数列，可直接使用求和公式，得到时间复杂度为：

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \newline
& = 2^{h+1} - h - 2 \newline
& = O(2^h)
\end{aligned}
$$

进一步地，高度为 $h$ 的完美二叉树的节点数量为 $n = 2^{h+1} - 1$ ，易得复杂度为 $O(2^h) = O(n)$ 。以上推算表明，**输入列表并建堆的时间复杂度为 $O(n)$ ，非常高效**。



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

