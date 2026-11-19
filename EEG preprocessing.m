% EEGLAB history file generated on the 29-Jul-2026
% ------------------------------------------------
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadbv(%% file path where the raw EEG data is stored);
EEG = pop_eegfiltnew(EEG, 'locutoff',1);
EEG = pop_zapline_plus(EEG, 'noisefreqs','line','coarseFreqDetectPowerDiff',4,'chunkLength',0,'adaptiveNremove',1,'fixedNremove',1,'plotResults',0);
EEG = pop_cleanline(EEG, 'bandwidth',2,'chanlist',[1:67] ,'computepower',1,'linefreqs',60,'newversion',0,'normSpectrum',0,'p',0.01,'pad',2,'plotfigures',0,'scanforlines',1,'sigtype','Channels','taperbandwidth',2,'tau',100,'verb',1,'winsize',4,'winstep',1);
EEG = pop_eegfiltnew(EEG, 'hicutoff',135);
EEG = pop_select( EEG, 'rmchannel',{'x_dir','y_dir','z_dir'});
EEG = pop_clean_rawdata(EEG, 'FlatlineCriterion',5,'ChannelCriterion',0.8,'LineNoiseCriterion',4,'Highpass','off','BurstCriterion',20,'WindowCriterion','off','BurstRejection','off','Distance','Euclidian');
EEG = pop_chanedit(EEG, {'lookup','standard_1005.elc'});
EEG = pop_runica(EEG, 'icatype', 'runica', 'extended',1,'interrupt','on');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 7,'setname','Participant code','gui','off'); %% such as PD03
eeglab redraw;
