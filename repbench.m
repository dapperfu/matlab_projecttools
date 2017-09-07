

N = 1e6;

test = 'this.is.a.test';
tmp = cell(1,N);
tic
for i=1:N
    tmp{i} = [regexprep(test,'\.','_') '.mat'];
end
toc

test = 'this.is.a.test';
tmp2 = cell(1,N);
tic
for i=1:N
    tmp2{i} = [strrep(test,'.','_') '.mat'];
end
toc

for i=1:N
   assert(strcmp(tmp{i}, tmp2{i})); 
end
