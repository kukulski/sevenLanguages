
class Tree
  attr_accessor :children, :node_name
  
    def initialize(hash)
        pair = hash.shift
        @node_name = pair[0]
        array_of_arrays = pair[1].to_a
        @children = array_of_arrays.map {|kv| Tree.new({kv[0], kv[1]})}
    end
    
    
  def visit_all(&block)
    visit &block
      children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({'gandpa'=>{'dad'=>{'me'=>{'jack'=>{}}}}})


puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

puts
puts "visiting another node"
ruby_tree.children[0].children[0].visit_all {|node| puts node.node_name}

puts
puts "direct"
puts ruby_tree.children[0].children[0].children[0].node_name
