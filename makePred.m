function y_pred = makePred (tree, x_test, y_test) 
    % x_test = [1 2 5 7]
    % y_test = [ 1 ]
    foundEnd = false
    curnode = tree
    while foundEnd == false
        val =  x_test(curnode.feature_used_for_node)%get val from x_test using cur.feature and cur.thresh
        if val < curnode.threshold_used_for_node
            if isempty(curnode.left)
                %  lesser_pred is y_pred
                y_pred = curnode.lesser_pred
                foundEnd = true
            else
                curnode = curnode.left %traverse left and recurse
            end
        else
            if isempty(curnode.right)
                % greater_pred is y_pred
                y_pred = curnode.greater_pred
                foundEnd = true
            else
                curnode = curnode.left %traverse left and recurse
            end
        end
     end
 
end
