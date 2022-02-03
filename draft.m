I = 100;

current_signal = coils_signal(I,5);
current_signal = current_signal(:,1:31);

fake_glm = zeros(1,24);
fake_glm(1) = 1;
fake_glm(4) = 1/6;
current_signal = 1*gauss2_hall(fake_glm,probepos())+0*ones(1,31)+0*rand(1,31);

gl10_0 = zeros(1,80);
gl10_0(1,36) = 1/300;
current_signal = current_signal + 1*gauss2_hall(gl10_0,probepos());


% current_signal = gauss2_hall(ones(1,24),probepos());
g_lm_cs = gcoeff3m(current_signal,probepos());

d31 = gauss2_hall(g_lm_cs,probepos());
d24 = gcoeff3m(d31 ,probepos());
% 
abs_err = (current_signal - d31)

rel_err = abs_err./abs(current_signal);

figure(1)
subplot(1,2,1)
plot(1:31,current_signal,'r',1:31,d31,'b')

subplot(1,2,2)
plot(rel_err)

% 
% figure(2)
% subplot(1,2,1)
% plot(g_lm_cs)
% 
% subplot(1,2,2)
% plot(d24)
% 
% d24;
% % 
% % % %%
% d24_fake = zeros(1,24);
% d24_fake(15) = 1;
% 
% error_g2h = gauss2_hall(10*d24_fake,probepos())./ gauss2_hall(d24_fake,probepos());
% figure(3)
% scatter(1:31,error_g2h)
% %%
% clc
% df24 = ones(1,24);
% 
% df31 = gauss2_hall(df24,probepos());
% df24_2=gcoeff3m(df31,probepos());
% 
% df31_2=gauss2_hall(df24_2,probepos());
% % df24 - df24_2
% df31_2 - df31
