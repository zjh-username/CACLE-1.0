t=30:30:30*length(V);
t1 = 1:0.001:t(1,end);
S_V = spline(t,V,t1)';

%%
% MATLAB Code for the LEAN method
% Date Jan. 13, 2020
% Code by Xuning FENG
% Step (1) Initialization
S_V=V';
%S_V is for the data set SV
n=length(S_V); 
% n is for the total length of the battery data set
dV=0.002; 
% The sampling interval of voltage, ¦ÄV, in the code it denotes the width of the counting bucket
Tolerance=5e-5; 
% Set the tolerance to avoid abnormal result of the comparing code in MATLAB
V_Min=S_V(1,1)-Tolerance;
% Set the start voltage of charge, v1 for B1=[v1, v2)
V_Max=S_V(n,1)+Tolerance; 
% Set the cut off voltage during charge
V1=V_Min:dV:V_Max;
% Set the vector V for counting and plotting
m=round((V_Max-V_Min)/dV)+1; 
% Set the length of V
N_V=zeros(m,1);
% Initialize the set of counting NV
Bucket_0=V_Min;
% Set the initial counting bucket B1=[v1, v2)
Pointer_i=round((S_V(1,1)-Bucket_0)/dV)+1;
% The pointer i that indicates the current index of the bucket

tic % For time counting
% Step (2): The for loop that iterates over each sampled data in SV
for k=1:n 
Flag=1; 
% Set a flag for the code to jump out the while loop, when the data is being counted.
while (Flag>0) % Step (3): The while loop to find the proper bucket
        Bucket(k,1)=Bucket_0+(Pointer_i-1)*dV;
% Locate the current bucket for counting
% Step (4): If Vk¡ÊBi, counter , break the while loop and jump to Step (2); otherwise, go to Step (5).
        if S_V(k,1)>=Bucket(k,1) && S_V(k,1)<Bucket(k,1)+dV
N_V(Pointer_i,1)=N_V(Pointer_i,1)+1;
        Flag=0; % Jump out of the while loop
        % Step (5): If Vk < vi, set i=i-1; otherwise, Vk ¡Ý vi, set i=i+1, until Vk¡ÊBi
        elseif S_V(k,1)<Bucket(k,1)
        Pointer_i=Pointer_i-1;
        elseif S_V(k,1)>=Bucket(k,1)+dV
        Pointer_i=Pointer_i+1;                 
        end % End of the if condition
    end % Step (6): End of the while loop
end % Step (7): End of the for loop
toc % For time counting
dQ_dV_Q=N_V./n/dV; % Transfer the counting data from NV to , according to Eqn. (3).
V1 = V1';
bar(V1,dQ_dV_Q);
%bar(V1,dQ_dV_Q(1:end-1)); % Plot the incremental capacity curve calculated by the LEAN method.
%%
x1 = [];
x2 = [];
y11 = y1+2;y22 = y2+2;

ax1 = subplot(2,1,1);
bar(x1,y1,1,'FaceColor',[51,102,153]/255);
hold on 
plot(x1,y11,'LineWidth',2,'Color',[239,0,0]/255);
box on
grid on
ylabel('IC(Ah V^-^1)','FontSize',12);
xlabel('Voltage(V)','FontSize',12);

ax1 = subplot(2,1,2);
bar(x2,y2,1,'FaceColor',[51,102,153]/255);
hold on
plot(x2,y22,'LineWidth',2,'Color',[239,0,0]/255);
box on
grid on
ylabel('IC(Ah V^-^1)','FontSize',12);
xlabel('Voltage(V)','FontSize',12);

%%
ax1 = subplot(2,1,1);
bar(V1(1,2:end),Q_V_G,1,'FaceColor',[51,102,153]/255,'EdgeColor',[24,4,5]/255);
hold on
plot(V1(1,2:end),Q_V_G,'k-*','Color',[239,0,0]/255,'LineWidth',2);
box on
grid on
h=legend('Rectangular Block','Discrete Point');
ylabel('IC(Ah V^-^1)','FontSize',12);
xlabel('Voltage(V)','FontSize',12);

ax1 = subplot(2,1,2);
bar(x1,y1,1,'FaceColor',[51,102,153]/255);
hold on
plot(x1,y1,'k-*','Color',[239,0,0]/255,'LineWidth',2);
box on
grid on
h=legend('Rectangular Block','Discrete Point');
ylabel('IC(Ah V^-^1)','FontSize',12);
xlabel('Voltage(V)','FontSize',12);







