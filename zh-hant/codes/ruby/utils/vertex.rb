=begin
File: vertex.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 頂點類別 ###
class Vertex
  attr_accessor :val

  def initialize(val)
    @val = val
  end
end

### 輸入值串列 vals ，返回頂點串列 vets ###
def vals_to_vets(vals)
  Array.new(vals.length) { |i| Vertex.new(vals[i]) }
end

### 輸入頂點串列 vets, 返回值串列 vals ###
def vets_to_vals(vets)
  Array.new(vets.length) { |i| vets[i].val }
end
