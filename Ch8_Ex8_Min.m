clear
ww_train = rand(10,1);
vv_train = 2*rand(1)-1;
gamma = rand(1);
epsilon = 1e-1;
n_iter = 1000;
figure(7)
clf
hold on
for ii = 1:n_iter
    uu_train = 2*round(rand(10,1))-1;
    vv_true = 2*(sum(uu_train)>0)-1;
    vv_train = 2*(ww_train'*uu_train>gamma)-1;
    gamma = gamma-0.5*epsilon*(vv_true-vv_train);
    ww_train = ww_train+0.5*epsilon*(vv_true-vv_train)'*uu_train;
    scatter(ii,vv_true,'.r')
    scatter(ii,vv_train,'ok')
    scatter(ii,mean(ww_train),'xb')
    scatter(ii,mean(gamma),'d')
end
legend('answer','training output','average weight of perceptrons','trained threshold (gamma)')
