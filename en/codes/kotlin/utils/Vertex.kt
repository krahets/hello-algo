/**
 * File: Vertex.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

/* Vertex class */
class Vertex(val _val: Int) {
    companion object {
        /* Given the array of values vals, return the array of vertices vets */
        fun valsToVets(vals: IntArray): Array<Vertex?> {
            val vets = arrayOfNulls<Vertex>(vals.size)
            for (i in vals.indices) {
                vets[i] = Vertex(vals[i])
            }
            return vets
        }

        /* Given the list of vertices vets, return the list of values vals */
        fun vetsToVals(vets: MutableList<Vertex?>): MutableList<Int> {
            val vals = mutableListOf<Int>()
            for (vet in vets) {
                vals.add(vet!!._val)
            }
            return vals
        }
    }
}