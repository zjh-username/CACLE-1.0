%% 案例
column = table2array(PL03{2,3});
inds = [];
for (i=1:length(column))
    if column(i,4)==1&&column(i,3)==3
        inds = [inds,column(i,5)];
    end
end
%% 导入excel
CX2_37 = cell(49,3);

cycle_1=xlsread('CX2_37_1_10_11','Channel_1-004');%代入你自己数据



%% 数据预处理
clc;clear;
cs_name = CS2_36;%输入数据集名称
p = length(cs_name);
Charge_Capacity = {};Discharge_Capacity = {};Charge_Voltage= {};
for k1 = 2:p
    k2 = cs_name{k1,1};
    column = cs_name{k1,3};

c1 = {};%累计充电容量
c2 = {};%充电容量指标
c6 = {};%恒流充电电压指标
for p=1:k2
   c1{p,1} = {};
   c2{p,1} = {};
   c6{p,1} = {};
end
for p=1:k2
  for (i=1:length(column))
      if column(i,6)==p && column(i,5)==2 %获取累计充电容量
          c1{p,1} = [c1{p,1},column(i,9)];
      end
      if column(i,6)==p && column(i,5)==1%获取充电容量减去的指标
          c2{p,1} = [c2{p,1},column(i,9)];
      end
      if column(i,6)==p && column(i,5)==2%获取恒流充电电压指标
          c6{p,1} = [c6{p,1},column(i,8)];
      end
  end
end
% 元胞转数组
c11 = {};c22 = {};c66 = {};
for p=1:k2
    c11 = [c11;cell2mat(c1{p,1})];
    c22 = [c22;cell2mat(c2{p,1})];
    c66 = [c66;cell2mat(c6{p,1})];
end
% 一个周期内的充电容量
for p=1:k2
    length_1 =length(c11{p,1});
    c22_1 = c22{p,1};
    c22{p,1} = ones(1,length_1)*c22_1(end);
    c11{p,1} = c11{p,1}-c22{p,1};
end

c3 = {};%累计放电容量
c4 = {};%放电容量指标
for p=1:k2
   c3{p,1} = {};
   c4{p,1} = {};
end
for p=1:k2
  for (i=1:length(column))
      if column(i,6)==p && column(i,5)==7 %获取累计放电容量
          c3{p,1} = [c3{p,1},column(i,10)];
      end
      if column(i,6)==p && column(i,5)==6%获取放电容量减去的指标
          c4{p,1} = [c4{p,1},column(i,10)];
      end
  end
end
% 元胞转数组
c33 = {};c44 = {};c55 = {};
for p=1:k2
    c33 = [c33;cell2mat(c3{p,1})];
    c44 = [c44;cell2mat(c4{p,1})];
end
% 一个周期内的放电容量
for p = 1:k2
    length_1 =length(c33{p,1});
    c44_1 = c44{p,1};
    c44{p,1} = ones(1,length_1)*c44_1(end);
    c33{p,1} = c33{p,1}-c44{p,1};
    c33_1 = c33{p,1};
    c55{p,1} = c33_1(end);%最大可用容量
end

%处理后数据总结 

Charge_Capacity = [Charge_Capacity;c11];%充电容量随时间变化
Discharge_Capacity = [Discharge_Capacity;c55];%单位周期的最大可用容量
Charge_Voltage= [Charge_Voltage;c66];%恒流充电电压指标

end

