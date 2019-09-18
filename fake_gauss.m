l_lp1 = fix([1:24].^0.5).*(1+fix([1:24].^0.5));

fake_signal_one_dipole = coils_signal(200,1);
gauss_fake_one_dipole = l_lp1.*gcoeff3m(fake_signal_one_dipole(:,1:31),probepos());


fake_signal_dipole = coils_signal(200,2);
gauss_fake_dipole = l_lp1.*gcoeff3m(fake_signal_dipole(:,1:31),probepos());

fake_signal_quad = coils_signal(200,3);
gauss_fake_quad = l_lp1.*gcoeff3m(fake_signal_quad(:,1:31),probepos());

figure(15)
plot(1:24,gauss_fake_one_dipole,'r',1:24,gauss_fake_dipole,'g',1:24,gauss_fake_quad,'b')

title('Normalized B fields from specific gauss coefficients induced by a current in external coil(s)')


namesx = cell(1,24);

for k =1:24
    [l, m] = k2lm(k);
    namesx{k} = [ 'l' num2str(l) ' m' num2str(m)];
end
    
legend('One coil dipole','Two coils dipole','Two coils quadrupole')

set(gca,'xtick',[1:24],'xticklabel',namesx)
xtickangle(60)

ylabel('Normalized magnetic field induced by the coil(s)')


figure(16)
plot(1:33,fake_signal_one_dipole,'r',1:33,fake_signal_dipole,'g',1:33,fake_signal_quad,'b')

title('Probes sensitivity in Volts/200 A')
legend('One coil dipole','Two coils dipole','Two coils quadrupole')

xlabel('Probe number')
ylabel('Probes sensitivity, V/200A')
xL = xlim;
line(xL, [0 0]);  %y-axis
