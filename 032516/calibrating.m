data0_20 = record20{1, 3}{1, 4};
data20=    record20{2, 3}{1, 4};
data0_200= record200{1, 3}{1, 4};
data200=   record200{2, 3}{1, 4};

b20  = record20{2, 3}{1, 1}(1);
b200 = record200{2, 3}{1, 1}(1);
% 2*(mean(data0_20)-mean(data0_200))./(std(data0_20)+std(data0_200))

k20 =  (mean(data20)-mean(data0_20))/b20
k200= (mean(data200)-mean(data0_200))/b200

figure(1)
plot(k20,k200,'.')
line([-0.023 0.023], [-0.023 0.023],'Color','k');

figure(2)
plot(1:33,k20,1:33,k200)

% figure(3)
% plot(data0_200(:,13))
% 
% 




% std(data0_20)./(mean(data20)-mean(data0_20));
% %%
% % figure spectrum
% remove_base = 1;
% remove_noise_level = 1;
% 
% channel=13;
% p020 = 10/log(10)*log(pwelch(data0_20(:,channel)-remove_base*mean(data0_20(:,channel))));
% p020 = p020 - mean(p020)*remove_noise_level;
% figure(14)
% l0 = length(p020);
% f0 = 128*(0:l0-1)/(l0-1);
% 
% p20 = 10/log(10)*log(pwelch(data20(:,channel)-remove_base*mean(data20(:,channel))));
% p20 = p20 - mean(p20)*remove_noise_level;
% l20 = length(p20);
% f20 = 128*(0:l20-1)/(l20-1);
% 
% p200 = 10/log(10)*log(pwelch(data200(:,channel)-remove_base*mean(data200(:,channel))));
% p200 = p200 - mean(p200)*remove_noise_level;
% l200 = length(p200);
% f200 = 128*(0:l200-1)/(l200-1);
% 
% % plot(f0,p020,'--b',f20,p20,'--r',f200,p200,'--g')
% % xlim([0 9])
% %%
