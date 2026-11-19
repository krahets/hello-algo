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
        Console.WriteLine("整数 " + num + " 的哈希值为 " + hashNum);
        // 整数 3 的哈希值为 3

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("布尔量 " + bol + " 的哈希值为 " + hashBol);
        // 布尔量 True 的哈希值为 1

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("小数 " + dec + " 的哈希值为 " + hashDec);
        // 小数 3.14159 的哈希值为 -1340954729

        string str = "Hello 算法";
        int hashStr = str.GetHashCode();
        Console.WriteLine("字符串“" + str + "”的哈希值为 " + hashStr);
        // 字符串“Hello 算法”的哈希值为 -586107568

        object[] arr = [12836, "小哈"];
        int hashArr = arr.GetHashCode();
        Console.WriteLine("数组 [" + string.Join(", ", arr) + "] 的哈希值为 " + hashArr);
        // 数组 [12836, 小哈] 的哈希值为 42931033

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("节点对象 " + obj + " 的哈希值为 " + hashObj);
        // 节点对象 0 的哈希值为 39053774
        // [endregion]{builtin_hash}
    }
}
