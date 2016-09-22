function value = bilerp(img, row, col)
    if (floor(row)==0 || floor(col)==0)
        value=0;
        % altfel nu as putea sa scot linia si
        % coloana mai departe
    else
        x=(img(floor(row),:));
        % am scos directia x
        y=(img(:,floor(col)));
        y=y';
        % am scos directia y
        x2=lerp(x,col);
        y2=lerp(y,row);
        value=lerp([x2 y2],1.5);
        % interpolez cele 2 valori obtinute
    endif
end
