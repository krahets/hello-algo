/**
 * File: Vertex.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

/* 정점 클래스 */
class Vertex(val _val: Int) {
    companion object {
        /* 값의 리스트 vals를 입력받아 정점 리스트 vets 반환 */
        fun valsToVets(vals: IntArray): Array<Vertex?> {
            val vets = arrayOfNulls<Vertex>(vals.size)
            for (i in vals.indices) {
                vets[i] = Vertex(vals[i])
            }
            return vets
        }

        /* 정점 리스트 vets를 입력받아 값의 리스트 vals 반환 */
        fun vetsToVals(vets: MutableList<Vertex?>): MutableList<Int> {
            val vals = mutableListOf<Int>()
            for (vet in vets) {
                vals.add(vet!!._val)
            }
            return vals
        }
    }
}