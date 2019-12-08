%170603108 自动化17-1 杨佳男
function A=myfft(x,N)
%N=length(x);
x=x(1:N);
A=zeros(1,N);%中间数组，用于存放每次蝶形运算的结果
T=log2(N);%此处T为执行蝶形运算的次数
%先将x整理成适合蝶形运算的形式
xlast=x;
for t=0:T-1%当前轮次t
    for section=1:(2^t)%将整个数组分成2^t段中的第section段
        sectionlength=N/(2^t);
        startpoint=(section-1)*sectionlength+1;%每一段的开始位下标
       for n=1:sectionlength/2
           x(startpoint-1+n)=xlast(startpoint-1+2*n-1);
           x(startpoint+sectionlength/2-1+n)=xlast(startpoint-1+2*n);%段内部奇偶互换
       end
    end
xlast=x;    
end
A=x;%x已整理好，此时得最初的A，开始进行FFT蝶形运算
Alast=A;
W=exp(-1i*2*pi/N);
for t=1:T
    for section=1:(2^(T-t))%将整个数组分成2^t段中的第section段
        sectionlength=N/(2^(T-t));
        startpoint=(section-1)*sectionlength+1;%每一段的开始位下标
        for n=1:sectionlength/2
             A(startpoint-1+n)=Alast(startpoint-1+n)+W^((n-1)*2^(T-t))*Alast(startpoint-1+sectionlength/2+n);
             A(startpoint-1+sectionlength/2+n)=Alast(startpoint-1+n)-W^((n-1)*2^(T-t))*Alast(startpoint-1+sectionlength/2+n);
        end
    end
    Alast=A;
end
end
