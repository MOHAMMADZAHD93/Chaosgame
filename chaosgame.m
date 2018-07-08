%Choose points for triangle:
PA=[7 5];
PB=[4 1];
PC=[8 1];
%Slope for BA:
MBA=(PA(2)-PB(2))/(PA(1)-PB(1));
%Slope for AC:
MAC=(PC(2)-PA(2))/(PC(1)-PA(1));
figure
ax=axes('XLim',[PB(1)-0.2 PC(1)+0.2],'YLim',[PB(2)-0.2 PA(2)+0.2]);
LAB=line([PA(1) PB(1)],[PA(2) PB(2)],'Linewidth',1,'Color','r');
LAC=line([PA(1) PC(1)],[PA(2) PC(2)],'Linewidth',1,'Color','r');
LBC=line([PB(1) PC(1)],[PB(2) PC(2)],'Linewidth',1,'Color','r');
text(PA(1),PA(2),'A','Color','r');
text(PB(1),PB(2),'B','Color','r');
text(PC(1),PC(2),'C','Color','r');
hold on
pause(1)
%Choose a random point inside the triangle:
Px=(PC(1)-PB(1))*rand()+PB(1);
Pymax=min(MBA*(Px-PB(1))+PB(2),MAC*(Px-PA(1))+PA(2));
Py=(Pymax-PB(2))*rand()+PB(2);
plot(Px,Py,'o','MarkerFaceColor','b','MarkerSize',2,...
'MarkerEdgeColor','b');
tx=text(Px,Py,'Choose a random point');
pause(1)
%Choose a corner randomly and go to the middile point between Px,Py and
%your corner
a=rand();
if (a<=1/3) %Point A
Px=(Px+PA(1))/2;
Py=(Py+PA(2))/2;
plot(Px,Py,'o','MarkerFaceColor','b','MarkerSize',2,...
'MarkerEdgeColor','b');
tx.Position=[Px,Py];
tx.String='Midpoint to Point A';
drawnow;
elseif (a>1/3 && a<=2/3) %Point B
Px=(Px+PB(1))/2;
Py=(Py+PB(2))/2;
plot(Px,Py,'o','MarkerFaceColor','b','MarkerSize',2,...
'MarkerEdgeColor','b');
tx.Position=[Px,Py];
tx.String='Midpoint to Point B';
drawnow;
else
Px=(Px+PC(1))/2;
Py=(Py+PC(2))/2;
plot(Px,Py,'o','MarkerFaceColor','b','MarkerSize',2,...
'MarkerEdgeColor','b');
tx.Position=[Px,Py];
tx.String='Midpoint to Point C';
drawnow;
end
pause(1)
%Lets now keep iterating!:
N=20000; %Number of points
tx.Position=[4.5 4.5];
tx.String='Continue doing the same!';
for i=3:N
a=rand();
if (a<=1/3) %Point A
Px=(Px+PA(1))/2;
Py=(Py+PA(2))/2;
plot(Px,Py,'o','MarkerFaceColor','b','MarkerSize',2,...
'MarkerEdgeColor','b');
elseif (a>1/3 && a<=2/3) %Point B
Px=(Px+PB(1))/2;
Py=(Py+PB(2))/2;
plot(Px,Py,'o','MarkerFaceColor','b','MarkerSize',2,...
'MarkerEdgeColor','b');
else
Px=(Px+PC(1))/2;
Py=(Py+PC(2))/2;
plot(Px,Py,'o','MarkerFaceColor','b','MarkerSize',2,...
'MarkerEdgeColor','b');
end
pause(0.5/i)
end