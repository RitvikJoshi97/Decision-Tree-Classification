M=readtable("winequality_for_classification.csv");
features=12;
X=table2array(M(:,1:features));
Y=table2array(M(:,features+1));
kFolds = 5;
kIdx = crossvalind('Kfold', length(Y), kFolds);
   for k = 1:kFolds
        tree(k) = node
        X_train = X(kIdx~=k, :);
        Y_train = Y(kIdx~=k);
        X_test = X(kIdx==k, :);
        Y_test = Y(kIdx==k);
        tree(k).features_rem = [1:12];
        tree(k).data = X_train
        tree(k).label = Y_train
        [tree(k).thresh,tree(k).feature_used] = findThresh(tree(k));
        tree(k).features_rem = tree(k).features_rem(tree(k).features_rem ~= tree(k).feature_used);
        makeTree(tree(k));
        Y_Pred = getPred(0,tree(k),X_test);
        Class_Perf(k)= 100*sum(Y_Pred==Y_test)/length(Y_test)
   end

   avg = mean(Class_Perf)