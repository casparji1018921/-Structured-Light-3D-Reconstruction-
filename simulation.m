% �����������򣬲����߶�ͼ�񣬼����������Ƶ������ȡ�߾��ȵĸ߶���Ϣ
% G=r*[ A+B*cos(2*pi*f*x+angle0) ]  r��ģ��������淴����
% f1=1/16     f2=3/16    f3=1/2
tic
clear
clc
sizex=512; 
hh=sizex/2;
% (1) ��������ͼ
A=40;  B=18;
h=6*peaks(sizex);
r=3+2.5*diff(h')';
r=[r,3*ones(sizex,1)]; %����
fLow=1/128;         fMid=fLow*3;            fHigh=fLow*9;
angleLow=h/16;     angleMid=angleLow*3;      angleHigh=angleLow*9;
 y=1:sizex;
 rowLow=2*pi*fLow*y;
 rowMid=2*pi*fMid*y;
 rowHigh=2*pi*fHigh*y;
 % ��Ƶ
 matriLow=repmat(rowLow,sizex,1); 
 tempLow=A+B*cos(matriLow+angleLow);  
 ObjLow=r.*tempLow;     Low_basFre=r.*B.*cos(matriLow+angleLow);
 RefLow=A+B*cos(matriLow);
 %��Ƶ
 matriMid=repmat(rowMid,sizex,1);
 tempMid=A+B*cos(matriMid+angleMid);
 ObjMid=r.*tempMid;      Mid_basFre=r.*B.*cos(matriMid+angleMid);
 RefMid=A+B*cos(matriMid);
 %��Ƶ
 matriHigh=repmat(rowHigh,sizex,1);
 tempHigh=A+B*cos(matriHigh+angleHigh);
 ObjHigh=r.*tempHigh;    High_basFre=r.*B.*cos(matriHigh+angleHigh);
 RefHigh=A+B*cos(matriHigh);
 % (2) ����ɫ���
 C=0.3;
High_C=ObjHigh+C*ObjMid+C*ObjLow;
Mid_C=C*ObjHigh+ObjMid+C*ObjLow;
Low_C=C*ObjHigh+C*ObjMid+ObjLow; 
% (3) �Ӹ�˹����
High_C_noise=AddNoise(ObjHigh,sizex);
Mid_C_noise=AddNoise(ObjMid,sizex);
Low_C_noise=AddNoise(ObjLow,sizex);
 figure, plot(High_C_noise(256,:))
  figure, plot(RefHigh(256,:))
% ��Ƶ��ɫͼ
colorImg=zeros(sizex,sizex,3);
colorImg(:,:,1)=Low_C_noise;
colorImg(:,:,2)=Mid_C_noise;
colorImg(:,:,3)=High_C_noise;
figure,imshow(uint8(colorImg));
%----------����ͼ��---------------%
AddLen=32;
High_C_noiseExtend=wextend(2,'symh',High_C_noise,AddLen);
Mid_C_noiseExtend=wextend(2,'symh',Mid_C_noise,AddLen);
Low_C_noiseExtend=wextend(2,'symh',Low_C_noise,AddLen);
RefHighExtend=wextend(2,'symh',RefHigh,32);
RefMidExtend=wextend(2,'symh',RefMid,32);
RefLowExtend=wextend(2,'symh',RefLow,32);
% (4) ȥ����������
High_Low_noise=High_C_noiseExtend-Low_C_noiseExtend;
High_LowDenoise=DoNoise_2DWThigh(High_Low_noise,sizex);
High_Mid_noise=High_C_noiseExtend-Mid_C_noiseExtend;%2*High_C_noise-Mid_C_noise-Low_C_noise;
High_MidDenoise=DoNoise_2DWThigh(High_Mid_noise,sizex);
% (4) FABEMD��ȡ��Ƶ��
[IMF1]=RBF_BEMD(High_LowDenoise,1); 
HighIMFExtend=IMF1(:,:,1);    
LowIMFExtend=-IMF1(:,:,2);    
imshowIMFs(IMF1)
 %[Maximum Minimum]=FindPeaks_zhh(HighIMF,sizex);
%  [Maximum Minimum]=findextm_FABEMD(HighIMF);
%   save('High_maxmin.mat','Maximum','Minimum');   %���漫ֵ�㣬�Ա���ȡ���ؼ�ֵ��
[IMF2]=RBF_BEMD(High_MidDenoise,2);
HighIMF_extra=IMF2(:,:,1);   
MidIMFExtend=-IMF2(:,:,2);
imshowIMFs(IMF2)
% (5)2άFTP
Low_unwrapphase=-FTP2D_Low(LowIMFExtend, RefLowExtend, sizex+2*AddLen);
Mid_wrapphase=-FTP2D_Mid(MidIMFExtend, RefMidExtend, sizex+2*AddLen);
High_wrapphase=-FTP2D_High(HighIMFExtend, RefHighExtend, sizex+2*AddLen);
% (5)������ȥ�������鿴���
[Mid_unwrapphase,High_unwrapphase]=ThreeFrequency_unwrap(Low_unwrapphase,Mid_wrapphase,High_wrapphase,sizex);
%-----------��ԭ�ź�-----------------%
HighIMF=wkeep(HighIMFExtend,[sizex sizex]);   Low_unwrapphase=wkeep(Low_unwrapphase,[sizex sizex]); 
MidIMF=wkeep(MidIMFExtend,[sizex sizex]);      Mid_unwrapphase=wkeep(Mid_unwrapphase,[sizex sizex]); 
LowIMF=wkeep(LowIMFExtend,[sizex sizex]);     High_unwrapphase=wkeep(High_unwrapphase,[sizex sizex]); 
%-----------������------------------%
error_HighIMF=High_basFre-HighIMF; error_MidIMF=Mid_basFre-MidIMF;  error_LowIMF=Low_basFre-LowIMF;
error_Low=abs( (Low_unwrapphase-angleLow) );  %����ֵ-��ֵ
error_Mid=abs( (Mid_unwrapphase-angleMid) );
error_High=abs( (High_unwrapphase-angleHigh) );

figure,plot(angleHigh(hh,:),'k','LineWidth',1)
hold on, plot(High_unwrapphase(hh,:),':k','LineWidth',1)
axis([0 512 -10 15]);
xlabel('x/pixel');
ylabel('phase/rad');
Truephase_filterFTP1=medfilt2(High_unwrapphase,[198 198]);
% Truephase_filterFTP1=DoNoise_2DWThigh(High_unwrapphase,480);
figure
mesh(angleHigh)
figure
mesh(Truephase_filterFTP1)
figure
mesh(High_unwrapphase)

figure,plot(error_High(hh,:),'k')
axis([0 512 0 0.1]);
xlabel('x/pixel');
ylabel('absolute error/rad');
Standard_deviation=std2(error_High(256,:))   %��׼��

toc