clear all
IMAGE='10min.jpg';
ax1 = imread(IMAGE);

a=im2bw(ax1,0.4);
imshow(a);
kolpixelha1=numel(a);
sefid1=nnz(a);
siyah1=kolpixelha1-sefid1;


IMAGE='30min.jpg';
ax2 = imread(IMAGE);
b=im2bw(ax2,0.4);
imshow(b);
kolpixelha2=numel(b);
sefid2=nnz(b);
siyah2=kolpixelha2-sefid2;
RF=(siyah1-siyah2)/siyah1;
fprintf('Recovery factor is : %f \n  siyah1 is : %f \n  siyah2 is: %f \n' ,RF,siyah1,siyah2);