/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        // [region]{init_deque}
        /* 両端キューを初期化する */
        // C# では、連結リスト LinkedList を両端キューとして使う
        LinkedList<int> deque = new();
        // [endregion]{init_deque}

        // [region]{push}
        /* 要素をエンキューする */
        deque.AddLast(2);   // キューの末尾に追加する
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // キューの先頭に追加する
        deque.AddFirst(1);
        // [endregion]{push}
        Console.WriteLine("両端キュー deque = " + string.Join(",", deque));

        // [region]{peek_first}
        /* 要素にアクセスする */
        int? peekFirst = deque.First?.Value;  // キューの先頭要素
        // [endregion]{peek_first}
        Console.WriteLine("キューの先頭要素 peekFirst = " + peekFirst);
        // [region]{peek_last}
        int? peekLast = deque.Last?.Value;    // キューの末尾要素
        // [endregion]{peek_last}
        Console.WriteLine("キューの末尾要素 peekLast = " + peekLast);

        // [region]{pop_first}
        /* 要素をデキューする */
        deque.RemoveFirst();  // キューの先頭要素をデキューする
        // [endregion]{pop_first}
        Console.WriteLine("先頭要素をデキューした後 deque = " + string.Join(",", deque));
        // [region]{pop_last}
        deque.RemoveLast();   // キューの末尾要素をデキューする
        // [endregion]{pop_last}
        Console.WriteLine("末尾要素をデキューした後 deque = " + string.Join(",", deque));

        // [region]{size}
        /* 両端キューの長さを取得する */
        int size = deque.Count;
        // [endregion]{size}
        Console.WriteLine("両端キューの長さ size = " + size);

        // [region]{is_empty}
        /* 両端キューが空かどうかを判定する */
        bool isEmpty = deque.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("両端キューは空か = " + isEmpty);
    }
}
