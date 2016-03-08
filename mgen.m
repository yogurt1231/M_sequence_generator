function mseq = mgen(init, fbconnection)

n = length(fbconnection); 
N = 2^n - 1;

mseq = zeros(1,N);
register = init;
newregister = register;
mseq(1) = register(n);

for i=2:N      
    newregister(1) = mod(sum(fbconnection.*register),2);          
	newregister(2:n) = register(1:(n-1));        
    register = newregister;     
    mseq(i) = register(n); 
end
