%i j在未用作变量名时可用于表示虚数单位，更正规的表示方式是 li lj

x=[1,2,3,2,3,1,3,2]
X=zeros(1,length(x));
N=length(x);
W=exp(-i*2*pi/N);
for k=0:N-1
   for n=0:N-1
        X(k+1)=X(k+1)+x(n+1)*(W.^(k*n))         
   end
end
X
fft(x)
