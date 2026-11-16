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
        // [region]{builtin_hash}
        let num = 3
        let hashNum = num.hashValue
        print("정수 \(num) → 해시값: \(hashNum)")
        // 정수 3 → 해시값: 9047044699613009734

        let bol = true
        let hashBol = bol.hashValue
        print("불리언 값 \(bol) → 해시값: \(hashBol)")
        // 불리언 값 true → 해시값: -4431640247352757451

        let dec = 3.14159
        let hashDec = dec.hashValue
        print("소수 \(dec) → 해시값: \(hashDec)")
        // 소수 3.14159 → 해시값: -2465384235396674631

        let str = "Hello 算法"
        let hashStr = str.hashValue
        print("문자열 ‘\(str)’ → 해시값: \(hashStr)")
        // 문자열 ‘Hello 算法’ → 해시값: -7850626797806988787

        let arr = [AnyHashable(12836), AnyHashable("小哈")]
        let hashArr = arr.hashValue
        print("배열 \(arr) → 해시값: \(hashArr)")
        // 배열 [AnyHashable(12836), AnyHashable("小哈")] → 해시값: -2308633508154532996

        let obj = ListNode(x: 0)
        let hashObj = obj.hashValue
        print("노드 객체 \(obj) → 해시값: \(hashObj)")
        // 노드 객체 utils.ListNode → 해시값: -2434780518035996159
        // [endregion]{builtin_hash}
    }
}
