class Node

	attr_accessor :value, :parent, :left_child, :right_child

	def initialize(value=nil, parent=nil, left_child=nil, right_child=nil)
		@value = value
		@parent = parent
		@left_child = left_child
		@right_child = right_child
	end

end

class BinaryTree

	attr_accessor :top_node

	def build_tree(array)
		@top_node = Node.new(array[0])
		parent_node = @top_node
		node_placed = false
		for i in (1...array.length)
				#puts ""
				#puts "num: #{array[i]}"
			while node_placed == false


				if array[i] >= parent_node.value 
					#puts "#{array[i]} >= #{parent_node.value}"
					if parent_node.right_child.nil?
						parent_node.right_child = Node.new(array[i], parent_node)
						node_placed = true
					else
						parent_node = parent_node.right_child
					end

				elsif array[i] < parent_node.value 
					#puts "#{array[i]} < #{parent_node.value}"
					if parent_node.left_child.nil?
						parent_node.left_child = Node.new(array[i], parent_node)
						node_placed = true
					else
						parent_node = parent_node.left_child
					end
				end

			end
			node_placed = false
			#reset parent_node to top!!!
			parent_node = @top_node
		end
	end

	def breadth_first_search(value)
		q = []
		current_node = @top_node
		while !current_node.nil?
			return current_node if current_node.value == value
			q.push current_node.left_child if !current_node.left_child.nil?
			q.push current_node.right_child if !current_node.right_child.nil?
			current_node = q.shift
		end
	end

	#INORDER
	def depth_first_search(value)
		s = []
		current_node = @top_node
		while !s.empty? || !current_node.nil?
			if !current_node.nil?
				s.push(current_node)
				current_node = current_node.left_child
			else
				current_node = s.pop
				return current_node if current_node.value == value
				current_node = current_node.right_child
			end
		end
	end

	#INORDER
	def dfs_rec(value, current_node = @top_node)
		return if current_node.nil?
		dfs_rec(value, current_node.left_child)
		#puts current_node.value
		return current_node if current_node.value == value
		dfs_rec(value, current_node.right_child)
	end

end

# array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

# b = BinaryTree.new
# b.build_tree(array)
# puts b.breadth_first_search(7).left_child.value
# puts b.breadth_first_search(7).right_child.value
# puts b.breadth_first_search(6345).value
# puts b.breadth_first_search(6345).left_child.value
# b.depth_first_search(2)
# b.dfs_rec(2)
