%% DLMREAD
pstr = {'r','b'};
fnames = dir('liftdrag');
for i = 1:length(fnames)-2
    fname = ['liftdrag/',fnames(i+2).name];
    liftdrag = dlmread(fname,' ',1,0);
    
    if i == 1
        figure('pos',[247   190   988   587],'paperpositionmode','auto');
        h(1)=plot(liftdrag(:,2),liftdrag(:,5),'k-','linew',2); hold on;
    elseif rem(i,2) == 0
        h(end+1)=plot(liftdrag(:,2),liftdrag(:,5),[pstr{floor(i/2)},'--'],'linew',2);
    else
        h(end+1)=plot(liftdrag(:,2),liftdrag(:,5),[pstr{floor(i/2)},':'],'linew',2);
    end
end
xlabel('time'); ylabel('drag coefficient');
leg=legend('Exact','ROM1 (e = 0.995)','ROM2 (e = 0.995)','ROM1 (e = 0.998)','ROM2 (e = 0.998)');
set(leg,'Position',[0.14018941584731 0.765163867932179 0.154352226720648 0.149063032367973]);

%%
%%GETLINE
fid = fopen('lec06_ex.m');
while 1
    tline = fgets(fid); %try with fgets to see line spacing
    if ~ischar(tline)
        break;
    end
    fprintf(tline)
end
fclose(fid);

%% File position
fid = fopen('liftdrag/unsteady.hdm.LiftDrag');
line1 = fgetl(fid);
for i = 1:10
    line=fgets(fid);
end

fprintf('File location = %d\n',ftell(fid));
fprintf('At end of file? = %d\n',feof(fid));
frewind(fid);
fprintf('File location = %d\n',ftell(fid));
fprintf('At end of file? = %d\n',feof(fid));
fseek(fid,1000,-1);
fprintf('File location = %d\n',ftell(fid));
fprintf('At end of file? = %d\n',feof(fid));
while (fgetl(fid) ~= -1); end;
fprintf('File location = %d\n',ftell(fid));
fprintf('At end of file? = %d\n',feof(fid));
%% TEXTSCAN
% UC Berkeley Graphics group mesh format
fname = 'meshes/dragon';

fid = fopen([fname,'.node']);
fgetl(fid);
nodes  = textscan(fid,'%d %f %f %f %d');
fclose(fid);
p = [nodes{2:end-1}];

fid = fopen([fname,'.ele']);
fgetl(fid);
elems  = textscan(fid,'%d %d %d %d %d');
fclose(fid);
t = [elems{2:end}];

figure;
simpplot(p,t);
set(gca,'cameraposition',[40.5091 39.0167 488.426],...
        'view',[ 0,90]);

% FRG mesh format
fname = 'meshes/AGARDwtt.top';
fid = fopen(fname);
fgetl(fid);
nodes  = textscan(fid,'%d %f %f %f');
fgetl(fid);
elems = textscan(fid,'%d %d %d %d %d');
fclose(fid);

p = [nodes{2:end}]; clear nodes;
t = [elems{end-3:end}]; clear elems;

figure;
simpplot(p,t);
set(gca,'view',[ -117.5000   26.0000],...
        'cameraposition',[-206.498 134.045 122.589]);
%% Spreadsheet
M = rand(10,4);
[stat,msg] = xlswrite('examp.xls',M,2,'D3:M12');

%% Images
man  = imread('images/mandrill.jpeg','jpeg');
palm = imread('images/palm.png','png');

figure('pos',[129,351,1063,419]);
subplot(1,2,1); image(man);
subplot(1,2,2); image(palm);

imwrite(man,'images/mandrill.png','png');
imwrite(palm,'images/palm.jpeg','jpeg');