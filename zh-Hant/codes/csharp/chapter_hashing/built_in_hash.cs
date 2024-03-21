/**
* File: built_in_hash.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

public class built_in_hash {
    [Test]
    public void Test() {
        int num = 3;
        int hashNum = num.GetHashCode();
        Console.WriteLine("整數 " + num + " 的雜湊值為 " + hashNum);

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("布林量 " + bol + " 的雜湊值為 " + hashBol);

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("小數 " + dec + " 的雜湊值為 " + hashDec);

        string str = "Hello 演算法";
        int hashStr = str.GetHashCode();
        Console.WriteLine("字串 " + str + " 的雜湊值為 " + hashStr);

        object[] arr = [12836, "小哈"];
        int hashTup = arr.GetHashCode();
        Console.WriteLine("陣列 [" + string.Join(", ", arr) + "] 的雜湊值為 " + hashTup);

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("節點物件 " + obj + " 的雜湊值為 " + hashObj);
    }
}
