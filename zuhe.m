ws = [0.316839856	0.683160144...
;0.211702426	0.788297574...
];
mm = 2;
x0 = zeros(1,mm);  
Aeq = ones(1,mm); beq = [1];lb = zeros(1,mm);ub = ones(1,mm);
[x,fval] = fmincon(@fun1,x0,[],[],Aeq,beq,[],[],@nonlfun1); 

%% 累计加权
X = 10:10:520;
height = data*x';
plot(height,'k-*');
%% CS2_33拟合
x = 1:600;
%height拟合
p1_height =  -1.276e-08;
p2_height =   9.1e-06;
p3_height =   -0.003754;
p4_height =      3.085;
height = p1_height*x.^3 + p2_height*x.^2 + p3_height*x + p4_height;
height = height';
%position拟合
p1_position =   -7.034e-08;
p2_position =   9.718e-05;
p3_position =    3.819;
position = p1_position*x.^2 + p2_position*x + p3_position;
position = position';
%area拟合
p1_area =   1.954e-07;
p2_area =    -0.0002518;
p3_area =  0.37;
area = p1_area*x.^2 + p2_area*x + p3_area;
area = area';
aaa = [height,position,area];
%% CS2_34拟合
x = 1:600;
%height拟合
p1_height =  -5.944e-09;
p2_height =   5.392e-06;
p3_height =   -0.003604;
p4_height =      3.41;
height = p1_height*x.^3 + p2_height*x.^2 + p3_height*x + p4_height;
height = height';
%position拟合
p1_position =   -3.666e-07;
p2_position =   0.0003021;
p3_position =    3.839;
position = p1_position*x.^2 + p2_position*x + p3_position;
position = position';
%area拟合
p1_area =   7.821e-07;
p2_area =    -0.0007078;
p3_area =  0.4079;
area = p1_area*x.^2 + p2_area*x + p3_area;
area = area';
aaa = [height,position,area];
%% CS2_35拟合
x = 1:700;
%可用容量拟合
p1_Capacity =  -3.464e-09;
p2_Capacity =   3.043e-06;
p3_Capacity =  -0.0009977;
p4_Capacity =       1.114;
Capacity = p1_Capacity*x.^3 + p2_Capacity*x.^2 + p3_Capacity*x + p4_Capacity;
%height拟合
p1_height =  -1.934e-08;
p2_height =    1.77e-05;
p3_height =   -0.005942;
p4_height =       3.027;
height = p1_height*x.^3 + p2_height*x.^2 + p3_height*x + p4_height;
%position拟合
p1_position =   4.596e-10;
p2_position =   -4.31e-07;
p3_position =    0.000175;
p4_position =       3.829;
position = p1_position*x.^3 + p2_position*x.^2 + p3_position*x + p4_position;
%area拟合
p1_area =   -1.58e-09;
p2_area =    1.46e-06;
p3_area =  -0.0005627;
p4_area =      0.3975;
area = p1_area*x.^3 + p2_area*x.^2 + p3_area*x + p4_area;
aaa = [height',position',area'];
%% CS2_36拟合
x = 1:700;
%height拟合
p1_height =  -1.774e-08 ;
p2_height =   1.341e-05;
p3_height =   -0.004533;
p4_height =      2.957;
height = p1_height*x.^3 + p2_height*x.^2 + p3_height*x + p4_height;
height = height';
%position拟合
p1_position =   -1.171e-07;
p2_position =   0.0001193;
p3_position =    3.818;
position = p1_position*x.^2 + p2_position*x + p3_position;
position = position';
%area拟合
p1_area =   1.28e-07;
p2_area =    -0.0002679;
p3_area =  0.4086;
area = p1_area*x.^2 + p2_area*x + p3_area;
area = area';
aaa = [height,position,area];
%% CS2_37拟合
x = 1:800;
%height拟合
p1_height =  -7.898e-09;
p2_height =   8.27e-06;
p3_height =   -0.003552;
p4_height =     2.59;
height = p1_height*x.^3 + p2_height*x.^2 + p3_height*x + p4_height;
height = height';
%position拟合
p1_position =   -1.12e-07;
p2_position =   0.0001234;
p3_position =    3.825;
position = p1_position*x.^2 + p2_position*x + p3_position;
position = position';
%area拟合
p1_area =   2.338e-07;
p2_area =    -0.0003114;
p3_area =  0.3929;
area = p1_area*x.^2 + p2_area*x + p3_area;
area = area';
aaa = [height,position,area];
%% CS2_38拟合
x = 1:800;
%height拟合
p1_height =  -8.855e-09;
p2_height =   9.906e-06;
p3_height =   -0.004359;
p4_height =     2.897;
height = p1_height*x.^3 + p2_height*x.^2 + p3_height*x + p4_height;
height = height';
%position拟合
p1_position =  5.052e-10;
p2_position =    -4.692e-07;
p3_position =    0.0001323;
p4_position =    3.846 ;
position = p1_position*x.^3 + p2_position*x.^2 + p3_position*x + p4_position;
position = position';
%area拟合
p1_area =   -1.292e-09;
p2_area =   1.257e-06;
p3_area =  -0.0004409;
p4_area =  0.3523;
area = p1_area*x.^3 + p2_area*x.^2 + p3_area*x + p4_area;
area = area';
aaa = [height,position,area];
%% CX2_34拟合
x = 1:700;
%height拟合
p1_height =  -3.495e-10;
p2_height =   1.137e-06;
p3_height =   -0.001979;
p4_height =     3.165;
height = p1_height*x.^3 + p2_height*x.^2 + p3_height*x + p4_height;
height = height';
%position拟合
p1_position = 2.14e-10;
p2_position = -1.998e-07;
p3_position = 6.833e-05 ;
p4_position = 3.856;
position = p1_position*x.^3 + p2_position*x.^2 + p3_position*x + p4_position;
position = position';
%area拟合
p1_area =  -3.573e-10;
p2_area =   4.403e-07;
p3_area =  -0.0003073;
p4_area =  0.3988;
area = p1_area*x.^3 + p2_area*x.^2 + p3_area*x + p4_area;
area = area';
aaa = [height,position,area];
%% CX2_35拟合
x = 1:800;
%height拟合
p1_height =  -1.621e-09;
p2_height =   2.291e-06;
p3_height =   -0.001868;
p4_height =     3.261;
height = p1_height*x.^3 + p2_height*x.^2 + p3_height*x + p4_height;
height = height';
%position拟合
p1_position =  2.605e-06;
p2_position =    3.868;
position = p1_position*x + p2_position;
position = position';
%area拟合
p1_area =  -6.802e-10;
p2_area =   7.832e-07;
p3_area =  -0.0003535;
p4_area =  0.4011;
area = p1_area*x.^3 + p2_area*x.^2 + p3_area*x + p4_area;
area = area';
aaa = [height,position,area];
%% CX2_36拟合
x = 1:800;
%height拟合
p1_height =  0.5801;
p2_height =   0.006206;
p3_height =   2.469 ;
height = p1_height*exp(-p2_height*x)+p3_height;
height = height';
%position拟合
p1_position = 3.861;
p2_position =   5.564e-06;
position = p1_position*exp(p2_position*x);
position = position';
%area拟合
p1_area = -0.0001607;
p2_area =    0.3415;
area = p1_area*x + p2_area;
area = area';
aaa = [height,position,area];
%% CX2_37拟合
x = 1:900;
%height拟合
p1_height =  -2.057e-09;
p2_height =   3.477e-06 ;
p3_height =   -0.002608;
p4_height =      3.269;
height = p1_height*x.^3 + p2_height*x.^2 + p3_height*x + p4_height;
height = height';
%position拟合
p1_position =  1.344e-05;
p2_position =    3.862;
position = p1_position*x + p2_position;
position = position';
%area拟合
p1_area = 0.8273;
p2_area =   -774.3;
p3_area =   676.3 ;
p4_area =   0.3157 ;
p5_area =    618.8 ;
p6_area =  966.1 ;

area = p1_area*exp(-((x-p2_area)./p3_area).^2) + p4_area *exp(-((x-p5_area)./p6_area).^2);
area = area';
aaa = [height,position,area];



