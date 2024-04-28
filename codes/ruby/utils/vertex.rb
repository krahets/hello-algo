=begin
File: vertex.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 顶点类 ###
class Vertex
  attr_accessor :val

  def initialize(val)
    @val = val
  end
end

### 输入值列表 vals ，返回顶点列表 vets ###
def vals_to_vets(vals)
  Array.new(vals.length) { |i| Vertex.new(vals[i]) }
end

### 输入顶点列表 vets, 返回值列表 vals ###
def vets_to_vals(vets)
  Array.new(vets.length) { |i| vets[i].val }
end
