%170603108 �Զ���17-1 ����� ���Դ���
f=rand(1,5000);
startf=1000;%f���е���ʼλ��
g=rand(1,50);
startg=-1230;%g���е���ʼλ��
tic%��ʼ��ʱ
r0=conv(f,g);
t0=toc%������ʱ
tic
[r1,xr1]=ConvolutionV1(f,startf,g,startg);%��һ�����
t1=toc
tic
[r2,xr2]=ConvolutionV2(f,startf,g,startg);%�ڶ������
t2=toc

figure('Position',[200,40,1200,600],'name',"f���г���Ϊ"+num2str(length(f))+"��g���г���Ϊ"+num2str(length(g))+"ʱ����Ա�");
subplot(131)
stem(r0);
title("conv()��������ʱ��Ϊ��"+num2str(t0)+"��")
subplot(132)
stem(xr1,r1);
title("��һ���������ʱ��Ϊ��"+num2str(t1)+"��")
subplot(133)
stem(xr2,r2)
title("�ڶ����������ʱ��Ϊ��"+num2str(t2)+"��")