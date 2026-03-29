/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* 両端キューを初期化 */
        // C# では、LinkedList を両端キューとして使う
        LinkedList<int> deque = new();

        /* 要素をエンキュー */
        deque.AddLast(2);   // 末尾に追加する
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // 先頭に追加する
        deque.AddFirst(1);
        Console.WriteLine("双方向キュー deque = " + string.Join(",", deque));

        /* 要素にアクセス */
        int? peekFirst = deque.First?.Value;  // 先頭要素
        Console.WriteLine("先頭要素 peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // 末尾要素
        Console.WriteLine("末尾要素 peekLast = " + peekLast);

        /* 要素をデキュー */
        deque.RemoveFirst();  // 先頭要素を取り出す
        Console.WriteLine("先頭要素をデキューした後 deque = " + string.Join(",", deque));
        deque.RemoveLast();   // 末尾要素を取り出す
        Console.WriteLine("末尾要素をデキューした後 deque = " + string.Join(",", deque));

        /* 両端キューの長さを取得 */
        int size = deque.Count;
        Console.WriteLine("双方向キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定 */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("双方向キューが空かどうか = " + isEmpty);
    }
}
