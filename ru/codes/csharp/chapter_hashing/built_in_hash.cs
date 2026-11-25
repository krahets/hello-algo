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
        Console.WriteLine("Целое число " + num + " имеет хеш " + hashNum);

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("Логическое значение " + bol + " имеет хеш " + hashBol);

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("Вещественное число " + dec + " имеет хеш " + hashDec);

        string str = "Hello 算法";
        int hashStr = str.GetHashCode();
        Console.WriteLine("Строка " + str + " имеет хеш " + hashStr);

        object[] arr = [12836, "小哈"];
        int hashTup = arr.GetHashCode();
        Console.WriteLine("Массив [" + string.Join(", ", arr) + "] имеет хеш " + hashTup);

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("Объект узла " + obj + " имеет хеш " + hashObj);
    }
}
