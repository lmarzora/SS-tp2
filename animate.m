

videoFile = "test.avi";
staticFile = "./Data/staticFile.txt";
frameFile = "./Frames/frame";

t_init = 0;
t_end = 50;

plotParticle = 1;

frames =  t_end - t_init

		getFrames(staticFile,frameFile,t_init,t_end,plotParticle);

		setVideo(videoFile, frameFile, frames);

