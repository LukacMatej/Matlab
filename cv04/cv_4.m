M=[0,1,1,1,1;
1,0,1,0,0;
1,1,0,0,1;
1,0,1,0,1;
0,0,1,0,0];

K=sum(M,1);
M=M./K;

[vec,lambda] = mocninna_metoda(M, [0.20;0.20;0.2;0.2;0.2], 1e-7, 10000);
[~,index] = sort(vec,"ascend");
webs=['A','B','C','D','E'];
webs=webs(index);