=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # [region]{init_stack}
  # 初始化堆疊
  # Ruby 沒有內建的堆疊類別，可以把 Array 當作堆疊來使用
  stack = []
  # [endregion]{init_stack}

  # [region]{push}
  # 元素入堆疊
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  # [endregion]{push}
  puts "堆疊 stack = #{stack}"

  # [region]{peek}
  # 訪問堆疊頂元素
  peek = stack.last
  # [endregion]{peek}
  puts "堆疊頂元素 peek = #{peek}"

  # [region]{pop}
  # 元素出堆疊
  pop = stack.pop
  # [endregion]{pop}
  puts "出堆疊元素 pop = #{pop}"
  puts "出堆疊後 stack = #{stack}"

  # [region]{size}
  # 獲取堆疊的長度
  size = stack.length
  # [endregion]{size}
  puts "堆疊的長度 size = #{size}"

  # [region]{is_empty}
  # 判斷是否為空
  is_empty = stack.empty?
  # [endregion]{is_empty}
  puts "堆疊是否為空 = #{is_empty}"
end
