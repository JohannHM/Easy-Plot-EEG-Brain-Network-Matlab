% ............................. FOR TESTING PURPOSES ...........................
% ..............................................................................
clear all;  clc;    close all;
% lets load several networks to be plotted
aij31 = importdata('aij31.txt');    %31 channels
aij56 = importdata('aij56.txt');    %56 channels
aij61 = importdata('aij61.txt');    %61 channels
aij64 = importdata('aij64.txt');    %64 channels

%% plotting the available layouts
figure(1);
f_PlotEEG_BrainNetwork(31)
figure(2);
f_PlotEEG_BrainNetwork(56)
figure(3);
f_PlotEEG_BrainNetwork(61)
figure(4);
f_PlotEEG_BrainNetwork(64)

%% plotting brain network with nodes of equal sizes and no colorbars  
% % Here we want to threshold a network of 31 channels for fast plotting
% under different option to show the links' weights.

nch = 31; %take care of this variable (nch must be according to matrix size you want to plot it)
p = 0.03;   %proportion of weigthed links to keep for.
aij = threshold_proportional(aij31, p); %thresholding networks due to proportion p
ijw = adj2edgeL(triu(aij));             %passing from matrix form to edge list form

figure(5);
f_PlotEEG_BrainNetwork(nch, ijw, 'w_intact');
figure(6);
f_PlotEEG_BrainNetwork(nch, ijw, 'w_unity');
figure(7);
f_PlotEEG_BrainNetwork(nch, ijw, 'w_wn2wx');

%% Now we will play with another network and different options of node atributes
nch = 56; %take care of this variable (nch must be according to matrix size you want to plot it)
p = 0.03;   %proportion of weigthed links to keep for.
aij = threshold_proportional(aij56, p); %thresholding networks due to proportion p
ijw = adj2edgeL(triu(aij));             %passing from matrix form to edge list form

n_features = sum(aij, 2);       % in this case the feature is the Strenght
cbtype = 'wcb';                 % colorbar for weigth

figure(8);
f_PlotEEG_BrainNetwork(nch, ijw, 'w_wn2wx', n_features, 'n_fixed', cbtype);
% % look how in this case, no matter the nodes attributes, if node scaling
% is 'n_fixed', the option for colorbars is set by default to 'nocb' (NO
% colorbar)

figure(9);
f_PlotEEG_BrainNetwork(nch, ijw, 'w_wn2wx', n_features, 'n_nn2nx', cbtype);
% % Note how when I change the option for ndoe scaling we can see the nodes
% attributes plotted and finally, it appears our desired colorbar for
% weights

%% Now we turn on another network to play with another colorbar option.
nch = 64; %take care of this variable (nch must be according to matrix size you want to plot it)
p = 0.03;   %proportion of weigthed links to keep for.
aij = threshold_proportional(aij64, p); %thresholding networks due to proportion p
ijw = adj2edgeL(triu(aij));             %passing from matrix form to edge list form

n_features = sum(aij, 2);       % in this case the feature is the Strenght
cbtype = 'ncb';                 % colorbar for weigth

figure(10);
f_PlotEEG_BrainNetwork(nch, ijw, 'w_wn2wx', n_features, 'n_nn2nx', cbtype);
% % Look how now appears the colorbar for nodes attributes

%% Now we will play with another network associated to the last layout.
nch = 61; %take care of this variable (nch must be according to matrix size you want to plot it)
p = 0.03;   %proportion of weigthed links to keep for.
aij = threshold_proportional(aij61, p); %thresholding networks due to proportion p
ijw = adj2edgeL(triu(aij));             %passing from matrix form to edge list form

n_features = sum(aij, 2);       % in this case the feature is the Strenght
cbtype = 'wncb';                 % colorbar for weigth

figure(11);
f_PlotEEG_BrainNetwork(nch, ijw, 'w_wn2wx', n_features, 'n_nn2nx', cbtype);
% % Look how now appears the colorbar for nodes and weights attributes