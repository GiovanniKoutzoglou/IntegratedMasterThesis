function out = FunctionOfRootsRightShifted
import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath(['E:\' native2unicode(hex2dec({'03' '94'}), 'unicode')  native2unicode(hex2dec({'03' 'b9'}), 'unicode')  native2unicode(hex2dec({'03' ...
    'c0'}), 'unicode')  native2unicode(hex2dec({'03' 'bb'}), 'unicode')  native2unicode(hex2dec({'03' 'c9'}), 'unicode')  native2unicode(hex2dec({'03' ...
    'bc'}), 'unicode')  native2unicode(hex2dec({'03' 'b1'}), 'unicode')  native2unicode(hex2dec({'03' 'c4'}), 'unicode')  native2unicode(hex2dec({'03' ...
    'b9'}), 'unicode')  native2unicode(hex2dec({'03' 'ba'}), 'unicode')  native2unicode(hex2dec({'03' 'ae'}), 'unicode') '\FinalCodes Draft1\Stage 2nd']);

% ---------------------------------------------------------------------
% ------------------------- Set Parameters ----------------------------
% ---------------------------------------------------------------------

width_increasment = 0.03;
length_increasment = 0.04;
shift_right_left = width_increasment/2;
shift_up_down = length_increasment/2;
simulations = 4;

