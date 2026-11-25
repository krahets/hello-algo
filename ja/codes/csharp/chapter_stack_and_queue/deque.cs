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
        // C# では連結リスト LinkedList を両端キューとして使う
        LinkedList<int> deque = new();

        /* 要素を両端キューに追加する */
        deque.AddLast(2);   // 末尾に追加する
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // 先頭に追加する
        deque.AddFirst(1);
        Console.WriteLine("両端キュー deque = " + string.Join(",", deque));

        /* 要素を参照する */
        int? peekFirst = deque.First?.Value;  // 先頭要素
        Console.WriteLine("先頭要素 peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // 末尾要素
        Console.WriteLine("末尾要素 peekLast = " + peekLast);

        /* 両端キューから要素を取り出す */
        deque.RemoveFirst();  // 先頭から要素を取り出す
        Console.WriteLine("先頭から取り出した後の deque = " + string.Join(",", deque));
        deque.RemoveLast();   // 末尾から要素を取り出す
        Console.WriteLine("末尾から取り出した後の deque = " + string.Join(",", deque));

        /* 両端キューの要素数を取得する */
        int size = deque.Count;
        Console.WriteLine("両端キューの要素数 size = " + size);

        /* 両端キューが空かどうかを判定する */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("両端キューは空か = " + isEmpty);
    }
}
