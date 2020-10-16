%{
    author:Lyn
    create:2020.10.15
%}
function Ethanol_water(WB,a,M,g)
p1=polyfit(WB,a,3);             %三次拟合
rangeWB =0:0.05:1;              %范围0~1,以0.05为步长
a1=polyval(p1,rangeWB);         %算出区域内拟合曲线的所有值
disp('a-WB%多项式曲线公式')
a_=poly2str(p1,'WB%')
p2=polyder(p1);                 %多项式求导
ak=polyval(p2,M);
yb=polyval(p1,M);
k=ak;                           %切线斜率
b=yb-k*M;                       %切线截距
aL=polyval([k,b],rangeWB);      %以切线斜率和截距算大小
aA=aL(1);                       %读取切线在质量分数WB%=0的比容a的大小,即aA的值
disp('A(水)的偏摩尔体积')
VA=(aA*18);                     %读取切线在质量分数WB%=1的比容a的大小,即aB的值
fprintf('VA=%.2fcm^3\n',VA)     %输出VA,即A(水)的偏摩尔体积
aB=aL(end);
disp('B(酒精)的偏摩尔体积')
VB=(aB*46);
fprintf('VB=%.2fcm^3\n',VB)     %输出VB,即B(酒精)的偏摩尔体积
fprintf('%dg该液体的体积\n',g)
aa=(1-M)* aA+M*aB;           %质量分数为M时比容a的大小
V=g*aa;                         %密度为溶液总质量g和比容的乘积
fprintf('V=%.2fcm^3\n',V)
%绘图指令的一些设定
plot(rangeWB,a1,'-bo',rangeWB,aL,'-.r',M,yb,'h')
legend('a-WB拟合曲线','质量分数30%的切线','M点')
title('比容a-质量分数WB%') 
xlabel('质量分数WB%')
ylabel('比容a')
grid on