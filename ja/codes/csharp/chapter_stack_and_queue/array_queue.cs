/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 循環配列ベースのキュー */
class ArrayQueue {
    int[] nums;  // キュー要素を格納する配列
    int front;   // 先頭ポインタ。先頭要素を指す
    int queSize; // キューの長さ

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* キューの容量を取得 */
    int Capacity() {
        return nums.Length;
    }

    /* キューの長さを取得 */
    public int Size() {
        return queSize;
    }

    /* キューが空かどうかを判定 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* エンキュー */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("キューは満杯です");
            return;
        }
        // 末尾ポインタを計算し、末尾インデックス + 1 を指す
        // 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
        int rear = (front + queSize) % Capacity();
        // num をキュー末尾に追加
        nums[rear] = num;
        queSize++;
    }

    /* デキュー */
    public int Pop() {
        int num = Peek();
        // 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* 配列を返す */
    public int[] ToArray() {
        // 有効長の範囲内のリスト要素のみを変換
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
        /* キューを初期化 */
        int capacity = 10;
        ArrayQueue queue = new(capacity);

        /* 要素をエンキュー */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("キュー queue = " + string.Join(",", queue.ToArray()));

        /* キュー先頭の要素にアクセス */
        int peek = queue.Peek();
        Console.WriteLine("先頭要素 peek = " + peek);

        /* 要素をデキュー */
        int pop = queue.Pop();
        Console.WriteLine("デキューした要素 pop = " + pop + "、デキュー後の queue = " + string.Join(",", queue.ToArray()));

        /* キューの長さを取得 */
        int size = queue.Size();
        Console.WriteLine("キューの長さ size = " + size);

        /* キューが空かどうかを判定 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("キューが空かどうか = " + isEmpty);

        /* 循環配列をテストする */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("第 " + i + " 回のエンキュー + デキュー後 queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
