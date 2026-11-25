/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 循環配列を使った両端キュー */
public class ArrayDeque {
    int[] nums;  // 両端キューの要素を格納する配列
    int front;   // 両端キューの先頭要素を指すインデックス
    int queSize; // 両端キューの要素数

    /* コンストラクタ */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 両端キューの容量を取得する */
    int Capacity() {
        return nums.Length;
    }

    /* 両端キューの要素数を取得する */
    public int Size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 循環配列のインデックスを求める */
    int Index(int i) {
        // 剰余を使って配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭より前に出たら末尾に回る
        return (i + Capacity()) % Capacity();
    }

    /* 先頭に追加する */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("両端キューが満杯です");
            return;
        }
        // 先頭のインデックスを左に 1 つ移す
        // 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
        front = Index(front - 1);
        // num を両端キューの先頭に追加する
        nums[front] = num;
        queSize++;
    }

    /* 末尾に追加する */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("両端キューが満杯です");
            return;
        }
        // 両端キューの末尾要素の次の位置を示すインデックスを求める
        int rear = Index(front + queSize);
        // num を両端キューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* 先頭から取り出す */
    public int PopFirst() {
        int num = PeekFirst();
        // 先頭のインデックスを 1 つ進める
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* 末尾から取り出す */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* 両端キューの先頭要素を参照する */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* 両端キューの末尾要素を参照する */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // 末尾要素のインデックスを求める
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* 表示用の配列を返す */
    public int[] ToArray() {
        // 両端キューの要素数に当たる範囲だけを変換する
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

        /* 要素を参照する */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("末尾要素 peekLast = " + peekLast);

        /* 要素を両端キューに追加する */
        deque.PushLast(4);
        Console.WriteLine("末尾に 4 を追加した後の deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("先頭に 1 を追加した後の deque = " + string.Join(" ", deque.ToArray()));

        /* 両端キューから要素を取り出す */
        int popLast = deque.PopLast();
        Console.WriteLine("末尾から取り出した要素 = " + popLast + "、末尾から取り出した後の deque = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("先頭から取り出した要素 = " + popFirst + "、先頭から取り出した後の deque = " + string.Join(" ", deque.ToArray()));

        /* 両端キューの要素数を取得する */
        int size = deque.Size();
        Console.WriteLine("両端キューの要素数 size = " + size);

        /* 両端キューが空かどうかを判定する */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("両端キューは空か = " + isEmpty);
    }
}
