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
        let num = 3
        let hashNum = num.hashValue
        print("Хеш-значение целого числа \(num) = \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("Хеш-значение булева значения \(bol) = \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("Хеш-значение десятичного числа \(dec) = \(hashDec)")

        let str = "Hello Algo"
        let hashStr = str.hashValue
        print("Хеш-значение строки \(str) = \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("Сяо Ха")]
        let hashTup = arr.hashValue
        print("Хеш-значение массива \(arr) = \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("Хеш-значение объекта узла \(obj) = \(hashObj)")
    }
}
