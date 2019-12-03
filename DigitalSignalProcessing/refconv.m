x=rand(1,10000)
h=rand(1,10000)
%function y = myconv(x,h)
%实现卷积运算，且a和b为行向量

nx=length(x);nh=length(h);
ny=nx+nh;
if nx<nh
    t=x;x=h;h=t;
end
nh=length(h);h=h';
x=[zeros(1,nh-1) fliplr(x) zeros(1,nh-1)]
y=zeros(1,ny-1);
for i=1:ny-1
    y(i)=x(1:nh)*h;
    x=circshift(x,[0 -1]);
end
y=fliplr(y)

