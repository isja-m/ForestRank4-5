% create matrices for n = 4 and n = 5
M4 = ForestMatrix(4);
M5 = ForestMatrix(5);

% for convenience
Indeces4 = num2cell(1:15)';
Indeces5 = num2cell(1:52)';

P4 = [Indeces4, SetPartition(4)]';
P4{:}; % remove ; to see all partitions on n = 4
P5 = [Indeces5, SetPartition(5)]';
P5{:}; % remove ; to see all partitions on n = 5

% indices of the (non)crossing parititons for n = 4
Cross4 = [7];
Noncross4 = 1:15;
Noncross4(Cross4) = [];
% indices of the (non)crossing parititons for n = 5
Cross5 = [7,17,19,20,21,23,27,37,38,42];
Noncross5 = 1:52;
Noncross5(Cross5) = [];

% check whether the noncrossing partitions span the rowspace
rank(M4)
rank(M4(Noncross4,:))
rank(M5)
rank(M5(Noncross5,:))