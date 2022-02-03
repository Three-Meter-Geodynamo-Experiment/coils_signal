
import = 1;

if import 
    t1 = 10+[66553,66709,66812,66917,67019,67120,67218,67335,67447];
    t2 = -3+[66703,66806,66910,67013,67114,67212,67328,67439,67540];
    tb1 = t1(1);
    tb2 = t2(1);
    record = grab_3mdata_chunks('020222',t1,t2,tb1,tb2); 
    clearvars t1 t2 tb1 tb2 import
end


L = size(record,1);
average_voltage_on_probes = zeros(L,35);
coil_current = zeros(L,1);

for i = 1:L
    average_voltage_on_probes(i,:) = mean(record{i, 3}{1, 4})-mean(record{1, 3}{1, 4});
    coil_current(i) = record{i, 3}{1, 1}(1)-record{1, 3}{1, 1}(1);
end

figure(11)
plot(coil_current,average_voltage_on_probes(:,:),'.')

%% evaluating k's
k_matrix = zeros(L-1,35);
for i = 2:L
    k_matrix(i-1,:) = average_voltage_on_probes(i,:)./coil_current(i);
end


figure(13)
plot(coil_current(2:end),k_matrix(:,:),'.')
figure(1)
plot(1:35,std(k_matrix)./mean(k_matrix),'.')

figure(2)
plot(1:35,mean(k_matrix),'r')
hold on
plot(1:35,coils_signal(1,7),'g')
plot(1:33,coils_signal(1,2),'k')
hold off

alpha = mean(k_matrix);
figure(3)
plot(1:33,coils_signal(1,1)./mean(k_matrix(1:33)))

figure(4)
plot(average_voltage_on_probes(:,35))
%%
figure(5)
plot(k_matrix(:,14))