// File: my_list.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

/* リストクラス */
type myList struct {
	arrCapacity int
	arr         []int
	arrSize     int
	extendRatio int
}

/* コンストラクタ */
func newMyList() *myList {
	return &myList{
		arrCapacity: 10,              // リスト容量
		arr:         make([]int, 10), // 配列（リスト要素を格納）
		arrSize:     0,               // リストの長さ（現在の要素数）
		extendRatio: 2,               // リスト拡張時の増加倍率
	}
}

/* リストの長さを取得（現在の要素数） */
func (l *myList) size() int {
	return l.arrSize
}

/* リスト容量を取得する */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* 要素にアクセス */
func (l *myList) get(index int) int {
	// インデックスが範囲外なら例外を送出する。以下同様
	if index < 0 || index >= l.arrSize {
		panic("インデックスが範囲外です")
	}
	return l.arr[index]
}

/* 要素を更新 */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("インデックスが範囲外です")
	}
	l.arr[index] = num
}

/* 末尾に要素を追加 */
func (l *myList) add(num int) {
	// 要素数が容量を超えると、拡張機構が発動する
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// 要素数を更新
	l.arrSize++
}

/* 中間に要素を挿入 */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("インデックスが範囲外です")
	}
	// 要素数が容量を超えると、拡張機構が発動する
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// index 以降の要素をすべて 1 つ後ろへずらす
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// 要素数を更新
	l.arrSize++
}

/* 要素を削除 */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("インデックスが範囲外です")
	}
	num := l.arr[index]
	// インデックス index より後の要素をすべて 1 つ前に移動する
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// 要素数を更新
	l.arrSize--
	// 削除された要素を返す
	return num
}

/* リストの拡張 */
func (l *myList) extendCapacity() {
	// 元の配列の extendRatio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// リストの容量を更新
	l.arrCapacity = len(l.arr)
}

/* 有効長のリストを返す */
func (l *myList) toArray() []int {
	// 有効長の範囲内のリスト要素のみを変換
	return l.arr[:l.arrSize]
}
