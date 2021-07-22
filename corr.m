%% 
count = 1;
Y = [];
for i =1:500
   if i == count*10
       count = count+1;
       Y(1,count) = data(i);
   end
end
Y = Y(2:end)';
r2 = corr(X' , Y' , 'type' , 'Spearman');
r1=corr(X' , Y' ,'type','pearson');
%%
x = [];
y = [];
%ax1 = subplot(2,1,1);
scatter(x1,y,200,'MarkerFaceColor',[242 159 5]/255,'LineWidth',1.5);
box on
grid on
ylabel('Capacity(Ah)','FontSize',12);
xlabel('Area','FontSize',12);

ax1 = subplot(2,1,2);
scatter(x2,y,100,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
box on
grid on
ylabel('Capacity(Ah)','FontSize',12);
xlabel('Area 2(Ah)','FontSize',12);

%scatter(x,y,sz,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5)

%%
x1 = 1:600;
x2 = 1:700;
plot(x1,cs_33,x1,cs_34,x1,cs_36,'LineWidth',3);
box on
grid on
h=legend('CS2\_33','CS2\_34','CS2\_36');
set(h,'FontSize',12')
legend('boxoff')
ylabel('Capacity(Ah)','FontSize',12);
xlabel('Cycle','FontSize',12);



plot(x1,cs_35,x2,cs_37,x2,cs_38,'LineWidth',3);
box on
grid on
h=legend('CS2\_35','CS2\_37','CS2\_38');
set(h,'FontSize',12')
legend('boxoff')
ylabel('Capacity(Ah)','FontSize',12);
xlabel('Cycle','FontSize',12);

%%












