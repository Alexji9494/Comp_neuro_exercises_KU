clear all; clc;

%%Parameters
% input_pool = [1, -1];
input_num = 1;
% input = datasample(input_pool, input_num);
% input = rand(1, input_num)*2-1;
input = 1;
weight = 0;
weight_2 = weight;
lr = 0.05;
w_history = [weight];
w_history_2 = [weight];

reward = 1;
for i = 1:100
    weight = weight + lr.*(reward-weight.*input).*input;
    w_history = [w_history; weight;];
end

% for i = 1:200
%     input_2 = rand(1, input_num)*2-1;
%     weight_2 = weight_2 + lr.*(reward-weight_2.*input_2).*input_2;
%     w_history_2 = [w_history_2; weight_2;];
% end

reward = 0;
for i = 101:200
    weight = weight + lr.*(reward-weight.*input).*input;
    w_history = [w_history; weight;];
end

r_2 = zeros(200, 1);
r_2(randi([1, 200], 1, 100)) = 1;
w_history_3 = [];
weight_3 = weight;
input_3=1;

for i = 1:100
    weight_3 = weight_3 + lr.*(r_2(i)-weight_3*input_3)*input_3;
    w_history_3 = [w_history_3; weight_3;];
end
for i = 101:200
%     input_3 = rand(1, input_num)*2-1;
    input_31 = rand(1, input_num)*2-1;
    input_total = input_3 + input_31;
    weight_3 = weight_3 + lr.*(r_2(i)-weight_3*input_total)*input_total;
    w_history_3 = [w_history_3; weight_3;];
end

figure(1)
scatter(1:length(w_history), w_history);
hold on
% scatter(1:length(w_history), w_history_2);
hold on
scatter(1:length(w_history_3), w_history_3);