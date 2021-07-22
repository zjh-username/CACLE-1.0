%% Ô¤²â
train_number_1 = 1;
train_number_2 = 3400;
x_train_1 = data(train_number_1:train_number_2,1);
x_train_2 = data(train_number_1:train_number_2,2);
x_train_3 = data(train_number_1:train_number_2,3);
y_train = data(train_number_1:train_number_2,4);
x_train = [x_train_1,x_train_2,x_train_3];

x_test_1 = data(train_number_2+1:end,1);
x_test_2 = data(train_number_2+1:end,2);
x_test_3 = data(train_number_2+1:end,3);
x_test = [x_test_1,x_test_2,x_test_3];
y_test = data(train_number_2+1:end,4);

gprMdl = fitrgp(x_train,y_train,'Basis','constant',...
'FitMethod','exact','PredictMethod','exact',...
'KernelFunction','ardrationalquadratic','Standardize',1);

tic
[ytestpred,~,ytestci] = predict(gprMdl,x_test);
ytrainpred = resubPredict(gprMdl);
toc

hold on
plot(ytrainpred);
plot(y_train);

plot(y_test,'r');
hold on;
plot(ytestpred,'b');
plot(ytestci(:,1),'k:');
plot(ytestci(:,2),'k:');

APE = 100*abs(ytestpred-y_test)./y_test;
plot(APE)
legend('Actual response','GPR predictions',...
'95% lower','95% upper','Location','Best');

%% ºó´¦Àí
cycle_number = 700;
cycle = 1:cycle_number;
eol = y_test(1)*0.8;

for i = 1:cycle_number
    if y_test(i) <= eol
        break
    end
end


for i = 1:cycle_number
    if ytestpred(i) <= eol
        break
    end
end

low = ytestci(:,1)';
up = ytestci(:,2)';
low = low(1:cycle_number);
up = up(1:cycle_number);
hold on
fill([cycle fliplr(cycle)],[(low) fliplr(up)],'r','FaceColor',[1 0.8 0.8],'EdgeColor','none');
plot(cycle,ytestpred(1:cycle_number)','Color',[26,111,223]/255,'LineWidth',2);
plot(cycle,y_test(1:cycle_number)','Color',[30,30,32]/255,'LineWidth',2);
line([0 cycle_number],[eol eol],'linestyle','--', 'Color',[239,0,0]/255, 'LineWidth', 2);
grid on
box on
h=legend('95% Confidence Interval','Estimated Capacity','Real Capacity');
legend('boxoff')
set(h,'FontSize',12')
ylabel('Capacity(Ah)','FontSize',12);
xlabel('Cycle','FontSize',12);

% Îó²î
MAPE = mean(APE(1:cycle_number));
plot(cycle,APE(1:cycle_number),'Color',[51,102,153]/255,'Marker','d','LineWidth', 1);
line([0 cycle_number],[MAPE MAPE],'linestyle','-.', 'Color',[251,101,1]/255, 'LineWidth', 2);
grid on
box on
h=legend('APE','MAPE');
set(h,'FontSize',12')
ylabel('Absolute Percentage Error(%)','FontSize',12);
xlabel('Cycle','FontSize',12);

RMSE = sqrt(sum((ytestpred-y_test).^2)/cycle_number);
