/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 配列ベースのスタック */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // リスト（動的配列）を初期化する
        stack = [];
    }

    /* スタックの長さを取得 */
    public int Size() {
        return stack.Count;
    }

    /* スタックが空かどうかを判定 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* プッシュ */
    public void Push(int num) {
        stack.Add(num);
    }

    /* ポップ */
    public int Pop() {
        if (IsEmpty())
            throw new Exception();
        var val = Peek();
        stack.RemoveAt(Size() - 1);
        return val;
    }

    /* スタックトップの要素にアクセス */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* List を Array に変換して返す */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* スタックを初期化 */
        ArrayStack stack = new();

        /* 要素をプッシュ */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("スタック stack = " + string.Join(",", stack.ToArray()));

        /* スタックトップの要素にアクセス */
        int peek = stack.Peek();
        Console.WriteLine("スタックトップ要素 peek = " + peek);

        /* 要素をポップ */
        int pop = stack.Pop();
        Console.WriteLine("ポップした要素 pop = " + pop + "、ポップ後の stack = " + string.Join(",", stack.ToArray()));

        /* スタックの長さを取得 */
        int size = stack.Size();
        Console.WriteLine("スタックの長さ size = " + size);

        /* 空かどうかを判定 */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("スタックが空かどうか = " + isEmpty);
    }
}
