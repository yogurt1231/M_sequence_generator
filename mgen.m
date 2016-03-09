function mequ = mgen(reg_width, init, fb, num_width)

N = lcm(2^reg_width-1, num_width);
temp_ans = zeros(N, 1);
mask = 2^reg_width-1;
reg = init;

for i=1:N
    temp_ans(i) = bitget(reg, reg_width);
    new = bitand(reg, fb);
    sum = 0;
    for j=1:reg_width
        sum = sum + bitget(new, j);
    end
    new = mod(sum, 2);
    reg = bitand(bitor(bitshift(reg, 1), new), mask);
end

temp_ans = reshape(temp_ans, 5, []);
mequ = temp_ans(1, :);
for i=2:num_width
    mequ = mequ*2 + temp_ans(i, :);
end
