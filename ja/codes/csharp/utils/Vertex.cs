/**
 * File: Vertex.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com), krahets (krahets@163.com)
 */

namespace hello_algo.utils;

/* 頂点クラス */
public class Vertex(int val) {
    public int val = val;

    /* 値リスト vals を入力し、頂点リスト vets を返す */
    public static Vertex[] ValsToVets(int[] vals) {
        Vertex[] vets = new Vertex[vals.Length];
        for (int i = 0; i < vals.Length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 頂点リスト vets を入力し、値リスト vals を返す */
    public static List<int> VetsToVals(List<Vertex> vets) {
        List<int> vals = [];
        foreach (Vertex vet in vets) {
            vals.Add(vet.val);
        }
        return vals;
    }
}
