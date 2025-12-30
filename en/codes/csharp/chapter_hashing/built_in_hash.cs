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
        Console.WriteLine("Integer " + num + " has hash value " + hashNum);

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("Boolean " + bol + " has hash value " + hashBol);

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("Decimal " + dec + " has hash value " + hashDec);

        string str = "Hello Algo";
        int hashStr = str.GetHashCode();
        Console.WriteLine("String " + str + " has hash value " + hashStr);

        object[] arr = [12836, "Xiao Ha"];
        int hashTup = arr.GetHashCode();
        Console.WriteLine("Array [" + string.Join(", ", arr) + "] hash value is " + hashTup);

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("Node object " + obj + " has hash value " + hashObj);
    }
}
