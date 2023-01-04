function out = FunctionOfEpsilonSimulations
import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath(['E:\' native2unicode(hex2dec({'03' '94'}), 'unicode')  native2unicode(hex2dec({'03' 'b9'}), 'unicode')  native2unicode(hex2dec({'03' ...
    'c0'}), 'unicode')  native2unicode(hex2dec({'03' 'bb'}), 'unicode')  native2unicode(hex2dec({'03' 'c9'}), 'unicode')  native2unicode(hex2dec({'03' ...
    'bc'}), 'unicode')  native2unicode(hex2dec({'03' 'b1'}), 'unicode')  native2unicode(hex2dec({'03' 'c4'}), 'unicode')  native2unicode(hex2dec({'03' ...
    'b9'}), 'unicode')  native2unicode(hex2dec({'03' 'ba'}), 'unicode')  native2unicode(hex2dec({'03' 'ae'}), 'unicode') '\FinalCodes Draft1\Stage 1st']);

% ---------------------------------------------------------------------
% ------------------------- Set Parameters ----------------------------
% ---------------------------------------------------------------------

width_increasment = 0.03;
length_increasment = 0.04;
shift_right_left = width_increasment/2;
shift_up_down = length_increasment/2;
simulations = 30;

for i = 1:simulations

    % ---------------------------------------------------------------------
    % ---------------------- Simulation of Epsilon1 -----------------------
    % ---------------------------------------------------------------------
    if i == 1
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the first microstrip:
        model.param.set('epsilon1', width_increasment);
        model.param.descr('epsilon1', 'epsilon1 simulation');
        model.param.set('shift1', shift_right_left);
        model.param.descr('shift1', 'shift1 for epsilon1 simulation');

        % Increasment of width of the First Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('size', {'W + epsilon1[mm]' 'length_of_first'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 - shift1[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').setIndex('pos', '-s_length/2 + length_of_first/2 + L1', 1);

        % Adapt the 50ohm transmission line properly:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('table', [-0.004 -0.02975; -0.003645 -0.03115; -0.004755 -0.03115; -0.0044-0.00003 -0.02975; -0.004 -0.02975]);
        
        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the S-parameters:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon1 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon1 Simulation','text file.txt','Delimiter','tab')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max) 

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    

    % ---------------------------------------------------------------------
    % ---------------------- Simulation of Epsilon2 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 2
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the length of the first microstrip:
        model.param.set('epsilon2', length_increasment);
        model.param.descr('epsilon2', 'epsilon2 simulation');
        model.param.set('shift2', shift_up_down);
        model.param.descr('shift2', 'shift2 for epsilon2 simulation');

        % Increasment of length of the First Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('size', {'W' 'length_of_first + epsilon2[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 + shift2[mm]', 1);

        % Here we dont need to change the 50ohm transmission line since there is no change on the width of the first microstrip

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the S-parameters:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon2 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon2 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % ---------------------- Simulation of Epsilon3 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 3
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the first microstrip:
        model.param.set('epsilon3', width_increasment);
        model.param.descr('epsilon3', 'epsilon3 simulation');
        model.param.set('shift3', shift_right_left);
        model.param.descr('shift3', 'shift3 for epsilon3 simulation');

        % Increasment of width of the First Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('size', {'W + epsilon3[mm]' 'length_of_first'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + shift3[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').setIndex('pos', '-s_length/2 + length_of_first/2 + L1', 1);

        % Adapt the 50ohm transmission line properly:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('table', [-0.004+0.00003 -0.02975; -0.003645 -0.03115; -0.004755 -0.03115; -0.0044 -0.02975; -0.004+0.00003 -0.02975]);
        
        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon3 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon3 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % ---------------------- Simulation of Epsilon4 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 4
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon4', width_increasment);
        model.param.descr('epsilon4', 'epsilon4 simulation');
        model.param.set('shift4', shift_right_left);
        model.param.descr('shift4', 'shift4 for epsilon4 simulation');

        % Increasment of width of the Second Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('size', {'W + epsilon4[mm]' 'length_of_first'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W - shift4[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').setIndex('pos', '-s_length/2 + length_of_first/2 + L1', 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon4 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon4 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    

    % ---------------------------------------------------------------------
    % ---------------------- Simulation of Epsilon5 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 5
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon5', width_increasment);
        model.param.descr('epsilon5', 'epsilon5 simulation');
        model.param.set('shift5', shift_right_left);
        model.param.descr('shift5', 'shift5 for epsilon5 simulation');

        % Increasment of width of the Second Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('size', {'W + epsilon5[mm]' 'height_of_2microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W - shift5[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').setIndex('pos', '-s_length/2 + length_of_first + L1 + height_of_2microstrip_p2/2', 1);

        % Increasment of width of the Second Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('size', {'W + epsilon5[mm]' 'L - length_of_first - height_of_2microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W - shift5[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2', 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon5 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon5 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    

    % ---------------------------------------------------------------------
    % ---------------------- Simulation of Epsilon6 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 6
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the length of the second microstrip:
        model.param.set('epsilon6', length_increasment);
        model.param.descr('epsilon6', 'epsilon6 simulation');
        model.param.set('shift6', shift_up_down);
        model.param.descr('shift6', 'shift6 for epsilon6 simulation');

        % Increasment of length of the Second Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('size', {'W' 'L - length_of_first - height_of_2microstrip_p2 + epsilon6[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2 + shift6[mm]', 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon6 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon6 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    

    % ---------------------------------------------------------------------
    % ---------------------- Simulation of Epsilon7 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 7
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon7', width_increasment);
        model.param.descr('epsilon7', 'epsilon7 simulation');
        model.param.set('shift7', shift_right_left);
        model.param.descr('shift7', 'shift7 for epsilon7 simulation');

        % Increasment of width of the Second Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('size', {'W + epsilon7[mm]' 'L - length_of_first - height_of_2microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W + shift7[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2', 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon7 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon7 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    
    % ---------------------------------------------------------------------
    % ---------------------- Simulation of Epsilon8 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 8
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon8', width_increasment);
        model.param.descr('epsilon8', 'epsilon8 simulation');
        model.param.set('shift8', shift_right_left);
        model.param.descr('shift8', 'shift8 for epsilon8 simulation');

        % Increasment of width of the Second Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('size', {'W + epsilon8[mm]' 'length_of_first'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W + shift8[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').setIndex('pos', '-s_length/2 + length_of_first/2 + L1', 1);

        % Increasment of width of the Second Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('size', {'W + epsilon8[mm]' 'height_of_2microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W + shift8[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').setIndex('pos', '-s_length/2 + length_of_first + L1 + height_of_2microstrip_p2/2', 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon8 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon8 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % ---------------------- Simulation of Epsilon9 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 9
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the length of the second microstrip:
        model.param.set('epsilon9', length_increasment);
        model.param.descr('epsilon9', 'epsilon9 simulation');
        model.param.set('shift9', shift_up_down);
        model.param.descr('shift9', 'shift9 for epsilon9 simulation');

        % Increasment of length of the Second Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('size', {'W' 'length_of_first + epsilon9[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 - shift9[mm]', 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon9 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon9 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon10 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 10
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon10', width_increasment);
        model.param.descr('epsilon10', 'epsilon10 simulation');
        model.param.set('shift10', shift_right_left);
        model.param.descr('shift10', 'shift10 for epsilon10 simulation');

        % Increasment of width of the Third Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('size', {'W + epsilon10[mm]' 'height_of_3microstrip_p1'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - shift10[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2', 1);
        
        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon10 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon10 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon11 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 11
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon11', width_increasment);
        model.param.descr('epsilon11', 'epsilon11 simulation');
        model.param.set('shift11', shift_right_left);
        model.param.descr('shift11', 'shift11 for epsilon11 simulation');

        % Increasment of width of the Third Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('size', {'W + epsilon11[mm]' 'heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - shift11[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L/2 +heigth_of_3microstrip_p2/2 +height_of_3microstrip_p1/2'], 1);

        % Increasment of width of the Third Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('size', {'W + epsilon11[mm]' 'L - height_of_3microstrip_p1 - heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - shift11[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon11 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon11 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon12 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 12
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the length of the third microstrip:
        model.param.set('epsilon12', length_increasment);
        model.param.descr('epsilon12', 'epsilon12 simulation');
        model.param.set('shift12', shift_up_down);
        model.param.descr('shift12', 'shift12 for epsilon12 simulation');

        % Increasment of length of the Third Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('size', {'W' 'L - height_of_3microstrip_p1 - heigth_of_3microstrip_p2 + epsilon12[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 + shift12[mm]'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon12 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon12 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon13 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 13
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon13', width_increasment);
        model.param.descr('epsilon13', 'epsilon13 simulation');
        model.param.set('shift13', shift_right_left);
        model.param.descr('shift13', 'shift13 for epsilon13 simulation');

        % Increasment of width of the Third Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('size', {'W + epsilon13[mm]' 'L - height_of_3microstrip_p1 - heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W + shift13[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon13 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon13 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon14 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 14
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon14', width_increasment);
        model.param.descr('epsilon14', 'epsilon14 simulation');
        model.param.set('shift14', shift_right_left);
        model.param.descr('shift14', 'shift14 for epsilon14 simulation');

        % Increasment of width of the Third Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('size', {'W + epsilon14[mm]' 'height_of_3microstrip_p1'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W + shift14[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2', 1);

        % Increasment of width of the Third Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('size', {'W + epsilon14[mm]' 'heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W + shift14[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L/2 +heigth_of_3microstrip_p2/2 +height_of_3microstrip_p1/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon14 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon14 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon15 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 15
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the length of the third microstrip:
        model.param.set('epsilon15', length_increasment);
        model.param.descr('epsilon15', 'epsilon15 simulation');
        model.param.set('shift15', shift_up_down);
        model.param.descr('shift15', 'shift15 for epsilon15 simulation');

        % Increasment of length of the Third Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('size', {'W' 'height_of_3microstrip_p1 + epsilon15[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2 - shift15[mm]', 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon15 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon15 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    

    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon16 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 16
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the fourth microstrip:
        model.param.set('epsilon16', width_increasment);
        model.param.descr('epsilon16', 'epsilon16 simulation');
        model.param.set('shift16', shift_right_left );
        model.param.descr('shift16', 'shift16 for epsilon16 simulation');

        % Increasment of width of the Fourth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('size', {'W + epsilon16[mm]' 'height_of_4microstrip_p1'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W - shift16[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 ' ...
            '+ L +heigth_of_3microstrip_p2/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon16 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon16 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon17 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 17
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the fourth microstrip:
        model.param.set('epsilon17', width_increasment);
        model.param.descr('epsilon17', 'epsilon17 simulation');
        model.param.set('shift17', shift_right_left );
        model.param.descr('shift17', 'shift17 for epsilon17 simulation');

        % Increasment of width of the Fourth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('size', {'W + epsilon17[mm]' 'height_of_4microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W - shift17[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 + height_of_4microstrip_p2/2 + height_of_4microstrip_p1/2'], 1);

        % Increasment of width of the Fourth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('size', {'W + epsilon17[mm]' 'L - height_of_4microstrip_p1 - height_of_4microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W - shift17[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon17 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon17 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon18 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 18
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the length of the fourth microstrip:
        model.param.set('epsilon18', length_increasment);
        model.param.descr('epsilon18', 'epsilon18 simulation');
        model.param.set('shift18', shift_up_down );
        model.param.descr('shift18', 'shift18 for epsilon18 simulation');

        % Increasment of length of the Fourth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('size', {'W' 'L - height_of_4microstrip_p1 - height_of_4microstrip_p2 + epsilon18[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + shift18[mm]'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon18 Simulation')
        legend('S11','S21')

       % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon18 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon19 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 19
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the fourth microstrip:
        model.param.set('epsilon19', width_increasment);
        model.param.descr('epsilon19', 'epsilon19 simulation');
        model.param.set('shift19', shift_right_left );
        model.param.descr('shift19', 'shift19 for epsilon19 simulation');

        % Increasment of width of the Fourth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('size', {'W + epsilon19[mm]' 'L - height_of_4microstrip_p1 - height_of_4microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W + shift19[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon19 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon19 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    

    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon20 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 20
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the fourth microstrip:
        model.param.set('epsilon20', width_increasment);
        model.param.descr('epsilon20', 'epsilon20 simulation');
        model.param.set('shift20', shift_right_left );
        model.param.descr('shift20', 'shift20 for epsilon20 simulation');

        % Increasment of width of the Fourth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('size', {'W + epsilon20[mm]' 'height_of_4microstrip_p1'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W + shift20[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 ' ...
            '+ L +heigth_of_3microstrip_p2/2'], 1);

        % Increasment of width of the Fourth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('size', {'W + epsilon20[mm]' 'height_of_4microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W + shift20[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 + height_of_4microstrip_p2/2 + height_of_4microstrip_p1/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon20 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon20 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon21 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 21
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the length of the fourth microstrip:
        model.param.set('epsilon21', length_increasment);
        model.param.descr('epsilon21', 'epsilon21 simulation');
        model.param.set('shift21', shift_up_down);
        model.param.descr('shift21', 'shift21 for epsilon21 simulation');

        % Increasment of width of the Fourth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('size', {'W' 'height_of_4microstrip_p1 + epsilon21[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 ' ...
            '+ L +heigth_of_3microstrip_p2/2 - shift21[mm]'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon21 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon21 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon22 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 22
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon22', width_increasment);
        model.param.descr('epsilon22', 'epsilon22 simulation');
        model.param.set('shift22', shift_right_left);
        model.param.descr('shift22', 'shift22 for epsilon22 simulation');

        % Increasment of width of the Fifth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('size', {'W + epsilon22[mm]' 'height_of_5microstrip_p1'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - shift22[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon22 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon22 Simulation','text file.txt','WriteMode','append')
        
        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon23 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 23
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon23', width_increasment);
        model.param.descr('epsilon23', 'epsilon23 simulation');
        model.param.set('shift23', shift_right_left);
        model.param.descr('shift23', 'shift23 for epsilon23 simulation');

        % Increasment of width of the Fifth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('size', {'W + epsilon23[mm]' 'height_of_5microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - shift23[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + height_of_5microstrip_p2/2 + height_of_5microstrip_p1/2'], 1);

        % Increasment of width of the Fifth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('size', {'W + epsilon23[mm]' 'L - height_of_5microstrip_p1 - height_of_5microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - shift23[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + ' ...
            '2*L +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 +  height_of_5microstrip_p2/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon23 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon23 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    

    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon24 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 24
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the length of the fifth microstrip:
        model.param.set('epsilon24', length_increasment);
        model.param.descr('epsilon24', 'epsilon24 simulation');
        model.param.set('shift24', shift_up_down);
        model.param.descr('shift24', 'shift24 for epsilon24 simulation');

        % Increasment of length of the Fifth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('size', {'W' 'L - height_of_5microstrip_p1 - height_of_5microstrip_p2 + epsilon24[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + ' ...
            '2*L +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 +  height_of_5microstrip_p2/2 + shift24[mm]'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon24 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon24 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon25 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 25
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon25', width_increasment);
        model.param.descr('epsilon25', 'epsilon25 simulation');
        model.param.set('shift25', shift_right_left);
        model.param.descr('shift25', 'shift25 for epsilon25 simulation');

        % Increasment of width of the Fifth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('size', {'W + epsilon25[mm]' 'L - height_of_5microstrip_p1 - height_of_5microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W + shift25[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + ' ...
            '2*L +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 +  height_of_5microstrip_p2/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon25 Simulation')
        legend('S11','S21')

       % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon25 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon26 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 26
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon26', width_increasment);
        model.param.descr('epsilon26', 'epsilon26 simulation');
        model.param.set('shift26', shift_right_left);
        model.param.descr('shift26', 'shift26 for epsilon26 simulation');

        % Increasment of width of the Fifth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('size', {'W + epsilon26[mm]' 'height_of_5microstrip_p1'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W + shift26[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2'], 1);

        % Increasment of width of the Fifth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('size', {'W + epsilon26[mm]' 'height_of_5microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W + shift26[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + height_of_5microstrip_p2/2 + height_of_5microstrip_p1/2'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon26 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon26 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon27 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 27
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the length of the fifth microstrip:
        model.param.set('epsilon27', length_increasment);
        model.param.descr('epsilon27', 'epsilon27 simulation');
        model.param.set('shift27', shift_up_down);
        model.param.descr('shift27', 'shift27 for epsilon27 simulation');

        % Increasment of width of the Fifth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('size', {'W' 'height_of_5microstrip_p1 + epsilon27[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 - shift27[mm]'], 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon27 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon27 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    

    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon28 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 28
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the sixth microstrip:
        model.param.set('epsilon28', width_increasment);
        model.param.descr('epsilon28', 'epsilon28 simulation');
        model.param.set('shift28', shift_right_left);
        model.param.descr('shift28', 'shift28 for epsilon28 simulation')

        % Increasment of width of the Sixth Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('size', {'W + epsilon28[mm]' 'length_of_first'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + 2*gap_1 + 2*gap_2 +gap_3+ 5*W - shift28[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').setIndex('pos', 's_length/2 - length_of_first/2 - L1', 1);

        % Adapt the 50ohm transmission line properly
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol2').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol2').set('table', [0.0044 0.02975; 0.004-0.00003 0.02975; 0.003645 0.03115; 0.004755 0.03115; 0.0044 0.02975]);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon28 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon28 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    
        

    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon29 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 29
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the length of the sixth microstrip:
        model.param.set('epsilon29', length_increasment);
        model.param.descr('epsilon29', 'epsilon29 simulation');
        model.param.set('shift29', shift_up_down);
        model.param.descr('shift29', 'shift29 for epsilon29 simulation');

        % Increasment of length of the Sixth Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('size', {'W' 'length_of_first + epsilon29[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + 2*gap_1 + 2*gap_2 +gap_3+ 5*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').setIndex('pos', 's_length/2 - length_of_first/2 - L1 - shift29[mm]', 1);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon29 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon29 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    


    % ---------------------------------------------------------------------
    % --------------------- Simulation of Epsilon30 -----------------------
    % ---------------------------------------------------------------------
    elseif i == 30
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % Define the increasement on the width of the sixth microstrip:
        model.param.set('epsilon30', width_increasment);
        model.param.descr('epsilon30', 'epsilon30 simulation');
        model.param.set('shift30', shift_right_left);
        model.param.descr('shift30', 'shift30 for epsilon30 simulation');

        % Increasment of width of the Sixth Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('size', {'W + epsilon30[mm]' 'length_of_first'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + 2*gap_1 + 2*gap_2 +gap_3+ 5*W + shift30[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').setIndex('pos', 's_length/2 - length_of_first/2 - L1', 1);

        % Adapt the 50ohm transmission line properly
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol2').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol2').set('table', [0.0044+0.00003 0.02975; 0.004 0.02975; 0.003645 0.03115; 0.004755 0.03115; 0.0044+0.00003 0.02975]);

        % Run the new geometry:
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results:
        model.study('std2').run;

        % Plot the desirable results:
        figure(i)
        data = mphplot(model,'pg2');
        title('Epsilon30 Simulation')
        legend('S11','S21')

        % Save the data from the graph of S11:
        S11_graph = [data{1,1}{1,1}.p;transpose(data{1,1}{1,1}.d)];

        % Use the islocalmin function to find the local minimums of the
        % graph
        S11_logical_sinks = islocalmin(S11_graph(2,:));

        % islocalmin is a logic function, so when it finds a min it stores
        % 1 in the index of the array. We want the actual value:
        S11_sinks = find(S11_logical_sinks == 1);

        % Use the islocalmax function to find the local maximums of the
        % graph
        S11_logical_local_max = islocalmax(S11_graph(2,:));

        % islocalmax is a logic function, so when it finds a max it stores
        % 1 in the index of the array. We want the actual value:
        S11_local_max = find(S11_logical_local_max == 1);

        % Open a text file to store the desirable data:
        writematrix('This is Epsilon30 Simulation','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'text file.txt','WriteMode','append')
            writematrix(S11_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','text file.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'text file.txt','WriteMode','append')
            writematrix('             ','text file.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','text file.txt','WriteMode','append')
        writematrix('----------------------------------','text file.txt','WriteMode','append')
    

    end
end
out = FunctionOfEpsilonSimulations;
