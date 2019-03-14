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


def rcrv_preorder(root)
    # recursive traversal solution
    return [] if !root
    [root.val] + rcrv_preorder(root.left) + rcrv_preorder(root.right)
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

def rcvr_inorder(root)
    #Recursive Solution
    return [] if !root
    rcvr_inorder(root.left) + [root.val] + rcvr_inorder(root.right)
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