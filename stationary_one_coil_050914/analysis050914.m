%% one coil with stationary sphere and mag ramp
import = 1;

if import 
%     t1 =  [46155,46212,46310,46412,46520,46610,46706,46806,46907,47010,47111];
%     t2 =  [46196,46245,46345,46445,46545,46645,46745,46845,46945,47045,47143];
    t1 = [46155,46212,46255,46310,46356,46412,46456,46520,46556,46610,46656,46706,46756,46806,46856,46907,46957,47010,47056,47111];
    t2 = [46196,46245,46296,46345,46396,46445,46496,46545,46596,46645,46695,46745,46795,46845,46895,46945,46995,47045,47095,47143];
    tb1 = t1(1);
    tb2 = t2(1);
    record_stat_mag_ramp = grab_3mdata_chunks('050914',t1,t2,tb1,tb2); 
    clearvars t1 t2 tb1 tb2 import
end

L = length(record_stat_mag_ramp);
average_voltage_on_probes = zeros(L,33);
coil_current = zeros(L,1);

for i = 1:L
    average_voltage_on_probes(i,:) = mean(record_stat_mag_ramp{i, 3}{1, 4});
    coil_current(i) = record_stat_mag_ramp{i, 3}{1, 1}(1);
end

average_voltage_on_probes_debiassed = zeros(1+fix(L/2),33);
coil_current_debiassed = zeros(fix(1+L/2),1);

average_voltage_on_probes_debiassed(1,:) = average_voltage_on_probes(1,:);

for i = 2:2:L
    average_voltage_on_probes_debiassed(i/2+1,:) = average_voltage_on_probes(i,:) - average_voltage_on_probes(i-1,:);
    coil_current_debiassed(i/2+1) = coil_current(i) - coil_current(i-1);
end
figure(11)
plot(coil_current,average_voltage_on_probes(:,:),'.')
    
figure(12)
plot(coil_current_debiassed,average_voltage_on_probes_debiassed(:,20),'.')
    

% lets take the sum of voltages at all currents and devide over sum of currents
alpha = (sum(average_voltage_on_probes_debiassed,1))/sum(coil_current_debiassed);
alpha2= average_voltage_on_probes_debiassed(11,:)./coil_current_debiassed(11);

error_v = ((coil_current_debiassed*alpha2-average_voltage_on_probes_debiassed));
error_v_rel= (error_v./average_voltage_on_probes_debiassed).^2;
error_v_rel(1,:) = zeros(size(error_v_rel(1,:)));
figure(13)
imagesc(error_v_rel)

figure(14)
plot(error_v_rel(:,:))