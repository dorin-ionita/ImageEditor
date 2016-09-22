function img_out = transform_image(img_in, k)
    stack=image_stack(img_in,floor(k)+1);
    dimensiune=size(img_in);
    img_out=zeros(dimensiune);
    for i=1:dimensiune(1)
        for j=1:dimensiune(2)
            vect=[stack(i,j,floor(k));stack(i,j,floor(k)+1)];
            img_out(i,j)=lerp(vect,1+k-floor(k));
        end
    end
    % explicatia este ceva mai lunga:
    % in image stack am doar pixeli pe pozitii intregi
    % nu are rost sa fac un trilerp, cand pot sa interpolez
    % pixeli de pe aceleasi pozitii i si j din matrici vecine
    % din stack
    % partea fractionala imi da exact precizia, unde ma aflu
    % intre matricile din stack (cat de departe/aproape de ele)
end
