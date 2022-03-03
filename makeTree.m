
function makeTree(curnode)
    if length(curnode.features_rem) > 4
        if((sum((curnode.label==1))==length(curnode.label))||(sum((curnode.label==0)))==length(curnode.label))
            return
        end
        
        %makeLeft
        curnode.left = node;
        %makeRight
        curnode.right = node;
        
       
        curnode.left.parent = curnode;
        curnode.right.parent = curnode;
        
        % populate the data the children nodes will use
        [curnode.left.data,curnode.left.label, curnode.right.data, curnode.right.label] = calculateData(curnode);
        [curnode.left.thresh,curnode.left.feature_used] = findThresh(curnode);
        curnode.left.features_rem = curnode.features_rem(curnode.features_rem ~= curnode.left.feature_used);
        
        % populate the data the children nodes will use
        [curnode.right.data,curnode.right.label, curnode.right.data, curnode.right.label] = calculateData(curnode);
        [curnode.right.thresh,curnode.right.feature_used] = findThresh(curnode);
        curnode.right.features_rem = curnode.features_rem(curnode.features_rem ~= curnode.right.feature_used);
        
        makeTree(curnode.left) 
        makeTree(curnode.right)
    else
        return
    end
end
