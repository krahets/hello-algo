// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* Перенос одного диска */
func move(src, tar *list.List) {
	// Снимаем верхний диск с src
	pan := src.Back()
	// Кладём диск на вершину tar
	tar.PushBack(pan.Value)
	// Снимаем верхний диск с src
	src.Remove(pan)
}

/* Решение задачи о ханойских башнях f(i) */
func dfsHanota(i int, src, buf, tar *list.List) {
	// Если с src осталось перенести один диск, кладём его сразу на tar
	if i == 1 {
		move(src, tar)
		return
	}
	// Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
	dfsHanota(i-1, src, tar, buf)
	// Подзадача f(1): переносим оставшийся диск с src на tar
	move(src, tar)
	// Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
	dfsHanota(i-1, buf, src, tar)
}

/* Решение задачи о ханойских башнях */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// Переносим n верхних дисков с A на C с помощью B
	dfsHanota(n, A, B, C)
}
