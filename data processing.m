%% ����
column = table2array(PL03{2,3});
inds = [];
for (i=1:length(column))
    if column(i,4)==1&&column(i,3)==3
        inds = [inds,column(i,5)];
    end
end
%% ����excel
CX2_37 = cell(49,3);

cycle_1=xlsread('CX2_37_1_10_11','Channel_1-004');%�������Լ�����



%% ����Ԥ����
clc;clear;
cs_name = CS2_36;%�������ݼ�����
p = length(cs_name);
Charge_Capacity = {};Discharge_Capacity = {};Charge_Voltage= {};
for k1 = 2:p
    k2 = cs_name{k1,1};
    column = cs_name{k1,3};

c1 = {};%�ۼƳ������
c2 = {};%�������ָ��
c6 = {};%��������ѹָ��
for p=1:k2
   c1{p,1} = {};
   c2{p,1} = {};
   c6{p,1} = {};
end
for p=1:k2
  for (i=1:length(column))
      if column(i,6)==p && column(i,5)==2 %��ȡ�ۼƳ������
          c1{p,1} = [c1{p,1},column(i,9)];
      end
      if column(i,6)==p && column(i,5)==1%��ȡ���������ȥ��ָ��
          c2{p,1} = [c2{p,1},column(i,9)];
      end
      if column(i,6)==p && column(i,5)==2%��ȡ��������ѹָ��
          c6{p,1} = [c6{p,1},column(i,8)];
      end
  end
end
% Ԫ��ת����
c11 = {};c22 = {};c66 = {};
for p=1:k2
    c11 = [c11;cell2mat(c1{p,1})];
    c22 = [c22;cell2mat(c2{p,1})];
    c66 = [c66;cell2mat(c6{p,1})];
end
% һ�������ڵĳ������
for p=1:k2
    length_1 =length(c11{p,1});
    c22_1 = c22{p,1};
    c22{p,1} = ones(1,length_1)*c22_1(end);
    c11{p,1} = c11{p,1}-c22{p,1};
end

c3 = {};%�ۼƷŵ�����
c4 = {};%�ŵ�����ָ��
for p=1:k2
   c3{p,1} = {};
   c4{p,1} = {};
end
for p=1:k2
  for (i=1:length(column))
      if column(i,6)==p && column(i,5)==7 %��ȡ�ۼƷŵ�����
          c3{p,1} = [c3{p,1},column(i,10)];
      end
      if column(i,6)==p && column(i,5)==6%��ȡ�ŵ�������ȥ��ָ��
          c4{p,1} = [c4{p,1},column(i,10)];
      end
  end
end
% Ԫ��ת����
c33 = {};c44 = {};c55 = {};
for p=1:k2
    c33 = [c33;cell2mat(c3{p,1})];
    c44 = [c44;cell2mat(c4{p,1})];
end
% һ�������ڵķŵ�����
for p = 1:k2
    length_1 =length(c33{p,1});
    c44_1 = c44{p,1};
    c44{p,1} = ones(1,length_1)*c44_1(end);
    c33{p,1} = c33{p,1}-c44{p,1};
    c33_1 = c33{p,1};
    c55{p,1} = c33_1(end);%����������
end

%����������ܽ� 

Charge_Capacity = [Charge_Capacity;c11];%���������ʱ��仯
Discharge_Capacity = [Discharge_Capacity;c55];%��λ���ڵ�����������
Charge_Voltage= [Charge_Voltage;c66];%��������ѹָ��

end

