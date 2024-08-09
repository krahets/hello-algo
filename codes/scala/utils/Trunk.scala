
/**
 * File: Trunk.scala
 * Author: WangBlue
 * Create: 2024-08-09 16:51
 */
class Trunk {
  var pre: Trunk = _
  var str: String = _

  def this(pre: Trunk, str: String) {
    this()
    this.pre = pre
    this.str = str
  }

}
