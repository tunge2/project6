clear all
close all

abb=loadrobot('abbIrb120','DataFormat','column');
abb.Gravity = 9.81*[0,0,-1];
 
qinit=zeros(6,1);
qdotinit=zeros(6,1);
tau=zeros(6,1);
fext=zeros(6,8);

f_v = zeros(6,1);
f_c = zeros(6,1);
%f_v = [0.1 0.1 0.1 0.05 0.05 0.05]';
%f_c = [2 2 2 0.1 0.1 0.1]';
N = 10000;

counter = 1;

%while counter < 20 % (1.2,3)
for i=1%0:10:100% I like 7.5 and 5 for kd of q2 and q3
     %for j=0:2:10%:5:20
       %i = rand()*100
       %j = rand()*100
        tic 
%         kp = [5  20     80   0.5    80   1];%kp=[1.5;1.5;1.5;.1;.1;.1]
%         kd = [4  100    20     20     20    10]; %[2.5;2.5;1;1;1;1];
%         ki  = [4  400   200       5      10   10]; %[.1;.1;.1;0.5;0.5;0.5];
        
        kp = [5  20     80     1     10     1];
        kd = [4  100   20     20   40    10];
        ki  = [4  400   20     5     1      10];
        
        qdes=(rand(6,1)-0.5)*2*pi;
        %qdes = [-1     3    2    1    -3    -2]';
        
        tstop = 5;
        simout=sim('problem3_robotsim','ReturnWorkspaceOutputs', 'on');
        
        n=length(simout.tout);
        %figure(counter)
        counter = counter + 1
        
        %plot(simout.tout,simout.q,'LineWidth',2);
        % yyaxis left
        %plot(simout.tout,simout.q(:,1:3),'LineWidth',1);
        % yyaxis right
        %plot(simout.tout,simout.q(:,4:6),'LineWidth',2);
        plot(simout.tout,simout.q*180/pi,'LineWidth',2);
        legend('q_1','q_2','q_3','q_4','q_5','q_6');
        %legend('q_4','q_5','q_6');
        grid on
        xlabel('Time (sec)')
        ylabel('Angle (deg)')
        title('Simulated ABB IRB 120 Joint Response w/ Manual PID')
        %title([num2str(i) ', ' num2str(j)])
        qerror_deg = (qdes'-simout.q(end,:))*180/pi
        toc
     %end
end

numframes = length(simout.q);

% PAUSEDURATION = 0.01;
% 
% close all;
% framerate = 60;
% 
% floppyrobot = VideoWriter('floppyrobot') %open video file
% floppyrobot.FrameRate = framerate; %set frame rate
% open(floppyrobot) %open the empty file
% 
% M(numframes) = struct('cdata',[],'colormap',[]);
% figure(42069);
% 
% for i=1:5:numframes
%     %clf
%     figure(42069);
%     show(abb,simout.q(i,:)')
%     title('Kachow');
%     pause(PAUSEDURATION);
%     %drawnow
%     %pause(0.01) %Pause and grab frame
% 
%     %M(i) = getframe;
%     %writeVideo(floppyrobot, M(i));
% end
% % 
% % movie(M,5,framerate) %play recorded movie 5 times at specified framerate




