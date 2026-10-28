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
        Console.WriteLine("정수 " + num + " ; 해시값: " + hashNum);

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("불리언 값 " + bol + " ; 해시값: " + hashBol);

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("소수 " + dec + " ; 해시값: " + hashDec);

        string str = "Hello 算法";
        int hashStr = str.GetHashCode();
        Console.WriteLine("문자열 " + str + " ; 해시값: " + hashStr);

        object[] arr = [12836, "小哈"];
        int hashTup = arr.GetHashCode();
        Console.WriteLine("배열 [" + string.Join(", ", arr) + "]의 해시값: " + hashTup);

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("노드 객체 " + obj + " ; 해시값: " + hashObj);
    }
}
