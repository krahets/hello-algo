/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        /* キューを初期化 */
        Queue<int> queue = new();

        /* 要素をエンキュー */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        Console.WriteLine("キュー queue = " + string.Join(",", queue));

        /* キュー先頭の要素にアクセス */
        int peek = queue.Peek();
        Console.WriteLine("先頭要素 peek = " + peek);

        /* 要素をデキュー */
        int pop = queue.Dequeue();
        Console.WriteLine("デキューした要素 pop = " + pop + "、デキュー後の queue = " + string.Join(",", queue));

        /* キューの長さを取得 */
        int size = queue.Count;
        Console.WriteLine("キューの長さ size = " + size);

        /* キューが空かどうかを判定 */
        bool isEmpty = queue.Count == 0;
        Console.WriteLine("キューが空かどうか = " + isEmpty);
    }
}
