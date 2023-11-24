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
        Console.WriteLine("整数 " + num + " 的哈希值为 " + hashNum);

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("布尔量 " + bol + " 的哈希值为 " + hashBol);

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("小数 " + dec + " 的哈希值为 " + hashDec);

        string str = "Hello 算法";
        int hashStr = str.GetHashCode();
        Console.WriteLine("字符串 " + str + " 的哈希值为 " + hashStr);

        object[] arr = [12836, "小哈"];
        int hashTup = arr.GetHashCode();
        Console.WriteLine("数组 [" + string.Join(", ", arr) + "] 的哈希值为 " + hashTup);

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("节点对象 " + obj + " 的哈希值为 " + hashObj);
    }
}