for i = 1:simulations
    if i == 1
        % ---------------------------------------------------------------------
        % ---------------------- First Root Right Shift -----------------------
        % ---------------------------------------------------------------------

        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % ----------------- Define the parameters -------------------------

        % Define the increasement on the width of the first microstrip:
        model.param.set('epsilon1', width_increasment);
        model.param.descr('epsilon1', 'epsilon1 simulation');
        model.param.set('shift1', shift_right_left);
        model.param.descr('shift1', 'shift1 for epsilon1 simulation');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon8', width_increasment);
        model.param.descr('epsilon8', 'epsilon8 simulation');
        model.param.set('shift8', shift_right_left);
        model.param.descr('shift8', 'shift8 for epsilon8 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon10', width_increasment);
        model.param.descr('epsilon10', 'epsilon10 simulation');
        model.param.set('shift10', shift_right_left);
        model.param.descr('shift10', 'shift10 for epsilon10 simulation');

        % Define the increasement on the length of the third microstrip:
        model.param.set('epsilon12', length_increasment);
        model.param.descr('epsilon12', 'epsilon12 simulation');
        model.param.set('shift12', shift_up_down);
        model.param.descr('shift12', 'shift12 for epsilon12 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon13', width_increasment);
        model.param.descr('epsilon13', 'epsilon13 simulation');
        model.param.set('shift13', shift_right_left);
        model.param.descr('shift13', 'shift13 for epsilon13 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon14', width_increasment);
        model.param.descr('epsilon14', 'epsilon14 simulation');
        model.param.set('shift14', shift_right_left);
        model.param.descr('shift14', 'shift14 for epsilon14 simulation');

        % Define the increasement on the length of the third microstrip:
        model.param.set('epsilon15', length_increasment);
        model.param.descr('epsilon15', 'epsilon15 simulation');
        model.param.set('shift15', shift_up_down);
        model.param.descr('shift15', 'shift15 for epsilon15 simulation');

        % Define the increasement on the width of the fourth microstrip:
        model.param.set('epsilon16', width_increasment);
        model.param.descr('epsilon16', 'epsilon16 simulation');
        model.param.set('shift16', shift_right_left );
        model.param.descr('shift16', 'shift16 for epsilon16 simulation');

        % Define the increasement on the width of the fourth microstrip:
        model.param.set('epsilon19', width_increasment);
        model.param.descr('epsilon19', 'epsilon19 simulation');
        model.param.set('shift19', shift_right_left );
        model.param.descr('shift19', 'shift19 for epsilon19 simulation');


        % --------- Changes in the geometry of first microstrip -----------

        % Increasment of width of the First Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('size', {'W + epsilon1[mm]' 'length_of_first'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 - shift1[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').setIndex('pos', '-s_length/2 + length_of_first/2 + L1', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r2');

        % Adapt the 50ohm transmission line properly:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('table', [-0.004 -0.02975; -0.003645 -0.03115; -0.004755 -0.03115; -0.0044-0.00003 -0.02975; -0.004 -0.02975]);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('pol1');


        % --------- Changes in the geometry of second microstrip ----------

        % Decreasement of width of the Second Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('size', {'W - epsilon8[mm]' 'length_of_first'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W - shift8[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').setIndex('pos', '-s_length/2 + length_of_first/2 + L1', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r3');

        % Decreasement of width of the Second Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('size', {'W - epsilon8[mm]' 'height_of_2microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W - shift8[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').setIndex('pos', '-s_length/2 + length_of_first + L1 + height_of_2microstrip_p2/2', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r4');


        % --------- Changes in the geometry of third microstrip -----------

        % Decreasement of width of the Third Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('size', {'W - epsilon10[mm]' 'height_of_3microstrip_p1'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W + shift10[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r6');

        % Decreasement of length of the Third Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('size', {'W - epsilon13[mm]' 'L - height_of_3microstrip_p1 - heigth_of_3microstrip_p2 - epsilon12[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - shift13[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 - shift12[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r8');

        % Decreasement of width of the Third Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('size', {'W - 2*epsilon14[mm]' 'height_of_3microstrip_p1- epsilon15[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W' '0'}); %- shift14[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 + height_of_2microstrip_p2/2 + L/2 + shift15[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r6');

        % Decreasement of width of the Third Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('size', {'W - epsilon14[mm]' 'heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - shift14[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L/2 +heigth_of_3microstrip_p2/2 +height_of_3microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r7');


        % --------- Changes in the geometry of fourth microstrip ----------

        % Decreasement of width of the Fourth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('size', {'W - epsilon16[mm]' 'height_of_4microstrip_p1'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W + shift16[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 ' ...
            '+ L +heigth_of_3microstrip_p2/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r9');

        % Decreasement of width of the Fourth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('size', {'W - epsilon19[mm]' 'L - height_of_4microstrip_p1 - height_of_4microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W - shift19[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r11');


        % ------------------ Save and run the new geometry ----------------

        % Run the new geometry
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results of our increasement
        model.study('std2').run;

        % Plot the desirable results
        figure(i)
        data = mphplot(model,'pg2');
        title('First root right shift')
        legend('S11','S21')


        % ---------------- Save the data to a text file -------------------

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
        writematrix('This is First root Right Shift','RightShift.txt','Delimiter','tab')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'RightShift.txt','WriteMode','append')
            writematrix(S11_dB,'RightShift.txt','WriteMode','append')
            writematrix('             ','RightShift.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'RightShift.txt','WriteMode','append')
            writematrix('             ','RightShift.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')


    elseif i == 2
        % ---------------------------------------------------------------------
        % ---------------------- Second Root Right Shift ----------------------
        % ---------------------------------------------------------------------

        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % ----------------- Define the parameters -------------------------

        % Define the increasement on the length of the second microstrip:
        model.param.set('epsilon6', length_increasment);
        model.param.descr('epsilon6', 'epsilon6 simulation');
        model.param.set('shift6', shift_up_down);
        model.param.descr('shift6', 'shift6 for epsilon6 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon13', width_increasment);
        model.param.descr('epsilon13', 'epsilon13 simulation');
        model.param.set('shift13', shift_right_left);
        model.param.descr('shift13', 'shift13 for epsilon13 simulation');

        % Define the increasement on the width of the fourth microstrip:
        model.param.set('epsilon20', width_increasment);
        model.param.descr('epsilon20', 'epsilon20 simulation');
        model.param.set('shift20', shift_right_left );
        model.param.descr('shift20', 'shift20 for epsilon20 simulation');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon22', width_increasment);
        model.param.descr('epsilon22', 'epsilon22 simulation');
        model.param.set('shift22', shift_right_left);
        model.param.descr('shift22', 'shift22 for epsilon22 simulation');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon26', width_increasment);
        model.param.descr('epsilon26', 'epsilon26 simulation');
        model.param.set('shift26', shift_right_left);
        model.param.descr('shift26', 'shift26 for epsilon26 simulation');

        % Define the increasement on the length of the fifth microstrip:
        model.param.set('epsilon27', length_increasment);
        model.param.descr('epsilon27', 'epsilon27 simulation');
        model.param.set('shift27', shift_up_down);
        model.param.descr('shift27', 'shift27 for epsilon27 simulation');


        % -------- Changes in the geometry of second microstrip -----------

        % Decreasement of length of the Second Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('size', {'W' 'L - length_of_first - height_of_2microstrip_p2 - epsilon6[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2 - shift6[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r5');

        % -------- Changes in the geometry of third microstrip ------------

        % Increasment of width of the Third Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('size', {'W + epsilon13[mm]' 'L - height_of_3microstrip_p1 - heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W + shift13[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r8');

        % -------- Changes in the geometry of fourth microstrip -----------

        % Decreasement of width of the Fourth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('size', {'W - epsilon20[mm]' 'height_of_4microstrip_p1'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W - shift20[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 ' ...
            '+ L +heigth_of_3microstrip_p2/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r9');

        % Decreasement of width of the Fourth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('size', {'W - epsilon20[mm]' 'height_of_4microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W - shift20[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 + height_of_4microstrip_p2/2 + height_of_4microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r10');

        % -------- Changes in the geometry of fifth microstrip ------------

        % Decreasement of width of the Fifth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('size', {'W' 'height_of_5microstrip_p1 - epsilon27[mm]'}); %+ epsilon26[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W + 2*shift26[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + shift27[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r12');

        % Increasment of width of the Fifth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('size', {'W + epsilon26[mm]' 'height_of_5microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W + shift26[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + height_of_5microstrip_p2/2 + height_of_5microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r13');


        % ------------------ Save and run the new geometry ----------------

        % Run the new geometry
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results of our increasement
        model.study('std2').run;

        % Plot the desirable results
        figure(i)
        data = mphplot(model,'pg2');
        title('Second root right shift')
        legend('S11','S21')


        % ---------------- Save the data to a text file -------------------

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
        writematrix('This is Second root Right Shift','RightShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'RightShift.txt','WriteMode','append')
            writematrix(S11_dB,'RightShift.txt','WriteMode','append')
            writematrix('             ','RightShift.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'RightShift.txt','WriteMode','append')
            writematrix('             ','RightShift.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')


    elseif i == 3
        % ---------------------------------------------------------------------
        % ---------------------- Third Root Right Shift -----------------------
        % ---------------------------------------------------------------------

        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % ----------------- Define the parameters -------------------------

        % Define the increasement on the length of the second microstrip:
        model.param.set('epsilon6', length_increasment);
        model.param.descr('epsilon6', 'epsilon6 simulation');
        model.param.set('shift6', shift_up_down);
        model.param.descr('shift6', 'shift6 for epsilon6 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon11', width_increasment);
        model.param.descr('epsilon11', 'epsilon11 simulation');
        model.param.set('shift11', shift_right_left);
        model.param.descr('shift11', 'shift11 for epsilon11 simulation');

        % Define the increasement on the length of the fourth microstrip:
        model.param.set('epsilon18', length_increasment);
        model.param.descr('epsilon18', 'epsilon18 simulation');
        model.param.set('shift18', shift_up_down );
        model.param.descr('shift18', 'shift18 for epsilon18 simulation');

        % Define the increasement on the width of the fourth microstrip:
        model.param.set('epsilon19', width_increasment);
        model.param.descr('epsilon19', 'epsilon19 simulation');
        model.param.set('shift19', shift_right_left );
        model.param.descr('shift19', 'shift19 for epsilon19 simulation');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon26', width_increasment);
        model.param.descr('epsilon26', 'epsilon26 simulation');
        model.param.set('shift26', shift_right_left);
        model.param.descr('shift26', 'shift26 for epsilon26 simulation');

        % Define the increasement on the length of the fifth microstrip:
        model.param.set('epsilon27', length_increasment);
        model.param.descr('epsilon27', 'epsilon27 simulation');
        model.param.set('shift27', shift_up_down);
        model.param.descr('shift27', 'shift27 for epsilon27 simulation');


        % --------- Changes in the geometry of second microstrip ----------

        % Decreasement of length of the Second Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('size', {'W' 'L - length_of_first - height_of_2microstrip_p2 - epsilon6[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2 - shift6[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r5');

        % --------- Changes in the geometry of third microstrip -----------

        % Increasment of width of the Third Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('size', {'W + epsilon11[mm]' 'heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - shift11[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L/2 +heigth_of_3microstrip_p2/2 +height_of_3microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r7');

        % Increasment of width of the Third Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('size', {'W + epsilon11[mm]' 'L - height_of_3microstrip_p1 - heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - shift11[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r7');


        % --------- Changes in the geometry of fourth microstrip ----------

        % Increasment of length of the Fourth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('size', {'W + epsilon19[mm]' 'L - height_of_4microstrip_p1 - height_of_4microstrip_p2 + epsilon18[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W + shift19[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + shift18[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r11');


        % --------- Changes in the geometry of fifth microstrip -----------

        % Decreasement of width of the Fifth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('size', {'W - epsilon26[mm]' 'height_of_5microstrip_p1 - epsilon27[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - shift26[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + shift27[mm]'], 1);

        model.component('comp1').geom('geom1').feature('wp1').geom.run('r12');

        % Decreasement of width of the Fifth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('size', {'W - epsilon26[mm]' 'height_of_5microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - shift26[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + height_of_5microstrip_p2/2 + height_of_5microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r13');


        % ------------------ Save and run the new geometry ----------------

        % Run the new geometry
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results of our increasement
        model.study('std2').run;

        % Plot the desirable results
        figure(i)
        data = mphplot(model,'pg2');
        title('Third root right shift')
        legend('S11','S21')


        % ---------------- Save the data to a text file -------------------

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
        writematrix('This is Third root Right Shift','RightShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'RightShift.txt','WriteMode','append')
            writematrix(S11_dB,'RightShift.txt','WriteMode','append')
            writematrix('             ','RightShift.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'RightShift.txt','WriteMode','append')
            writematrix('             ','RightShift.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')


    elseif i == 4
        % ---------------------------------------------------------------------
        % --------------------- Fourth Root Right Shift -----------------------
        % ---------------------------------------------------------------------

        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % ----------------- Define the parameters -------------------------

        % Define the increasement on the width of the first microstrip:
        model.param.set('epsilon1', width_increasment);
        model.param.descr('epsilon1', 'epsilon1 simulation');
        model.param.set('shift1', shift_right_left);
        model.param.descr('shift1', 'shift1 for epsilon1 simulation');

        % Define the increasement on the width of the first microstrip:
        model.param.set('epsilon3', width_increasment);
        model.param.descr('epsilon3', 'epsilon3 simulation');
        model.param.set('shift3', shift_right_left);
        model.param.descr('shift3', 'shift3 for epsilon3 simulation');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon4', width_increasment);
        model.param.descr('epsilon4', 'epsilon4 simulation');
        model.param.set('shift4', shift_right_left);
        model.param.descr('shift4', 'shift4 for epsilon4 simulation');

        % Define the increasement on the length of the third microstrip:
        model.param.set('epsilon12', length_increasment);
        model.param.descr('epsilon12', 'epsilon12 simulation');
        model.param.set('shift12', shift_up_down);
        model.param.descr('shift12', 'shift12 for epsilon12 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon14', width_increasment);
        model.param.descr('epsilon14', 'epsilon14 simulation');
        model.param.set('shift14', shift_right_left);
        model.param.descr('shift14', 'shift14 for epsilon14 simulation');

        % Define the increasement on the length of the third microstrip:
        model.param.set('epsilon15', length_increasment);
        model.param.descr('epsilon15', 'epsilon15 simulation');
        model.param.set('shift15', shift_up_down);
        model.param.descr('shift15', 'shift15 for epsilon15 simulation');

        % Define the increasement on the length of the fourth microstrip:
        model.param.set('epsilon18', length_increasment);
        model.param.descr('epsilon18', 'epsilon18 simulation');
        model.param.set('shift18', shift_up_down );
        model.param.descr('shift18', 'shift18 for epsilon18 simulation');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon23', width_increasment);
        model.param.descr('epsilon23', 'epsilon23 simulation');
        model.param.set('shift23', shift_right_left);
        model.param.descr('shift23', 'shift23 for epsilon23 simulation');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon25', width_increasment);
        model.param.descr('epsilon25', 'epsilon25 simulation');
        model.param.set('shift25', shift_right_left);
        model.param.descr('shift25', 'shift25 for epsilon25 simulation');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon26', width_increasment);
        model.param.descr('epsilon26', 'epsilon26 simulation');
        model.param.set('shift26', shift_right_left);
        model.param.descr('shift26', 'shift26 for epsilon26 simulation');


        % --------- Changes in the geometry of first microstrip -----------

        % Decreasement of width of the First Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('size', {'W' 'length_of_first'}); %  - epsilon3[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 - shift3[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').setIndex('pos', '-s_length/2 + length_of_first/2 + L1', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r2');

        % Adapt the 50ohm transmission line properly:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('table', [-0.004-0.000015 -0.02975; -0.003645 -0.03115; -0.004755 -0.03115; -0.0044-0.000015 -0.02975; -0.004-0.000015 -0.02975]);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('pol1');


        % --------- Changes in the geometry of second microstrip ----------

        % Decreasement of width of the Second Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('size', {'W - epsilon4[mm]' 'length_of_first'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W + shift4[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').setIndex('pos', '-s_length/2 + length_of_first/2 + L1', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r4');


        % --------- Changes in the geometry of third microstrip -----------

        % Decreasement of length of the Third Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('size', {'W' 'L - height_of_3microstrip_p1 - heigth_of_3microstrip_p2 - epsilon12[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 - shift12[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r8');

        % Decreasement of width of the Third Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('size', {'W - epsilon14[mm]' 'height_of_3microstrip_p1 - epsilon15[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - shift14[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2 + shift15[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r6');

        % Decreasement of width of the Third Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('size', {'W - epsilon14[mm]' 'heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - shift14[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L/2 +heigth_of_3microstrip_p2/2 +height_of_3microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r7');

        % -------- Changes in the geometry of fourth microstrip -----------

        % Decreasement of length of the Fourth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('size', {'W' 'L - height_of_4microstrip_p1 - height_of_4microstrip_p2 - epsilon18[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 - shift18[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r11');

        % --------- Changes in the geometry of fifth microstrip -----------

        % Increasment of width of the Fifth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('size', {'W' 'L - height_of_5microstrip_p1 - height_of_5microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - 2*shift25[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + ' ...
            '2*L +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 +  height_of_5microstrip_p2/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r14');

        % Decreasement of width of the Fifth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('size', {'W - epsilon26[mm]' 'height_of_5microstrip_p1'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - shift26[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r12');

        % Increasment of width of the Fifth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('size', {'W' 'height_of_5microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - 2*shift26[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + height_of_5microstrip_p2/2 + height_of_5microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r13');


        % ------------------ Save and run the new geometry ----------------

        % Run the new geometry
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results of our increasement
        model.study('std2').run;

        % Plot the desirable results
        figure(i)
        data = mphplot(model,'pg2');
        title('Fourth root right shift')
        legend('S11','S21')


        % ---------------- Save the data to a text file -------------------

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
        writematrix('This is Fourth root Right Shift','RightShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'RightShift.txt','WriteMode','append')
            writematrix(S11_dB,'RightShift.txt','WriteMode','append')
            writematrix('             ','RightShift.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'RightShift.txt','WriteMode','append')
            writematrix('             ','RightShift.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')
        writematrix('----------------------------------','RightShift.txt','WriteMode','append')

    end
end
out = FunctionOfRootsRightShifted;

