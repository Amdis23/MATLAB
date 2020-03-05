%% QR (regression)
load('regression_data.mat'); %Defines x,y
xfine = linspace(min(x),max(x),1000);
order = 5;

V = vander(x);
V = V(:,end-order:end);