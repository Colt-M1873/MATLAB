clear
Rootcata=input('输入待处理文件所在目录','s');%输入文件路径,注意输入路径最后要加反斜杠\
str5='*.xlsx';
Open=sprintf('%s%s',Rootcata,str5);
filename=dir(Open);%获取目录下全部的.xlsx文件
n=length(filename);%文件数目
for count=1:n
name=filename(count).name;
Proceeding=sprintf('%s%s',Rootcata,name)%准备打开路径文件名
storage=xlsread(Proceeding,1,'C2:C200');%执行打开,并将数据存于数组storage
Range1=max(storage)-min(storage);
Criterion=Range1*0.1;
n=length(storage);
for i=1:(n-6)
    if abs(storage(i+6)-storage(i))>=Criterion
        D=i;
        break;
    end
end
D;%欲删除行数
str1='A1:Z';
Deleted=sprintf('%s%d',str1,D)%删除范围
xlswrite(Proceeding,'''',1,Deleted)%执行删除
end



