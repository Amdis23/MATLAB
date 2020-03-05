%test it!
% This will test a random case AND the worst case!

options1.order = 'ascend';
options2.order = 'descend';

v = rand(5000,1);

tic;
s1=bubble_sort(v,options1);
matlab_time1 = toc
%reverse the order
tic;
s2=bubble_sort(s1,options2);
matlab_time2 = toc

codegen bubble_sort -args {zeros(length(v),1),options1} -o bubble_sort_mex
tic;
s3=bubble_sort_mex(v,options1);
mex_time1 = toc

tic;
codegen bubble_sort -args {zeros(length(v),1),options2} -o bubble_sort_mex
s4=bubble_sort_mex(s3,options2);
mex_time2 = toc

fprintf('Error between MATLAB and C/C++ = %e, %e\n',norm(s1-s3),norm(s2-s4));