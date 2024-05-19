clc;
clear;
close all;
A =[ 0  20   0   0  15  0;
    20   0  20  60  25   0;
    0  20   0  30  18   0;
    0  60  30   0  35  10;
    15  25  18  35   0  15;
    0   0   0  10  15  0];
s=cellstr(strcat('v',int2str([1:6]')));
G=graph(A,s,'upper');
p=plot(G,'EdgeLabel',G.Edges.Weight);
T=minspantree(G,'Method','dense');
Lmin=sum(T.Edges.Weight);
highlight(p,T)

%% PRIM 最小生成树算法
% A 是一个邻接矩阵，表示图的连接情况
% T 是一个矩阵，表示最小生成树的连接情况

% 获取图的顶点数
n = size(A, 1);
% 初始化最小生成树矩阵
T = zeros(n);
% 初始化一个数组，表示每个顶点的最小权重
minWeight = inf(1, n);
% 选择第一个顶点作为最小生成树的起点
minWeight(1) = 0;
% 初始化一个数组，表示每个顶点的父节点
parent = nan(1, n);
for i = 1:n
    % 找到当前未被选中的顶点中权重最小的顶点
    [~, u] = min(minWeight);
    % 将这个顶点加入到最小生成树中
    minWeight(u) = inf;
    % 更新这个顶点的所有邻居的权重和父节点
    for v = find(A(u, :) > 0)
        if A(u, v) < minWeight(v)
            minWeight(v) = A(u, v);
            parent(v) = u;
        end
    end
end
% 根据父节点数组构造最小生成树
for v = 2:n
    u = parent(v);
    T(u, v) = A(u, v);
    T(v, u) = A(v, u);
end

%% kuskal
n = size(A,1);
T = zeros(n);
[i, j, v] = find(triu(A));
edges = sortrows([i j v], 3);
parent = 1:n;

for i = 1:size(edges, 1)
    u = edges(i, 1);
    v = edges(i, 2);
    root_u = find_root(parent, u);
    root_v = find_root(parent, v);
    if root_u ~= root_v
        T(u, v) = A(u, v);
        T(v, u) = A(v, u);
        parent(root_v) = root_u;
    end
end

Gg=graph(T,'upper');
figure(2);
p=plot(Gg,'EdgeLabel',Gg.Edges.Weight);

function root = find_root(parent, u)
while parent(u) ~= u
    u = parent(u);
end
root = u;
end

