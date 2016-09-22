function B = inverse (A)
	% functie care sa-mi inverseze
	[Q R]=Gram_Schmidt(A);
	[n n]=size(A);
	Q=Q';
	% B va fi inversa transpua
	% pe care o voi transpune din nou
	% apoi
	E=eye(n);
	B=zeros(n,n);
	% ma voi folosi de faptul
	% ca Q^(-1)=Q^T
	for i=1:n
		e=E(1:n,i);
		% QRxi=ei
		% Rxi=Q'ei
		e=Q*e;
		B(i,1:n)=SST(R,e);
	endfor
	B=B'; 
endfunction