function remainder = rem1(X_left,Y_left,X_right,Y_right)
% calculates remainder for new training sets



p1=sum(Y_left==1)/length(Y_left);
n1=sum(Y_left==0)/length(Y_left);
p2=sum(Y_right==1)/length(Y_right);
n2=sum(Y_right==0)/length(Y_right);
p=p1+p2;
n=n1+n2;

ent(p1/(p1+n1));
ent(p2/(p2+n2));

remainder=((p1+n1)/(p+n))*ent(p1/(p1+n1))+((p2+n2)/(p+n))*ent(p2/(p2+n2));

end