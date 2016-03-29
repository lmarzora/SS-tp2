
N = 1000;
L = 50;
t = 0;
rc = 10;
vel_max = 1;
periodic = false;

dynamicFile = ["./Data/dynamicFile_" num2str(N) "_" num2str(L) "_" num2str(t) ".txt"];
staticFile = "./Data/staticFile.txt";

duration = 50;

generateRandomSet(staticFile,dynamicFile,N,L,t)

simulate(staticFile,dynamicFile,duration,periodic,rc,vel_max)



