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
        print("Хеш-значение целого числа \(num) равно \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("Хеш-значение логического значения \(bol) равно \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("Хеш-значение десятичного числа \(dec) равно \(hashDec)")

        let str = "Hello Algo"
        let hashStr = str.hashValue
        print("Хеш-значение строки \(str) равно \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("Сяо Ха")]
        let hashTup = arr.hashValue
        print("массив \(arr) равно \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("объект узла \(obj) равно \(hashObj)")
    }
}
