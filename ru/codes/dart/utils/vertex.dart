/**
 * File: Vertex.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Класс вершины */
class Vertex {
  int val;
  Vertex(this.val);

  /* На вход подается список значений vals, на выходе возвращается список вершин vets */
  static List<Vertex> valsToVets(List<int> vals) {
    List<Vertex> vets = [];
    for (int i in vals) {
      vets.add(Vertex(i));
    }
    return vets;
  }

  /* На вход подается список вершин vets, на выходе возвращается список значений vals */
  static List<int> vetsToVals(List<Vertex> vets) {
    List<int> vals = [];
    for (Vertex vet in vets) {
      vals.add(vet.val);
    }
    return vals;
  }
}
