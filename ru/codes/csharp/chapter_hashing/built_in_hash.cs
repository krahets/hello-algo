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
        Console.WriteLine("Хеш-значение целого числа " + num + " равно " + hashNum);

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("Хеш-значение логического значения " + bol + " равно " + hashBol);

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("Хеш-значение десятичного числа " + dec + " равно " + hashDec);

        string str = "Hello Algo";
        int hashStr = str.GetHashCode();
        Console.WriteLine("Хеш-значение строки " + str + " равно " + hashStr);

        object[] arr = [12836, "Сяо Ха"];
        int hashTup = arr.GetHashCode();
        Console.WriteLine("массив [" + string.Join(", ", arr) + "] равно" + hashTup);

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("объект узла" + obj + " равно " + hashObj);
    }
}
