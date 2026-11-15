/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* 両端キューを初期化する */
        // C# では、連結リスト LinkedList を両端キューとして使う
        LinkedList<int> deque = new();

        /* 要素をエンキューする */
        deque.AddLast(2);   // キューの末尾に追加する
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // キューの先頭に追加する
        deque.AddFirst(1);
        Console.WriteLine("両端キュー deque = " + string.Join(",", deque));

        /* 要素にアクセスする */
        int? peekFirst = deque.First?.Value;  // キューの先頭要素
        Console.WriteLine("キューの先頭要素 peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // キューの末尾要素
        Console.WriteLine("キューの末尾要素 peekLast = " + peekLast);

        /* 要素をデキューする */
        deque.RemoveFirst();  // キューの先頭要素をデキューする
        Console.WriteLine("先頭要素をデキューした後 deque = " + string.Join(",", deque));
        deque.RemoveLast();   // キューの末尾要素をデキューする
        Console.WriteLine("末尾要素をデキューした後 deque = " + string.Join(",", deque));

        /* 両端キューの長さを取得する */
        int size = deque.Count;
        Console.WriteLine("両端キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定する */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("両端キューは空か = " + isEmpty);
    }
}
