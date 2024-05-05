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
        Console.WriteLine("The hash value of integer " + num + " is" + hashNum);

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("The hash value of boolean " + bol + " is" + hashBol);

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("The hash value of decimal " + dec + " is" + hashDec);

        string str = "Hello algorithm";
        int hashStr = str.GetHashCode();
        Console.WriteLine("The hash value of string " + str + " is" + hashStr);

        object[] arr = [12836, "Ha"];
        int hashTup = arr.GetHashCode();
        Console.WriteLine("Array [" + string.Join(", ", arr) + "] hash value is" + hashTup);

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("The hash value of node object " + obj + " is" + hashObj);
    }
}
