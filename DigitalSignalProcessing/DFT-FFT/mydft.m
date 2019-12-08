%170603108 ×Ô¶¯»¯17-1 Ñî¼ÑÄÐ
function X=mydft(x,N)
if length(x)<N 
    x=[x zeros(1,N-length(x))];
end
X=zeros(1,N);
W=exp(-1i*2*pi/N);
for k=0:N-1
   for n=0:N-1
        X(k+1)=X(k+1)+x(n+1)*(W.^(k*n));      
   end
end
end