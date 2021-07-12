function Output = Func_ReadData(nCode)

    str = ['Data\Spike_and_Log_Files\',nCode,'\'];
    filesname = strcat(str,nCode,'*','msq1D.sa0');
    
    files = dir(filesname);
    
    Output = struct;
    for i=1:length(files)
        currentFile = files(i);
        [events,hdr] = fget_spk(strcat(str,currentFile.name),'hdr');
        Output(i).events = events;
        Output(i).hdr = hdr;
    end
end