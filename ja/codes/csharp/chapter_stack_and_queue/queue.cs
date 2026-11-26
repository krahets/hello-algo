/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        /* キューを初期化する */
        Queue<int> queue = new();

        /* 要素をキューに追加する */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        Console.WriteLine("キュー queue = " + string.Join(",", queue));

        /* キューの先頭要素を参照する */
        int peek = queue.Peek();
        Console.WriteLine("先頭要素 peek = " + peek);

        /* キューから要素を取り出す */
        int pop = queue.Dequeue();
        Console.WriteLine("デキューした要素 pop = " + pop + "、デキュー後の queue = " + string.Join(",", queue));

        /* キューの要素数を取得する */
        int size = queue.Count;
        Console.WriteLine("キューの要素数 size = " + size);

        /* キューが空かどうかを判定する */
        bool isEmpty = queue.Count == 0;
        Console.WriteLine("キューは空か = " + isEmpty);
    }
}
