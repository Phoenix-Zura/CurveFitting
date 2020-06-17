%% Given data
t = 0:5:25; %%time in years
B = [ 12000, 13500, 14100, 16900, 18200, 19000];  %%Balance

%% Model Fitting 
%% y = ae^bx , here x = t, y = B, solving it by least squres method
Y = log(B);
[l n] = size(Y);
sY = sum(Y);
st = sum(t);
st2 = sum(t.*t);
stY = sum(t.*Y);
c1 = (st2*sY-st*stY)/(n*st2 - st*st);
c2 = (n*stY-st*sY)/(n*st2 - st*st);

a = exp(c1);
b = c2;
fprintf('the model expression is : y = %d * e^%dx\n',a,b);

plot(t,B,'o')
hold on
fit = a*exp(b.*t);
plot(t,fit,'linewidth',2);
xlabel('time')
ylabel('Balance')

time = (1/b)*log(30000/a);%% question 3
fprintf('the time when balance will reach $30000 is:\t%d\n',time);