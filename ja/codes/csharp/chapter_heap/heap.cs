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
        /* ヒープを初期化する */
        // 最小ヒープを初期化する
        PriorityQueue<int, int> minHeap = new();
        // 最大ヒープを初期化する（ラムダ式で Comparer を変更すればよい）
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        // [endregion]{init}
        Console.WriteLine("以下のテストケースは最大ヒープを対象とする");

        // [region]{push}
        /* ヒープに要素を挿入する */
        maxHeap.Enqueue(1, 1);
        maxHeap.Enqueue(3, 3);
        maxHeap.Enqueue(2, 2);
        maxHeap.Enqueue(5, 5);
        maxHeap.Enqueue(4, 4);
        // [endregion]{push}
        PrintUtil.PrintHeap(maxHeap);

        // [region]{peek}
        /* ヒープの先頭要素を取得する */
        int peek = maxHeap.Peek(); // 5
        // [endregion]{peek}
        Console.WriteLine($"ヒープの先頭要素は {peek}");

        // [region]{pop_1}
        /* ヒープの先頭要素を取り出す */
        // 取り出した要素は降順の列を形成する
        peek = maxHeap.Dequeue(); // 5
        // [endregion]{pop_1}
        Console.WriteLine(peek);
        // [region]{pop_2}
        peek = maxHeap.Dequeue(); // 4
        // [endregion]{pop_2}
        Console.WriteLine(peek);
        // [region]{pop_3}
        peek = maxHeap.Dequeue(); // 3
        // [endregion]{pop_3}
        Console.WriteLine(peek);
        // [region]{pop_4}
        peek = maxHeap.Dequeue(); // 2
        // [endregion]{pop_4}
        Console.WriteLine(peek);
        // [region]{pop_5}
        peek = maxHeap.Dequeue(); // 1
        // [endregion]{pop_5}
        Console.WriteLine(peek);

        // [region]{size}
        /* ヒープのサイズを取得する */
        int size = maxHeap.Count;
        // [endregion]{size}
        Console.WriteLine($"ヒープの要素数は {size}");

        // [region]{is_empty}
        /* ヒープが空か判定 */
        bool isEmpty = maxHeap.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine($"ヒープは空か {isEmpty}");

        // [region]{heapify}
        /* リストを入力してヒープを構築する */
        minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
        // [endregion]{heapify}
        Console.WriteLine("リストを入力して最小ヒープを構築した後");
        PrintUtil.PrintHeap(minHeap);
    }
}
