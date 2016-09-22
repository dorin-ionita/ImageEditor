function x=SST(A,b)
	[m n]=size(A);
	% m reprezinta numarul de ecuatii
	x=zeros(m,1);
	x(m)=b(m)/A(m,m);
	% acesta este termenul liber
	for i=m-1:-1:1
    	x(i)=(b(i)-A(i,i+1:m)*x(i+1:m))/A(i,i);
	endfor
endfunction