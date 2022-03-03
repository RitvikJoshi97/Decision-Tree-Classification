function gain = info_gain(X,Y,j,t)

        %  calculates p and n
        p=sum(Y==1)/length(Y);
        n=sum(Y==0)/length(Y);

        % calculates information I(p/(p+n),n/(p+n))
        info=ent(p/(p+n));

        % finding new training sets X_left and X_right and new labels
        left_rows=(X(:,j)<t);
        X_left=X(left_rows,:);
        Y_left=Y(left_rows);

        right_rows=(X(:,j)>=t);
        X_right=X(right_rows,:);
        Y_right=Y(right_rows);

        % information gain = 0 if one of X_left, X_right is empty    
        if isempty(Y_left)==1 || isempty(Y_right)==1
            gain=0;
        else
            gain=info-rem1(X_left,Y_left,X_right,Y_right);
        end
   end
