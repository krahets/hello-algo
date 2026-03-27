// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* Переместить один диск */
func move(src, tar *list.List) {
	// Снять диск с вершины src
	pan := src.Back()
	// Положить диск на вершину tar
	tar.PushBack(pan.Value)
	// Убрать верхний диск из src
	src.Remove(pan)
}

/* Решить задачу Ханойской башни f(i) */
func dfsHanota(i int, src, buf, tar *list.List) {
	// Если в src остался только один диск, сразу переместить его в tar
	if i == 1 {
		move(src, tar)
		return
	}
	// Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
	dfsHanota(i-1, src, tar, buf)
	// Подзадача f(1): переместить оставшийся один диск из src в tar
	move(src, tar)
	// Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
	dfsHanota(i-1, buf, src, tar)
}

/* Решить задачу Ханойской башни */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// Переместить верхние n дисков из A в C с помощью B
	dfsHanota(n, A, B, C)
}
