clc; clear;

video_file = '/media/ming/DATADRIVE1/KTH2391/KTH 2391 video clips/';  % original video place
subdir = dir(video_file);
OutputDir = '/media/ming/DATADRIVE1/KTH2391/KTH 2391 frames/';   % frames place

for i = 1 : length(subdir)
    if(isequal(subdir(i).name, '.') || isequal(subdir(i).name, '..'))
        continue;
    end
    
    
framesPath = '/media/ming/DATADRIVE1/KTHtrim600/KTH600 frames/walking/person25_walking_d4_uncomp/';
videoName = 'person25_walking_d4_uncomp.avi';
fps = 25;
frames = dir([framesPath '/*.jpg']);

startFrame = 1;
endFrame = numel(frames);

% generate video parameter setting
aviobj = VideoWriter(videoName);   % create a avi file object
aviobj.FrameRate = fps;

open(aviobj); % open file for writing video data
% read an image
for i = startFrame:endFrame
    fileName = ['frame', num2str(i)];
    frames = imread([framesPath, fileName, '.jpg']);
    writeVideo(aviobj, frames);
end
close(aviobj);