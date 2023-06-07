%Universal Variables
n = 0:30;
delta = @(n) 1.0.*(n==0);
u = @(n) 1.0.*(n>=0);

%A.1
%i
a1 = [1 1/6 -1/6]; b1 = [1/3 0 0];
h1 = filter(b1,a1,delta(n));
figure(1);
grid on;
stem(n, h1, 'k'); xlabel('n'); ylabel('h[n]'); title('Problem A 1');
axis([-1 30 -1 1]);

%ii
a2 = [1 0 1/4]; b2 = [1 0 0];
h2 = filter(b2,a2,delta(n));
figure(2);
grid on;
stem(n, h2, 'k'); xlabel('n'); ylabel('h[n]'); title('Problem A 2');
axis([-1 30 -1 1]);

%A.3
h1(4)
h2(4)

%B
a3 = [1 -3/10 -1/10]; b3 = [2 0 0];
initial1 = filtic(b3, a3, [1 2]);
z1 = zeros(size(n));
h3 = filter(b3,a3,z1,initial1);
figure(3);
grid on;
stem(n, h3, 'k'); xlabel('n'); ylabel('h[n]'); title('Problem B');
axis([-1 30 -0.1 1]);

%C
a4 = [1 -3/10 -1/10]; b4 = [2 0 0];
x1 = @(n) 2.*cos((2*pi.*n)/6).*(u(n)-u(n-10));
h4 = filter(b4,a4, x1(n));
figure(4);
grid on;
stem(n, h4, 'k'); xlabel('n'); ylabel('h[n]'); title('Problem C');
axis([-1 30 -5 5]);

%D.1
a5 = [1 -3/10 -1/10]; b5 = [2 0 0];
initial2 = filtic(b5, a5, [1 2]);
z2 = zeros(size(n));
x2 = @(n) 2.*cos((2*pi.*n)/6).*(u(n)-u(n-10));
h5 = filter(b5, a5, x2(n), initial2);
figure(5);
subplot(1, 2, 1);
grid on;
stem(n, h5, 'k'); xlabel('n'); ylabel('h[n]'); title('Problem D');
axis([-1 30 -5 5]);

%D.2
h6 = h3 + h4;
subplot(1,2,2);
grid on;
stem(n, h6, 'k'); xlabel('n'); ylabel('h[n]'); title('Summation of h(n) from Question B and C');
axis([-1 30 -5 5]);

%E.1
a6 = [1 -3/10 -1/10]; b6 = [2 0 0];
initial3 = filtic(b6, a6, [1 2]);
z3 = zeros(size(n));
x3 = @(n) 2.*cos((2*pi.*n)/6).*(u(n)-u(n-10));
h7 = @(n) filter(b6, a6, z3, initial3);
y1 = conv(x3(n), h7(n));
figure(6);
grid on;
stem([0:60], y1, 'k'); xlabel('n'); ylabel('h[n]'); title('Problem E');


%F
n1 = 0:44;
x4 = @(n) cos((pi.*n1)/5)+(1.0.*((n1==30)-(n1==35)));
N=4;
[a7,b7] = MaxFilter(N);
y2 = filter(b7, a7, x4(n1));
figure(7);
stem(n1, y2); xlabel('n'); ylabel('h[n]'); title('Problem F when N=4');
N=8;
[a8, b8] = MaxFilter(N);
y3 = filter(b8, a8, x4(n1));
figure(8);
stem(n1, y3); xlabel('n'); ylabel('h[n]'); title('Problem F when N=8');
N=12;
[a9, b9] = MaxFilter(N);
y4 = filter(b9, a9, x4(n1));
figure(9);
stem(n1, y4); xlabel('n'); ylabel('h[n]'); title('Problem F when N=12');

function [a,b] = MaxFilter(N)
a = 1;
b=ones(N,1)/N;
end

