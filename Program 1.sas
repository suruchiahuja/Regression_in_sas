/*q-a*/
proc iml;
x = {1 2.21, 1 1.49, 1 2.81, 1 0.79, 1 1.02,1 2.93,1 1.21};
y = {6.9, 14.9, 3.3, 11.2, 11.3, 4.0, 9.9};

xpx = x`*x;
xpy = x`*y;
xpxinv = inv(xpx);
b = xpxinv*xpy;
print b;


/*q-b*/
h = x*xpxinv*x`;
yhat = h*y;
n = nrow(x);
p = ncol(x);
ssr = y`*(h-(1/n)*J(n,n,1))*y;
sse = y`*(I(n) - h)*y;
ssto = y`*(I(n)-(1/n)*J(n,n,1))*y;
ssr = y`*(h-(1/n)*J(n,n,1))*y;
mse = sse/(n-p);
msr = ssr/1;
df = n-p;
f = msr/mse;
pval = 1 - probf(f,1,df);
print ssr sse ssto msr mse f pval;


/*q-c*/
b =xpxinv*xpy;
print b;
var_b = mse*xpxinv;
print var_b;

/*q-d*/
se_b = sqrt(mse * h[1,1]);
lower = b[1,1] - tinv(0.975,n-p) * se_b;
upper = b[1,1] + tinv(0.975,n-p) * se_b;
print lower upper;

/*q-e*/
e = Y[3] - yhat[3];
print e;

/*q-f*/
var_e = mse*(I(n)-H);
se_e = sqrt(var_e[3,3]);
print se_e;

/*q-g*/
ans_g = mse*h[1,2];
print ans_g;
