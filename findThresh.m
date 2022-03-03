function [threshold,feature_index] = findThresh(curnode)%features_left, data, label)
    %data1 = readtable("winequality_for_classification.csv")
    
    data = curnode.data;
    best_gain=struct('Threshold', NaN, 'feature_index', NaN, 'Gain', 0);
    features_rem = curnode.features_rem;
    X = data;
    Y = curnode.label;
    
    for j = features_rem
   
        %sort each columns and call it col
%         X
%         j
        
        X_col_sort = sort(X(:,j));
        
        for n = (1:length(X_col_sort)-1)
            point1 = X_col_sort(n,1);
            point2 = X_col_sort(n+1, 1);
            thresh = (point1 + point2)/2;
            Gain=info_gain(X,Y,j,thresh);
            if(Gain>best_gain.Gain)
                best_gain.Gain =Gain;
                best_gain.Threshold= thresh;
                best_gain.feature_index = j;
            end

        end

    end
    
   feature_index =best_gain.feature_index;
   threshold=best_gain.Threshold;
end