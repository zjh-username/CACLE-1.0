% 熵权法
abmin = min(data);
abmax = max(data);
abmaxmin = abmax-abmin;
[n,m] = size(data);
datable =(data-abmin)./repmat(abmaxmin,n,1);

zaple = zeros(1,m);  
for i = 1:m
    x = datable(:,i);  
    p = x / sum(x);
    e = -sum(p.* mylog(p)) / log(n); % 计算信息熵
    zaple(i) = 1- e; % 效用值
end
W = zaple ./ sum(zaple);  % 归一化，得到权重



