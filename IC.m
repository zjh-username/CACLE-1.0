%% IC 前期计算
%单条IC曲线测试
k3 = 50;%第几个循环周期
Q = Charge_Capacity{k3,1}; 
V = Charge_Voltage{k3,1};
Q_V = diff(Q)./diff(V);
plot(V(1,2:end),Q_V,'r-*');%未处理的IC曲线

hold on
V1=3.6:0.0005:4.2;
p=spline(V,Q,V1);
p1=diff(p)/0.0005;
plot(V1(1,2:end),p1,'b-o');

hold on
Q_V_G  = smoothdata(p1,'gaussian',100);
plot(V1(1,2:end),Q_V_G,'k-*');

[peak_height,loc] = findpeaks(Q_V_G);
peak_A_height = peak_height(1,1);
peak_B_height = peak_height(1,2);
peak_A_position = V1(1,loc(1,1)+1);
peak_B_position = V1(1,loc(1,2)+1);

nn = peak_B_height-Q_V_G;
plot(V1(1,2:end),nn,'k-*');
[valley_height,valley_loc] = findpeaks(nn((400:700)));
valley_C_height = peak_B_height-valley_height;
valley_C_position = V1(1,valley_loc+400);
area_1 = p(valley_loc+400)-p(201);
area_2 = p(801)-p(valley_loc+400);
aa = [peak_A_height;peak_A_position;peak_B_height;peak_B_position;
    valley_C_height;valley_C_position;area_1;area_2];

%绘图
for k3 = 580:10:700
    Q = Charge_Capacity{k3,1};
    V = Charge_Voltage{k3,1};
    Q_V = diff(Q)./diff(V);
    V1=3.6:0.0005:4.2;
    p=spline(V,Q,V1);
    p1=diff(p)/0.0005;
    hold on
    Q_V_G  = smoothdata(p1,'gaussian',100);%移动平均滤波 MA   a moving window of 5 data points
    %plot(V1(1,2:end),Q_V_G);
    plot(Q_V_G);
end

%计算 peak A peak B
count = 0;
for k3 = 10:10:600
    count = count+1;
    Q = Charge_Capacity{k3,1};
    V = Charge_Voltage{k3,1};
    Q_V = diff(Q)./diff(V);
    V1=3.6:0.0005:4.2;
    p=spline(V,Q,V1);
    p1=diff(p)/0.0005;
    hold on
    Q_V_G  = smoothdata(p1,'gaussian',100);%移动平均滤波 MA   a moving window of 5 data points
    plot(V1(1,2:end),Q_V_G);
    [peak_height,loc] = findpeaks(Q_V_G);
    peak_A_height(1,count) = peak_height(1,1);
    peak_B_height(1,count) = peak_height(1,2);
    peak_A_position(1,count) = V1(1,loc(1,1)+1);
    peak_B_position(1,count) = V1(1,loc(1,2)+1);
    nn = peak_B_height(1,count)-Q_V_G;
    [valley_height,valley_loc] = findpeaks(nn(400:700));
    valley_C_height(1,count) = peak_B_height(1,count)-valley_height;
    valley_C_position(1,count) = V1(1,valley_loc+400);
    area_1(1,count) = p(valley_loc+400)-p(201);
    area_2(1,count) = p(801)-p(valley_loc+400);
end

aa = [peak_A_height;peak_A_position;peak_B_height;peak_B_position;
    valley_C_height;valley_C_position;area_1;area_2];

%% 后处理1 出图
%单条IC曲线测试
k3 = 50;%第几个循环周期
Q = Charge_Capacity{k3,1}; 
V = Charge_Voltage{k3,1};
Q_V = diff(Q)./diff(V);
plot(V(1,2:end),Q_V,'r-*', 'Color',[239,0,0]/255);%未处理的IC曲线
grid on
box on
ylabel('Incremental Capacity(Ah V^-^1)','FontSize',12);
xlabel('Voltage(V)','FontSize',12);

