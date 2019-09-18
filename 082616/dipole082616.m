% magnets wired as dipole with north up

import = 0;

if import 
    t1 = [54405,54804,54945,55067,55216,55304,55366,55546,55663,55806];
    t2 = [54789,54922,55043,55196,55294,55349,55516,55652,55795,55948];
    tb1 = t1(1);
    tb2 = t2(1);
    record = grab_3mdata_chunks('082616',t1,t2,tb1,tb2); 
    clearvars t1 t2 tb1 tb2 import
end


L = size(record,1);
average_voltage_on_probes = zeros(L,33);
coil_current = zeros(L,1);

for i = 1:L
    average_voltage_on_probes(i,:) = mean(record{i, 3}{1, 4})-mean(record{1, 3}{1, 4});
    coil_current(i) = record{i, 3}{1, 1}(1)-record{1, 3}{1, 1}(1);
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
plot(1:33,std(k_matrix)./mean(k_matrix),'.')

figure(2)
plot(1:33,mean(k_matrix),'r')
hold on
plot(1:33,coils_signal(1,2),'g')
hold off

alpha = mean(k_matrix);
figure(3)
plot(1:33,coils_signal(1,2)./mean(k_matrix))

figure(4)
plot(average_voltage_on_probes(:,33))

