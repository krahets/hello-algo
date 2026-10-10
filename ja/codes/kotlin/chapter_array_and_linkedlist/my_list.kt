/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* リストクラス */
class MyList {
    private var arr: IntArray = intArrayOf() // 配列（リスト要素を格納）
    private var capacity: Int = 10 // リスト容量
    private var size: Int = 0 // リストの長さ（現在の要素数）
    private var extendRatio: Int = 2 // リスト拡張時の増加倍率

    /* コンストラクタ */
    init {
        arr = IntArray(capacity)
    }

    /* リストの長さを取得（現在の要素数） */
    fun size(): Int {
        return size
    }

    /* リスト容量を取得する */
    fun capacity(): Int {
        return capacity
    }

    /* 要素にアクセス */
    fun get(index: Int): Int {
        // インデックスが範囲外なら例外を送出する。以下同様
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("インデックスが範囲外")
        return arr[index]
    }

    /* 要素を更新 */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("インデックスが範囲外")
        arr[index] = num
    }

    /* 末尾に要素を追加 */
    fun add(num: Int) {
        // 要素数が容量を超えると、拡張機構が発動する
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // 要素数を更新
        size++
    }

    /* 中間に要素を挿入 */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("インデックスが範囲外")
        // 要素数が容量を超えると、拡張機構が発動する
        if (size == capacity())
            extendCapacity()
        // index 以降の要素をすべて 1 つ後ろへずらす
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // 要素数を更新
        size++
    }

    /* 要素を削除 */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("インデックスが範囲外")
        val num = arr[index]
        // インデックス index より後の要素をすべて 1 つ前に移動する
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // 要素数を更新
        size--
        // 削除された要素を返す
        return num
    }

    /* リストの拡張 */
    fun extendCapacity() {
        // 元の配列の extendRatio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
        arr = arr.copyOf(capacity() * extendRatio)
        // リストの容量を更新
        capacity = arr.size
    }

    /* リストを配列に変換する */
    fun toArray(): IntArray {
        val size = size()
        // 有効長の範囲内のリスト要素のみを変換
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* Driver Code */
fun main() {
    /* リストを初期化 */
    val nums = MyList()
    /* 末尾に要素を追加 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("リスト nums = ${nums.toArray().contentToString()}，容量 = ${nums.capacity()}，長さ = ${nums.size()}")

    /* 中間に要素を挿入 */
    nums.insert(3, 6)
    println("インデックス 3 に数値 6 を挿入し，nums = ${nums.toArray().contentToString()}")

    /* 要素を削除 */
    nums.remove(3)
    println("インデックス 3 の要素を削除し，nums = ${nums.toArray().contentToString()}")

    /* 要素にアクセス */
    val num = nums.get(1)
    println("インデックス 1 の要素にアクセスし，num = $num")

    /* 要素を更新 */
    nums.set(1, 0)
    println("インデックス 1 の要素を 0 に更新し，nums = ${nums.toArray().contentToString()}")

    /* 拡張機構をテストする */
    for (i in 0..9) {
        // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
        nums.add(i)
    }
    println("拡張後のリスト nums = ${nums.toArray().contentToString()}，容量 = ${nums.capacity()}，長さ =  ${nums.size()}")
}