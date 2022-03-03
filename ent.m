function info = ent(k)
    if k==0 || k==1
        info=0;
    else
        info=-k*log2(k)-(1-k)*log2(1-k);
    end
end