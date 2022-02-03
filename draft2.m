clc
d24 = zeros(1,80);
d24(1,64) = 1;
I = 20;
coil_sig =coils_signal(I,5);
coil_sig = coil_sig(1:31);
d31 = gauss2_hall(d24,probepos()) + coil_sig;

% first linear data
d24_t=gcoeff3m(d31,probepos());


d24_t2=gcoeff3m(gauss2_hall(d24,probepos()),probepos());
d24_t2 = d24_t2 + gcoeff3m(coil_sig,probepos());

figure(4)
scatter(1:24,d24_t./d24_t2)
%%

I_matr = 1:10:200;
G24_big_array = zeros(size(I_matr,2),24);
D31_big_array = zeros(size(I_matr,2),31);
D31_big_array2 = zeros(size(I_matr,2),31);
for i_curr = 1:size(I_matr,2)
    coil_sig = coils_signal(I_matr(i_curr),3);
    I = I_matr(i_curr);
    D31_big_array(i_curr,:) = coil_sig/I ;
    G24_big_array(i_curr,:) = gcoeff3m(coil_sig(:,1:31),probepos())/I;
%     D31_big_array2(i_curr,:)= 
end

figure(3)
waterfall(G24_big_array)

%%
I =100;
coil_sig = coils_signal(I,3);
g24 = gcoeff3m(coil_sig(1,1:31),probepos());
d31 = gauss2_hall(g24,probepos());

figure(6)
scatter(1:31,abs(coil_sig(1,1:31)-d31)./coil_sig(1,1:31))