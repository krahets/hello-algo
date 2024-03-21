/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // 元素入堆
        Console.WriteLine($"\n元素 {val} 入堆后\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // 堆顶元素出堆
        Console.WriteLine($"\n堆顶元素 {val} 出堆后\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* 初始化堆 */
        // 初始化小顶堆
        PriorityQueue<int, int> minHeap = new();
        // 初始化大顶堆（使用 lambda 表达式修改 Comparator 即可）
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y - x));
        Console.WriteLine("以下测试样例为大顶堆");

        /* 元素入堆 */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* 获取堆顶元素 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"堆顶元素为 {peek}");

        /* 堆顶元素出堆 */
        // 出堆元素会形成一个从大到小的序列
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* 获取堆大小 */
        int size = maxHeap.Count;
        Console.WriteLine($"堆元素数量为 {size}");

        /* 判断堆是否为空 */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"堆是否为空 {isEmpty}");

        /* 输入列表并建堆 */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("输入列表并建立小顶堆后");
        PrintUtil.PrintHeap(minHeap);
    }
}
