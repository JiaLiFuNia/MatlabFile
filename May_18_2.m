clc;
clear;
close all;
a = zeros(6);
a(1,2) = 2;a(1,3) = 7;
a(2,3) = 4;a(2,4) = 6;a(2,5) = 8;
a(3,4) = 1;a(3,5) = 3;
a(4,5) = 1;a(4,6) = 6;
a(5,6) = 3;
nodes = 1:6;
s = cellstr(strcat('v',int2str(nodes')));

G = graph(a,s,'upper');
node_min_path = distances(G);
M = max(node_min_path,[],2);
[m,index] = min(M);
fprintf("医院建在v%d,使最远的最短为：%d\n",index,m);

stu_nums = [50 40 60 20 70 90];
M2 = stu_nums*node_min_path;
[m,index] = min(M2);
fprintf("学校建在v%d,使最远的最短为：%d\n",index,m);

