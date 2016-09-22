function img_out = inverse_mapping(img_in, T)
    Dimensiune=size(img_in);
    invT=inverse(T);
    if (T(1,2)==0&&T(1,1)>0)
    % scalare
        img_out=zeros(abs(T(1,1)*Dimensiune(1)),abs(T(1,1)*Dimensiune(2)));
        Dimensiune_noua=size(img_out);
        for i=1:Dimensiune_noua(1)
            for j=1:Dimensiune_noua(2)
                initial=[i;j];
                final=invT*initial;
                img_out(i,j)=bilerp(img_in,final(1),final(2));
                % se procedeaza pe dos functiei forward
            end
        end
    else
    % rotatie
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
        Dimensiune_noua=size(img_out);
        for i=1:Dimensiune_noua(1)
            for j=1:Dimensiune_noua(2)
                initial=[i;j];
                initial=initial-[abs(shift_lateral)-1;abs(shift_vertical)-1];
                final=invT*initial;
                if ( (final(1)<=0 || final(1)>=Dimensiune(1)) ||
                    final(2)<=0 || final(2)>=Dimensiune(2) )
                    img_out(i,j)=0;
                else
                    img_out(i,j)=bilerp(img_in,floor((final(1))),floor(final(2)));
                end
                % se procedeaza pe dos functiei forward.
                % daca corespondentul in imaginea orignala nu exista, atunci
                % acolo am negru
            end
        end
    end
end
