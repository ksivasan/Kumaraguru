%   Kumaraguru Sivasankaran
%   26 April 2017
%   Finding the range of features for given target variable
clear all;
clc;

X=-5+10*rand(1000,2);               %   uniform distribution r = a + (b-a)*rand()
X(:,3) = X(:,1).^2+X(:,2).^2;       %   Formula used y = x1^2+x2^2

prompt = 'Enter the value of y between 0 to 50 \n';
Y = input(prompt);

%   tune the range
epsilon=0.5;

%   count the no. of classes to get distribution
class_1=0;
class_2=0;
class_3=0;

%   creating two different classes
for i=1:length(X)
    if (X(i,3) <= Y+epsilon) && (X(i,3) >= Y-epsilon)
        X(i,4) = 0;
        class_1=class_1+1;
    elseif (X(i,3) < Y-epsilon)
        X(i,4) = 1;
        class_2=class_2+1;
    else
        X(i,4)=1;
        class_3=class_3+1;
    end
end

rng(1);     %for reproduceability

%   classifier
cl=fitcsvm(X(:,1:2),X(:,4),'Kernelfunction','rbf','Standardize','On',...
    'BoxConstraint',Inf,'ClassNames',unique(X(:,4)));

%   crossvalidated to 10 fold and and generalized classifier obtained
cvcl=crossval(cl);

%   to see the first classifier out of 10
firstmodel=cvcl.Trained{1};

%   total error
Generalization_error=kfoldLoss(cvcl);

%%
% redefining data
data3=X(:,1:2);
theclass=X(:,4);

% Predict scores over the grid
d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(data3(:,1)):d:max(data3(:,1)),...
    min(data3(:,2)):d:max(data3(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
[label,scores] = predict(cl,xGrid);
ScorePosteriorProb = fitPosterior(cl,data3,theclass);

% Plot the data and the decision boundary
figure;
h(1:2) = gscatter(data3(:,1),data3(:,2),theclass,'rb','.');
hold on
ezpolar(@(x)5);
h(3) = plot(data3(cl.IsSupportVector,1),data3(cl.IsSupportVector,2),'ko');
contour(x1Grid,x2Grid,reshape(scores(:,2),size(x1Grid)),[0 0],'k');
legend(h,{'-1','+1','Support Vectors'});
axis equal
hold off

%%
[label1,scores1]=predict(cl,data3);

%%
class_conf=theclass;
label_conf=label1;
for i=1:length(theclass)
    if (class_conf(i,1)==0)
        class_conf(i,2)=1;
    else
        class_conf(i,2)=0;
    end
    if (label_conf(i,1)==0)
        label_conf(i,2)=1;
    else
        label_conf(i,2)=0;
    end
end
%%
plotconfusion(class_conf,label_conf)   