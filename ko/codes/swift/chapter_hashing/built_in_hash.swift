/**
 * File: built_in_hash.swift
 * Created Time: 2023-07-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BuiltInHash {
    /* 실행 코드 */
    static func main() {
        let num = 3
        let hashNum = num.hashValue
        print("정수 = \(num), 해시값 = \(hashNum)")

        let bol = true
        let hashBol = bol.hashValue
        print("불리언 값 = \(bol), 해시값 = \(hashBol)")

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("소수 = \(dec), 해시값 = \(hashDec)")

        let str = "Hello 算法"
        let hashStr = str.hashValue
        print("문자열 = \(str), 해시값 = \(hashStr)")

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashTup = arr.hashValue
        print("배열 = \(arr), 해시값 = \(hashTup)")

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("노드 객체 = \(obj), 해시값 = \(hashObj)")
    }
}
