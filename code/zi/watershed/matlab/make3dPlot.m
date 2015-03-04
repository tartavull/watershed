function make3dPlot(s, cmap)

chan = h5read('../../data/x10y50z30_im_s2483_11475_6931_e2738_11730_7186.h5', '/main');
Ix = toColormappedChannel(squeeze(s(128,:,:)), cmap, squeeze(chan(128,:,:)), 0.1); imshow(Ix);
Iy = toColormappedChannel(squeeze(s(:,128,:)), cmap, squeeze(chan(:,128,:)), 0.1); imshow(Iy);
Iz = toColormappedChannel(squeeze(s(:,:,128)), cmap, squeeze(chan(:,:,128)), 0.1); imshow(Iz);

%Ix = imadjust(Ix,[.2 .2 .2; .7 .7 .7],[]);
%Iy = imadjust(Iy,[.2 .2 .2; .7 .7 .7],[]);
%Iz = imadjust(Iz,[.2 .2 .2; .7 .7 .7],[]);

do3Dplot(Ix,Iy,Iz);
view([90 80 40]);
light('Position',[5 8 12],'Style','local')
axis off

end