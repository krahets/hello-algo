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
		arrCapacity: 10,              // リストの容量
		arr:         make([]int, 10), // 配列（リストの要素を格納する）
		arrSize:     0,               // リストの長さ（現在の要素数）
		extendRatio: 2,               // リストの容量を拡張する際の倍率
	}
}

/* リストの長さ（現在の要素数）を取得する */
func (l *myList) size() int {
	return l.arrSize
}

/*  リストの容量を取得する */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* 要素にアクセスする */
func (l *myList) get(index int) int {
	// インデックスが範囲外の場合、例外を送出する。以下も同様
	if index < 0 || index >= l.arrSize {
		panic("インデックスが範囲外です")
	}
	return l.arr[index]
}

/* 要素を更新する */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("インデックスが範囲外です")
	}
	l.arr[index] = num
}

/* 末尾に要素を追加する */
func (l *myList) add(num int) {
	// 要素数が容量を超える場合、容量を拡張する
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// 要素数を更新する
	l.arrSize++
}

/* 途中に要素を挿入する */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("インデックスが範囲外です")
	}
	// 要素数が容量を超える場合、容量を拡張する
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// インデックス index 以降の全要素を後ろに 1 つずらす
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// 要素数を更新する
	l.arrSize++
}

/* 要素を削除する */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("インデックスが範囲外です")
	}
	num := l.arr[index]
	// インデックス index より後の全要素を前に 1 つずらす
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// 要素数を更新する
	l.arrSize--
	// 削除した要素を返す
	return num
}

/* リストの容量を拡張する */
func (l *myList) extendCapacity() {
	// 元の配列の extendRatio 倍の長さの配列を新たに作成し、元の配列をコピーする
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// リストの容量を更新する
	l.arrCapacity = len(l.arr)
}

/* 有効な長さのリストを返す */
func (l *myList) toArray() []int {
	// 有効な長さの範囲内にあるリストの要素だけを変換する
	return l.arr[:l.arrSize]
}
