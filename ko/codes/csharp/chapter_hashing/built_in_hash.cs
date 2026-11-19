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
        Console.WriteLine("정수 " + num + " → 해시값: " + hashNum);
        // 정수 3 → 해시값: 3

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("불리언 값 " + bol + " → 해시값: " + hashBol);
        // 불리언 값 True → 해시값: 1

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("소수 " + dec + " → 해시값: " + hashDec);
        // 소수 3.14159 → 해시값: -1340954729

        string str = "Hello 算法";
        int hashStr = str.GetHashCode();
        Console.WriteLine("문자열 ‘" + str + "’ → 해시값: " + hashStr);
        // 문자열 ‘Hello 算法’ → 해시값: -586107568

        object[] arr = [12836, "小哈"];
        int hashArr = arr.GetHashCode();
        Console.WriteLine("배열 [" + string.Join(", ", arr) + "] → 해시값: " + hashArr);
        // 배열 [12836, 小哈] → 해시값: 42931033

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("노드 객체 " + obj + " → 해시값: " + hashObj);
        // 노드 객체 0 → 해시값: 39053774
        // [endregion]{builtin_hash}
    }
}
