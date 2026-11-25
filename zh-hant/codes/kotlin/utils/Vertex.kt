/**
 * File: Vertex.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

/* 頂點類別 */
class Vertex(val _val: Int) {
    companion object {
        /* 傳入數值陣列 vals，回傳頂點陣列 vets */
        fun valsToVets(vals: IntArray): Array<Vertex?> {
            val vets = arrayOfNulls<Vertex>(vals.size)
            for (i in vals.indices) {
                vets[i] = Vertex(vals[i])
            }
            return vets
        }

        /* 傳入頂點串列 vets，回傳數值串列 vals */
        fun vetsToVals(vets: MutableList<Vertex?>): MutableList<Int> {
            val vals = mutableListOf<Int>()
            for (vet in vets) {
                vals.add(vet!!._val)
            }
            return vals
        }
    }
}