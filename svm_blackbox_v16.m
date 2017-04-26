%   Kumaraguru Sivasankaran
%   26 April 2017
%   Finding the range of features for given target variable
clear all;
clc;

X=-5+10*rand(1000,2);               %   uniform distribution r = a + (b-a)*rand()
X(:,3) = X(:,1).^2+X(:,2).^2;       %   Formula used y = x1^2+x2^2

%   for receiving input from user
% prompt = 'Enter the value of y between 0 to 50 \n';
% Y = input(prompt);
Y=16;
%   tune the range
epsilon=0.5;

%   count the no. of classes to get distribution
class_1=0;
class_2=0;
%   creating two different classes
for i=1:length(X)
    if (X(i,3) <= Y+epsilon) && (X(i,3) >= Y-epsilon)
        X(i,4) = 0;
        class_1=class_1+1;
    else
        X(i,4)=1;
        class_2=class_2+1;
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

%   redefining data
data3=X(:,1:2);
theclass=X(:,4);

%   predict for given data
[label1,scores1]=predict(cl,data3);

%   finding accuracy truepositive & truenegative
tp_a=0;
tp_b=0;
tn_a=0;
tn_b=0;
for i=1:length(X)
    if (theclass(i,1)==0)
        if (label1(i,1)==0)
            tp_a=tp_a+1;
            index(tp_a)=tp_a;
        else
            tn_a=tn_a+1;
        end
    else
        if (label1(i,1)==1)
            tp_b=tp_b+1;
        else
            tn_b=tn_b+1;
        end
    end
end

%   finding x for Y in data
list_X=X(index,1:4);

% Predict scores over the data
d = 0.05;
[x1Grid,x2Grid] = meshgrid(min(data3(:,1)):d:max(data3(:,1)),...
    min(data3(:,2)):d:max(data3(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
[label,scores] = predict(cl,xGrid);
ScorePosteriorProb = fitPosterior(cl,xGrid,label);
xGrid(:,3)=xGrid(:,1).^2+xGrid(:,2).^2;
tp_a1=0;
tp_b1=0;
tn_a1=0;
tn_b1=0;

for i=1:length(xGrid)
    if (xGrid(i,3)>=Y-epsilon) && (xGrid(i,3)<=Y+epsilon)
        if (label(i,1)==0)
            tp_a1=tp_a1+1;
            index1(tp_a1)=tp_a1;
        else
            tn_a1=tn_a1+1;
        end
    else
        if (label(i,1)==1)
            tp_b1=tp_b1+1;
        else
            tn_b1=tn_b1+1;
        end
    end
end

list_all_X=xGrid(index1,:);

% Plot the data and the decision boundary
figure;
h(1:2) = gscatter(xGrid(:,1),xGrid(:,2),label,'rb','.');
hold on
ezpolar(@(x)5);
h(3) = plot(xGrid(cl.IsSupportVector,1),xGrid(cl.IsSupportVector,2),'ko');
contour(x1Grid,x2Grid,reshape(scores(:,2),size(x1Grid)),[0 0],'k');
legend(h,{'-1','+1','Support Vectors'});
axis equal
hold off     
