=begin
File: print_util.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 列印鏈結串列 ###
def print_linked_list(head)
  list = []
  while head
    list << head.val
    head = head.next
  end
  puts "#{list.join(" -> ")}"
end
