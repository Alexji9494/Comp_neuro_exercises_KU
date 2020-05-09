clear all; clc;
%%Parameters
input_num = 10;
input_pool = [1, -1];
s_b = [-1:.1:1];
threshold = datasample(s_b, input_num);

input = datasample(input_pool, 10);

weight = rand(1, input_num)*2-1;
pre_output = input.*weight-threshold;
lr = 0.01; 

if sum(pre_output) >=0
    output = 1;
else output = -1;
end

alpha = 0.01; %This is the alpha value of Hebbian learning

%For specific reasons....
pre_output_H = pre_output;
weight_D = weight;
weight_P = weight;
threshold_P = threshold;
input_neuron = exp(-0.5.*((input-threshold).^2));
exp_out = cos(0.6.*input);

for i = 1: 1000 % Train the perceptron
    %Hebbian learning rule
    weight_H = mean(pre_output_H.*input)/alpha;

    %Delta learning rule
    weight_D = weight_D + lr.*((exp_out - weight_D.*input_neuron).*input_neuron);

    %Perceptron learning rule
%     weight_P = weight_P + lr/2*()
%     threshold_P = threshold_P -lr/2*()
end

output_H = weight_H .* input - threshold;
output_D = weight_D .* input - threshold;
output_P = weight_P .* input - threshold_P;

figure(1)
% plot(1:length(output_H), output_H)
hold on
plot(1:length(output_D), output_D)
hold on
plot(1:length(output_P), output_P)
