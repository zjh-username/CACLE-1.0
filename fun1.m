function f = fun1(x)
ws = [0.316839856	0.683160144...
;0.211702426	0.788297574...
];
m = 2;

for j = 1:2
    for k = 1:m
        f1(j,k)= (x(k)-ws(j,k))^2;
    end
end

f = sum(sum(f1));
end