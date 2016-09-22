function img_out = forward_mapping(img_in, T)
    Dimensiune=size(img_in);
    if (T(1,2)==0&&T(1,1)>0)
        img_out=zeros(abs(T(1,1)*Dimensiune(1)),abs(T(1,1)*Dimensiune(2)));
        % am initilizat cadrul imaginii- adica o imagine neagra
        % de dimensiunea potrivita
        for i=1:Dimensiune(1)
            for j=1:Dimensiune(2)
                initial=[i;j];
                final=T*initial;
                img_out(floor(final(1)+1),floor(final(2)+1))=img_in(i,j);
                % aplic transformarea si copiez pixelii la pozitia
                % potrivita in noua matrice
            end
        end
    else
        % e rotatie
        colt_st_jos=T*[Dimensiune(1);1];
        colt_dr_jos=T*[Dimensiune(1);Dimensiune(2)];
        colt_st_sus=T*[1;1];
        colt_dr_sus=T*[1;Dimensiune(2)];
        noua_latime=abs(colt_st_jos(1)-colt_dr_sus(1));
        noua_latime=max(abs(colt_dr_jos(1)-colt_st_sus(1)),noua_latime);
        noua_inaltime=abs(colt_dr_jos(2)-colt_st_sus(2));
        noua_inaltime=max(abs(colt_dr_sus(2)-colt_st_jos(2)),noua_inaltime);
        img_out=zeros(noua_latime+1,noua_inaltime+1);
        shift_lateral=min(colt_st_jos(1),colt_dr_jos(1));
        shift_lateral=min(shift_lateral,colt_st_sus(1));
        shift_lateral=min(shift_lateral,colt_dr_sus(1));
        shift_vertical=min(colt_st_jos(2),colt_dr_jos(2));
        shift_vertical=min(shift_vertical,colt_st_sus(2));
        shift_vertical=min(shift_vertical,colt_dr_sus(2));
        % pe scurt zis: ma intereseaza ce se intampla cu colturile,
        % deoarece ele sunt pozitile extreme.
        % scot de aici lungimea si latimea noii imagini
        % in plus, pentru ca se poate sa obtin valori negative
        % introduc un factor de shiftare pe care il voi adauga dupa
        % aplicarea transformarii
        for (i=1:Dimensiune(1))
            for (j=1:Dimensiune(2))
                initial=[i;j];
                final=T*initial+[abs(shift_lateral)+1;abs(shift_vertical)+1];
                img_out(floor(final(1)),floor(final(2)))=img_in(i,j);
            end
        end
    end
end