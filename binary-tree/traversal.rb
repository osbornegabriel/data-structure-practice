=begin

These are the solutions I provided on leetcode.com for their traversing a tree chapter

***Set-up for all challenges***
Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

@param {TreeNode} root
@return {Integer[]}

=end


def rcur_preorder(root)
  # recursive traversal solution
  return [] if !root
  [root.val] + rcur_preorder(root.left) + rcur_preorder(root.right)
end

def itr_preorder()
  # iterative solution
  unresolved = []
  answer = []
  while root
      answer << root.val
      unresolved << root.right if root.right
      root = root.left
      root ||= unresolved.pop
  end
  answer
end

def rcur_inorder(root)
  #Recursive Solution
  return [] if !root
  rcur_inorder(root.left) + [root.val] + rcur_inorder(root.right)
end

def itr_inorder(root)
  #Iterative Solution
  future_steps = []
  answer = []

  while root
      left_step = root.left
      root.left = nil
      if left_step
          future_steps << root
          root = left_step
      else
          answer << root.val
          root = root.right
          root ||= future_steps.pop
      end
  end
  answer
end

def rcur_postorder(root)
  # Recursive solution
  return [] if !root
  return [root.val] if !root.left && !root.right
  rcur_postorder(root.left) + rcur_postorder(root.right) + [root.val]
end

def itr_postorder(root)
  # Iterative Solution
  answer = []
  future_branches = []
  while root
      if !root.left && !root.right
          answer << root.val
      else
          left = root.left
          right = root.right
          root.left = nil
          root.right = nil
          future_branches << root
          future_branches << right if right
          future_branches << left if left
      end
      root = future_branches.pop
  end
  answer
end

def level_order(root)
    answer = []
    current_level = []
    current_level << root if root
    next_level = []

    until current_level.empty?
        level_vals = []
        for level in current_level
            level_vals << level.val
            next_level << level.left if level.left
            next_level << level.right if level.right
        end
        answer << level_vals
        current_level = next_level
        next_level = []
    end
    answer
end

#Finding the maximum depth of the tree
def max_depth(root)
    return 0 if !root
    1 + [max_depth(root.left), max_depth(root.right)].max
end


# Check whether tree is symmetric (mirror of itself)

# Recursive solution
def is_symmetric(root)
    is_symmetric_compare(root&.left, root&.right)
end

def is_symmetric_compare(left, right)
    return false if left&.val != right&.val
    return true if !(left || right)
    is_symmetric_compare(left.left, right.right) && is_symmetric_compare(left.right, right.left)
end

########################

# Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

# Recursive Solution
def has_path_sum(root, sum)
    return false if !root
    path_helper(root, 0, sum)
end

def path_helper(path, total, sum)
    total += path.val
    return total == sum if !(path.right || path.left)
    left = path_helper(path.left,total,sum) if path.left
    right = path_helper(path.right,total,sum) if path.right
    !!(left || right)
end

# Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.

# Recursive Solution
def path_sum(root, sum)
    path_sum_helper([], root, sum)
end

def path_sum_helper(path, root, sum)
    return [] if !root
    current_path = path.dup
    current_path << root.val
    return  [current_path] if (!root.left && !root.right) && current_path.reduce(:+) == sum
    left_path = path_sum_helper(current_path, root.left, sum)
    right_path = path_sum_helper(current_path, root.right, sum)
    left_path + right_path
end