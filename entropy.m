% ��Ȩ��
abmin = min(data);
abmax = max(data);
abmaxmin = abmax-abmin;
[n,m] = size(data);
datable =(data-abmin)./repmat(abmaxmin,n,1);

zaple = zeros(1,m);  
for i = 1:m
    x = datable(:,i);  
    p = x / sum(x);
    e = -sum(p.* mylog(p)) / log(n); % ������Ϣ��
    zaple(i) = 1- e; % Ч��ֵ
end
W = zaple ./ sum(zaple);  % ��һ�����õ�Ȩ��



