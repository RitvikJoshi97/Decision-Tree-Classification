
function [left_data,left_labels, right_data, right_labels] = calculateData(curnode)%label, data, feature, thresh)
    
    label = curnode.label;
    data = curnode.data;
    feature = curnode.feature_used;
    thresh = curnode.thresh;
%     if isnan(feature)
%         feature = 1;
%     end
    if isnan(feature)
        if curnode.parent.left == curnode
            curnode.parent.left = []
        else
            curnode.parent.right = [];;
        end
        left_data = 0;
        left_labels = 0;
        right_data = 0;
        right_labels = 0;
        return
    end
%     feature
%     fprintf("here")
%     data
%     data(:,feature);
    left_rows=(data(:,feature)<thresh);
    left_data=data(left_rows,:);
    left_labels=label(left_rows);
    right_rows=(data(:,feature)>=thresh);
    right_data=data(right_rows,:);
    right_labels=label(right_rows);
end

