%Shao-Fang Wang 2018
%file name
fname = 'jm_stimuli_param.csv';
fname_train = 'jm_stimuli_param_train.csv';
fname_test = 'jm_stimuli_param_test.csv';
%specify training features 
F1 = [2,3];
F2 = [0,2,3,5];
F3 = [0,2,3,5];


%%
%category A: training
%F1_freq = [6 10 6 4];
%F2_freq = [9 9 4 4];

%%parameters for CatA
CatA_train_feature_set = [
    2 0 0;
    2 0 2;
    2 0 3;
    2 0 5;
    2 2 0;
    2 2 2;
    2 2 3;
    2 2 5;
    ];%3 features + category label

CatA_train_feature_set = [CatA_train_feature_set ones(length(temp),1)];

%%
%category B: training
%F1_freq = [4 6 10 6];
%F2_freq = [4 4 9 9];
%%parameters for CatB
CatB_train_feature_set = [
    3 3 0;
    3 3 2;
    3 3 3;
    3 3 5;
    3 5 0;
    3 5 2;
    3 5 3;
    3 5 5;
    ];%3 features + category label
CatB_train_feature_set = [CatB_train_feature_set zeros(length(temp),1)];

Cat_train_set = [CatA_train_feature_set; CatB_train_feature_set];

%%%Plot
c = [0.9 0.4 0.4];%color for category A (red)
c2 = [0.4 0.4 0.9]; % color for category B (blue)
C = [];
    for ii = 1:size(CatA_train_feature_set,1)
        C = [C; c];
    end

    for ii = 1:size(CatB_train_feature_set,1)
        C = [C; c2];
    end
    
for ii = 10:10:100
h=figure(1);scatter3(Cat_train_set(:,1),Cat_train_set(:,2),Cat_train_set(:,3),120,C,'fill')
view(ii,30)
img_name = ['stimuli_dimension_train_',num2str(ii,'%03d'),'.jpg'];
saveas(h,img_name)
pause
end

%%save training stimuli parameters
csvwrite(fname_train,Cat_train_set)

%% New stimuli
CatA_train_feature_set_new = [
   2 1 0;
   2 1 2;
   2 1 3;
   2 1 5;
   2 0 1;
   2 0 4;
   2 2 1;
   2 2 4;
   ];

CatB_train_feature_set_new = [
    3 4 0;
    3 4 2;
    3 4 3;
    3 4 5;
    3 3 1;
    3 3 4;
    3 5 1;
    3 5 4;
];

CatA_new = [CatA_train_feature_set_new ones(size(CatA_train_feature_set_new,1),1)];
CatB_new = [CatB_train_feature_set_new zeros(size(CatB_train_feature_set_new,1),1)];

New_set = [CatA_new; CatB_new];
%%save training stimuli parameters
csvwrite(fname_test,New_set)

%%plot
c = [0.6 0.2 0.3];%color for category A (red)
c2 = [0.3 0.2 0.6]; % color for category B (blue)
%C = [];
     for ii = 1:size(CatA_train_feature_set_new,1)
         C = [C; c];
     end
 
     for ii = 1:size(CatB_train_feature_set_new,1)
         C = [C; c2];
     end

%%% labels for train and test stimuli sets
Cat_train_set = [Cat_train_set ones(size(Cat_train_set,1),1)]
New_set = [New_set zeros(size(New_set,1),1)];
Cat = [Cat_train_set; New_set];

%%%Plot
for ii = 10:10:100
h=figure(2);scatter3(Cat(:,1),Cat(:,2),Cat(:,3),120,C,'fill')
view(ii,30)
img_name = ['stimuli_dimension_train_test_',num2str(ii,'%03d'),'.jpg'];
saveas(h,img_name)
pause
end

h=figure(3);scatter3(New_set(:,1),New_set(:,2),New_set(:,3),120,'fill')
img_name = ['jm_stimuli_dimension_test.jpg'];
saveas(h,img_name)
%% save stimuli parameters
csvwrite(fname,Cat)
%parameters for three features, category label, and train/test label

