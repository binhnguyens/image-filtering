function final_image = WeightAvgMask (picA, mask)

output = zeros (length (picA));

    for j = 2: (length (picA(:,1))-1)        %j represents the x axis
        for i = 2: (length (picA(1,:))-1)    %i represents the y axis
            
            holder1 = [picA(j+1,i),picA(j+1,i-1),picA(j+1,i+1);...
                picA(j,i-1),picA(j,i), picA(j,i+1); ...
                picA(j-1,i-1),picA(j-1,i),picA(j-1,i+1)];
            
            
            
            for z1 = 1:length(holder1)
                for z2 = 1: length(holder1)
                    holder (z1,z2) = holder1(z1,z2)* mask(z1,z2);
                end
            end
            
            
            
            output (j,i) = sum (holder(:));
        end
    end
    
    
    final_image = uint8(output);
    figure;
    imshow(final_image);
    title ('Weighted Filter');


end