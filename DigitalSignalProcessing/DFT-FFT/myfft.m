%170603108 �Զ���17-1 �����
function A=myfft(x,N)
%N=length(x);
x=x(1:N);
A=zeros(1,N);%�м����飬���ڴ��ÿ�ε�������Ľ��
T=log2(N);%�˴�TΪִ�е�������Ĵ���
%�Ƚ�x������ʺϵ����������ʽ
xlast=x;
for t=0:T-1%��ǰ�ִ�t
    for section=1:(2^t)%����������ֳ�2^t���еĵ�section��
        sectionlength=N/(2^t);
        startpoint=(section-1)*sectionlength+1;%ÿһ�εĿ�ʼλ�±�
       for n=1:sectionlength/2
           x(startpoint-1+n)=xlast(startpoint-1+2*n-1);
           x(startpoint+sectionlength/2-1+n)=xlast(startpoint-1+2*n);%���ڲ���ż����
       end
    end
xlast=x;    
end
A=x;%x������ã���ʱ�������A����ʼ����FFT��������
Alast=A;
W=exp(-1i*2*pi/N);
for t=1:T
    for section=1:(2^(T-t))%����������ֳ�2^t���еĵ�section��
        sectionlength=N/(2^(T-t));
        startpoint=(section-1)*sectionlength+1;%ÿһ�εĿ�ʼλ�±�
        for n=1:sectionlength/2
             A(startpoint-1+n)=Alast(startpoint-1+n)+W^((n-1)*2^(T-t))*Alast(startpoint-1+sectionlength/2+n);
             A(startpoint-1+sectionlength/2+n)=Alast(startpoint-1+n)-W^((n-1)*2^(T-t))*Alast(startpoint-1+sectionlength/2+n);
        end
    end
    Alast=A;
end
end
