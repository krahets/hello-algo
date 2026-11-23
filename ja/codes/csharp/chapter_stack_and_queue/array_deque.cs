/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 循環配列で実装した両端キュー */
public class ArrayDeque {
    int[] nums;  // 両端キューの要素を格納する配列
    int front;   // キューの先頭要素を指す先頭ポインタ
    int queSize; // 両端キューの長さ

    /* コンストラクタ */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 両端キューの容量を取得する */
    int Capacity() {
        return nums.Length;
    }

    /* 両端キューの長さを取得する */
    public int Size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 循環配列のインデックスを計算する */
    int Index(int i) {
        // 剰余演算を使い、配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら、先頭に戻る
        // i が配列の先頭を越えたら、末尾に戻る
        return (i + Capacity()) % Capacity();
    }

    /* 先頭にエンキューする */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("両端キューが満杯です");
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        front = Index(front - 1);
        // num をキューの先頭に追加する
        nums[front] = num;
        queSize++;
    }

    /* 末尾にエンキューする */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("両端キューが満杯です");
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        int rear = Index(front + queSize);
        // num をキューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* 先頭からデキューする */
    public int PopFirst() {
        int num = PeekFirst();
        // 先頭ポインタを後ろに 1 つ移動する
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* 末尾からデキューする */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* キューの末尾要素にアクセスする */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // 末尾要素のインデックスを計算する
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* 表示用の配列を返す */
    public int[] ToArray() {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[Index(j)];
        }
        return res;
    }
}

public class array_deque {
    [Test]
    public void Test() {
        /* 両端キューを初期化する */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("両端キュー deque = " + string.Join(" ", deque.ToArray()));

        /* 要素にアクセスする */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("キューの先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("キューの末尾要素 peekLast = " + peekLast);

        /* 要素をエンキューする */
        deque.PushLast(4);
        Console.WriteLine("要素 4 を末尾にエンキューした後 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("要素 1 を先頭にエンキューした後 deque = " + string.Join(" ", deque.ToArray()));

        /* 要素をデキューする */
        int popLast = deque.PopLast();
        Console.WriteLine("末尾からデキューした要素 = " + popLast + "、末尾からデキューした後 deque = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("先頭からデキューした要素 = " + popFirst + "、先頭からデキューした後 deque = " + string.Join(" ", deque.ToArray()));

        /* 両端キューの長さを取得する */
        int size = deque.Size();
        Console.WriteLine("両端キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定する */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("両端キューは空か = " + isEmpty);
    }
}
