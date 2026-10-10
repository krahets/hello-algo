/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 循環配列ベースの両端キュー */
public class ArrayDeque {
    int[] nums;  // 両端キューの要素を格納する配列
    int front;   // 先頭ポインタ。先頭要素を指す
    int queSize; // 両端キューの長さ

    /* コンストラクタ */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 両端キューの容量を取得 */
    int Capacity() {
        return nums.Length;
    }

    /* 両端キューの長さを取得 */
    public int Size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 循環配列のインデックスを計算 */
    int Index(int i) {
        // 剰余演算により配列の先頭と末尾をつなげる
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭を越えて前に出たら末尾に戻る
        return (i + Capacity()) % Capacity();
    }

    /* キュー先頭にエンキュー */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("両端キューは満杯です");
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
        front = Index(front - 1);
        // num をキュー先頭に追加
        nums[front] = num;
        queSize++;
    }

    /* キュー末尾にエンキュー */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("両端キューは満杯です");
            return;
        }
        // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        int rear = Index(front + queSize);
        // num をキュー末尾に追加
        nums[rear] = num;
        queSize++;
    }

    /* キュー先頭からデキュー */
    public int PopFirst() {
        int num = PeekFirst();
        // 先頭ポインタを 1 つ後ろへ進める
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* キュー末尾からデキュー */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* キュー末尾の要素にアクセス */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // 末尾要素のインデックスを計算
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* 出力用の配列を返す */
    public int[] ToArray() {
        // 有効長の範囲内のリスト要素のみを変換
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
        /* 両端キューを初期化 */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("双方向キュー deque = " + string.Join(" ", deque.ToArray()));

        /* 要素にアクセス */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("末尾要素 peekLast = " + peekLast);

        /* 要素をエンキュー */
        deque.PushLast(4);
        Console.WriteLine("要素 4 を末尾にエンキューした後 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("要素 1 を先頭にエンキューした後 deque = " + string.Join(" ", deque.ToArray()));

        /* 要素をデキュー */
        int popLast = deque.PopLast();
        Console.WriteLine("末尾からデキューした要素 = " + popLast + "、末尾からデキューした後 deque = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("先頭からデキューした要素 = " + popFirst + "、先頭からデキューした後 deque = " + string.Join(" ", deque.ToArray()));

        /* 両端キューの長さを取得 */
        int size = deque.Size();
        Console.WriteLine("双方向キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("双方向キューが空かどうか = " + isEmpty);
    }
}
