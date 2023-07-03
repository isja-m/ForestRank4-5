% generate forest compatibility matrix
function M = ForestMatrix(n)
    P = SetPartition(n);
    bell = size(P,1);
    M = zeros(bell, bell);
    for k = 1:bell
        for l = 1:bell
            M(k,l) = ForestJoin(P, k, l);
        end
    end
end

% Checks if two partitions are compatible
function output = ForestJoin(P, i,j)
    a = size(P{i},2); % size of partition i
    b = size(P{j},2); % size of partition j
    M = zeros(a,b); % intersect. size between sets in the partitions
    % computing entries of M
    for k = 1:a
        for l = 1:b
            M(k,l) = length(intersect(P{i}{k}, P{j}{l}));
            if M(k,l) > 1 % two sets k, l induce a cycle
                output = 0;
                return
            end
        end
    end
    % check for cycles that use more than 2 sets
    G = graph([zeros(a,a) M; M' zeros(b,b)]);
    output = 1 - hascycles(G);
end