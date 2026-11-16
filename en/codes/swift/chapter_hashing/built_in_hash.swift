/**
 * File: built_in_hash.swift
 * Created Time: 2023-07-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BuiltInHash {
    /* Driver code */
    static func main() {
        // [region]{builtin_hash}
        let num = 3
        let hashNum = num.hashValue
        print("Integer \(num) has hash value \(hashNum)")
        // Integer 3 has hash value 9047044699613009734

        let bol = true
        let hashBol = bol.hashValue
        print("Boolean \(bol) has hash value \(hashBol)")
        // Boolean true has hash value -4431640247352757451

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("Floating-point number \(dec) has hash value \(hashDec)")
        // Floating-point number 3.14159 has hash value -2465384235396674631

        let str = "Hello 算法"
        let hashStr = str.hashValue
        print("String '\(str)' has hash value \(hashStr)")
        // String 'Hello 算法' has hash value -7850626797806988787

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashArr = arr.hashValue
        print("Array \(arr) has hash value \(hashArr)")
        // Array [AnyHashable(12836), AnyHashable("小哈")] has hash value -2308633508154532996

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("Node object \(obj) has hash value \(hashObj)")
        // Node object utils.ListNode has hash value -2434780518035996159
        // [endregion]{builtin_hash}
    }
}
