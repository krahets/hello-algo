/**
 * File: Vertex.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 頂點類別 */
class Vertex {
  int val;
  Vertex(this.val);

  /* 傳入數值串列 vals，回傳頂點串列 vets */
  static List<Vertex> valsToVets(List<int> vals) {
    List<Vertex> vets = [];
    for (int i in vals) {
      vets.add(Vertex(i));
    }
    return vets;
  }

  /* 傳入頂點串列 vets，回傳數值串列 vals */
  static List<int> vetsToVals(List<Vertex> vets) {
    List<int> vals = [];
    for (Vertex vet in vets) {
      vals.add(vet.val);
    }
    return vals;
  }
}
