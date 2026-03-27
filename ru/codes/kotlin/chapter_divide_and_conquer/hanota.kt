/**
 * File: hanota.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.hanota

/* Переместить один диск */
fun move(src: MutableList<Int>, tar: MutableList<Int>) {
    // Снять диск с вершины src
    val pan = src.removeAt(src.size - 1)
    // Положить диск на вершину tar
    tar.add(pan)
}

/* Решить задачу Ханойской башни f(i) */
fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
    // Если в src остался только один диск, сразу переместить его в tar
    if (i == 1) {
        move(src, tar)
        return
    }
    // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
    dfs(i - 1, src, tar, buf)
    // Подзадача f(1): переместить оставшийся один диск из src в tar
    move(src, tar)
    // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
    dfs(i - 1, buf, src, tar)
}

/* Решить задачу Ханойской башни */
fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
    val n = A.size
    // Переместить верхние n дисков из A в C с помощью B
    dfs(n, A, B, C)
}

/* Driver Code */
fun main() {
    // Хвост списка соответствует вершине столбца
    val A = mutableListOf(5, 4, 3, 2, 1)
    val B = mutableListOf<Int>()
    val C = mutableListOf<Int>()
    println("Исходное состояние:")
    println("A = $A")
    println("B = $B")
    println("C = $C")

    solveHanota(A, B, C)

    println("После завершения перемещения дисков:")
    println("A = $A")
    println("B = $B")
    println("C = $C")
}