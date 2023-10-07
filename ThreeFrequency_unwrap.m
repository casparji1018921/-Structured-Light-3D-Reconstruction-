function [Mid_Truephase,High_Truephase]=ThreeFrequency_unwrap(Low_phase,Mid_phase,High_phase,sizex)

 KLow=9;  KMid=3;  KHigh=1; %频率的反比(P_r=8; P_g=20; P_b=48)
 %%%% (a) 以低频为基准，计算中频投影的真实相位
 n1=round( ( KLow*Low_phase/KMid-Mid_phase )/(2*pi) );  %四舍五入取整
% r1=abs( KMid*(Mid_phase+2*n1*pi)-KLow*Low_phase );
% s1=abs( KMid*(Mid_phase+2*(n1-1)*pi)-KLow*Low_phase );
% t1=abs( KMid*(Mid_phase+2*(n1+1)*pi)-KLow*Low_phase );
% for i=1:sizex
%     for j=1:sizex
%         [min_number1 position1]=min([r1(i,j) s1(i,j) t1(i,j)]);
%         if position1==1 
%             nn1(i,j)=n1(i,j);
%         end
%         if position1==2
%             nn1(i,j)=n1(i,j)-1;
%          end
%          if position1==3 
%             nn1(i,j)=n1(i,j)+1;
%          end       
%          Mid_Truephase(i,j)=Mid_phase(i,j)+2*nn1(i,j)*pi;
%     end
% end

Mid_Truephase=Mid_phase+2*n1*pi;

%%%% (b) 以中频真实相位为基准，计算高频投影的真实相位
 n2=round( ( KMid*Mid_Truephase/KHigh-High_phase )/(2*pi) );  %四舍五入取整
% r2=abs( KHigh*(High_phase+2*n2*pi)-KMid*Mid_Truephase );
% s2=abs( KHigh*(High_phase+2*(n2-1)*pi)-KMid*Mid_Truephase );
% t2=abs( KHigh*(High_phase+2*(n2+1)*pi)-KMid*Mid_Truephase );
% for i=1:sizex
%     for j=1:sizex
%         [min_number2 position2]=min([r2(i,j) s2(i,j) t2(i,j)]);
%         if position2==1 
%             nn2(i,j)=n2(i,j);
%         end
%         if position2==2
%             nn2(i,j)=n2(i,j)-1;
%          end
%          if position2==3 
%             nn2(i,j)=n2(i,j)+1;
%          end       
%          High_Truephase(i,j)=High_phase(i,j)+2*nn2(i,j)*pi;
%     end
% end

 High_Truephase=High_phase+2*n2*pi;
