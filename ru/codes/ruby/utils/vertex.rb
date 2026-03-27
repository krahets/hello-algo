=begin
File: vertex.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Класс вершины ###
class Vertex
  attr_accessor :val

  def initialize(val)
    @val = val
  end
end

# ## На вход подается список значений vals, на выходе возвращается список вершин vets ###
def vals_to_vets(vals)
  Array.new(vals.length) { |i| Vertex.new(vals[i]) }
end

# ## На вход подается список вершин vets, на выходе возвращается список значений vals ###
def vets_to_vals(vets)
  Array.new(vets.length) { |i| vets[i].val }
end
