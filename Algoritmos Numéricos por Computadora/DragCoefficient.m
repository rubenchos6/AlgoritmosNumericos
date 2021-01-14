dragData= readtable('VehicleDragData.csv','HeaderLines',3);
plot(dragData.Velocity, dragData.Force, 'rx');
hold on;

x=dragData.Velocity.^2;
coeffs=polyfit(x, dragData.Force,1);
gamma=coeffs(1);
vfit = (15:5:150)';
Ffit= gamma*vfit.^2;
y1= plot(vfit, Ffit, 'b--','LineWidth',2);
hold off;
