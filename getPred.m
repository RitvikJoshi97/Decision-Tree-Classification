%x_test = [1 2 4 2 5 5]
%y_test = [1] 

function y_pred = getPred(reg, curnode, x_test)
    if reg == 1
        y_pred = getReg(curnode,x_test);
    else
        y_pred = getClass(curnode,x_test);
    end
end

function y_pred = getClass(root, x_test)
    y_pred = zeros(height(x_test),1)
    for i = 1:height(x_test)
        curnode = root;
        leaf = false;
        while leaf == false
            if ~isempty(curnode.left) || ~isempty(curnode.right)
                x = x_test(i,curnode.feature_used);
                if x > curnode.thresh
                    curnode = curnode.right;
                else
                    curnode = curnode.left;
                end
            else
                if mean(curnode.label)>0.5
                    y_pred(i,1) = 1;
                else
                    y_pred(i,1) = 0;
                end
                leaf = true;
            end
        end
    end  
end


function y_pred = getReg(root, x_test)
    y_pred = zeros(length(x_test),1);
    for i = 1:length(x_test)
        curnode = root;
        leaf = false;
        while leaf == false
            if ~isempty(curnode.left) && ~isempty(curnode.right)
                x = x_test(i,curnode.feature_used);
                if x > curnode.thresh
                    curnode = curnode.right;
                else
                    curnode = curnode.left;
                end
            else
                y_pred(i,1) = mean(curnode.label) ;
                leaf = true;
            end
        end
    end  
end