function final_image = MedianMask (picA)
    output = zeros (length (picA));

    for j = 2: (length (picA(:,1))-1)        %j represents the x axis
        for i = 2: (length (picA(1,:))-1)    %i represents the y axis
            holder = [picA(j-1,i),picA(j,i-1),picA(j-1,i-1),picA(j+1,i),picA(j,i+1),picA(j+1,i+1),picA(j+1,i-1),picA(j-1,i+1)];
            output (j,i) = median (holder);
        end
    end

    final_image = uint8(output);
    figure;
    imshow(final_image);
    title ('Median Filter');
    
    %The edges are not considered 

end