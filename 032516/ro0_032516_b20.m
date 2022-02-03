%% dipole field ~20A with Ro=0

import = 1;
% recalc = 1;
% plotting = 1;
% save_folder = '';

if import 
    t1 =  [57370, 57434];
    t2 =  [57424, 57526];
    tb1 = t1(1);
    tb2 = t2(1);
    record20 = grab_3mdata_chunks('032516',t1,t2,tb1,tb2); 
    clearvars t1 t2 tb1 tb2 import
end