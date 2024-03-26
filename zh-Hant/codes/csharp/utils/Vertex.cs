/**
 * File: Vertex.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com), krahets (krahets@163.com)
 */

namespace hello_algo.utils;

/* 頂點類別 */
public class Vertex(int val) {
    public int val = val;

    /* 輸入值串列 vals ，返回頂點串列 vets */
    public static Vertex[] ValsToVets(int[] vals) {
        Vertex[] vets = new Vertex[vals.Length];
        for (int i = 0; i < vals.Length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 輸入頂點串列 vets ，返回值串列 vals */
    public static List<int> VetsToVals(List<Vertex> vets) {
        List<int> vals = [];
        foreach (Vertex vet in vets) {
            vals.Add(vet.val);
        }
        return vals;
    }
}
