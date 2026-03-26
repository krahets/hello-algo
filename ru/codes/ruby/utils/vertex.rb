=begin
File: vertex.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## вершинакласс ###
class Vertex
  attr_accessor :val

  def initialize(val)
    @val = val
  end
end

# ## Входзначениесписок vals, Вернутьсписок вершин vets ###
def vals_to_vets(vals)
  Array.new(vals.length) { |i| Vertex.new(vals[i]) }
end

# ## Входсписок вершин vets, Вернутьзначениесписок vals ###
def vets_to_vals(vets)
  Array.new(vets.length) { |i| vets[i].val }
end
