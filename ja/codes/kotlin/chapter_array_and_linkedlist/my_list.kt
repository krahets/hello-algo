/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* リストクラス */
class MyList {
    private var arr: IntArray = intArrayOf() // 配列（リストの要素を格納する）
    private var capacity: Int = 10 // リストの容量
    private var size: Int = 0 // リストの長さ（現在の要素数）
    private var extendRatio: Int = 2 // リストの容量を拡張する際の倍率

    /* コンストラクタ */
    init {
        arr = IntArray(capacity)
    }

    /* リストの長さ（現在の要素数）を取得する */
    fun size(): Int {
        return size
    }

    /* リストの容量を取得する */
    fun capacity(): Int {
        return capacity
    }

    /* 要素にアクセスする */
    fun get(index: Int): Int {
        // インデックスが範囲外の場合、例外を送出する。以下も同様
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("インデックスが範囲外です")
        return arr[index]
    }

    /* 要素を更新する */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("インデックスが範囲外です")
        arr[index] = num
    }

    /* 末尾に要素を追加する */
    fun add(num: Int) {
        // 要素数が容量を超える場合、容量を拡張する
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // 要素数を更新する
        size++
    }

    /* 途中に要素を挿入する */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("インデックスが範囲外です")
        // 要素数が容量を超える場合、容量を拡張する
        if (size == capacity())
            extendCapacity()
        // インデックス index 以降の全要素を後ろに 1 つずらす
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // 要素数を更新する
        size++
    }

    /* 要素を削除する */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("インデックスが範囲外です")
        val num = arr[index]
        // インデックス index より後の全要素を前に 1 つずらす
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // 要素数を更新する
        size--
        // 削除した要素を返す
        return num
    }

    /* リストの容量を拡張する */
    fun extendCapacity() {
        // 元の配列の extendRatio 倍の長さの配列を新たに作成し、元の配列をコピーする
        arr = arr.copyOf(capacity() * extendRatio)
        // リストの容量を更新する
        capacity = arr.size
    }

    /* リストを配列に変換する */
    fun toArray(): IntArray {
        val size = size()
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* 実行用コード */
fun main() {
    /* リストを初期化する */
    val nums = MyList()
    /* 末尾に要素を追加する */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("リスト nums = ${nums.toArray().contentToString()}、容量 = ${nums.capacity()}、長さ = ${nums.size()}")

    /* 途中に要素を挿入する */
    nums.insert(3, 6)
    println("インデックス 3 に数値 6 を挿入した結果 nums = ${nums.toArray().contentToString()}")

    /* 要素を削除する */
    nums.remove(3)
    println("インデックス 3 の要素を削除した結果 nums = ${nums.toArray().contentToString()}")

    /* 要素にアクセスする */
    val num = nums.get(1)
    println("インデックス 1 の要素にアクセスした結果 num = $num")

    /* 要素を更新する */
    nums.set(1, 0)
    println("インデックス 1 の要素を 0 に更新した結果 nums = ${nums.toArray().contentToString()}")

    /* 容量の拡張をテストする */
    for (i in 0..9) {
        // i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
        nums.add(i)
    }
    println("容量を拡張した後のリスト nums = ${nums.toArray().contentToString()}、容量 = ${nums.capacity()}、長さ =  ${nums.size()}")
}