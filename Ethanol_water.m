%{
    author:Lyn
    create:2020.10.15
%}
function Ethanol_water(WB,a,M,g)
p1=polyfit(WB,a,3);             %�������
rangeWB =0:0.05:1;              %��Χ0~1,��0.05Ϊ����
a1=polyval(p1,rangeWB);         %���������������ߵ�����ֵ
disp('a-WB%����ʽ���߹�ʽ')
a_=poly2str(p1,'WB%')
p2=polyder(p1);                 %����ʽ��
ak=polyval(p2,M);
yb=polyval(p1,M);
k=ak;                           %����б��
b=yb-k*M;                       %���߽ؾ�
aL=polyval([k,b],rangeWB);      %������б�ʺͽؾ����С
aA=aL(1);                       %��ȡ��������������WB%=0�ı���a�Ĵ�С,��aA��ֵ
disp('A(ˮ)��ƫĦ�����')
VA=(aA*18);                     %��ȡ��������������WB%=1�ı���a�Ĵ�С,��aB��ֵ
fprintf('VA=%.2fcm^3\n',VA)     %���VA,��A(ˮ)��ƫĦ�����
aB=aL(end);
disp('B(�ƾ�)��ƫĦ�����')
VB=(aB*46);
fprintf('VB=%.2fcm^3\n',VB)     %���VB,��B(�ƾ�)��ƫĦ�����
fprintf('%dg��Һ������\n',g)
aa=(1-M)* aA+M*aB;           %��������ΪMʱ����a�Ĵ�С
V=g*aa;                         %�ܶ�Ϊ��Һ������g�ͱ��ݵĳ˻�
fprintf('V=%.2fcm^3\n',V)
%��ͼָ���һЩ�趨
plot(rangeWB,a1,'-bo',rangeWB,aL,'-.r',M,yb,'h')
legend('a-WB�������','��������30%������','M��')
title('����a-��������WB%') 
xlabel('��������WB%')
ylabel('����a')
grid on