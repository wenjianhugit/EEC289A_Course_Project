function [t,p, results] = adnet_demo (vid_path)
% ADNET_DEMO Demonstrate `action-decision network'
% 
% Sangdoo Yun, 2017.

if nargin < 1
    vid_path = 'data/bike-trial';
%	vid_path = 'data/horsejump-stick';
%	vid_path = 'data/car-roundabout';
%	vid_path = 'data/dance-twirl';
%	vid_path = 'data/cows';
%	vid_path = 'data/soapbox';
end

addpath('test/');
addpath(genpath('utils/'));

init_settings;

run(matconvnet_path);

load('models/net.mat');

%{
[net, net_conv, net_fc] = split_dagNN(net);
net_conv

input_data = randn(480, 854, 3, 'single');
for i = 1: 10
    net_conv.layers(i)
end
for i = 1: 6
    net_conv.params(i)
end
net_conv.eval({'input', input_data});
index = net_conv.getVarIndex('x10');
output = net_conv.vars(index).value
size(output)
%}



%{
net.layers(12)
net.layers(13)
net.layers(14)
net.layers(15)
net.layers(16)
net.layers(17)
net.layers(18)

net.params(1)
net.params(2)
net.params(3)
net.params(4)
net.params(5)
net.params(6)
net.params(7)
net.params(8)
net.params(9)
net.params(10)
net.params(11)
net.params(12)
net.params(13)
net.params(14)

net.meta 

for i = 1: 14
    net.params(i)
end
%}

opts.visualize = true;
opts.printscreen = true;

rng(1004);
[results, t, p] = adnet_test(net, vid_path, opts);
fprintf('precision: %f, fps: %f\n', p(20), size(results, 1)/t);

results
bbox_output_file = fopen('results/bbox_output_file.txt', 'w');
for i = 1: size(results, 1)
    fprintf(bbox_output_file, '%f %f %f %f\n', [results(i, 1), results(i, 2), results(i, 3), results(i, 4)]);
end
