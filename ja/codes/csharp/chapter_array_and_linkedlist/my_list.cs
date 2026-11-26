/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* リストクラス */
class MyList {
    private int[] arr;           // 配列（リストの要素を格納）
    private int arrCapacity = 10;    // リストの容量
    private int arrSize = 0;         // リストの長さ（現在の要素数）
    private readonly int extendRatio = 2;  // リストの容量を拡張する際の倍率

    /* コンストラクタ */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* リストの長さ（現在の要素数）を取得する*/
    public int Size() {
        return arrSize;
    }

    /* リストの容量を取得する */
    public int Capacity() {
        return arrCapacity;
    }

    /* 要素にアクセスする */
    public int Get(int index) {
        // インデックスが範囲外なら例外を送出する。以下も同様
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("インデックスが範囲外です");
        return arr[index];
    }

    /* 要素を更新する */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("インデックスが範囲外です");
        arr[index] = num;
    }

    /* 末尾に要素を追加する */
    public void Add(int num) {
        // 要素数が容量を超えるときは容量を拡張する
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // 要素数を更新する
        arrSize++;
    }

    /* 途中に要素を挿入する */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("インデックスが範囲外です");
        // 要素数が容量を超えるときは容量を拡張する
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // インデックス index 以降の要素をすべて後ろに 1 つずらす
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 要素数を更新する
        arrSize++;
    }

    /* 要素を削除する */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("インデックスが範囲外です");
        int num = arr[index];
        // インデックス index より後ろの要素をすべて前に 1 つずらす
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 要素数を更新する
        arrSize--;
        // 削除した要素を返す
        return num;
    }

    /* リストの容量を拡張する */
    public void ExtendCapacity() {
        // 長さ arrCapacity * extendRatio の配列を作り、元の配列の内容をコピーする
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // リストの容量を更新する
        arrCapacity = arr.Length;
    }

    /* リストを配列に変換する */
    public int[] ToArray() {
        // 有効な範囲内のリスト要素だけを変換する
        int[] arr = new int[arrSize];
        for (int i = 0; i < arrSize; i++) {
            arr[i] = Get(i);
        }
        return arr;
    }
}

public class my_list {
    [Test]
    public void Test() {
        /* リストを初期化する */
        MyList nums = new();
        /* 末尾に要素を追加する */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("リスト nums = " + string.Join(",", nums.ToArray()) +
                           " 、容量 = " + nums.Capacity() + " 、長さ = " + nums.Size());

        /* 途中に要素を挿入する */
        nums.Insert(3, 6);
        Console.WriteLine("インデックス 3 に 6 を挿入した後の nums = " + string.Join(",", nums.ToArray()));

        /* 要素を削除する */
        nums.Remove(3);
        Console.WriteLine("インデックス 3 の要素を削除した後の nums = " + string.Join(",", nums.ToArray()));

        /* 要素にアクセスする */
        int num = nums.Get(1);
        Console.WriteLine("インデックス 1 の要素を読み出した結果 num = " + num);

        /* 要素を更新する */
        nums.Set(1, 0);
        Console.WriteLine("インデックス 1 の要素を 0 に更新した後の nums = " + string.Join(",", nums.ToArray()));

        /* 容量拡張の動作を確認する */
        for (int i = 0; i < 10; i++) {
            // i = 5 でリストの長さが容量を超えるため、容量を拡張する
            nums.Add(i);
        }
        Console.WriteLine("容量拡張後のリスト nums = " + string.Join(",", nums.ToArray()) +
                           " 、容量 = " + nums.Capacity() + " 、長さ = " + nums.Size());
    }
}
