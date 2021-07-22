% 改进的CRITIC
[n,m]=size(data);
xabmin = min(data);
xabmax = max(data);
xabmaxmin = xabmax-xabmin;
pose =(data-xabmin)./repmat(xabmaxmin,n,1);  % 最大值最小值标准化
rasb = corrcoef(pose); 
for i =1:m
    for j=1:m
        if rasb(i,j)<0
            rasb(i,j)=-rasb(i,j);
        end
    end
end 
acpe = zeros(1,m);
ccab = zeros(1,m);
x_average = zeros(1,m);
for j=1:m
    acpe(j) = std(pose(:,j));
    ccab(j)= size(rasb,1)-sum(rasb(:,j));
    x_average(j) = mean(pose(:,j));
 end
C = acpe.*ccab./x_average;
w = C./(sum(C));

