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
        Console.WriteLine("整數 " + num + " 的雜湊值為 " + hashNum);
        // 整數 3 的雜湊值為 3

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("布林量 " + bol + " 的雜湊值為 " + hashBol);
        // 布林量 True 的雜湊值為 1

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("小數 " + dec + " 的雜湊值為 " + hashDec);
        // 小數 3.14159 的雜湊值為 -1340954729

        string str = "Hello 演算法";
        int hashStr = str.GetHashCode();
        Console.WriteLine("字串“" + str + "”的雜湊值為 " + hashStr);
        // 字串“Hello 演算法”的雜湊值為 -586107568

        object[] arr = [12836, "小哈"];
        int hashArr = arr.GetHashCode();
        Console.WriteLine("陣列 [" + string.Join(", ", arr) + "] 的雜湊值為 " + hashArr);
        // 陣列 [12836, 小哈] 的雜湊值為 42931033

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("節點物件 " + obj + " 的雜湊值為 " + hashObj);
        // 節點物件 0 的雜湊值為 39053774
        // [endregion]{builtin_hash}
    }
}
