/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 配列を使ったスタック */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // リスト（動的配列）を初期化する
        stack = [];
    }

    /* スタックの要素数を取得する */
    public int Size() {
        return stack.Count;
    }

    /* スタックが空かどうかを判定する */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* プッシュする */
    public void Push(int num) {
        stack.Add(num);
    }

    /* ポップする */
    public int Pop() {
        if (IsEmpty())
            throw new Exception();
        var val = Peek();
        stack.RemoveAt(Size() - 1);
        return val;
    }

    /* スタックのトップを参照する */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* リストを配列に変換して返す */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* スタックを初期化する */
        ArrayStack stack = new();

        /* 要素をプッシュする */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("スタック stack = " + string.Join(",", stack.ToArray()));

        /* スタックのトップを参照する */
        int peek = stack.Peek();
        Console.WriteLine("スタックのトップの要素 peek = " + peek);

        /* 要素をポップする */
        int pop = stack.Pop();
        Console.WriteLine("ポップした要素 pop = " + pop + "、ポップ後の stack = " + string.Join(",", stack.ToArray()));

        /* スタックの要素数を取得する */
        int size = stack.Size();
        Console.WriteLine("スタックの要素数 size = " + size);

        /* 空かどうかを判定する */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("スタックは空か = " + isEmpty);
    }
}
