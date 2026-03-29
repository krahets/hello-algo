/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* リストクラス */
class MyList {
    private int[] arr;           // 配列（リスト要素を格納）
    private int arrCapacity = 10;    // リスト容量
    private int arrSize = 0;         // リストの長さ（現在の要素数）
    private readonly int extendRatio = 2;  // リスト拡張時の増加倍率

    /* コンストラクタ */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* リストの長さを取得（現在の要素数） */
    public int Size() {
        return arrSize;
    }

    /* リスト容量を取得する */
    public int Capacity() {
        return arrCapacity;
    }

    /* 要素にアクセス */
    public int Get(int index) {
        // インデックスが範囲外なら例外を送出する。以下同様
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("インデックスが範囲外です");
        return arr[index];
    }

    /* 要素を更新 */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("インデックスが範囲外です");
        arr[index] = num;
    }

    /* 末尾に要素を追加 */
    public void Add(int num) {
        // 要素数が容量を超えると、拡張機構が発動する
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // 要素数を更新
        arrSize++;
    }

    /* 中間に要素を挿入 */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("インデックスが範囲外です");
        // 要素数が容量を超えると、拡張機構が発動する
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // index 以降の要素をすべて 1 つ後ろへずらす
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 要素数を更新
        arrSize++;
    }

    /* 要素を削除 */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("インデックスが範囲外です");
        int num = arr[index];
        // インデックス index より後の要素をすべて 1 つ前に移動する
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 要素数を更新
        arrSize--;
        // 削除された要素を返す
        return num;
    }

    /* リストの拡張 */
    public void ExtendCapacity() {
        // `arrCapacity * extendRatio` の長さを持つ配列を新規作成し、元の配列を新しい配列にコピーする
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // リストの容量を更新
        arrCapacity = arr.Length;
    }

    /* リストを配列に変換する */
    public int[] ToArray() {
        // 有効長の範囲内のリスト要素のみを変換
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
        /* リストを初期化 */
        MyList nums = new();
        /* 末尾に要素を追加 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("リスト nums = " + string.Join(",", nums.ToArray()) +
                           " ，容量 = " + nums.Capacity() + " ，長さ = " + nums.Size());

        /* 中間に要素を挿入 */
        nums.Insert(3, 6);
        Console.WriteLine("インデックス 3 に数値 6 を挿入すると nums = " + string.Join(",", nums.ToArray()));

        /* 要素を削除 */
        nums.Remove(3);
        Console.WriteLine("インデックス 3 の要素を削除すると nums = " + string.Join(",", nums.ToArray()));

        /* 要素にアクセス */
        int num = nums.Get(1);
        Console.WriteLine("インデックス 1 の要素にアクセスすると num = " + num);

        /* 要素を更新 */
        nums.Set(1, 0);
        Console.WriteLine("インデックス 1 の要素を 0 に更新すると nums = " + string.Join(",", nums.ToArray()));

        /* 拡張機構をテストする */
        for (int i = 0; i < 10; i++) {
            // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
            nums.Add(i);
        }
        Console.WriteLine("拡張後のリスト nums = " + string.Join(",", nums.ToArray()) +
                           " ，容量 = " + nums.Capacity() + " ，長さ = " + nums.Size());
    }
}
