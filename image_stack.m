function stack = image_stack(img, num_levels)
    stack(:,:,1)=img;
    K=[1/9 1/9 1/9;
        1/9 1/9 1/9;
        1/9 1/9 1/9];
    for i=1:num_levels-1
        stack(:,:,i+1)=conv2(stack(:,:,i),K,'same');
    end
    % construiesc o imagine din stack pe baza
    % imaginii anterioare
end
