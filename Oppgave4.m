%Plotter refleksjoner og multipler
figure
plot(t(t > 0.5 & t < 3.5), y1(t > 0.5 & t < 3.5,1))
title('Nærtrase. Plott av første primærrefleksjon og de tre første havbunnsmultiplene.')
xlabel('Tid(s), 0.5s til 3.5s')
ylabel('Amplitude')

figure
plot(t(t > 1.5 & t < 4), y1(t > 1.5 & t < 4,1))
title('Nærtrase. Plott av refleksjon og multipler fra grunneste sedementærlag.')
xlabel('Tid(s), 1.5s til 4s')
ylabel('Amplitude')

figure
imagesc(offset1,t*1000,y1)

%Lager kryss og sirkler på gatherplott
colormap gray
colorbar
caxis([-0.0025,0.0025])
hold on;
plot(100, 780, 'bluex','LineWidth',2,'MarkerSize',7)
plot(100, 1572, 'blueo','LineWidth',2,'MarkerSize',7)
plot(100, 2324, 'blueo','LineWidth',2,'MarkerSize',7)
plot(100, 3116, 'blueo','LineWidth',2,'MarkerSize',7)

plot(100, 1572, 'yellowx','LineWidth',2,'MarkerSize',7)
plot(100, 2270, 'yellowo','LineWidth',2,'MarkerSize',7)
plot(100, 3040, 'yellowo','LineWidth',2,'MarkerSize',7)
title('Gather filtrert med h1')
xlabel('Offset(m)')
ylabel('Tid(ms)')
