clc;
clear;
close all;
E = [1,2,2;1,3,4;2,4,3;2,5,3;2,6,1;3,4,2;3,5,3;3,6,1;4,7,1;5,7,3;6,7,4];
nodename = cellstr([' A';'B1';'B2';'C1';'C2';'C3';' D']);
G = digraph(E(:,1),E(:,2),E(:,3),nodename);
p = plot(G,'EdgeLabel',G.Edges.Weight);
[path,d] = shortestpath(G," A"," D","Method",'positive');
highlight(p,path,'EdgeColor','red');