hold on
V1=3.6:0.0005:4.2;
p=spline(V,Q,V1);
p1=diff(p)/0.0005;
plot(V1(1,2:end),p1,'b-o');
h=legend('Initial Curve','Cubic Spline Interpolation');
legend('boxoff')
set(h,'FontSize',12')

hold on
plot(V(1,2:end),Q_V,'r-*', 'Color',[239,0,0]/255,'LineWidth', 1);
Q_V_G_50  = smoothdata(p1,'gaussian',50);
Q_V_G_100  = smoothdata(p1,'gaussian',100);
Q_V_G_150 = smoothdata(p1,'gaussian',150);
plot(V1(1,2:end),Q_V_G_50, 'Color',[26,111,223]/255,'LineWidth',1);
plot(V1(1,2:end),Q_V_G_100, 'Color',[251,101,1]/255,'LineWidth',1);
plot(V1(1,2:end),Q_V_G_150, 'Color',[0,203,204]/255,'LineWidth',1);
grid on
box on
ylabel('Incremental Capacity(Ah V^-^1)','FontSize',12);
xlabel('Voltage(V)','FontSize',12);
h=legend('Original Data','Window Length = 50','Window Length = 100','Window Length = 150');
legend('boxoff')
set(h,'FontSize',12')


[peak_height,loc] = findpeaks(Q_V_G_100);
peak_A_height = peak_height(1,1);
peak_B_height = peak_height(1,2);
peak_A_position = V1(1,loc(1,1)+1);
peak_B_position = V1(1,loc(1,2)+1);
nn = peak_B_height-Q_V_G_100;
[valley_height,valley_loc] = findpeaks(nn((400:600)));
valley_C_height = peak_B_height-valley_height;
valley_C_position = V1(1,valley_loc+400);

hold on
a1 = find(V1 == 3.7)-1;
a2 = valley_loc+399;
a3 = find(V1 == 4)-1;
y1 = Q_V_G_100(a1:a2);
y2 = Q_V_G_100(a2:a3);
h1 = area(V1(a1+1:a2+1),y1);
set(h1(1),'FaceColor',[62,96,111]/255,'edgecolor',[.8,.8,.8]);
h2 = area(V1(a2+1:a3+1),y2);
set(h2(1),'FaceColor',[145,170,157]/255,'edgecolor',[.8,.8,.8]);
plot(V1(1,2:end),Q_V_G_100, 'Color',[251,101,1]/255,'LineWidth',2);
axis([3.7 4 0 5]); 
grid on
box on
ylabel('Incremental Capacity(Ah V^-^1)','FontSize',12);
xlabel('Voltage(V)','FontSize',12);
%% 后处理2 出图
data = [];%输入参数

%第一张图
cycle = 10:10:500;
ax1 = subplot(2,1,1);
yyaxis(ax1,'left');
plot(cycle,data(1,:),'-^','LineWidth',1.5, 'Color',[29,52,66]/255)
ylabel('Height(Ah V^-^1)','FontSize',12,'Color',[29,52,66]/255);
set(gca,'ycolor',[29,52,66]/255);
yyaxis(ax1,'right');
plot(cycle,data(2,:),'-*','LineWidth',1.5, 'Color',[166,3,3]/255)
xlabel('Cycle','FontSize',12);
ylabel('Position(V)','FontSize',12,'Color',[166,3,3]/255);
set(gca,'ycolor',[166,3,3]/255);
title('Peak A','FontSize',12);
grid on
box on

ax1 = subplot(2,1,2);
yyaxis(ax1,'left');
plot(cycle,data(3,:),'-^','LineWidth',1.5, 'Color',[29,52,66]/255)
ylabel('Height(Ah V^-^1)','FontSize',12,'Color',[29,52,66]/255);
set(gca,'ycolor',[29,52,66]/255);
yyaxis(ax1,'right');
plot(cycle,data(4,:),'-*','LineWidth',1.5, 'Color',[166,3,3]/255)
xlabel('Cycle','FontSize',12);
ylabel('Position(V)','FontSize',12,'Color',[166,3,3]/255);
set(gca,'ycolor',[166,3,3]/255);
title('Peak B','FontSize',12);
grid on
box on

%第二张图
ax1 = subplot(2,1,1);
yyaxis(ax1,'left');
plot(cycle,data(5,:),'-^','LineWidth',1.5, 'Color',[29,52,66]/255)
ylabel('Height(Ah V^-^1)','FontSize',12,'Color',[29,52,66]/255);
set(gca,'ycolor',[29,52,66]/255);
yyaxis(ax1,'right');
plot(cycle,data(6,:),'-*','LineWidth',1.5, 'Color',[166,3,3]/255)
xlabel('Cycle','FontSize',12);
ylabel('Position(V)','FontSize',12,'Color',[166,3,3]/255);
set(gca,'ycolor',[166,3,3]/255);
title('Valley C','FontSize',12);
grid on
box on

ax1 = subplot(2,1,2);
yyaxis(ax1,'left');
plot(cycle,data(7,:),'-^','LineWidth',1.5, 'Color',[29,52,66]/255)
ylabel('Area 1(Ah)','FontSize',12,'Color',[29,52,66]/255);
set(gca,'ycolor',[29,52,66]/255);
yyaxis(ax1,'right');
plot(cycle,data(8,:),'-*','LineWidth',1.5, 'Color',[166,3,3]/255)
xlabel('Cycle','FontSize',12);
ylabel('Area 2(Ah)','FontSize',12,'Color',[166,3,3]/255);
set(gca,'ycolor',[166,3,3]/255);
title('Area','FontSize',12);
grid on
box on

%第三张图
for k3 = 50:50:500
    Q = Charge_Capacity{k3,1};
    V = Charge_Voltage{k3,1};
    Q_V = diff(Q)./diff(V);
    V1=3.6:0.0005:4.2;
    p=spline(V,Q,V1);
    p1=diff(p)/0.0005;
    hold on
    Q_V_G  = smoothdata(p1,'gaussian',100);%移动平均滤波 MA   a moving window of 5 data points
    %plot(V1(1,2:end),Q_V_G);
    plot(V1(1,2:end),Q_V_G,'LineWidth',1.5);
end
xlabel('Cycle','FontSize',12);
ylabel('Incremental Capacity(Ah V^-^1)','FontSize',12);
grid on
box on
h=legend('Cycle 50','Cycle 100','Cycle 150','Cycle 200','Cycle 250','Cycle 300',...
'Cycle 350','Cycle 400','Cycle 450','Cycle 500');
%legend('boxoff')
set(h,'FontSize',12')




%第4 5 6张图
data=[];%输入参数

data =data';
x = 10:10:500;

subplot(3,1,1);
p1_height =  -1.774e-08 ;
p2_height =   1.341e-05;
p3_height =   -0.004533;
p4_height =      2.957;
height = p1_height*x.^3 + p2_height*x.^2 + p3_height*x + p4_height;
hold on
plot(x,data(1,:),'*', 'Color',[29,52,66]/255,'LineWidth',1.5);
plot(x,height,'-', 'Color',[166,3,3]/255,'LineWidth',1.5);
xlabel('Cycle','FontSize',12);
ylabel('Weighted Height','FontSize',10);
grid on
box on
h=legend('Discrete Point','Fitted Curve');
set(h,'FontSize',6')

subplot(3,1,2);
%position拟合
p1_position =   -1.171e-07;
p2_position =   0.0001193;
p3_position =    3.818;
position = p1_position*x.^2 + p2_position*x + p3_position;
hold on
plot(x,data(2,:),'*', 'Color',[29,52,66]/255,'LineWidth',1.5);
plot(x,position,'-', 'Color',[166,3,3]/255,'LineWidth',1.5);
xlabel('Cycle','FontSize',12);
ylabel('Weighted Position','FontSize',10);
grid on
box on
h=legend('Discrete Point','Fitted Curve');
set(h,'FontSize',6')

subplot(3,1,3);
%area拟合
p1_area =   1.28e-07;
p2_area =    -0.0002679;
p3_area =  0.4086;
area = p1_area*x.^2 + p2_area*x + p3_area;
hold on
plot(x,data(3,:),'*', 'Color',[29,52,66]/255,'LineWidth',1.5);
plot(x,area,'-', 'Color',[166,3,3]/255,'LineWidth',1.5);
xlabel('Cycle','FontSize',12);
ylabel('Weighted Area','FontSize',10);
grid on
box on
h=legend('Discrete Point','Fitted Curve');
set(h,'FontSize',6')
%% 数据预处理
clc;
clear;
data = [];%第一列未处理数据 第二列处理后的数据

cycle = 1:600;
plot(cycle,data(:,1),'*', 'Color',[29,52,66]/255,'LineWidth',1.5)
xlabel('Cycle','FontSize',12);
ylabel('Initial Capacity Data','FontSize',12);
grid on
box on















