absolutePath = "C:\Users\Admin\Downloads\BTP_CURVATURE_ESTIMATION\unstructured_grid\generated_data\ten_neighbours\";
fileArray = ["1000unstruc_data", "1200unstruc_1_data", "1200unstruc_2_data", "1400unstruc_1_data" , "1400unstruc_2_data"];
    volumeFraction = [];
    target = [];
    cellNumbers =[];
    % CALCULATING THE DATA SIZE OF THE FILE FROM FOLDER NAME
    for i=1:numel(fileArray)
      m = matfile(absolutePath  + fileArray(i), 'Writable',true);

      if numel(volumeFraction) == 0
            volumeFraction = m.volumeFraction;
            target = m.target;
            cellNumbers = m.cellNumbers;
      else
       volumeFraction =[m.volumeFraction;volumeFraction];
       target = [target;m.target];
       cellNumbers = [cellNumbers;m.cellNumbers];

      end

    end

    save("data_greater_than_equal_to_1000", "volumeFraction", "cellNumbers", "target");