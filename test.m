peak_A_height = data(1,:);
peak_A_position = data(2,:);
peak_B_height = data(3,:);
peak_B_position = data(4,:);
peak_C_height = data(5,:);
peak_C_position = data(6,:);
area_1 = data(7,:);
area_2 = data(8,:);

x = 10:10:550;
p1_1 =  -1.355e-08;
p2_1 =  1.176e-05;
p3_1 =  -0.00342;
p4_1 = 1.805;
peak_A_height = p1_1*x.^3 + p2_1*x.^2 + p3_1*x + p4_1;
plot(x,peak_A_height);

p1_2 =  8.865e-05;
p2_2 =  3.783;
peak_A_position = p1_2*x + p2_2;

p1_3 =  -3.279e-08;
p2_3 =   3.122e-05;
p3_3 =    -0.01114;
p4_3 =       4.944;
peak_B_height = p1_3*x.^3 + p2_3*x.^2 + p3_4*x + p4_3;

p1_4 =   3.851e-10;
p2_4 =  -2.899e-07;
p3_4 =   0.0001096;
p4_4 =       3.889;
peak_B_position = p1_4*x.^3 + p2_4*x.^2 + p3_4*x + p4_4;

p1_5 =  -3.671e-09;
p2_5 =   2.118e-06;
p3_5 =  -0.0003014;
p4_5 =        1.38;
peak_C_height = p1_5*x.^3 + p2_5*x.^2 + p3_5*x + p4_5;






