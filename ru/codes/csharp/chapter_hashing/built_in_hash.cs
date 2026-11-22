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
        Console.WriteLine("Хеш-значение целого числа " + num + " = " + hashNum);

        bool bol = true;
        int hashBol = bol.GetHashCode();
        Console.WriteLine("Хеш-значение булева значения " + bol + " = " + hashBol);

        double dec = 3.14159;
        int hashDec = dec.GetHashCode();
        Console.WriteLine("Хеш-значение десятичного числа " + dec + " = " + hashDec);

        string str = "Hello Algo";
        int hashStr = str.GetHashCode();
        Console.WriteLine("Хеш-значение строки " + str + " = " + hashStr);

        object[] arr = [12836, "Сяо Ха"];
        int hashTup = arr.GetHashCode();
        Console.WriteLine("Хеш-значение массива [" + string.Join(", ", arr) + "] = " + hashTup);

        ListNode obj = new(0);
        int hashObj = obj.GetHashCode();
        Console.WriteLine("Хеш-значение объекта узла " + obj + " = " + hashObj);
    }
}
