function out = FunctionOfRootsUpShifted
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
simulations = 3;

for i = 1:simulations
    if i == 1
        % ---------------------------------------------------------------------
        % ---------------------- First Root Up Shift --------------------------
        % ---------------------------------------------------------------------
        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % ----------------- Define the parameters -------------------------

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon4', width_increasment);
        model.param.descr('epsilon4', 'epsilon4 simulation');
        model.param.set('shift4', shift_right_left);
        model.param.descr('shift4', 'shift4 for epsilon4 simulation');

        % Define the increasement on the length of the second microstrip:
        model.param.set('epsilon6', length_increasment);
        model.param.descr('epsilon6', 'epsilon6 simulation');
        model.param.set('shift6', shift_up_down);
        model.param.descr('shift6', 'shift6 for epsilon6 simulation');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon7', width_increasment);
        model.param.descr('epsilon7', 'epsilon7 simulation');
        model.param.set('shift7', shift_right_left);
        model.param.descr('shift7', 'shift7 for epsilon7 simulation');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon8', width_increasment);
        model.param.descr('epsilon8', 'epsilon8 simulation');
        model.param.set('shift8', shift_right_left);
        model.param.descr('shift8', 'shift8 for epsilon8 simulation');

        % Define the increasement on the length of the second microstrip:
        model.param.set('epsilon9', length_increasment);
        model.param.descr('epsilon9', 'epsilon9 simulation');
        model.param.set('shift9', shift_up_down);
        model.param.descr('shift9', 'shift9 for epsilon9 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon11', width_increasment);
        model.param.descr('epsilon11', 'epsilon11 simulation');
        model.param.set('shift11', shift_right_left);
        model.param.descr('shift11', 'shift11 for epsilon11 simulation');

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

        % Define the increasement on the width of the fourth microstrip:
        model.param.set('epsilon20', width_increasment);
        model.param.descr('epsilon20', 'epsilon20 simulation');
        model.param.set('shift20', shift_right_left );
        model.param.descr('shift20', 'shift20 for epsilon20 simulation');

        % Define the increasement on the length of the fourth microstrip:
        model.param.set('epsilon21', length_increasment);
        model.param.descr('epsilon21', 'epsilon21 simulation');
        model.param.set('shift21', shift_up_down);
        model.param.descr('shift21', 'shift21 for epsilon21 simulation');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon22', width_increasment);
        model.param.descr('epsilon22', 'epsilon22 simulation');
        model.param.set('shift22', shift_right_left);
        model.param.descr('shift22', 'shift22 for epsilon22 simulation');

        % Define the increasement on the length of the fifth microstrip:
        model.param.set('epsilon24', length_increasment);
        model.param.descr('epsilon24', 'epsilon24 simulation');
        model.param.set('shift24', shift_up_down);
        model.param.descr('shift24', 'shift24 for epsilon24 simulation');

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

        % Define the increasement on the length of the fifth microstrip:
        model.param.set('epsilon27', length_increasment);
        model.param.descr('epsilon27', 'epsilon27 simulation');
        model.param.set('shift27', shift_up_down);
        model.param.descr('shift27', 'shift27 for epsilon27 simulation');

        % Define the increasement on the length of the sixth microstrip:
        model.param.set('epsilon29', length_increasment);
        model.param.descr('epsilon29', 'epsilon29 simulation');
        model.param.set('shift29', shift_up_down);
        model.param.descr('shift29', 'shift29 for epsilon29 simulation');

        % Define the increasement on the width of the sixth microstrip:
        model.param.set('epsilon30', width_increasment);
        model.param.descr('epsilon30', 'epsilon30 simulation');
        model.param.set('shift30', shift_right_left);
        model.param.descr('shift30', 'shift30 for epsilon30 simulation');



        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r2');



        % --------- Changes in the geometry of second microstrip ----------

        % Decreasement of length of the Second Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('size', {'W - epsilon7[mm]' 'L - length_of_first - height_of_2microstrip_p2 - epsilon6[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W - shift7[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2 - shift6[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r5');

        % Decreasement of width of the Second Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('size', {'W' 'length_of_first - epsilon9[mm]'}); % + epsilon8[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W + 2*shift8[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 + shift9[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r3');

        % Increasment of width of the Second Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('size', {'W + epsilon8[mm]' 'height_of_2microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W + shift8[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').setIndex('pos', '-s_length/2 + length_of_first + L1 + height_of_2microstrip_p2/2', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r4');

        
        % --------- Changes in the geometry of third microstrip -----------

        % Increasment of width of the Third Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('size', {'W + epsilon11[mm] + epsilon13[mm]' 'L - height_of_3microstrip_p1 - heigth_of_3microstrip_p2 + epsilon12[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W' '0'}); % - shift11[mm] + shift13[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 + shift12[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r8');

        % Increasment of width of the Third Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('size', {'W + epsilon14[mm]' 'height_of_3microstrip_p1 + epsilon15[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W + shift14[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2  - shift15[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r6');

        % Increasment of width of the Third Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('size', {'W + epsilon11[mm] + epsilon14[mm]' 'heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W' '0'}); % + shift14[mm] - shift11[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L/2 +heigth_of_3microstrip_p2/2 +height_of_3microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r7');

        
        % --------- Changes in the geometry of fourth microstrip ----------

        % Increasment of width of the Fourth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('size', {'W' 'height_of_4microstrip_p1 + epsilon21[mm]'}); % + epsilon16[mm]- epsilon20[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W - 2*shift16[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 ' ...
            '+ L +heigth_of_3microstrip_p2/2 - shift21[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r9');

        % Increasment of length of the Fourth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('size', {'W + epsilon19[mm]' 'L - height_of_4microstrip_p1 - height_of_4microstrip_p2 + epsilon18[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W + shift19[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + shift18[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r11');

        % Decreasement of width of the Fourth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('size', {'W - epsilon20[mm]' 'height_of_4microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W - shift20[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 + height_of_4microstrip_p2/2 + height_of_4microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r10');


        % --------- Changes in the geometry of fifth microstrip -----------

        % Increasment of width of the Fifth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('size', {'W' 'height_of_5microstrip_p1 - epsilon27[mm]'}); % - epsilon22[mm] + epsilon26[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W + 2*shift22[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + shift27[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r12');

        % Decreasement of length of the Fifth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('size', {'W - epsilon25[mm]' 'L - height_of_5microstrip_p1 - height_of_5microstrip_p2 - epsilon24[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - shift25[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + ' ...
            '2*L +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 +  height_of_5microstrip_p2/2 - shift24[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r14');

        % Increasment of width of the Fifth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('size', {'W + epsilon26[mm]' 'height_of_5microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W + shift26[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + height_of_5microstrip_p2/2 + height_of_5microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r13');


        % --------- Changes in the geometry of sixth microstrip -----------

        % Increasment of width of the Sixth Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('size', {'W + epsilon30[mm]' 'length_of_first - epsilon29[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + 2*gap_1 + 2*gap_2 +gap_3+ 5*W + shift30[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').setIndex('pos', 's_length/2 - length_of_first/2 - L1 + shift29[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r15');

        % Adapt the 50ohm transmission line properly
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol2').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol2').set('table', [0.0044+0.00003 0.02975; 0.004 0.02975; 0.003645 0.03115; 0.004755 0.03115; 0.0044+0.00003 0.02975]);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('pol2');


        % ------------------ Save and run the new geometry ----------------

        % Run the new geometry
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results of our increasement
        model.study('std2').run;

        % Plot the desirable results
        figure(i)
        data = mphplot(model,'pg2');
        title('First root up shift')
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
        writematrix('This is First root Up Shift','UpShift.txt','Delimiter','tab')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'UpShift.txt','WriteMode','append')
            writematrix(S11_dB,'UpShift.txt','WriteMode','append')
            writematrix('             ','UpShift.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','UpShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'UpShift.txt','WriteMode','append')
            writematrix('             ','UpShift.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','UpShift.txt','WriteMode','append')
        writematrix('----------------------------------','UpShift.txt','WriteMode','append')


    elseif i == 2
        % ---------------------------------------------------------------------
        % --------------------- Second Root Up Shift --------------------------
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

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon5', width_increasment);
        model.param.descr('epsilon5', 'epsilon5 simulation');
        model.param.set('shift5', shift_right_left);
        model.param.descr('shift5', 'shift5 for epsilon5 simulation');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon7', width_increasment);
        model.param.descr('epsilon7', 'epsilon7 simulation');
        model.param.set('shift7', shift_right_left);
        model.param.descr('shift7', 'shift7 for epsilon7 simulation');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon8', width_increasment);
        model.param.descr('epsilon8', 'epsilon8 simulation');
        model.param.set('shift8', shift_right_left);
        model.param.descr('shift8', 'shift8 for epsilon8 simulation');

        % Define the increasement on the length of the second microstrip:
        model.param.set('epsilon9', length_increasment);
        model.param.descr('epsilon9', 'epsilon9 simulation');
        model.param.set('shift9', shift_up_down);
        model.param.descr('shift9', 'shift9 for epsilon9 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon10', width_increasment);
        model.param.descr('epsilon10', 'epsilon10 simulation');
        model.param.set('shift10', shift_right_left);
        model.param.descr('shift10', 'shift10 for epsilon10 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon11', width_increasment);
        model.param.descr('epsilon11', 'epsilon11 simulation');
        model.param.set('shift11', shift_right_left);
        model.param.descr('shift11', 'shift11 for epsilon11 simulation');

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
        model.param.set('epsilon17', width_increasment);
        model.param.descr('epsilon17', 'epsilon17 simulation');
        model.param.set('shift17', shift_right_left );
        model.param.descr('shift17', 'shift17 for epsilon17 simulation');

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

        % Define the increasement on the length of the fifth microstrip:
        model.param.set('epsilon27', length_increasment);
        model.param.descr('epsilon27', 'epsilon27 simulation');
        model.param.set('shift27', shift_up_down);
        model.param.descr('shift27', 'shift27 for epsilon27 simulation');

        % Define the increasement on the width of the sixth microstrip:
        model.param.set('epsilon28', width_increasment);
        model.param.descr('epsilon28', 'epsilon28 simulation');
        model.param.set('shift28', shift_right_left);
        model.param.descr('shift28', 'shift28 for epsilon28 simulation')

        % Define the increasement on the length of the sixth microstrip:
        model.param.set('epsilon29', length_increasment);
        model.param.descr('epsilon29', 'epsilon29 simulation');
        model.param.set('shift29', shift_up_down);
        model.param.descr('shift29', 'shift29 for epsilon29 simulation');

        % Define the increasement on the width of the sixth microstrip:
        model.param.set('epsilon30', width_increasment);
        model.param.descr('epsilon30', 'epsilon30 simulation');
        model.param.set('shift30', shift_right_left);
        model.param.descr('shift30', 'shift30 for epsilon30 simulation');


        % --------- Changes in the geometry of first microstrip -----------

        % Increasment of width of the First Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('size', {'W' 'length_of_first'}); % + epsilon1[mm] - epsilon3[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 - 2*shift1[mm]' '0'}); %- shift3[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').setIndex('pos', '-s_length/2 + length_of_first/2 + L1', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r2');

        % Adapt the 50ohm transmission line properly:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('table', [-0.004-0.00003 -0.02975; -0.003645 -0.03115; -0.004755 -0.03115; -0.0044-0.00003 -0.02975; -0.004-0.00003 -0.02975]);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('pol1');

        % -------- Changes in the geometry of second microstrip -----------

        % Decreasement of width of the Second Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('size', {'W' 'length_of_first - epsilon9[mm]'}); %  - epsilon4[mm] + epsilon8[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W + 2*shift4[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 + shift9[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r3');

        % Increasment of width of the Second Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('size', {'W' 'height_of_2microstrip_p2'}); % - epsilon5[mm] + epsilon8[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W + 2*shift5[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').setIndex('pos', '-s_length/2 + length_of_first + L1 + height_of_2microstrip_p2/2', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r4');

        % Increasment of width of the Second Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('size', {'W' 'L - length_of_first - height_of_2microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W + 2*shift5[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r5');

        % -------- Changes in the geometry of third microstrip ------------

        % Increasment of width of the Third Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('size', {'W' 'height_of_3microstrip_p1 + epsilon15[mm]'}); % + epsilon10[mm]- epsilon14[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - 2*shift10[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2 - shift15[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r6');

        % Increasment of width of the Third Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('size', {'W' 'heigth_of_3microstrip_p2'}); % + epsilon11[mm] - epsilon14[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - 2*shift11[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L/2 +heigth_of_3microstrip_p2/2 +height_of_3microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r7');

        % Increasment of width of the Third Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('size', {'W' 'L - height_of_3microstrip_p1 - heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W - 2*shift11[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r8');

        % -------- Changes in the geometry of fourth microstrip -----------

        % Increasment of width of the Fourth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('size', {'W' 'height_of_4microstrip_p1'}); %  - epsilon16[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W + 2*shift16[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 ' ...
            '+ L +heigth_of_3microstrip_p2/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r9');

        % Increasment of width of the Fourth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('size', {'W' 'height_of_4microstrip_p2'}); %- epsilon17[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W + 2*shift17[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 + height_of_4microstrip_p2/2 + height_of_4microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r10');

        % Increasment of width of the Fourth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('size', {'W' 'L - height_of_4microstrip_p1 - height_of_4microstrip_p2 + epsilon18[mm]'}); % - epsilon17[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W + 2*shift17[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + shift18[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r11');


        % -------- Changes in the geometry of fifth microstrip ------------

        % Increasment of width of the Fifth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('size', {'W' 'height_of_5microstrip_p1 + epsilon27[mm]'}); % + epsilon22[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - 2*shift22[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 - shift27[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r12');

        % Increasment of width of the Fifth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('size', {'W' 'height_of_5microstrip_p2'}); % + epsilon23[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - 2*shift23[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + height_of_5microstrip_p2/2 + height_of_5microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r13');

        % Increasment of width of the Fifth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('size', {'W' 'L - height_of_5microstrip_p1 - height_of_5microstrip_p2'}); %+ epsilon23[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - 2*shift23[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + ' ...
            '2*L +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 +  height_of_5microstrip_p2/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r14');


        % -------- Changes in the geometry of sixth microstrip ------------

        % Decreasement of width of the Sixth Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('size', {'W' 'length_of_first - epsilon29[mm]'}); %- epsilon28[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + 2*gap_1 + 2*gap_2 +gap_3+ 5*W + 2*shift28[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').setIndex('pos', 's_length/2 - length_of_first/2 - L1 + shift29[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r15');

        % Adapt the 50ohm transmission line properly
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol2').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol2').set('table', [0.0044+0.00003 0.02975; 0.004+0.00003 0.02975; 0.003645 0.03115; 0.004755 0.03115; 0.0044+0.00003 0.02975]);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('pol2');

        % ------------------ Save and run the new geometry ----------------

        % Run the new geometry
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results of our increasement
        model.study('std2').run;

        % Plot the desirable results
        figure(i)
        data = mphplot(model,'pg2');
        title('Second root up shift')
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
        writematrix('This is Second root Up Shift','UpShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'UpShift.txt','WriteMode','append')
            writematrix(S11_dB,'UpShift.txt','WriteMode','append')
            writematrix('             ','UpShift.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','UpShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'UpShift.txt','WriteMode','append')
            writematrix('             ','UpShift.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','UpShift.txt','WriteMode','append')
        writematrix('----------------------------------','UpShift.txt','WriteMode','append')


    elseif i == 3
        % ---------------------------------------------------------------------
        % ---------------------- Third Root Up Shift --------------------------
        % ---------------------------------------------------------------------

        % Call the COMSOL file with the CAD:
        model = mphload ('FilterChebyshevMesh.mph');

        % ----------------- Define the parameters -------------------------

        % Define the increasement on the width of the first microstrip:
        model.param.set('epsilon1', width_increasment);
        model.param.descr('epsilon1', 'epsilon1 simulation');
        model.param.set('shift1', shift_right_left);
        model.param.descr('shift1', 'shift1 for epsilon1 simulation');

        % Define the increasement on the length of the first microstrip:
        model.param.set('epsilon2', length_increasment);
        model.param.descr('epsilon2', 'epsilon2 simulation');
        model.param.set('shift2', shift_up_down);
        model.param.descr('shift2', 'shift2 for epsilon2 simulation');

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

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon5', width_increasment);
        model.param.descr('epsilon5', 'epsilon5 simulation');
        model.param.set('shift5', shift_right_left);
        model.param.descr('shift5', 'shift5 for epsilon5 simulation');

        % Define the increasement on the length of the second microstrip:
        model.param.set('epsilon6', length_increasment);
        model.param.descr('epsilon6', 'epsilon6 simulation');
        model.param.set('shift6', shift_up_down);
        model.param.descr('shift6', 'shift6 for epsilon6 simulation');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon7', width_increasment);
        model.param.descr('epsilon7', 'epsilon7 simulation');
        model.param.set('shift7', shift_right_left);
        model.param.descr('shift7', 'shift7 for epsilon7 simulation');

        % Define the increasement on the width of the second microstrip:
        model.param.set('epsilon8', width_increasment);
        model.param.descr('epsilon8', 'epsilon8 simulation');
        model.param.set('shift8', shift_right_left);
        model.param.descr('shift8', 'shift8 for epsilon8 simulation');

        % Define the increasement on the length of the second microstrip:
        model.param.set('epsilon9', length_increasment);
        model.param.descr('epsilon9', 'epsilon9 simulation');
        model.param.set('shift9', shift_up_down);
        model.param.descr('shift9', 'shift9 for epsilon9 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon10', width_increasment);
        model.param.descr('epsilon10', 'epsilon10 simulation');
        model.param.set('shift10', shift_right_left);
        model.param.descr('shift10', 'shift10 for epsilon10 simulation');

        % Define the increasement on the width of the third microstrip:
        model.param.set('epsilon11', width_increasment);
        model.param.descr('epsilon11', 'epsilon11 simulation');
        model.param.set('shift11', shift_right_left);
        model.param.descr('shift11', 'shift11 for epsilon11 simulation');

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
        model.param.set('epsilon17', width_increasment);
        model.param.descr('epsilon17', 'epsilon17 simulation');
        model.param.set('shift17', shift_right_left );
        model.param.descr('shift17', 'shift17 for epsilon17 simulation');

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

        % Define the increasement on the length of the fourth microstrip:
        model.param.set('epsilon21', length_increasment);
        model.param.descr('epsilon21', 'epsilon21 simulation');
        model.param.set('shift21', shift_up_down);
        model.param.descr('shift21', 'shift21 for epsilon21 simulation');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon22', width_increasment);
        model.param.descr('epsilon22', 'epsilon22 simulation');
        model.param.set('shift22', shift_right_left);
        model.param.descr('shift22', 'shift22 for epsilon22 simulation');

        % Define the increasement on the width of the fifth microstrip:
        model.param.set('epsilon23', width_increasment);
        model.param.descr('epsilon23', 'epsilon23 simulation');
        model.param.set('shift23', shift_right_left);
        model.param.descr('shift23', 'shift23 for epsilon23 simulation');

        % Define the increasement on the length of the fifth microstrip:
        model.param.set('epsilon24', length_increasment);
        model.param.descr('epsilon24', 'epsilon24 simulation');
        model.param.set('shift24', shift_up_down);
        model.param.descr('shift24', 'shift24 for epsilon24 simulation');

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

        % Define the increasement on the length of the fifth microstrip:
        model.param.set('epsilon27', length_increasment);
        model.param.descr('epsilon27', 'epsilon27 simulation');
        model.param.set('shift27', shift_up_down);
        model.param.descr('shift27', 'shift27 for epsilon27 simulation');

        % Define the increasement on the width of the sixth microstrip:
        model.param.set('epsilon28', width_increasment);
        model.param.descr('epsilon28', 'epsilon28 simulation');
        model.param.set('shift28', shift_right_left);
        model.param.descr('shift28', 'shift28 for epsilon28 simulation')

        % Define the increasement on the length of the sixth microstrip:
        model.param.set('epsilon29', length_increasment);
        model.param.descr('epsilon29', 'epsilon29 simulation');
        model.param.set('shift29', shift_up_down);
        model.param.descr('shift29', 'shift29 for epsilon29 simulation');

        % Define the increasement on the width of the sixth microstrip:
        model.param.set('epsilon30', width_increasment);
        model.param.descr('epsilon30', 'epsilon30 simulation');
        model.param.set('shift30', shift_right_left);
        model.param.descr('shift30', 'shift30 for epsilon30 simulation');



        % --------- Changes in the geometry of first microstrip -----------

        % Increasment of width of the First Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('size', {'W' 'length_of_first + epsilon2[mm]'}); % + epsilon1[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 - 2*shift1[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r2').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 + shift2[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r2');

        % Adapt the 50ohm transmission line properly:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('table', [-0.004-0.00003 -0.02975; -0.003645 -0.03115; -0.004755 -0.03115; -0.0044-0.00003 -0.02975; -0.004-0.00003 -0.02975]);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('pol1');

        % --------- Changes in the geometry of second microstrip ----------

        % Decreasement of width of the Second Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('size', {'W - epsilon4[mm] - epsilon8[mm]' 'length_of_first + epsilon9[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W' '0'}); % + shift4[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r3').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 - shift9[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r3');

        % Decreasement of width of the Second Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('size', {'W - epsilon5[mm] - epsilon8[mm]' 'height_of_2microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W' '0'}); % + shift5[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r4').setIndex('pos', '-s_length/2 + length_of_first + L1 + height_of_2microstrip_p2/2', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r4');

        % Increasment of width of the Second Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('size', {'W' 'L - length_of_first - height_of_2microstrip_p2 + epsilon6[mm]'}); % - epsilon5[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + W + 2*shift5[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r5').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2 + shift6[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r5');


        % --------- Changes in the geometry of third microstrip -----------

        % Decreasement of width of the Third Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('size', {'W - epsilon10[mm] - epsilon14[mm]' 'height_of_3microstrip_p1 - epsilon15[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W' '0'}); %+ shift10[mm]
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r6').setIndex('pos', '-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + L/2 + shift15[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r6');

        % Decreasement of width of the Third Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('size', {'W - epsilon11[mm] - epsilon14[mm]' 'heigth_of_3microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r7').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L/2 +heigth_of_3microstrip_p2/2 +height_of_3microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r7');

        % Decreasement of width of the Third Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('size', {'W - epsilon11[mm]- epsilon13[mm]' 'L - height_of_3microstrip_p1 - heigth_of_3microstrip_p2 - epsilon12[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 + 2*W' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r8').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 - shift12[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r8');


        % --------- Changes in the geometry of fourth microstrip ----------

        % Decreasement of width of the Fourth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('size', {'W - epsilon16[mm]' 'height_of_4microstrip_p1 - epsilon21[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W + shift16[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r9').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 ' ...
            '+ L +heigth_of_3microstrip_p2/2 + shift21[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r9');

        % Increasment of width of the Fourth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('size', {'W + epsilon17[mm]' 'height_of_4microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W - shift17[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r10').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            ' L +heigth_of_3microstrip_p2/2 + height_of_4microstrip_p2/2 + height_of_4microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r10');

        % Increasment of width of the Fourth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('size', {'W' 'L - height_of_4microstrip_p1 - height_of_4microstrip_p2 - epsilon18[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + gap_2 +gap_3+ 3*W - 2*shift17[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r11').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 - shift18[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r11');


        % --------- Changes in the geometry of fifth microstrip -----------

        % Increasment of width of the Fifth Microstrip Part 1:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('size', {'W' 'height_of_5microstrip_p1 + epsilon27[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - 2*shift22[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r12').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 - shift27[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r12');

        % Increasment of width of the Fifth Microstrip Part 2:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('size', {'W' 'height_of_5microstrip_p2'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - 2*shift23[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r13').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 +' ...
            '3* L/2 +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 + height_of_5microstrip_p2/2 + height_of_5microstrip_p1/2'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r13');

        % Increasment of width of the Fifth Microstrip Part 3:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('size', {'W' 'L - height_of_5microstrip_p1 - height_of_5microstrip_p2 + epsilon24[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + gap_1 + 2*gap_2 +gap_3+ 4*W - 2*shift23[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r14').setIndex('pos', ['-s_length/2 + length_of_first/2 + L1 +height_of_2microstrip_p2/2 + ' ...
            '2*L +heigth_of_3microstrip_p2/2  + height_of_4microstrip_p2/2 +  height_of_5microstrip_p2/2 + shift24[mm]'], 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r14');


        % --------- Changes in the geometry of sixth microstrip -----------

        % Increasment of width of the Sixth Microstrip:
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('size', {'W' 'length_of_first + epsilon29[mm]'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('base', 'center');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').set('pos', {'-s_width/2 + W1 + 0.765[mm] - W/2 + 2*gap_1 + 2*gap_2 +gap_3+ 5*W + 2*shift28[mm]' '0'});
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('r15').setIndex('pos', 's_length/2 - length_of_first/2 - L1 - shift29[mm]', 1);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('r15');

        % Adapt the 50ohm transmission line properly
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol2').set('source', 'table');
        model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol2').set('table', [0.0044+0.00003 0.02975; 0.004+0.00003 0.02975; 0.003645 0.03115; 0.004755 0.03115; 0.0044+0.00003 0.02975]);

        % Run the changes so we have the new geometry
        model.component('comp1').geom('geom1').feature('wp1').geom.run('pol2');



        % ------------------ Save and run the new geometry ----------------

        % Run the new geometry
        model.component('comp1').geom('geom1').run('fin');

        % Run Study 2, to take the results of our increasement
        model.study('std2').run;

        % Plot the desirable results
        figure(i)
        data = mphplot(model,'pg2');
        title('Third root up shift')
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
        writematrix('This is Third root Up Shift','UpShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % each frequency and the corresponding dB value:
        for j = 1:length(S11_sinks)

            S11_frequence = S11_graph(1,S11_sinks(j));
            S11_dB = S11_graph(2,S11_sinks(j));

            writematrix(S11_frequence,'UpShift.txt','WriteMode','append')
            writematrix(S11_dB,'UpShift.txt','WriteMode','append')
            writematrix('             ','UpShift.txt','WriteMode','append')

        end

        % We draw a line to separate local max:
        writematrix('----------------------------------','UpShift.txt','WriteMode','append')

        % With the below for loop, we store in the txt file the data of
        % local max dBs:
        for k = 1:length(S11_local_max)

            S11_local_max_dB = S11_graph(2,S11_local_max(k));

            writematrix(S11_local_max_dB,'UpShift.txt','WriteMode','append')
            writematrix('             ','UpShift.txt','WriteMode','append')
        end

        % We draw two lines to separate each simulation:
        writematrix('----------------------------------','UpShift.txt','WriteMode','append')
        writematrix('----------------------------------','UpShift.txt','WriteMode','append')

    end
end
out = FunctionOfRootsUpShifted;

