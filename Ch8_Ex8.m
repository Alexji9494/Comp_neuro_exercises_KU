clear all; clc;
%%Parameters
input_num = 10000;
s_b = [-10:1:10];
threshold = datasample(s_b, input_num); %Making threshold from the s_b field
weight = rand(1, input_num)*2-1; 
s = rand(1, input_num)*20-10; %input
exp_out = cos(0.6*s);
eps=0.01;
input_neuron = exp(-0.5.*((s-threshold).^2));
figure(1)
scatter(s, weight.*input_neuron)
hold on
for i = [1:10000]
    weight = weight + eps.*((exp_out - weight.*input_neuron).*input_neuron);
end

% p_v = exp((weight.*input_neuron).^2) / sum(exp((weight.*input_neuron).^2));
scatter(s, weight.*input_neuron)
hold on
scatter(s, exp_out)