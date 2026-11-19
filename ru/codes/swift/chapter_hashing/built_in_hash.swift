/**
 * File: built_in_hash.swift
 * Created Time: 2023-07-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BuiltInHash {
    /* Driver Code */
    static func main() {
        // [region]{builtin_hash}
        let num = 3
        let hashNum = num.hashValue
        print("Хеш-значение целого числа \(num) = \(hashNum)")
        // Хеш-значение целого числа 3 = 9047044699613009734

        let bol = true
        let hashBol = bol.hashValue
        print("Хеш-значение булева значения \(bol) = \(hashBol)")
        // Хеш-значение булева значения true = -4431640247352757451

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("Хеш-значение десятичного числа \(dec) = \(hashDec)")
        // Хеш-значение десятичного числа 3.14159 = -2465384235396674631

        let str = "Hello Algo"
        let hashStr = str.hashValue
        print("Хеш-значение строки «\(str)» = \(hashStr)")
        // Хеш-значение строки «Hello Algo» = -7850626797806988787

        let arr = [AnyHashable(12836), AnyHashable("Сяо Ха")]
        let hashArr = arr.hashValue
        print("Хеш-значение массива \(arr) = \(hashArr)")
        // Хеш-значение массива [AnyHashable(12836), AnyHashable("Сяо Ха")] = -2308633508154532996

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("Хеш-значение объекта узла \(obj) = \(hashObj)")
        // Хеш-значение объекта узла utils.ListNode = -2434780518035996159
        // [endregion]{builtin_hash}
    }
}
