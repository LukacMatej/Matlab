M=[0,1,1,1,0;
1,0,1,0,0;
1,1,0,1,1;
1,0,0,0,0;
1,0,1,1,0];

K=sum(M,1);
M=M./K;

[vec,lambda] = mocninna_metoda(M, 1, 1e-7, 10000);
[~,index] = sort(vec,"descend");
webs=['A','B','C','D','E'];
webs=webs(index);