% magnets wired as quadrupole with poles both south and equator north

import = 0;

if import 
    t1 = [51531,51609,51758];
    t2 = [51598,51747,51883];
    tb1 = t1(1);
    tb2 = t2(1);
    record = grab_3mdata_chunks('032416',t1,t2,tb1,tb2); 
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

k20 = average_voltage_on_probes(3,:)./coil_current(3)
k170 = average_voltage_on_probes(2,:)./coil_current(2)

err = (k20-k170)./k170