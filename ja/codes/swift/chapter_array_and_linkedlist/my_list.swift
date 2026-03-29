/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* リストクラス */
class MyList {
    private var arr: [Int] // 配列（リスト要素を格納）
    private var _capacity: Int // リスト容量
    private var _size: Int // リストの長さ（現在の要素数）
    private let extendRatio: Int // リスト拡張時の増加倍率

    /* コンストラクタ */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* リストの長さを取得（現在の要素数） */
    func size() -> Int {
        _size
    }

    /* リスト容量を取得する */
    func capacity() -> Int {
        _capacity
    }

    /* 要素にアクセス */
    func get(index: Int) -> Int {
        // インデックスが範囲外ならエラーを投げる。以下同様
        if index < 0 || index >= size() {
            fatalError("インデックスが範囲外")
        }
        return arr[index]
    }

    /* 要素を更新 */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("インデックスが範囲外")
        }
        arr[index] = num
    }

    /* 末尾に要素を追加 */
    func add(num: Int) {
        // 要素数が容量を超えると、拡張機構が発動する
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // 要素数を更新
        _size += 1
    }

    /* 中間に要素を挿入 */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("インデックスが範囲外")
        }
        // 要素数が容量を超えると、拡張機構が発動する
        if size() == capacity() {
            extendCapacity()
        }
        // index 以降の要素をすべて 1 つ後ろへずらす
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // 要素数を更新
        _size += 1
    }

    /* 要素を削除 */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("インデックスが範囲外")
        }
        let num = arr[index]
        // インデックス index より後の要素をすべて 1 つ前に移動する
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // 要素数を更新
        _size -= 1
        // 削除された要素を返す
        return num
    }

    /* リストの拡張 */
    func extendCapacity() {
        // 元の配列の extendRatio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // リストの容量を更新
        _capacity = arr.count
    }

    /* リストを配列に変換する */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* Driver Code */
    static func main() {
        /* リストを初期化 */
        let nums = MyList()
        /* 末尾に要素を追加 */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("リスト nums = \(nums.toArray()) 、容量 = \(nums.capacity()) 、長さ = \(nums.size())")

        /* 中間に要素を挿入 */
        nums.insert(index: 3, num: 6)
        print("インデックス 3 に数値 6 を挿入すると、nums = \(nums.toArray())")

        /* 要素を削除 */
        nums.remove(index: 3)
        print("インデックス 3 の要素を削除すると、nums = \(nums.toArray())")

        /* 要素にアクセス */
        let num = nums.get(index: 1)
        print("インデックス 1 の要素にアクセスすると、num = \(num)")

        /* 要素を更新 */
        nums.set(index: 1, num: 0)
        print("インデックス 1 の要素を 0 に更新すると、nums = \(nums.toArray())")

        /* 拡張機構をテストする */
        for i in 0 ..< 10 {
            // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
            nums.add(num: i)
        }
        print("拡張後のリスト nums = \(nums.toArray()) 、容量 = \(nums.capacity()) 、長さ = \(nums.size())")
    }
}
