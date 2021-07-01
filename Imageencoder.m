clear all
%           IMAGE='0.jpg';
%     IMAGE='10min.jpg';
%        IMAGE='30min.jpg';
     IMAGE='13.20tomoroow.jpg';
%   IMAGE='18tomorrow.jpg';
RGB = imread(IMAGE);
RGBDouble=double(RGB);
COLOUR=1; % 1:Red, 2:Green, 3: Blue;

Red=RGBDouble(:,:,1);

%Plot
figure
histogram(RGB(:,:,COLOUR))
title(IMAGE)
[xxx,yyy] = ginput(2);
%% Get Three Maximums:
%          X,Y
% LowestExt=[xxx(1),yyy(1)]; %Point A
% MiddleExt=[xxx(2),yyy(2)]; %Point B
% UppestExt=[xxx(3),yyy(3)]; %Point C
% 
% LowestExtNormed=(LowestExt(2)/(LowestExt(2)+MiddleExt(2)))*LowestExt(1);
% MiddleExtNormedL=(MiddleExt(2)/(LowestExt(2)+MiddleExt(2)))*MiddleExt(1);
% MiddleExtNormedU=(MiddleExt(2)/(LowestExt(2)+UppestExt(2)))*MiddleExt(1);
% UppestExtNormed=(UppestExt(2)/(UppestExt(2)+MiddleExt(2)))*UppestExt(1);
% 
% ABmiddle=(LowestExt(1)+MiddleExt(1))/2;
% BCmiddle=(UppestExt(1)+MiddleExt(1))/2;
% 
% P1= mean(xxx([1,2,4]));
% P2= mean(xxx([3,2,5]));

% ABmiddle=(LowestExtNormed+MiddleExtNormedL)/1;
% BCmiddle=(UppestExtNormed+MiddleExtNormedU)/1;
% 





if COLOUR==1
    
% ThreshholdOil=ABmiddle;
% ThreshholdPore=BCmiddle; 
% 
% ThreshholdOil=P1;
% ThreshholdPore=P2; 

ThreshholdOil=xxx(1);
ThreshholdPore=xxx(2); 


elseif COLOUR==2
    
ThreshholdOil=140;
ThreshholdPore=190; 

else
    
ThreshholdOil=140;
ThreshholdPore=190;   

end




OilX=numel(find(RGB(:,:,COLOUR)<=ThreshholdOil));
% PoresX=numel(find(RGB(:,:,COLOUR)>=ThreshholdPore));
PoresX=numel(RGB(:,:,COLOUR))*0.30;
PoresXCALC=numel(find(RGB(:,:,COLOUR)>=ThreshholdPore));

WaterX=numel(find(RGB(:,:,COLOUR)<ThreshholdPore & RGB(:,:,COLOUR)>ThreshholdOil));

FractionWater=WaterX/(numel(RGB(:,:,COLOUR))-(PoresXCALC));
FractionOil=OilX/(numel(RGB(:,:,COLOUR))-(PoresXCALC));
FractionPore=PoresXCALC/(numel(RGB(:,:,COLOUR)));
FractionPoreCALC=PoresXCALC/(numel(RGB(:,:,COLOUR)));



Total=FractionOil+FractionWater;

TotalFraction(1)=(PoresX)/(numel(RGB(:,:,COLOUR))); % PORE FRACTION
TotalFraction(2)=(OilX)  /(numel(RGB(:,:,COLOUR))); % OIL FRACTION
TotalFraction(3)=(WaterX)/(numel(RGB(:,:,COLOUR))); % WATER FRACTION


TOTALRGBINDEX=(RGB(:,:,1).*RGB(:,:,2).*RGB(:,:,3));
        
%         figure
%         subplot(2,2,1)
%         histogram(RGB(:,:,1))
%         title(IMAGE)
% 
%         subplot(2,2,2)
%         histogram(RGB(:,:,2))
%         
% %         
%         subplot(2,2,3)
%         histogram(RGB(:,:,3))
        
%         subplot(2,2,4)
%         histogram(TOTALRGBINDEX)

Outputer=[COLOUR;ThreshholdOil;ThreshholdPore;FractionOil;FractionPoreCALC];