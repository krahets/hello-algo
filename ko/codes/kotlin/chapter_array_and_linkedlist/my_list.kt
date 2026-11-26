/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* 리스트 클래스 */
class MyList {
    private var arr: IntArray = intArrayOf() // 배열(리스트 원소 저장)
    private var capacity: Int = 10 // 리스트 용량
    private var size: Int = 0 // 리스트 길이(현재 원소 수)
    private var extendRatio: Int = 2 // 리스트 용량을 늘릴 때마다 적용하는 배수

    /* 생성자 */
    init {
        arr = IntArray(capacity)
    }

    /* 리스트 길이(현재 원소 수) 구하기 */
    fun size(): Int {
        return size
    }

    /* 리스트 용량 구하기 */
    fun capacity(): Int {
        return capacity
    }

    /* 원소 접근 */
    fun get(index: Int): Int {
        // 인덱스가 범위를 벗어나면 예외를 던진다. 이하에서도 같다.
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("인덱스 범위 초과")
        return arr[index]
    }

    /* 원소 갱신 */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("인덱스 범위 초과")
        arr[index] = num
    }

    /* 맨 뒤에 원소 추가 */
    fun add(num: Int) {
        // 원소 수가 용량을 초과하면 용량을 늘린다.
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // 원소 수 갱신
        size++
    }

    /* 중간에 원소 삽입 */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("인덱스 범위 초과")
        // 원소 수가 용량을 초과하면 용량을 늘린다.
        if (size == capacity())
            extendCapacity()
        // 인덱스 index부터 끝까지 원소를 뒤로 한 칸씩 이동
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // 원소 수 갱신
        size++
    }

    /* 원소 삭제 */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("인덱스 범위 초과")
        val num = arr[index]
        // 인덱스 index 다음의 원소를 모두 앞으로 한 칸씩 이동
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // 원소 수 갱신
        size--
        // 삭제한 원소 반환
        return num
    }

    /* 리스트 용량 늘리기 */
    fun extendCapacity() {
        // 원래 배열 길이의 extendRatio배인 새 배열을 만들고 원래 배열을 복사
        arr = arr.copyOf(capacity() * extendRatio)
        // 리스트 용량 갱신
        capacity = arr.size
    }

    /* 리스트를 배열로 변환 */
    fun toArray(): IntArray {
        val size = size()
        // 유효한 길이 범위 안의 리스트 원소만 변환
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* 실행 예제 */
fun main() {
    /* 리스트 초기화 */
    val nums = MyList()
    /* 맨 뒤에 원소 추가 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("리스트 nums = ${nums.toArray().contentToString()}, 용량 = ${nums.capacity()}, 길이 = ${nums.size()}")

    /* 중간에 원소 삽입 */
    nums.insert(3, 6)
    println("인덱스 3에 숫자 6을 삽입한 후 nums = ${nums.toArray().contentToString()}")

    /* 원소 삭제 */
    nums.remove(3)
    println("인덱스 3의 원소를 삭제한 후 nums = ${nums.toArray().contentToString()}")

    /* 원소 접근 */
    val num = nums.get(1)
    println("인덱스 1의 원소를 읽은 결과 num = $num")

    /* 원소 갱신 */
    nums.set(1, 0)
    println("인덱스 1의 원소를 0으로 바꾼 후 nums = ${nums.toArray().contentToString()}")

    /* 용량 확장 동작 테스트 */
    for (i in 0..9) {
        // i = 5일 때 리스트 길이가 용량을 초과하게 되어 용량 확장이 일어난다.
        nums.add(i)
    }
    println("용량 확장 후 리스트 nums = ${nums.toArray().contentToString()}, 용량 = ${nums.capacity()}, 길이 = ${nums.size()}")
}