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
        Console.WriteLine("Integer " + num + " has hash value " + hashNum);
        // Integer 3 has hash value 3

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("Boolean " + bol + " has hash value " + hashBol);
        // Boolean True has hash value 1

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("Floating-point number " + dec + " has hash value " + hashDec);
        // Floating-point number 3.14159 has hash value -1340954729

        string str = "Hello 算法";
        int hashStr = str.GetHashCode();
        Console.WriteLine("String '" + str + "' has hash value " + hashStr);
        // String 'Hello 算法' has hash value -586107568

        object[] arr = [12836, "小哈"];
        int hashArr = arr.GetHashCode();
        Console.WriteLine("Array [" + string.Join(", ", arr) + "] has hash value " + hashArr);
        // Array [12836, 小哈] has hash value 42931033

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("Node object " + obj + " has hash value " + hashObj);
        // Node object 0 has hash value 39053774
        // [endregion]{builtin_hash}
    }
}
