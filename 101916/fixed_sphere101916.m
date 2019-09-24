% fixed sphere, molten sodium 

import = 0;

if import 
    t1 = [48366,48607,48805,49006,49208,49406];
    t2 = [48597,48795,48995,49196,49395,49595];
    tb1 = t1(1);
    tb2 = t2(1);
    record_101916 = grab_3mdata_chunks('101916',t1,t2,tb1,tb2); 
    clearvars t1 t2 tb1 tb2 import
end


L = size(record_101816,1);
average_voltage_on_probes = zeros(L,33);
coil_current = zeros(L,1);

for i = 1:L
    average_voltage_on_probes(i,:) = mean(record_101816{i, 3}{1, 4})-mean(record_101816{1, 3}{1, 4});
    coil_current(i) = record_101816{i, 3}{1, 1}(1)-record_101816{1, 3}{1, 1}(1);
end

figure(11)
plot(coil_current,average_voltage_on_probes(:,:),'.')

%% evaluating k's
k_matrix = zeros(L-1,33);
for i = 2:L
    k_matrix(i-1,:) = average_voltage_on_probes(i,:)./coil_current(i);
end

% 
% figure(13)
% plot(coil_current(2:end),k_matrix(:,:),'.')
figure(1)
plot(1:33,std(k_matrix)./abs(mean(k_matrix)),'.')
title('Relative standard deviation of alpha');

figure(2)
plot(1:33,mean(k_matrix),'r')
hold on
plot(1:33,coils_signal(1,2),'g')
hold off
title('Evaluated alpha compared to what we have in coils signal.m');
legend(["current alphas";"from the coils signal.m"])


alpha = mean(k_matrix);

figure(4)
plot(coil_current,average_voltage_on_probes(:,33))
title('Phi probe mean value signal s a function of current')
