%lecture 7 examples

%% Mex Hello World
mex hello.c
hello

%% Mex Bubble Sort
mex bubble_sort_mex.c
v = rand(5000,1);
tic; s= bubble_sort_mex(v); toc;
tic; sm = bubble_sort(v,struct('order','ascend')); toc;