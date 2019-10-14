%Plotter to signaler for forksjellige offset for å finne tiden.
figure
plot(t(t > 0 & t < 0.8), abs(y1(t > 0 & t < 0.8,offset1==800)),...
    t(t > 0 & t < 0.8), abs(y1(t > 0 & t < 0.8,offset1==300)))

title('Plott av direkte ankomst, to forskjellige offset.')
xlabel('Tid(s)')
ylabel('Amplitude')
legend('Offset=800','Offset=300')