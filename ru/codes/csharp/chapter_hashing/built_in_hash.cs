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
        Console.WriteLine("Хеш-значение целого числа " + num + " = " + hashNum);
        // Хеш-значение целого числа 3 = 3

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("Хеш-значение булева значения " + bol + " = " + hashBol);
        // Хеш-значение булева значения True = 1

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("Хеш-значение десятичного числа " + dec + " = " + hashDec);
        // Хеш-значение десятичного числа 3.14159 = -1340954729

        string str = "Hello Algo";
        int hashStr = str.GetHashCode();
        Console.WriteLine("Хеш-значение строки «" + str + "» = " + hashStr);
        // Хеш-значение строки «Hello Algo» = -586107568

        object[] arr = [12836, "Сяо Ха"];
        int hashArr = arr.GetHashCode();
        Console.WriteLine("Хеш-значение массива [" + string.Join(", ", arr) + "] = " + hashArr);
        // Хеш-значение массива [12836, Сяо Ха] = 42931033

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("Хеш-значение объекта узла " + obj + " = " + hashObj);
        // Хеш-значение объекта узла 0 = 39053774
        // [endregion]{builtin_hash}
    }
}
