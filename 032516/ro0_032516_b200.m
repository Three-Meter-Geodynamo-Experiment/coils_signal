%% dipole field ~200A with Ro=0

import = 1;
% recalc = 1;
% plotting = 1;
% save_folder = '';

if import 
    t1 =  [53480, 53612];
    t2 =  [53600, 53698];
    tb1 = t1(1);
    tb2 = t2(1);
    record200 = grab_3mdata_chunks('032516',t1,t2,tb1,tb2); 
end