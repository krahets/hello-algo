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
        Console.WriteLine("整数 " + num + " のハッシュ値は " + hashNum);

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("真偽値 " + bol + " のハッシュ値は " + hashBol);

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("小数 " + dec + " のハッシュ値は " + hashDec);

        string str = "Hello アルゴリズム";
        int hashStr = str.GetHashCode();
        Console.WriteLine("文字列 " + str + " のハッシュ値は " + hashStr);

        object[] arr = [12836, "シャオハー"];
        int hashTup = arr.GetHashCode();
        Console.WriteLine("配列 [" + string.Join(", ", arr) + "] のハッシュ値は " + hashTup);

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("ノードオブジェクト " + obj + " のハッシュ値は " + hashObj);
    }
}
