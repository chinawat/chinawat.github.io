% Largest triangle given n points on a unit circle
% Writing efficient code

% Part 1
t1=zeros(1,3);
m=0;
for n=100:50:200
	tic;

	theta = rand(n,1)*2*pi;  % Angle of random pts on the unit circle
	% Determine how long it takes to compute the largest
	% possible triangle obtained by selecting vertices from the
	% points represented by theta
	A = 0;
	for i=1:n
		for j=1:n
			for k=1:n
				% theta --> Cartesian
				c1 = cos(theta(i));
				s1 = sin(theta(i));
				c2 = cos(theta(j));
				s2 = sin(theta(j));
				c3 = cos(theta(k));
				s3 = sin(theta(k));
				% Area using Heron's Formula
				a = sqrt((c1-c2)^2 + (s1-s2)^2);
				b = sqrt((c1-c3)^2 + (s1-s3)^2);
				c = sqrt((c2-c3)^2 + (s2-s3)^2);
				s = (a+b+c)/2;
				Aijk = sqrt((s-a)*(s-b)*(s-c)*s);
				A = max(A,Aijk);
			end
		end
	end

	m=m+1;
	t1(m)=toc;
end
  
% Part 2
t2=zeros(1,3);
m=0;
for n=100:50:200
	tic;

	theta = rand(n,1)*2*pi;  % Angle of random pts on the unit circle
	% Determine how long it takes to compute the largest
	% possible triangle obtained by selecting vertices from the
	% points represented by theta
	A = 0;
	for i=1:n-2
		c1 = cos(theta(i));
		s1 = sin(theta(i));
		for j=i+1:n-1
			c2 = cos(theta(j));
			s2 = sin(theta(j));
			for k=j+1:n
				% theta --> Cartesian
				c3 = cos(theta(k));
				s3 = sin(theta(k));
				% Area using Heron's Formula
				a = sqrt((c1-c2)^2 + (s1-s2)^2);
				b = sqrt((c1-c3)^2 + (s1-s3)^2);
				c = sqrt((c2-c3)^2 + (s2-s3)^2);
				s = (a+b+c)/2;
				Aijk = sqrt((s-a)*(s-b)*(s-c)*s);
				A = max(A,Aijk);
			end
		end
	end

	m=m+1;
	t2(m)=toc;
end

% Part 3
t3=zeros(1,3);
m=0;
for n=100:50:200
	tic;

	theta = rand(n,1)*2*pi;  % Angle of random pts on the unit circle

	% precompute distances
	D=zeros(n,n);
	for i=1:n-1
		c1 = cos(theta(i));
		s1 = sin(theta(i));
		for j=i+1:n
			c2 = cos(theta(j));
			s2 = sin(theta(j));
			D(i,j)=sqrt((c1-c2)^2 + (s1-s2)^2);
		end
	end

	% Determine how long it takes to compute the largest
	% possible triangle obtained by selecting vertices from the
	% points represented by theta
	A = 0;
	for i=1:n-2
		for j=i+1:n-1
			for k=j+1:n
				% Area using Heron's Formula
				a = D(i,j);
				b = D(i,k);
				c = D(j,k);
				s = (a+b+c)/2;
				Aijk = sqrt((s-a)*(s-b)*(s-c)*s);
				A = max(A,Aijk);
			end
		end
	end

	m=m+1;
	t3(m)=toc;
end

% Part 4
figure;
bar(100:50:200,t1);
shg;

figure;
bar(100:50:200,t2);
shg;

figure;
bar(100:50:200,t3);
shg;
