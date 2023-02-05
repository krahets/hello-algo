import '../chapter_array_and_linkedlist/array.dart';
import 'ListNode.dart';

/**
 * File: PrintUtil
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

class PrintUtil {
  void printLinkedList(ListNode? head) {
    List<String> list = [];

    while (head != null) {
      list.add('${head.val}');
      head = head.next;
    }

    print(list.join(' -> '));
  }
}

