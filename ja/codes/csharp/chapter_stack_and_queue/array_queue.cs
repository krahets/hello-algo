/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 循環配列を使ったキュー */
class ArrayQueue {
    int[] nums;  // キューの要素を格納する配列
    int front;   // キューの先頭要素を指すインデックス
    int queSize; // キューの要素数

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* キューの容量を取得する */
    int Capacity() {
        return nums.Length;
    }

    /* キューの要素数を取得する */
    public int Size() {
        return queSize;
    }

    /* キューが空かどうかを判定する */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* エンキューする */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("キューが満杯です");
            return;
        }
        // キューの末尾要素の次の位置を示すインデックスを求める
        // 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
        int rear = (front + queSize) % Capacity();
        // num をキューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* デキューする */
    public int Pop() {
        int num = Peek();
        // 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* キューの先頭要素を参照する */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* 配列を返す */
    public int[] ToArray() {
        // キューの要素数に当たる範囲だけを変換する
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

        /* 要素をキューに追加する */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("キュー queue = " + string.Join(",", queue.ToArray()));

        /* キューの先頭要素を参照する */
        int peek = queue.Peek();
        Console.WriteLine("先頭要素 peek = " + peek);

        /* キューから要素を取り出す */
        int pop = queue.Pop();
        Console.WriteLine("デキューした要素 pop = " + pop + "、デキュー後の queue = " + string.Join(",", queue.ToArray()));

        /* キューの要素数を取得する */
        int size = queue.Size();
        Console.WriteLine("キューの要素数 size = " + size);

        /* キューが空かどうかを判定する */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("キューは空か = " + isEmpty);

        /* 循環配列の動作を確認する */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("第 " + i + " 回のエンキューとデキューを終えた後の queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
