tree = node;

data = readtable("winequality_for_classification.csv");
data = table2array(data);

tree.data = data(1:3000,1:12);
tree.label = data(1:3000,end);

tree.features_rem = [1:12];

[tree.thresh,tree.feature_used] = findThresh(tree);
tree.features_rem = tree.features_rem(tree.features_rem ~= tree.feature_used);
makeTree(tree);


x_test = data(3000:3199,1:12)
y_test = data(3000:3199,end)
y_pred = getPred(0,tree,x_test);
result = sum(y_pred == y_test)/length(y_test)

% y_pred = getPred(1,tree,x_test)
% result_mse = zeros(length(y_pred),1)
% for i = length(y_pred)
%     result_mse(i) = (y_pred(i) - y_test(i))^2
% end
% reg_result = sqrt(sum(result_mse))


