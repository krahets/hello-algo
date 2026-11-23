/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* リストクラス */
class MyList {
    private var arr: [Int] // 配列（リストの要素を格納する）
    private var _capacity: Int // リストの容量
    private var _size: Int // リストの長さ（現在の要素数）
    private let extendRatio: Int // リストの容量を拡張する際の倍率

    /* コンストラクタ */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* リストの長さ（現在の要素数）を取得する*/
    func size() -> Int {
        _size
    }

    /* リストの容量を取得する */
    func capacity() -> Int {
        _capacity
    }

    /* 要素にアクセスする */
    func get(index: Int) -> Int {
        // インデックスが範囲外の場合、エラーを送出する。以下も同様
        if index < 0 || index >= size() {
            fatalError("インデックスが範囲外です")
        }
        return arr[index]
    }

    /* 要素を更新する */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("インデックスが範囲外です")
        }
        arr[index] = num
    }

    /* 末尾に要素を追加する */
    func add(num: Int) {
        // 要素数が容量を超える場合、容量を拡張する
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // 要素数を更新する
        _size += 1
    }

    /* 途中に要素を挿入する */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("インデックスが範囲外です")
        }
        // 要素数が容量を超える場合、容量を拡張する
        if size() == capacity() {
            extendCapacity()
        }
        // インデックス index 以降の全要素を後ろに 1 つずらす
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // 要素数を更新する
        _size += 1
    }

    /* 要素を削除する */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("インデックスが範囲外です")
        }
        let num = arr[index]
        // インデックス index より後の全要素を前に 1 つずらす
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // 要素数を更新する
        _size -= 1
        // 削除した要素を返す
        return num
    }

    /* リストの容量を拡張する */
    func extendCapacity() {
        // 元の配列の extendRatio 倍の長さの配列を新たに作成し、元の配列をコピーする
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // リストの容量を更新する
        _capacity = arr.count
    }

    /* リストを配列に変換する */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* 実行用コード */
    static func main() {
        /* リストを初期化する */
        let nums = MyList()
        /* 末尾に要素を追加する */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("リスト nums = \(nums.toArray()) 、容量 = \(nums.capacity()) 、長さ = \(nums.size())")

        /* 途中に要素を挿入する */
        nums.insert(index: 3, num: 6)
        print("インデックス 3 に数値 6 を挿入した結果 nums = \(nums.toArray())")

        /* 要素を削除する */
        nums.remove(index: 3)
        print("インデックス 3 の要素を削除した結果 nums = \(nums.toArray())")

        /* 要素にアクセスする */
        let num = nums.get(index: 1)
        print("インデックス 1 の要素にアクセスした結果 num = \(num)")

        /* 要素を更新する */
        nums.set(index: 1, num: 0)
        print("インデックス 1 の要素を 0 に更新した結果 nums = \(nums.toArray())")

        /* 容量の拡張をテストする */
        for i in 0 ..< 10 {
            // i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
            nums.add(num: i)
        }
        print("容量を拡張した後のリスト nums = \(nums.toArray()) 、容量 = \(nums.capacity()) 、長さ = \(nums.size())")
    }
}
