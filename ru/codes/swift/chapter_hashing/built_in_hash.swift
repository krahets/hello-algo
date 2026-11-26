/**
 * File: built_in_hash.swift
 * Created Time: 2023-07-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BuiltInHash {
    /* Демонстрационный код */
    static func main() {
        let num = 3
        let hashNum = num.hashValue
        print("Целое число \(num) имеет хеш \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("Логическое значение \(bol) имеет хеш \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("Вещественное число \(dec) имеет хеш \(hashDec)")

        let str = "Hello 算法"
        let hashStr = str.hashValue
        print("Строка \(str) имеет хеш \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashTup = arr.hashValue
        print("Массив \(arr) имеет хеш \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("Объект узла \(obj) имеет хеш \(hashObj)")
    }
}
