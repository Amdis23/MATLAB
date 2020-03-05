function  s = bubble_sort(v,options)
% bubble sort

n = length(v);
s = v;
while 1
    swapped = false;
    for i = 2:n
        if strcmpi(options.order,'ascend')
            if s(i-1) > s(i)
                tmp=s(i-1);
                s(i-1)=s(i);
                s(i) = tmp;
                swapped = true;
            end
        elseif strcmpi(options.order,'descend')
            if s(i-1) < s(i)
                tmp=s(i-1);
                s(i-1)=s(i);
                s(i) = tmp;
                swapped = true;
            end
        end
    end
    if ~swapped, return; end;
end