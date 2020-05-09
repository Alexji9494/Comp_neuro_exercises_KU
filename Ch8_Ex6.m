clear all; clc;
% E(w) = (w-2)^2;
% E'(w) = 2w-4;
% temp_w = [];
% temp_e = [];
% wspan = [0 10000];
% y0 = 5;
% figure(1)
% for eps = [0.01, 0.1, 1, 2, 3]
%     [w, y] = ode45(@(w, e)2*w-4, wspan, y0);
%     new_w = w-eps*y;
%     plot(w, new_w, '-o')
%     hold on
% end
w = 5;
temp_w = [];
temp_e = [];
eps = [0.01, 0.1, 1, 2, 3];
for ii = eps
    w=5;
    for i = [1:10000]
        w = w-ii*(2*w-4);
        e = (w-2)^2;
        temp_w = [temp_w; w;];
        temp_e = [temp_e; e;];
    end
end
figure(1)
for num = [10000, 20000, 30000]
    plot(1:10000, temp_e(num-9999:num))
    hold on
end
% figure(2)
% plot(1:10000, temp_e(300:399))

% temp_y = [temp_e(100), temp_e(200), temp_e(300), temp_e(400), temp_e(500)] 
% scatter([1, 2, 3, 4, 5], temp_y)
