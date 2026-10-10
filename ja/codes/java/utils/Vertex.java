/**
 * File: Vertex.java
 * Created Time: 2023-02-15
 * Author: krahets (krahets@163.com)
 */

package utils;

import java.util.*;

/* 頂点クラス */
public class Vertex {
    public int val;

    public Vertex(int val) {
        this.val = val;
    }

    /* 値リスト vals を入力し、頂点リスト vets を返す */
    public static Vertex[] valsToVets(int[] vals) {
        Vertex[] vets = new Vertex[vals.length];
        for (int i = 0; i < vals.length; i++) {
            vets[i] = new Vertex(vals[i]);
        }
        return vets;
    }

    /* 頂点リスト vets を入力し、値リスト vals を返す */
    public static List<Integer> vetsToVals(List<Vertex> vets) {
        List<Integer> vals = new ArrayList<>();
        for (Vertex vet : vets) {
            vals.add(vet.val);
        }
        return vals;
    }
}
