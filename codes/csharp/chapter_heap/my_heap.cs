/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* 大顶堆 */
class MaxHeap {
    // 使用列表而非数组，这样无须考虑扩容问题
    List<int> maxHeap;

    /* 构造函数，建立空堆 */
    public MaxHeap() {
        maxHeap = [];
    }

    /* 构造函数，根据输入列表建堆 */
    public MaxHeap(IEnumerable<int> nums) {
        // 将列表元素原封不动添加进堆
        maxHeap = new List<int>(nums);
        // 堆化除叶节点以外的其他所有节点
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* 获取左子节点的索引 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 获取右子节点的索引 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 获取父节点的索引 */
    int Parent(int i) {
        return (i - 1) / 2; // 向下整除
    }

    /* 访问堆顶元素 */
    public int Peek() {
        return maxHeap[0];
    }

    /* 元素入堆 */
    public void Push(int val) {
        // 添加节点
        maxHeap.Add(val);
        // 从底至顶堆化
        SiftUp(Size() - 1);
    }

    /* 获取堆大小 */
    public int Size() {
        return maxHeap.Count;
    }

    /* 判断堆是否为空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 从节点 i 开始，从底至顶堆化 */
    void SiftUp(int i) {
        while (true) {
            // 获取节点 i 的父节点
            int p = Parent(i);
            // 若“越过根节点”或“节点无须修复”，则结束堆化
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 交换两节点
            Swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }

    /* 元素出堆 */
    public int Pop() {
        // 判空处理
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        Swap(0, Size() - 1);
        // 删除节点
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 从顶至底堆化
        SiftDown(0);
        // 返回堆顶元素
        return val;
    }

    /* 从节点 i 开始，从顶至底堆化 */
    void SiftDown(int i) {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 若“节点 i 最大”或“越过叶节点”，则结束堆化
            if (ma == i) break;
            // 交换两节点
            Swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }

    /* 交换元素 */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* 打印堆（二叉树） */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* 初始化大顶堆 */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\n输入列表并建堆后");
        maxHeap.Print();

        /* 获取堆顶元素 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"堆顶元素为 {peek}");

        /* 元素入堆 */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"元素 {val} 入堆后");
        maxHeap.Print();

        /* 堆顶元素出堆 */
        peek = maxHeap.Pop();
        Console.WriteLine($"堆顶元素 {peek} 出堆后");
        maxHeap.Print();

        /* 获取堆大小 */
        int size = maxHeap.Size();
        Console.WriteLine($"堆元素数量为 {size}");

        /* 判断堆是否为空 */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"堆是否为空 {isEmpty}");
    }
}
