/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    [Test]
    public void Test() {
        // [region]{init}
        /* 初始化堆 */
        // 初始化小顶堆
        PriorityQueue<int, int> minHeap = new();
        // 初始化大顶堆（使用 lambda 表达式修改 Comparer 即可）
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        // [endregion]{init}
        Console.WriteLine("以下测试样例为大顶堆");

        // [region]{push}
        /* 元素入堆 */
        maxHeap.Enqueue(1, 1);
        maxHeap.Enqueue(3, 3);
        maxHeap.Enqueue(2, 2);
        maxHeap.Enqueue(5, 5);
        maxHeap.Enqueue(4, 4);
        // [endregion]{push}
        PrintUtil.PrintHeap(maxHeap);

        // [region]{peek}
        /* 获取堆顶元素 */
        int peek = maxHeap.Peek(); // 5
        // [endregion]{peek}
        Console.WriteLine($"堆顶元素为 {peek}");

        // [region]{pop_1}
        /* 堆顶元素出堆 */
        // 出堆元素会形成一个从大到小的序列
        peek = maxHeap.Dequeue(); // 5
        // [endregion]{pop_1}
        Console.WriteLine($"出堆元素为 {peek}");
        // [region]{pop_2}
        peek = maxHeap.Dequeue(); // 4
        // [endregion]{pop_2}
        Console.WriteLine($"出堆元素为 {peek}");
        // [region]{pop_3}
        peek = maxHeap.Dequeue(); // 3
        // [endregion]{pop_3}
        Console.WriteLine($"出堆元素为 {peek}");
        // [region]{pop_4}
        peek = maxHeap.Dequeue(); // 2
        // [endregion]{pop_4}
        Console.WriteLine($"出堆元素为 {peek}");
        // [region]{pop_5}
        peek = maxHeap.Dequeue(); // 1
        // [endregion]{pop_5}
        Console.WriteLine($"出堆元素为 {peek}");

        // [region]{size}
        /* 获取堆大小 */
        int size = maxHeap.Count;
        // [endregion]{size}
        Console.WriteLine($"堆元素数量为 {size}");

        // [region]{is_empty}
        /* 判断堆是否为空 */
        bool isEmpty = maxHeap.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine($"堆是否为空 {isEmpty}");

        // [region]{heapify}
        /* 输入列表并建堆 */
        // 时间复杂度为 O(n) ，而非 O(nlogn)
        minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
        // [endregion]{heapify}
        Console.WriteLine("输入列表并建立小顶堆后");
        PrintUtil.PrintHeap(minHeap);
    }
}
