/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 循環配列で実装したキュー */
class ArrayQueue {
    int[] nums;  // キューの要素を格納する配列
    int front;   // キューの先頭要素を指す先頭ポインタ
    int queSize; // キューの長さ

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* キューの容量を取得する */
    int Capacity() {
        return nums.Length;
    }

    /* キューの長さを取得 */
    public int Size() {
        return queSize;
    }

    /* キューが空か判定 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* エンキュー */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("キューが満杯です");
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        // 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
        int rear = (front + queSize) % Capacity();
        // num をキューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* デキュー */
    public int Pop() {
        int num = Peek();
        // 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* 配列を返す */
    public int[] ToArray() {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % this.Capacity()];
        }
        return res;
    }
}

public class array_queue {
    [Test]
    public void Test() {
        /* キューを初期化する */
        int capacity = 10;
        ArrayQueue queue = new(capacity);

        /* 要素をエンキューする */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("キュー queue = " + string.Join(",", queue.ToArray()));

        /* キューの先頭要素にアクセス */
        int peek = queue.Peek();
        Console.WriteLine("キューの先頭要素 peek = " + peek);

        /* 要素をデキューする */
        int pop = queue.Pop();
        Console.WriteLine("デキューした要素 pop = " + pop + "、デキュー後 queue = " + string.Join(",", queue.ToArray()));

        /* キューの長さを取得 */
        int size = queue.Size();
        Console.WriteLine("キューの長さ size = " + size);

        /* キューが空か判定 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("キューは空か = " + isEmpty);

        /* 循環配列をテストする */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("第 " + i + " 回のエンキューとデキューの後 queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
