clear
Rootcata=input('����������ļ�����Ŀ¼','s');%�����ļ�·��,ע������·�����Ҫ�ӷ�б��\
str5='*.xlsx';
Open=sprintf('%s%s',Rootcata,str5);
filename=dir(Open);%��ȡĿ¼��ȫ����.xlsx�ļ�
n=length(filename);%�ļ���Ŀ
for count=1:n
name=filename(count).name;
Proceeding=sprintf('%s%s',Rootcata,name)%׼����·���ļ���
storage=xlsread(Proceeding,1,'C2:C200');%ִ�д�,�������ݴ�������storage
Range1=max(storage)-min(storage);
Criterion=Range1*0.1;
n=length(storage);
for i=1:(n-6)
    if abs(storage(i+6)-storage(i))>=Criterion
        D=i;
        break;
    end
end
D;%��ɾ������
str1='A1:Z';
Deleted=sprintf('%s%d',str1,D)%ɾ����Χ
xlswrite(Proceeding,'''',1,Deleted)%ִ��ɾ��
end



