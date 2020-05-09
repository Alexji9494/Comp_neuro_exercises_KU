%%Parameters
input = rand(1, 512)*2-1;
output = zeros(1, 512);
spatial_gap = 10/512;
neuron = (1 : 512)*spatial_gap;
M = rand(512); 
W = rand(512);
I = eye(512);
K = inv(M-I);
Q = input*input';
sigma_k = 0.066;
lr = 0.01;
color=[0,0,0;1,1,1]
%%Equations
for n = 1:512
    for m = 1:512
        K(n, m) = exp(-(n-m)^2/(2*sigma_k^2)) - 1/9*exp(-(n-m)^2/(18*(sigma_k^2)));
    end
%     figure(1)
%     W = W+lr*(K*W*Q);
%     W(find(W>=1))=1;
%     W(find(W<=0))=0;
%     scatter(1:512, W(1:512))
%     drawnow
%     WWW=median(W,1);
    WWW = W;
    WWW(find(WWW>=0.5))=1;
    WWW(find(WWW<0.5))=0;
    heatmap(WWW)
    drawnow
end