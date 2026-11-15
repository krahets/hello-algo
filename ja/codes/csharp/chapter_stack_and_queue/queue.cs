/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        // [region]{init_queue}
        /* キューを初期化する */
        Queue<int> queue = new();
        // [endregion]{init_queue}

        // [region]{push}
        /* 要素をエンキューする */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        // [endregion]{push}
        Console.WriteLine("キュー queue = " + string.Join(",", queue));

        // [region]{peek}
        /* キューの先頭要素にアクセス */
        int peek = queue.Peek();
        // [endregion]{peek}
        Console.WriteLine("キューの先頭要素 peek = " + peek);

        // [region]{pop}
        /* 要素をデキューする */
        int pop = queue.Dequeue();
        // [endregion]{pop}
        Console.WriteLine("デキューした要素 pop = " + pop + "、デキュー後 queue = " + string.Join(",", queue));

        // [region]{size}
        /* キューの長さを取得 */
        int size = queue.Count;
        // [endregion]{size}
        Console.WriteLine("キューの長さ size = " + size);

        // [region]{is_empty}
        /* キューが空か判定 */
        bool isEmpty = queue.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("キューは空か = " + isEmpty);
    }
}
