%clear all
%close all

tic

abb=loadrobot('abbIrb120','DataFormat','column');
abb.Gravity = 9.81*[0,0,-1];

tau = zeros(6,1);
%f_v = zeros(6,1);
%f_c = zeros(6,1);
f_v = [0.1 0.1 0.1 0.05 0.05 0.05]';
f_c = [2 2 2 0.1 0.1 0.1]';

qinit=zeros(6,1);
qdotinit=zeros(6,1);
tau=zeros(6,1);
fext=zeros(6,8);

tstop = 8;
simout=sim('problem1_robotsim','ReturnWorkspaceOutputs', 'on');

n=length(simout.tout);

figure(10);
plot(simout.tout,simout.q,'LineWidth',2);
% yyaxis left
% plot(simout.tout,simout.q(:,1:3),'LineWidth',2);
% yyaxis right
% plot(simout.tout,simout.q(:,4:6),'LineWidth',2);
plot(simout.tout,simout.q,'LineWidth',2);
legend('q_1','q_2','q_3','q_4','q_5','q_6');
grid on
xlabel('Time (sec)')
ylabel('Angles (rad)')
title('ABB IRB 120 - Friction')

numframes = n;

PAUSEDURATION = 0.01;

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
% for i=1:numframes
%     clf
%     figure(42069);
%     show(abb,simout.q(i,:)')
%     title('Kachow');
%     text(0,0, 1, ['Time t = ' num2str(simout.tout(i)) ' sec'])   
%     pause(PAUSEDURATION);
%     drawnow
%     pause(0.01) %Pause and grab frame
% 
%     M(i) = getframe;
%     writeVideo(floppyrobot, M(i));
% end
% 
% movie(M,5,framerate) %play recorded movie 5 times at specified framerate


close all
for i = 1:250:4000
figure(i);
show(abb,simout.q(i,:)')
title(['ABB IRB 120 Position at t = ' num2str(simout.tout(i)) ' seconds'] );
xlim([-0.5 0.5])
ylim([-0.5 0.5])
zlim([-0.5 0.5])
end

