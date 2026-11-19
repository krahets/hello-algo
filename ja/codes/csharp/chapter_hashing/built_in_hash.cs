/**
* File: built_in_hash.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

public class built_in_hash {
    [Test]
    public void Test() {
        // [region]{builtin_hash}
        int num = 3;
        int hashNum = num.GetHashCode();
        Console.WriteLine("整数 " + num + " のハッシュ値は " + hashNum);
        // 整数 3 のハッシュ値は 3

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("真偽値 " + bol + " のハッシュ値は " + hashBol);
        // 真偽値 True のハッシュ値は 1

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("小数 " + dec + " のハッシュ値は " + hashDec);
        // 小数 3.14159 のハッシュ値は -1340954729

        string str = "Hello 算法";
        int hashStr = str.GetHashCode();
        Console.WriteLine("文字列「" + str + "」のハッシュ値は " + hashStr);
        // 文字列「Hello 算法」のハッシュ値は -586107568

        object[] arr = [12836, "小哈"];
        int hashArr = arr.GetHashCode();
        Console.WriteLine("配列 [" + string.Join(", ", arr) + "] のハッシュ値は " + hashArr);
        // 配列 [12836, 小哈] のハッシュ値は 42931033

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("ノードオブジェクト " + obj + " のハッシュ値は " + hashObj);
        // ノードオブジェクト 0 のハッシュ値は 39053774
        // [endregion]{builtin_hash}
    }
}
