proc iml;
a = {3 -1 7, 2 5 1, 1 11 9};
b = {1, 4, 2};
c = {0 1 1, 1 1 0};
d = {1 0, 1 0, -1 3};

ans = (c*d);
ans_a = a + ans;
print ans_a; 

ans_b = b`*a*b;
print ans_b;

answer = d`*d;
ans_c = inv(answer);
print ans_c;

ans_d = ginv(d);
print ans_d;

cinv = d*ans_d;
ans_e = cinv*d;
print ans_e;

ans_f = ROUND(TRACE(GINV(a)*a));
print ans_f;
 