f = fopen('voutall.out');
s = fread(f, 'uint32');
s = reshape(s, 256, 256, 256);
fclose(f);
close all;
plot = figure;
imagesc(reshape(rem(s(:, :, 166), 64), 256, 256)');
axis square;
axis off;
colormap('jet');
cdata = print(plot,'-RGBImage');
imwrite(cdata, './raw.png');