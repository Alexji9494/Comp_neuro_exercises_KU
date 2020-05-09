%%Parameters
weight = rand(1, 1)*2-1;
weight2 = weight;
r = 1;
lr = 0.01;

w_history = [weight];
w2_history = [weight2];
%%EQUATIONS
for i = 1:1000
    weight = mean(weight + lr.*(r-weight));
    weight2 = mean(weight2+ lr.*(r-weight2)^2);
    w_history = [w_history; weight;];
    w2_history = [w2_history; weight2;];
end

figure(1)
scatter(1:length(w_history), w_history);
hold on
scatter(1:length(w2_history), w2_history);
hold on

% lr = 2;
% varience = var()
% %%EQUATIONS
% for i = 1:100
%     weight2 = mean(weight2+ lr.*(r-weight2)^2);
%     w2_history = [w2_history; weight2;];
% end
% figure(2)



