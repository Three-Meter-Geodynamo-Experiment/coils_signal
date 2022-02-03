plotting_logs('110521');
% get_t1_t2_from_exp
import = 1;

if import 
    t1 = [40980,41086,41125,41166,41206];
    t2 = [41078,41117,41157,41197,41237];
    tb1 = t1(1);
    tb2 = t2(1);
    record = grab_3mdata_chunks('110521',t1,t2,tb1,tb2); 
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
probes = [1,12,32,34,33,35];
plot(coil_current,average_voltage_on_probes(:,probes))
legend(num2str(probes'))

k20 = average_voltage_on_probes(3,:)./coil_current(3)
k170 = average_voltage_on_probes(2,:)./coil_current(2)

err = (k20-k170)./k170