1

   Abaqus 2023.HF4                                  Date 02-Apr-2025   Time 16:27:51
   For use by AALTO UNIVERSITY under license from Dassault Systemes or its subsidiary.

                                                                                 
                                                                                 
 STEP    1     INCREMENT     1     STEP TIME    0.00    


                        S T E P       1     C O U P L E D - T E M P E R A T U R E - D I S P L A C E M E N T   A N A L Y S I S


                                                                                          

     AUTOMATIC TIME CONTROL WITH -
          A SUGGESTED INITIAL TIME INCREMENT OF                 1.00    
          AND A TOTAL TIME PERIOD OF                            100.    
          THE MINIMUM TIME INCREMENT ALLOWED IS                1.000E-03
          THE MAXIMUM TIME INCREMENT ALLOWED IS                 1.00    

          CREEP AND SWELLING EFFECTS ARE OMITTED IN THIS STEP

     THE SIZE OF THE TIME INCREMENT IS CONTROLLED BY -
          THE TEMPERATURE CHANGE PER INCREMENT NOT EXCEEDING            100.    
          THE RATE DEPENDENCY WILL BE CONSIDERED IN THIS STEP

          CREEP AND SWELLING EFFECTS WILL BE IGNORED.

 CONVERGENCE TOLERANCE PARAMETERS FOR FORCE    
     CRITERION FOR RESIDUAL FORCE     FOR A NONLINEAR PROBLEM          5.000E-03
     CRITERION FOR DISP.    CORRECTION IN A NONLINEAR PROBLEM          1.000E-02
     INITIAL VALUE OF TIME AVERAGE FORCE                               1.000E-02
     AVERAGE FORCE     IS TIME AVERAGE FORCE    
     ALTERNATE CRIT. FOR RESIDUAL FORCE     FOR A NONLINEAR PROBLEM    2.000E-02
     CRITERION FOR ZERO FORCE     RELATIVE TO TIME AVRG. FORCE         1.000E-05
     CRITERION FOR RESIDUAL FORCE     WHEN THERE IS ZERO FLUX          1.000E-05
     CRITERION FOR DISP.    CORRECTION WHEN THERE IS ZERO FLUX         1.000E-03
     CRITERION FOR RESIDUAL FORCE     FOR A LINEAR INCREMENT           1.000E-08
     FIELD CONVERSION RATIO                                             1.00    
     CRITERION FOR ZERO FORCE     REL. TO TIME AVRG. MAX. FORCE        1.000E-05
     CRITERION FOR ZERO DISP.    RELATIVE TO CHARACTERISTIC LENGTH     1.000E-08

 CONVERGENCE TOLERANCE PARAMETERS FOR HEAT FLUX
     CRITERION FOR RESIDUAL HEAT FLUX FOR A NONLINEAR PROBLEM          5.000E-03
     CRITERION FOR TEMP.    CORRECTION IN A NONLINEAR PROBLEM          1.000E-02
     INITIAL VALUE OF TIME AVERAGE HEAT FLUX                           1.000E-02
     AVERAGE HEAT FLUX IS TIME AVERAGE HEAT FLUX
     ALTERNATE CRIT. FOR RESIDUAL HEAT FLUX FOR A NONLINEAR PROBLEM    2.000E-02
     CRITERION FOR ZERO HEAT FLUX RELATIVE TO TIME AVRG. HEAT FLUX     1.000E-05
     CRITERION FOR RESIDUAL HEAT FLUX WHEN THERE IS ZERO FLUX          1.000E-05
     CRITERION FOR TEMP.    CORRECTION WHEN THERE IS ZERO FLUX         1.000E-03
     CRITERION FOR RESIDUAL HEAT FLUX FOR A LINEAR INCREMENT           1.000E-08
     FIELD CONVERSION RATIO                                             1.00    
     CRITERION FOR ZERO HEAT FLUX REL. TO TIME AVRG. MAX. HEAT FLUX    1.000E-05

     VOLUMETRIC STRAIN COMPATIBILITY TOLERANCE FOR HYBRID SOLIDS       1.000E-05
     AXIAL STRAIN COMPATIBILITY TOLERANCE FOR HYBRID BEAMS             1.000E-05
     TRANS. SHEAR STRAIN COMPATIBILITY TOLERANCE FOR HYBRID BEAMS      1.000E-05
     SOFT CONTACT CONSTRAINT COMPATIBILITY TOLERANCE FOR P>P0          5.000E-03
     SOFT CONTACT CONSTRAINT COMPATIBILITY TOLERANCE FOR P=0.0         0.100    
     CONTACT FORCE ERROR TOLERANCE FOR CONVERT SDI=YES                 1.00    
     DISPLACEMENT COMPATIBILITY TOLERANCE FOR DCOUP ELEMENTS           1.000E-05
     ROTATION COMPATIBILITY TOLERANCE FOR DCOUP ELEMENTS               1.000E-05

 EQUILIBRIUM WILL BE CHECKED FOR SEVERE DISCONTINUITY ITERATIONS

 TIME INCREMENTATION CONTROL PARAMETERS:
     FIRST EQUILIBRIUM ITERATION FOR CONSECUTIVE DIVERGENCE CHECK              4
     EQUILIBRIUM ITERATION AT WHICH LOG. CONVERGENCE RATE CHECK BEGINS         8
     EQUILIBRIUM ITERATION AFTER WHICH ALTERNATE RESIDUAL IS USED              9
     MAXIMUM EQUILIBRIUM ITERATIONS ALLOWED                                   16
     EQUILIBRIUM ITERATION COUNT FOR CUT-BACK IN NEXT INCREMENT               10
     MAXIMUM EQUILIB. ITERS IN TWO INCREMENTS FOR TIME INCREMENT INCREASE      4
     MAXIMUM ITERATIONS FOR SEVERE DISCONTINUITIES                            50
     MAXIMUM ATTEMPTS ALLOWED IN AN INCREMENT                                  5
     MAXIMUM DISCON. ITERS IN TWO INCREMENTS FOR TIME INCREMENT INCREASE      50
     MAXIMUM CONTACT AUGMENTATIONS FOR *SURFACE BEHAVIOR,AUGMENTED LAGRANGE   50
     CONSECUTIVE INCS MEETING TIME INTEG. TOL. FOR TIME INC. INCREASE          3
     CUT-BACK FACTOR AFTER DIVERGENCE                                 0.2500    
     CUT-BACK FACTOR FOR TOO SLOW CONVERGENCE                         0.5000    
     CUT-BACK FACTOR AFTER TOO MANY EQUILIBRIUM ITERATIONS            0.7500    
     CUT-BACK FACTOR AFTER TOO MANY SEVERE DISCONTINUITY ITERATIONS   0.2500    
     CUT-BACK FACTOR AFTER PROBLEMS IN ELEMENT ASSEMBLY               0.2500    
     INCREASE FACTOR AFTER TWO INCREMENTS THAT CONVERGE QUICKLY        1.500    
     MAX. TIME INCREMENT INCREASE FACTOR ALLOWED                       1.500    
     MAX. TIME INCREMENT INCREASE FACTOR ALLOWED (DYNAMICS)            1.250    
     MAX. TIME INCREMENT INCREASE FACTOR ALLOWED (DIFFUSION)           2.000    
     MINIMUM TIME INCREMENT RATIO FOR EXTRAPOLATION TO OCCUR          0.1000    
     CUT-BACK FACTOR WHEN TIME INTEGRATION ACCURACY TOL. EXCEEDED     0.8500    
     MAX. RATIO OF TIME INTEG. MEASURE TO TOL. FOR TIME INC. INCREASE 0.7500    
     INCREASE FACTOR FOR TIME INCREMENT WHEN POSSIBLE                 0.8000    
     MIN. TIME INC. INCREASE FACTOR IN LINEAR TRANSIENT PROBLEMS      0.9500    
     MAX. RATIO OF TIME INCREMENT TO STABILITY LIMIT                   1.000    
     FRACTION OF STABILITY LIMIT FOR NEW TIME INCREMENT               0.9500    
     TIME INCREMENT INCREASE FACTOR BEFORE A TIME POINT                1.000    
     GLOBAL STABILIZATION CONTROL IS NOT USED

          PRINT OF INCREMENT NUMBER, TIME, ETC., EVERY    1  INCREMENTS

     THE MAXIMUM NUMBER OF INCREMENTS IN THIS STEP IS                   10000

          LARGE DISPLACEMENT THEORY WILL BE USED

          UNSYMMETRIC MATRIX STORAGE AND SOLUTION WILL BE USED

     LINEAR EXTRAPOLATION WILL BE USED

     CHARACTERISTIC ELEMENT LENGTH     1.000E-03

     DETAILS REGARDING ACTUAL SOLUTION WAVEFRONT REQUESTED

     DETAILED OUTPUT OF DIAGNOSTICS TO DATABASE REQUESTED

     PRINT OF INCREMENT NUMBER, TIME, ETC., TO THE MESSAGE FILE EVERY     1  INCREMENTS

     COLLECTING MODEL CONSTRAINT INFORMATION FOR OVERCONSTRAINT CHECKS

     COLLECTING STEP CONSTRAINT INFORMATION FOR OVERCONSTRAINT CHECKS


  INCREMENT     1 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  6ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       174.       TIME AVG. FORCE        174.    
 LARGEST SCALED RESIDUAL FORCE       1.97       AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE       1.97    
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
          FORCE     EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.

 AVERAGE HEAT FLUX                  1.725E-04   TIME AVG. HEAT FLUX   1.725E-04
 LARGEST RESIDUAL HEAT FLUX         4.779E-05   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.629       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.        0.629       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       173.       TIME AVG. FORCE        173.    
 LARGEST SCALED RESIDUAL FORCE      1.915E-05   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.915E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.935E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.585E-04   TIME AVG. HEAT FLUX   1.585E-04
 LARGEST RESIDUAL HEAT FLUX         1.004E-05   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.749       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.        0.120       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                       173.       TIME AVG. FORCE        173.    
 LARGEST SCALED RESIDUAL FORCE     -2.343E-11   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -2.343E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.878E-13   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.556E-04   TIME AVG. HEAT FLUX   1.556E-04
 LARGEST RESIDUAL HEAT FLUX         2.108E-06   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.774       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.        2.515E-02   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     4


 AVERAGE FORCE                       173.       TIME AVG. FORCE        173.    
 LARGEST SCALED RESIDUAL FORCE     -1.362E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -1.362E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.       -6.040E-19   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.549E-04   TIME AVG. HEAT FLUX   1.549E-04
 LARGEST RESIDUAL HEAT FLUX         4.428E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.779       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.        5.283E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.779    

 ITERATION SUMMARY FOR THE INCREMENT:   4 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  4 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  1.000E-02
 STEP TIME COMPLETED        1.00    ,  TOTAL TIME COMPLETED         1.00    


  INCREMENT     2 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.027E+03   TIME AVG. FORCE        600.    
 LARGEST SCALED RESIDUAL FORCE      7.527E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      7.527E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.812E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.520E-04   TIME AVG. HEAT FLUX   1.535E-04
 LARGEST RESIDUAL HEAT FLUX        -1.308E-06   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.764       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.554E-02   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.027E+03   TIME AVG. FORCE        600.    
 LARGEST SCALED RESIDUAL FORCE      1.760E-11   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.760E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        7.309E-13   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.514E-04   TIME AVG. HEAT FLUX   1.531E-04
 LARGEST RESIDUAL HEAT FLUX        -2.746E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.760       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.264E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.760    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  2.000E-02
 STEP TIME COMPLETED        2.00    ,  TOTAL TIME COMPLETED         2.00    


  INCREMENT     3 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.525E+03   TIME AVG. FORCE        908.    
 LARGEST SCALED RESIDUAL FORCE      7.285E-05   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      7.285E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.727E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.486E-04   TIME AVG. HEAT FLUX   1.516E-04
 LARGEST RESIDUAL HEAT FLUX        -1.411E-06   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.744       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.670E-02   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.525E+03   TIME AVG. FORCE        908.    
 LARGEST SCALED RESIDUAL FORCE      8.393E-11   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      8.393E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        7.006E-13   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.479E-04   TIME AVG. HEAT FLUX   1.514E-04
 LARGEST RESIDUAL HEAT FLUX        -2.963E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.740       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.508E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.740    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  3.000E-02
 STEP TIME COMPLETED        3.00    ,  TOTAL TIME COMPLETED         3.00    


  INCREMENT     4 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  0ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.011E+03   TIME AVG. FORCE       1.184E+03
 LARGEST SCALED RESIDUAL FORCE      7.053E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      7.053E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.644E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.452E-04   TIME AVG. HEAT FLUX   1.499E-04
 LARGEST RESIDUAL HEAT FLUX        -1.368E-06   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.724       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.614E-02   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      2.011E+03   TIME AVG. FORCE       1.184E+03
 LARGEST SCALED RESIDUAL FORCE      2.268E-11   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.268E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        6.718E-13   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.446E-04   TIME AVG. HEAT FLUX   1.497E-04
 LARGEST RESIDUAL HEAT FLUX        -2.874E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.721       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.390E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.721    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  4.000E-02
 STEP TIME COMPLETED        4.00    ,  TOTAL TIME COMPLETED         4.00    


  INCREMENT     5 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.488E+03   TIME AVG. FORCE       1.445E+03
 LARGEST SCALED RESIDUAL FORCE      6.831E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      6.831E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.564E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.420E-04   TIME AVG. HEAT FLUX   1.482E-04
 LARGEST RESIDUAL HEAT FLUX        -1.321E-06   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.705       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.552E-02   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      2.488E+03   TIME AVG. FORCE       1.445E+03
 LARGEST SCALED RESIDUAL FORCE      4.225E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.225E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        6.444E-13   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.413E-04   TIME AVG. HEAT FLUX   1.480E-04
 LARGEST RESIDUAL HEAT FLUX        -2.776E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.702       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.262E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.702    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  5.000E-02
 STEP TIME COMPLETED        5.00    ,  TOTAL TIME COMPLETED         5.00    


  INCREMENT     6 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.954E+03   TIME AVG. FORCE       1.696E+03
 LARGEST SCALED RESIDUAL FORCE      6.618E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      6.618E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.486E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.389E-04   TIME AVG. HEAT FLUX   1.465E-04
 LARGEST RESIDUAL HEAT FLUX        -1.276E-06   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.687       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.494E-02   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      2.954E+03   TIME AVG. FORCE       1.696E+03
 LARGEST SCALED RESIDUAL FORCE     -1.789E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -1.789E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        6.184E-13   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.382E-04   TIME AVG. HEAT FLUX   1.464E-04
 LARGEST RESIDUAL HEAT FLUX        -2.682E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.684       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.139E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.684    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  6.000E-02
 STEP TIME COMPLETED        6.00    ,  TOTAL TIME COMPLETED         6.00    


  INCREMENT     7 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  0ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      3.411E+03   TIME AVG. FORCE       1.941E+03
 LARGEST SCALED RESIDUAL FORCE      6.414E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      6.414E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.411E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.358E-04   TIME AVG. HEAT FLUX   1.449E-04
 LARGEST RESIDUAL HEAT FLUX        -1.234E-06   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.669       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.438E-02   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      3.411E+03   TIME AVG. FORCE       1.941E+03
 LARGEST SCALED RESIDUAL FORCE      9.777E-12   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      9.777E-12
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        5.937E-13   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.352E-04   TIME AVG. HEAT FLUX   1.448E-04
 LARGEST RESIDUAL HEAT FLUX        -2.593E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.666       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.023E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.666    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  7.000E-02
 STEP TIME COMPLETED        7.00    ,  TOTAL TIME COMPLETED         7.00    


  INCREMENT     8 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      3.858E+03   TIME AVG. FORCE       2.181E+03
 LARGEST SCALED RESIDUAL FORCE      6.217E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      6.217E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.338E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.329E-04   TIME AVG. HEAT FLUX   1.433E-04
 LARGEST RESIDUAL HEAT FLUX        -1.193E-06   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.652       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.385E-02   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      3.858E+03   TIME AVG. FORCE       2.181E+03
 LARGEST SCALED RESIDUAL FORCE      2.945E-11   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.945E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        5.702E-13   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.323E-04   TIME AVG. HEAT FLUX   1.432E-04
 LARGEST RESIDUAL HEAT FLUX        -2.507E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.650       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.912E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.650    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  8.000E-02
 STEP TIME COMPLETED        8.00    ,  TOTAL TIME COMPLETED         8.00    


  INCREMENT     9 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      4.296E+03   TIME AVG. FORCE       2.416E+03
 LARGEST SCALED RESIDUAL FORCE      6.029E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      6.029E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.267E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.301E-04   TIME AVG. HEAT FLUX   1.418E-04
 LARGEST RESIDUAL HEAT FLUX        -1.153E-06   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.636       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.335E-02   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      4.296E+03   TIME AVG. FORCE       2.416E+03
 LARGEST SCALED RESIDUAL FORCE      3.340E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.340E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        5.478E-13   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.295E-04   TIME AVG. HEAT FLUX   1.417E-04
 LARGEST RESIDUAL HEAT FLUX        -2.425E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.633       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.806E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.633    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  9.000E-02
 STEP TIME COMPLETED        9.00    ,  TOTAL TIME COMPLETED         9.00    


  INCREMENT    10 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      4.726E+03   TIME AVG. FORCE       2.647E+03
 LARGEST SCALED RESIDUAL FORCE      5.847E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      5.847E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.199E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.273E-04   TIME AVG. HEAT FLUX   1.403E-04
 LARGEST RESIDUAL HEAT FLUX        -1.116E-06   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.621       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.287E-02   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      4.726E+03   TIME AVG. FORCE       2.647E+03
 LARGEST SCALED RESIDUAL FORCE      1.550E-11   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.550E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        5.265E-13   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.268E-04   TIME AVG. HEAT FLUX   1.402E-04
 LARGEST RESIDUAL HEAT FLUX        -2.346E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.618       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.706E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.618    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.100    
 STEP TIME COMPLETED        10.0    ,  TOTAL TIME COMPLETED         10.0    


  INCREMENT    11 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      5.146E+03   TIME AVG. FORCE       2.874E+03
 LARGEST SCALED RESIDUAL FORCE      5.673E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      5.673E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.132E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.247E-04   TIME AVG. HEAT FLUX   1.388E-04
 LARGEST RESIDUAL HEAT FLUX        -1.080E-06   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.605       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.241E-02   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      5.146E+03   TIME AVG. FORCE       2.874E+03
 LARGEST SCALED RESIDUAL FORCE      1.600E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.600E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        5.062E-13   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.241E-04   TIME AVG. HEAT FLUX   1.387E-04
 LARGEST RESIDUAL HEAT FLUX        -2.271E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.603       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.609E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.603    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.110    
 STEP TIME COMPLETED        11.0    ,  TOTAL TIME COMPLETED         11.0    


  INCREMENT    12 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      5.559E+03   TIME AVG. FORCE       3.098E+03
 LARGEST SCALED RESIDUAL FORCE      5.506E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      5.506E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.068E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.221E-04   TIME AVG. HEAT FLUX   1.374E-04
 LARGEST RESIDUAL HEAT FLUX        -1.046E-06   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.591       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.197E-02   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      5.559E+03   TIME AVG. FORCE       3.098E+03
 LARGEST SCALED RESIDUAL FORCE     -2.512E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -2.512E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        4.869E-13   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.216E-04   TIME AVG. HEAT FLUX   1.373E-04
 LARGEST RESIDUAL HEAT FLUX        -2.199E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.588       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.518E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.588    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.120    
 STEP TIME COMPLETED        12.0    ,  TOTAL TIME COMPLETED         12.0    


  INCREMENT    13 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      5.963E+03   TIME AVG. FORCE       3.318E+03
 LARGEST SCALED RESIDUAL FORCE      5.344E-05   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      5.344E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.005E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.196E-04   TIME AVG. HEAT FLUX   1.360E-04
 LARGEST RESIDUAL HEAT FLUX        -1.013E-06   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.577       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.156E-02   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      5.963E+03   TIME AVG. FORCE       3.318E+03
 LARGEST SCALED RESIDUAL FORCE      5.161E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      5.161E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        4.685E-13   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.191E-04   TIME AVG. HEAT FLUX   1.359E-04
 LARGEST RESIDUAL HEAT FLUX        -2.130E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.574       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.430E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.574    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.130    
 STEP TIME COMPLETED        13.0    ,  TOTAL TIME COMPLETED         13.0    


  INCREMENT    14 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      6.359E+03   TIME AVG. FORCE       3.535E+03
 LARGEST SCALED RESIDUAL FORCE      5.189E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      5.189E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.944E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.172E-04   TIME AVG. HEAT FLUX   1.346E-04
 LARGEST RESIDUAL HEAT FLUX        -9.816E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.563       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.116E-02   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      6.359E+03   TIME AVG. FORCE       3.535E+03
 LARGEST SCALED RESIDUAL FORCE      2.453E-11   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.453E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        4.509E-13   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.167E-04   TIME AVG. HEAT FLUX   1.345E-04
 LARGEST RESIDUAL HEAT FLUX        -2.064E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.561       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.347E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.561    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.140    
 STEP TIME COMPLETED        14.0    ,  TOTAL TIME COMPLETED         14.0    


  INCREMENT    15 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      6.747E+03   TIME AVG. FORCE       3.750E+03
 LARGEST SCALED RESIDUAL FORCE      5.040E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      5.040E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.885E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.149E-04   TIME AVG. HEAT FLUX   1.332E-04
 LARGEST RESIDUAL HEAT FLUX        -9.515E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.550       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.078E-02   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      6.747E+03   TIME AVG. FORCE       3.750E+03
 LARGEST SCALED RESIDUAL FORCE     -3.223E-11   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -3.223E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        4.341E-13   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.144E-04   TIME AVG. HEAT FLUX   1.332E-04
 LARGEST RESIDUAL HEAT FLUX        -2.001E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.548       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.267E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.548    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.150    
 STEP TIME COMPLETED        15.0    ,  TOTAL TIME COMPLETED         15.0    


  INCREMENT    16 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      7.128E+03   TIME AVG. FORCE       3.961E+03
 LARGEST SCALED RESIDUAL FORCE      4.897E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.897E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.828E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.126E-04   TIME AVG. HEAT FLUX   1.319E-04
 LARGEST RESIDUAL HEAT FLUX        -9.225E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.537       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.041E-02   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      7.128E+03   TIME AVG. FORCE       3.961E+03
 LARGEST SCALED RESIDUAL FORCE      4.383E-11   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.383E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        4.181E-13   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.122E-04   TIME AVG. HEAT FLUX   1.319E-04
 LARGEST RESIDUAL HEAT FLUX        -1.940E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.535       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.191E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.535    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.160    
 STEP TIME COMPLETED        16.0    ,  TOTAL TIME COMPLETED         16.0    


  INCREMENT    17 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      7.502E+03   TIME AVG. FORCE       4.169E+03
 LARGEST SCALED RESIDUAL FORCE      4.758E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.758E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.772E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.104E-04   TIME AVG. HEAT FLUX   1.306E-04
 LARGEST RESIDUAL HEAT FLUX        -8.948E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.525       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.007E-02   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      7.502E+03   TIME AVG. FORCE       4.169E+03
 LARGEST SCALED RESIDUAL FORCE     -4.297E-11   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -4.297E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        4.028E-13   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.100E-04   TIME AVG. HEAT FLUX   1.306E-04
 LARGEST RESIDUAL HEAT FLUX        -1.882E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.523       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.118E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.523    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.170    
 STEP TIME COMPLETED        17.0    ,  TOTAL TIME COMPLETED         17.0    


  INCREMENT    18 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      7.868E+03   TIME AVG. FORCE       4.374E+03
 LARGEST SCALED RESIDUAL FORCE      4.625E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.625E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.718E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.083E-04   TIME AVG. HEAT FLUX   1.294E-04
 LARGEST RESIDUAL HEAT FLUX        -8.682E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.513       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -9.734E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      7.868E+03   TIME AVG. FORCE       4.374E+03
 LARGEST SCALED RESIDUAL FORCE     -4.138E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -4.138E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.882E-13   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.079E-04   TIME AVG. HEAT FLUX   1.293E-04
 LARGEST RESIDUAL HEAT FLUX        -1.826E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.511       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.048E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.511    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.180    
 STEP TIME COMPLETED        18.0    ,  TOTAL TIME COMPLETED         18.0    


  INCREMENT    19 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      8.227E+03   TIME AVG. FORCE       4.577E+03
 LARGEST SCALED RESIDUAL FORCE      4.496E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.496E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.665E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.062E-04   TIME AVG. HEAT FLUX   1.281E-04
 LARGEST RESIDUAL HEAT FLUX        -8.426E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.502       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -9.416E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      8.227E+03   TIME AVG. FORCE       4.577E+03
 LARGEST SCALED RESIDUAL FORCE     -3.240E-11   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -3.240E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.742E-13   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.058E-04   TIME AVG. HEAT FLUX   1.281E-04
 LARGEST RESIDUAL HEAT FLUX        -1.773E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.500       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.981E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.500    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.190    
 STEP TIME COMPLETED        19.0    ,  TOTAL TIME COMPLETED         19.0    


  INCREMENT    20 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      8.580E+03   TIME AVG. FORCE       4.777E+03
 LARGEST SCALED RESIDUAL FORCE      4.372E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.372E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.614E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.042E-04   TIME AVG. HEAT FLUX   1.269E-04
 LARGEST RESIDUAL HEAT FLUX        -8.181E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.491       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -9.111E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      8.580E+03   TIME AVG. FORCE       4.777E+03
 LARGEST SCALED RESIDUAL FORCE     -3.433E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -3.433E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.609E-13   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.038E-04   TIME AVG. HEAT FLUX   1.269E-04
 LARGEST RESIDUAL HEAT FLUX        -1.721E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.489       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.917E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.489    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.200    
 STEP TIME COMPLETED        20.0    ,  TOTAL TIME COMPLETED         20.0    


  INCREMENT    21 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      8.926E+03   TIME AVG. FORCE       4.975E+03
 LARGEST SCALED RESIDUAL FORCE      4.253E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.253E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.564E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.023E-04   TIME AVG. HEAT FLUX   1.257E-04
 LARGEST RESIDUAL HEAT FLUX        -7.944E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.480       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -8.819E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      8.926E+03   TIME AVG. FORCE       4.975E+03
 LARGEST SCALED RESIDUAL FORCE     -4.172E-11   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -4.172E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.481E-13   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.019E-04   TIME AVG. HEAT FLUX   1.257E-04
 LARGEST RESIDUAL HEAT FLUX        -1.672E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.478       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.856E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.478    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.210    
 STEP TIME COMPLETED        21.0    ,  TOTAL TIME COMPLETED         21.0    


  INCREMENT    22 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      9.266E+03   TIME AVG. FORCE       5.170E+03
 LARGEST SCALED RESIDUAL FORCE      4.138E-05   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.138E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.516E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.004E-04   TIME AVG. HEAT FLUX   1.245E-04
 LARGEST RESIDUAL HEAT FLUX        -7.718E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.470       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -8.539E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      9.266E+03   TIME AVG. FORCE       5.170E+03
 LARGEST SCALED RESIDUAL FORCE      5.878E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      5.878E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.359E-13   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  1.000E-04   TIME AVG. HEAT FLUX   1.245E-04
 LARGEST RESIDUAL HEAT FLUX        -1.624E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.468       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.797E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.468    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.220    
 STEP TIME COMPLETED        22.0    ,  TOTAL TIME COMPLETED         22.0    


  INCREMENT    23 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      9.599E+03   TIME AVG. FORCE       5.363E+03
 LARGEST SCALED RESIDUAL FORCE      4.026E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.026E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.469E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.859E-05   TIME AVG. HEAT FLUX   1.234E-04
 LARGEST RESIDUAL HEAT FLUX        -7.499E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.460       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -8.270E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      9.599E+03   TIME AVG. FORCE       5.363E+03
 LARGEST SCALED RESIDUAL FORCE      2.470E-11   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.470E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.242E-13   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  9.821E-05   TIME AVG. HEAT FLUX   1.234E-04
 LARGEST RESIDUAL HEAT FLUX        -1.578E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.458       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.740E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.458    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.230    
 STEP TIME COMPLETED        23.0    ,  TOTAL TIME COMPLETED         23.0    


  INCREMENT    24 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  0ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      9.926E+03   TIME AVG. FORCE       5.553E+03
 LARGEST SCALED RESIDUAL FORCE      3.919E-05   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.919E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.423E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.681E-05   TIME AVG. HEAT FLUX   1.223E-04
 LARGEST RESIDUAL HEAT FLUX        -7.289E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.450       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -8.013E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      9.926E+03   TIME AVG. FORCE       5.553E+03
 LARGEST SCALED RESIDUAL FORCE     -2.788E-11   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -2.788E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.130E-13   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  9.644E-05   TIME AVG. HEAT FLUX   1.223E-04
 LARGEST RESIDUAL HEAT FLUX        -1.534E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.448       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.686E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.448    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.240    
 STEP TIME COMPLETED        24.0    ,  TOTAL TIME COMPLETED         24.0    


  INCREMENT    25 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.025E+04   TIME AVG. FORCE       5.740E+03
 LARGEST SCALED RESIDUAL FORCE      3.815E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.815E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.378E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.508E-05   TIME AVG. HEAT FLUX   1.212E-04
 LARGEST RESIDUAL HEAT FLUX        -7.087E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.440       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -7.766E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.025E+04   TIME AVG. FORCE       5.740E+03
 LARGEST SCALED RESIDUAL FORCE     -1.552E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -1.552E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        3.023E-13   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  9.472E-05   TIME AVG. HEAT FLUX   1.212E-04
 LARGEST RESIDUAL HEAT FLUX        -1.492E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.439       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.634E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.439    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.250    
 STEP TIME COMPLETED        25.0    ,  TOTAL TIME COMPLETED         25.0    


  INCREMENT    26 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.056E+04   TIME AVG. FORCE       5.926E+03
 LARGEST SCALED RESIDUAL FORCE      3.715E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.715E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.334E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.340E-05   TIME AVG. HEAT FLUX   1.201E-04
 LARGEST RESIDUAL HEAT FLUX        -6.893E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.431       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -7.528E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.056E+04   TIME AVG. FORCE       5.926E+03
 LARGEST SCALED RESIDUAL FORCE     -3.092E-11   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -3.092E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.921E-13   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  9.305E-05   TIME AVG. HEAT FLUX   1.201E-04
 LARGEST RESIDUAL HEAT FLUX        -1.451E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.430       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.585E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.430    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.260    
 STEP TIME COMPLETED        26.0    ,  TOTAL TIME COMPLETED         26.0    


  INCREMENT    27 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.087E+04   TIME AVG. FORCE       6.109E+03
 LARGEST SCALED RESIDUAL FORCE      3.619E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.619E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.292E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.176E-05   TIME AVG. HEAT FLUX   1.190E-04
 LARGEST RESIDUAL HEAT FLUX        -6.705E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.422       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -7.301E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.087E+04   TIME AVG. FORCE       6.109E+03
 LARGEST SCALED RESIDUAL FORCE      4.934E-11   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      4.934E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.822E-13   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  9.143E-05   TIME AVG. HEAT FLUX   1.190E-04
 LARGEST RESIDUAL HEAT FLUX        -1.411E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.421       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.537E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.421    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.270    
 STEP TIME COMPLETED        27.0    ,  TOTAL TIME COMPLETED         27.0    


  INCREMENT    28 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.118E+04   TIME AVG. FORCE       6.290E+03
 LARGEST SCALED RESIDUAL FORCE      3.525E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.525E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.251E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.017E-05   TIME AVG. HEAT FLUX   1.180E-04
 LARGEST RESIDUAL HEAT FLUX        -6.525E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.414       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -7.082E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.118E+04   TIME AVG. FORCE       6.290E+03
 LARGEST SCALED RESIDUAL FORCE     -1.216E-11   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -1.216E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.728E-13   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  8.985E-05   TIME AVG. HEAT FLUX   1.180E-04
 LARGEST RESIDUAL HEAT FLUX        -1.374E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.412       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.491E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.412    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.280    
 STEP TIME COMPLETED        28.0    ,  TOTAL TIME COMPLETED         28.0    


  INCREMENT    29 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.147E+04   TIME AVG. FORCE       6.469E+03
 LARGEST SCALED RESIDUAL FORCE      3.435E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.435E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.211E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.862E-05   TIME AVG. HEAT FLUX   1.170E-04
 LARGEST RESIDUAL HEAT FLUX        -6.351E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.405       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -6.871E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.147E+04   TIME AVG. FORCE       6.469E+03
 LARGEST SCALED RESIDUAL FORCE     -3.286E-11   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -3.286E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.637E-13   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  8.831E-05   TIME AVG. HEAT FLUX   1.170E-04
 LARGEST RESIDUAL HEAT FLUX        -1.337E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.404       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.447E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.404    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.290    
 STEP TIME COMPLETED        29.0    ,  TOTAL TIME COMPLETED         29.0    


  INCREMENT    30 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.177E+04   TIME AVG. FORCE       6.645E+03
 LARGEST SCALED RESIDUAL FORCE      3.347E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.347E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.171E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.712E-05   TIME AVG. HEAT FLUX   1.160E-04
 LARGEST RESIDUAL HEAT FLUX        -6.183E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.397       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -6.669E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.177E+04   TIME AVG. FORCE       6.645E+03
 LARGEST SCALED RESIDUAL FORCE     -2.669E-11   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -2.669E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.550E-13   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  8.681E-05   TIME AVG. HEAT FLUX   1.160E-04
 LARGEST RESIDUAL HEAT FLUX        -1.302E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.396       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.404E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.396    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.300    
 STEP TIME COMPLETED        30.0    ,  TOTAL TIME COMPLETED         30.0    


  INCREMENT    31 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.206E+04   TIME AVG. FORCE       6.820E+03
 LARGEST SCALED RESIDUAL FORCE      3.263E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.263E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.133E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.565E-05   TIME AVG. HEAT FLUX   1.150E-04
 LARGEST RESIDUAL HEAT FLUX        -6.021E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.389       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -6.475E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.206E+04   TIME AVG. FORCE       6.820E+03
 LARGEST SCALED RESIDUAL FORCE     -2.228E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -2.228E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.467E-13   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  8.535E-05   TIME AVG. HEAT FLUX   1.150E-04
 LARGEST RESIDUAL HEAT FLUX        -1.268E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.388       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.363E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.388    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.310    
 STEP TIME COMPLETED        31.0    ,  TOTAL TIME COMPLETED         31.0    


  INCREMENT    32 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.234E+04   TIME AVG. FORCE       6.992E+03
 LARGEST SCALED RESIDUAL FORCE      3.181E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.181E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.096E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.422E-05   TIME AVG. HEAT FLUX   1.140E-04
 LARGEST RESIDUAL HEAT FLUX        -5.865E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.382       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -6.288E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.234E+04   TIME AVG. FORCE       6.992E+03
 LARGEST SCALED RESIDUAL FORCE      3.115E-11   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.115E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.387E-13   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  8.393E-05   TIME AVG. HEAT FLUX   1.140E-04
 LARGEST RESIDUAL HEAT FLUX        -1.235E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.380       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.324E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.380    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.320    
 STEP TIME COMPLETED        32.0    ,  TOTAL TIME COMPLETED         32.0    


  INCREMENT    33 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.262E+04   TIME AVG. FORCE       7.163E+03
 LARGEST SCALED RESIDUAL FORCE      3.102E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.102E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.059E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.283E-05   TIME AVG. HEAT FLUX   1.130E-04
 LARGEST RESIDUAL HEAT FLUX        -5.714E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.374       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -6.108E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.262E+04   TIME AVG. FORCE       7.163E+03
 LARGEST SCALED RESIDUAL FORCE     -2.416E-11   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -2.416E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.310E-13   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  8.255E-05   TIME AVG. HEAT FLUX   1.130E-04
 LARGEST RESIDUAL HEAT FLUX        -1.203E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.373       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.286E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.373    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.330    
 STEP TIME COMPLETED        33.0    ,  TOTAL TIME COMPLETED         33.0    


  INCREMENT    34 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.289E+04   TIME AVG. FORCE       7.331E+03
 LARGEST SCALED RESIDUAL FORCE      3.026E-05   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      3.026E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.024E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.148E-05   TIME AVG. HEAT FLUX   1.121E-04
 LARGEST RESIDUAL HEAT FLUX        -5.569E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.367       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -5.934E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -1.250E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.367    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.340    
 STEP TIME COMPLETED        34.0    ,  TOTAL TIME COMPLETED         34.0    


  INCREMENT    35 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.316E+04   TIME AVG. FORCE       7.498E+03
 LARGEST SCALED RESIDUAL FORCE      2.952E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.952E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.989E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.022E-05   TIME AVG. HEAT FLUX   1.112E-04
 LARGEST RESIDUAL HEAT FLUX        -6.361E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.360       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -6.758E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.316E+04   TIME AVG. FORCE       7.498E+03
 LARGEST SCALED RESIDUAL FORCE     -2.387E-11   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE     -2.387E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.166E-13   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  7.990E-05   TIME AVG. HEAT FLUX   1.112E-04
 LARGEST RESIDUAL HEAT FLUX        -1.340E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.359       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.423E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.359    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.350    
 STEP TIME COMPLETED        35.0    ,  TOTAL TIME COMPLETED         35.0    


  INCREMENT    36 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.342E+04   TIME AVG. FORCE       7.662E+03
 LARGEST SCALED RESIDUAL FORCE      2.880E-05   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.880E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.956E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.887E-05   TIME AVG. HEAT FLUX   1.103E-04
 LARGEST RESIDUAL HEAT FLUX        -5.334E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.353       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -5.651E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -1.190E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.353    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.360    
 STEP TIME COMPLETED        36.0    ,  TOTAL TIME COMPLETED         36.0    


  INCREMENT    37 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.368E+04   TIME AVG. FORCE       7.825E+03
 LARGEST SCALED RESIDUAL FORCE      2.810E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.810E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.923E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.767E-05   TIME AVG. HEAT FLUX   1.094E-04
 LARGEST RESIDUAL HEAT FLUX        -6.056E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.347       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -6.397E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.368E+04   TIME AVG. FORCE       7.825E+03
 LARGEST SCALED RESIDUAL FORCE      1.131E-11   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.131E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        2.032E-13   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  7.737E-05   TIME AVG. HEAT FLUX   1.094E-04
 LARGEST RESIDUAL HEAT FLUX        -1.276E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.345       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.347E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.345    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.370    
 STEP TIME COMPLETED        37.0    ,  TOTAL TIME COMPLETED         37.0    


  INCREMENT    38 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.394E+04   TIME AVG. FORCE       7.986E+03
 LARGEST SCALED RESIDUAL FORCE      2.743E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.743E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.891E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.639E-05   TIME AVG. HEAT FLUX   1.085E-04
 LARGEST RESIDUAL HEAT FLUX        -5.074E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.340       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -5.344E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -1.126E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.340    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.380    
 STEP TIME COMPLETED        38.0    ,  TOTAL TIME COMPLETED         38.0    


  INCREMENT    39 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.419E+04   TIME AVG. FORCE       8.145E+03
 LARGEST SCALED RESIDUAL FORCE      2.678E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.678E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.859E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.525E-05   TIME AVG. HEAT FLUX   1.077E-04
 LARGEST RESIDUAL HEAT FLUX        -5.763E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.334       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -6.052E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.419E+04   TIME AVG. FORCE       8.145E+03
 LARGEST SCALED RESIDUAL FORCE      1.717E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.717E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.908E-13   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  7.496E-05   TIME AVG. HEAT FLUX   1.077E-04
 LARGEST RESIDUAL HEAT FLUX        -1.214E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.333       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.275E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.333    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.390    
 STEP TIME COMPLETED        39.0    ,  TOTAL TIME COMPLETED         39.0    


  INCREMENT    40 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.444E+04   TIME AVG. FORCE       8.302E+03
 LARGEST SCALED RESIDUAL FORCE      2.614E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.614E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.829E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.404E-05   TIME AVG. HEAT FLUX   1.068E-04
 LARGEST RESIDUAL HEAT FLUX        -4.831E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.328       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -5.059E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -1.066E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.328    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.400    
 STEP TIME COMPLETED        40.0    ,  TOTAL TIME COMPLETED         40.0    


  INCREMENT    41 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.468E+04   TIME AVG. FORCE       8.458E+03
 LARGEST SCALED RESIDUAL FORCE      2.553E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.553E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.799E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.295E-05   TIME AVG. HEAT FLUX   1.060E-04
 LARGEST RESIDUAL HEAT FLUX        -5.489E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.322       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -5.731E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.468E+04   TIME AVG. FORCE       8.458E+03
 LARGEST SCALED RESIDUAL FORCE      2.512E-11   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.512E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.794E-13   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  7.268E-05   TIME AVG. HEAT FLUX   1.060E-04
 LARGEST RESIDUAL HEAT FLUX        -1.156E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.321       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.207E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.321    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.410    
 STEP TIME COMPLETED        41.0    ,  TOTAL TIME COMPLETED         41.0    


  INCREMENT    42 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.492E+04   TIME AVG. FORCE       8.612E+03
 LARGEST SCALED RESIDUAL FORCE      2.494E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.494E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.770E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.179E-05   TIME AVG. HEAT FLUX   1.052E-04
 LARGEST RESIDUAL HEAT FLUX        -4.604E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.316       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.793E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -1.010E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.316    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.420    
 STEP TIME COMPLETED        42.0    ,  TOTAL TIME COMPLETED         42.0    


  INCREMENT    43 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.515E+04   TIME AVG. FORCE       8.764E+03
 LARGEST SCALED RESIDUAL FORCE      2.436E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.436E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.741E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.076E-05   TIME AVG. HEAT FLUX   1.044E-04
 LARGEST RESIDUAL HEAT FLUX        -5.232E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.311       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -5.433E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      1.515E+04   TIME AVG. FORCE       8.764E+03
 LARGEST SCALED RESIDUAL FORCE      1.364E-11   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.364E-11
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.687E-13   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  7.050E-05   TIME AVG. HEAT FLUX   1.044E-04
 LARGEST RESIDUAL HEAT FLUX        -1.102E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.309       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.144E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.309    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.430    
 STEP TIME COMPLETED        43.0    ,  TOTAL TIME COMPLETED         43.0    


  INCREMENT    44 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.538E+04   TIME AVG. FORCE       8.914E+03
 LARGEST SCALED RESIDUAL FORCE      2.380E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.380E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.713E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.965E-05   TIME AVG. HEAT FLUX   1.036E-04
 LARGEST RESIDUAL HEAT FLUX        -4.390E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.305       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.546E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -9.577E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.305    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.440    
 STEP TIME COMPLETED        44.0    ,  TOTAL TIME COMPLETED         44.0    


  INCREMENT    45 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.561E+04   TIME AVG. FORCE       9.063E+03
 LARGEST SCALED RESIDUAL FORCE      2.326E-05   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.326E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.686E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.867E-05   TIME AVG. HEAT FLUX   1.028E-04
 LARGEST RESIDUAL HEAT FLUX        -4.991E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.300       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -5.154E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -1.086E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.300    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.450    
 STEP TIME COMPLETED        45.0    ,  TOTAL TIME COMPLETED         45.0    


  INCREMENT    46 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.583E+04   TIME AVG. FORCE       9.210E+03
 LARGEST SCALED RESIDUAL FORCE      2.273E-05   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.273E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.659E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.767E-05   TIME AVG. HEAT FLUX   1.021E-04
 LARGEST RESIDUAL HEAT FLUX        -5.026E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.294       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -5.175E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -1.090E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.294    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.460    
 STEP TIME COMPLETED        46.0    ,  TOTAL TIME COMPLETED         46.0    


  INCREMENT    47 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.605E+04   TIME AVG. FORCE       9.356E+03
 LARGEST SCALED RESIDUAL FORCE      2.222E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.222E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.633E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.668E-05   TIME AVG. HEAT FLUX   1.013E-04
 LARGEST RESIDUAL HEAT FLUX        -4.943E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.289       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -5.076E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -1.069E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.289    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.470    
 STEP TIME COMPLETED        47.0    ,  TOTAL TIME COMPLETED         47.0    


  INCREMENT    48 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.627E+04   TIME AVG. FORCE       9.500E+03
 LARGEST SCALED RESIDUAL FORCE      2.173E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.173E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.608E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.572E-05   TIME AVG. HEAT FLUX   1.006E-04
 LARGEST RESIDUAL HEAT FLUX        -4.837E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.284       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.954E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -1.044E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.284    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.480    
 STEP TIME COMPLETED        48.0    ,  TOTAL TIME COMPLETED         48.0    


  INCREMENT    49 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.648E+04   TIME AVG. FORCE       9.642E+03
 LARGEST SCALED RESIDUAL FORCE      2.124E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.124E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.583E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.478E-05   TIME AVG. HEAT FLUX   9.983E-05
 LARGEST RESIDUAL HEAT FLUX        -4.730E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.280       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.831E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -1.018E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.280    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.490    
 STEP TIME COMPLETED        49.0    ,  TOTAL TIME COMPLETED         49.0    


  INCREMENT    50 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.669E+04   TIME AVG. FORCE       9.783E+03
 LARGEST SCALED RESIDUAL FORCE      2.078E-05   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.078E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.559E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.385E-05   TIME AVG. HEAT FLUX   9.911E-05
 LARGEST RESIDUAL HEAT FLUX        -4.625E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.275       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.711E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -9.929E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.275    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.500    
 STEP TIME COMPLETED        50.0    ,  TOTAL TIME COMPLETED         50.0    


  INCREMENT    51 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.690E+04   TIME AVG. FORCE       9.923E+03
 LARGEST SCALED RESIDUAL FORCE      2.032E-05   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      2.032E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.535E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.295E-05   TIME AVG. HEAT FLUX   9.840E-05
 LARGEST RESIDUAL HEAT FLUX        -4.523E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.270       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.595E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -9.684E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.270    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.510    
 STEP TIME COMPLETED        51.0    ,  TOTAL TIME COMPLETED         51.0    


  INCREMENT    52 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.710E+04   TIME AVG. FORCE       1.006E+04
 LARGEST SCALED RESIDUAL FORCE      1.988E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.988E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.512E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.207E-05   TIME AVG. HEAT FLUX   9.770E-05
 LARGEST RESIDUAL HEAT FLUX        -4.424E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.266       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.482E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -9.447E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.266    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.520    
 STEP TIME COMPLETED        52.0    ,  TOTAL TIME COMPLETED         52.0    


  INCREMENT    53 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.730E+04   TIME AVG. FORCE       1.020E+04
 LARGEST SCALED RESIDUAL FORCE      1.945E-05   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.945E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.489E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.121E-05   TIME AVG. HEAT FLUX   9.701E-05
 LARGEST RESIDUAL HEAT FLUX        -4.328E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.261       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.373E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -9.218E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.261    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.530    
 STEP TIME COMPLETED        53.0    ,  TOTAL TIME COMPLETED         53.0    


  INCREMENT    54 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.749E+04   TIME AVG. FORCE       1.033E+04
 LARGEST SCALED RESIDUAL FORCE      1.903E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.903E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.467E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.037E-05   TIME AVG. HEAT FLUX   9.633E-05
 LARGEST RESIDUAL HEAT FLUX        -4.234E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.257       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.268E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -8.995E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.257    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.540    
 STEP TIME COMPLETED        54.0    ,  TOTAL TIME COMPLETED         54.0    


  INCREMENT    55 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.769E+04   TIME AVG. FORCE       1.047E+04
 LARGEST SCALED RESIDUAL FORCE      1.863E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.863E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.445E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.955E-05   TIME AVG. HEAT FLUX   9.566E-05
 LARGEST RESIDUAL HEAT FLUX        -4.144E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.253       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.166E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -8.780E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.253    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.550    
 STEP TIME COMPLETED        55.0    ,  TOTAL TIME COMPLETED         55.0    


  INCREMENT    56 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.788E+04   TIME AVG. FORCE       1.060E+04
 LARGEST SCALED RESIDUAL FORCE      1.823E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.823E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.423E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.874E-05   TIME AVG. HEAT FLUX   9.500E-05
 LARGEST RESIDUAL HEAT FLUX        -4.055E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.249       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -4.067E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -8.572E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.249    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.560    
 STEP TIME COMPLETED        56.0    ,  TOTAL TIME COMPLETED         56.0    


  INCREMENT    57 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.807E+04   TIME AVG. FORCE       1.073E+04
 LARGEST SCALED RESIDUAL FORCE      1.785E-05   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.785E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.402E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.795E-05   TIME AVG. HEAT FLUX   9.435E-05
 LARGEST RESIDUAL HEAT FLUX        -3.970E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.245       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.971E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -8.370E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.245    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.570    
 STEP TIME COMPLETED        57.0    ,  TOTAL TIME COMPLETED         57.0    


  INCREMENT    58 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.825E+04   TIME AVG. FORCE       1.086E+04
 LARGEST SCALED RESIDUAL FORCE      1.747E-05   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.747E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.382E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.718E-05   TIME AVG. HEAT FLUX   9.371E-05
 LARGEST RESIDUAL HEAT FLUX        -3.887E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.241       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.878E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -8.174E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.241    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.580    
 STEP TIME COMPLETED        58.0    ,  TOTAL TIME COMPLETED         58.0    


  INCREMENT    59 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.843E+04   TIME AVG. FORCE       1.099E+04
 LARGEST SCALED RESIDUAL FORCE      1.711E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.711E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.362E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.642E-05   TIME AVG. HEAT FLUX   9.308E-05
 LARGEST RESIDUAL HEAT FLUX        -3.806E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.237       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.788E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -7.985E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.237    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.590    
 STEP TIME COMPLETED        59.0    ,  TOTAL TIME COMPLETED         59.0    


  INCREMENT    60 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.861E+04   TIME AVG. FORCE       1.111E+04
 LARGEST SCALED RESIDUAL FORCE      1.676E-05   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.676E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.342E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.568E-05   TIME AVG. HEAT FLUX   9.246E-05
 LARGEST RESIDUAL HEAT FLUX        -3.728E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.234       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.700E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -7.801E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.234    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.600    
 STEP TIME COMPLETED        60.0    ,  TOTAL TIME COMPLETED         60.0    


  INCREMENT    61 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.879E+04   TIME AVG. FORCE       1.124E+04
 LARGEST SCALED RESIDUAL FORCE      1.641E-05   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.641E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.323E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.496E-05   TIME AVG. HEAT FLUX   9.184E-05
 LARGEST RESIDUAL HEAT FLUX        -3.651E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.230       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.616E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -7.622E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.230    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.610    
 STEP TIME COMPLETED        61.0    ,  TOTAL TIME COMPLETED         61.0    


  INCREMENT    62 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.896E+04   TIME AVG. FORCE       1.136E+04
 LARGEST SCALED RESIDUAL FORCE      1.608E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.608E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.304E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.425E-05   TIME AVG. HEAT FLUX   9.124E-05
 LARGEST RESIDUAL HEAT FLUX        -3.577E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.226       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.533E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -7.449E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.226    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.620    
 STEP TIME COMPLETED        62.0    ,  TOTAL TIME COMPLETED         62.0    


  INCREMENT    63 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.913E+04   TIME AVG. FORCE       1.149E+04
 LARGEST SCALED RESIDUAL FORCE      1.575E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.575E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.286E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.355E-05   TIME AVG. HEAT FLUX   9.064E-05
 LARGEST RESIDUAL HEAT FLUX        -3.505E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.223       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.454E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -7.281E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.223    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.630    
 STEP TIME COMPLETED        63.0    ,  TOTAL TIME COMPLETED         63.0    


  INCREMENT    64 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.930E+04   TIME AVG. FORCE       1.161E+04
 LARGEST SCALED RESIDUAL FORCE      1.544E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.544E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.268E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.287E-05   TIME AVG. HEAT FLUX   9.005E-05
 LARGEST RESIDUAL HEAT FLUX        -3.435E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.220       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.376E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -7.118E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.220    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.640    
 STEP TIME COMPLETED        64.0    ,  TOTAL TIME COMPLETED         64.0    


  INCREMENT    65 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.947E+04   TIME AVG. FORCE       1.173E+04
 LARGEST SCALED RESIDUAL FORCE      1.513E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.513E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.250E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.220E-05   TIME AVG. HEAT FLUX   8.947E-05
 LARGEST RESIDUAL HEAT FLUX        -3.367E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.216       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.301E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -6.960E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.216    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.650    
 STEP TIME COMPLETED        65.0    ,  TOTAL TIME COMPLETED         65.0    


  INCREMENT    66 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.963E+04   TIME AVG. FORCE       1.185E+04
 LARGEST SCALED RESIDUAL FORCE      1.483E-05   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.483E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.233E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.155E-05   TIME AVG. HEAT FLUX   8.889E-05
 LARGEST RESIDUAL HEAT FLUX        -3.300E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.213       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.228E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -6.807E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.213    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.660    
 STEP TIME COMPLETED        66.0    ,  TOTAL TIME COMPLETED         66.0    


  INCREMENT    67 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.979E+04   TIME AVG. FORCE       1.197E+04
 LARGEST SCALED RESIDUAL FORCE      1.453E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.453E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.216E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.091E-05   TIME AVG. HEAT FLUX   8.832E-05
 LARGEST RESIDUAL HEAT FLUX        -3.236E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.210       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.157E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -6.657E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.210    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.670    
 STEP TIME COMPLETED        67.0    ,  TOTAL TIME COMPLETED         67.0    


  INCREMENT    68 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      1.995E+04   TIME AVG. FORCE       1.209E+04
 LARGEST SCALED RESIDUAL FORCE      1.425E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.425E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.199E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.028E-05   TIME AVG. HEAT FLUX   8.777E-05
 LARGEST RESIDUAL HEAT FLUX        -3.173E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.207       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.089E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -6.513E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.207    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.680    
 STEP TIME COMPLETED        68.0    ,  TOTAL TIME COMPLETED         68.0    


  INCREMENT    69 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.011E+04   TIME AVG. FORCE       1.220E+04
 LARGEST SCALED RESIDUAL FORCE      1.397E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.397E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.183E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.966E-05   TIME AVG. HEAT FLUX   8.721E-05
 LARGEST RESIDUAL HEAT FLUX        -3.111E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.204       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -3.022E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -6.372E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.204    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.690    
 STEP TIME COMPLETED        69.0    ,  TOTAL TIME COMPLETED         69.0    


  INCREMENT    70 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.026E+04   TIME AVG. FORCE       1.232E+04
 LARGEST SCALED RESIDUAL FORCE      1.370E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.370E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.167E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.906E-05   TIME AVG. HEAT FLUX   8.667E-05
 LARGEST RESIDUAL HEAT FLUX        -3.052E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.201       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.957E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -6.235E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.201    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.700    
 STEP TIME COMPLETED        70.0    ,  TOTAL TIME COMPLETED         70.0    


  INCREMENT    71 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.041E+04   TIME AVG. FORCE       1.243E+04
 LARGEST SCALED RESIDUAL FORCE      1.343E-05   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.343E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.151E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.846E-05   TIME AVG. HEAT FLUX   8.613E-05
 LARGEST RESIDUAL HEAT FLUX        -2.994E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.198       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.894E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -6.102E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.198    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.710    
 STEP TIME COMPLETED        71.0    ,  TOTAL TIME COMPLETED         71.0    


  INCREMENT    72 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.056E+04   TIME AVG. FORCE       1.255E+04
 LARGEST SCALED RESIDUAL FORCE      1.317E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.317E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.135E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.788E-05   TIME AVG. HEAT FLUX   8.560E-05
 LARGEST RESIDUAL HEAT FLUX        -2.937E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.195       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.832E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -5.973E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.195    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.720    
 STEP TIME COMPLETED        72.0    ,  TOTAL TIME COMPLETED         72.0    


  INCREMENT    73 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.071E+04   TIME AVG. FORCE       1.266E+04
 LARGEST SCALED RESIDUAL FORCE      1.292E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.292E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.120E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.731E-05   TIME AVG. HEAT FLUX   8.507E-05
 LARGEST RESIDUAL HEAT FLUX        -2.882E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.192       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.773E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -5.847E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.192    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.730    
 STEP TIME COMPLETED        73.0    ,  TOTAL TIME COMPLETED         73.0    


  INCREMENT    74 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.086E+04   TIME AVG. FORCE       1.277E+04
 LARGEST SCALED RESIDUAL FORCE      1.268E-05   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.268E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.106E-08   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.675E-05   TIME AVG. HEAT FLUX   8.456E-05
 LARGEST RESIDUAL HEAT FLUX        -2.828E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.190       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.715E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -5.725E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.190    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.740    
 STEP TIME COMPLETED        74.0    ,  TOTAL TIME COMPLETED         74.0    


  INCREMENT    75 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.100E+04   TIME AVG. FORCE       1.288E+04
 LARGEST SCALED RESIDUAL FORCE      1.244E-05   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.244E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.091E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.620E-05   TIME AVG. HEAT FLUX   8.405E-05
 LARGEST RESIDUAL HEAT FLUX        -2.776E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.187       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.658E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -5.606E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.187    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.750    
 STEP TIME COMPLETED        75.0    ,  TOTAL TIME COMPLETED         75.0    


  INCREMENT    76 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.114E+04   TIME AVG. FORCE       1.299E+04
 LARGEST SCALED RESIDUAL FORCE      1.220E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.220E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.077E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.566E-05   TIME AVG. HEAT FLUX   8.354E-05
 LARGEST RESIDUAL HEAT FLUX        -2.725E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.184       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.604E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -5.491E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.184    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.760    
 STEP TIME COMPLETED        76.0    ,  TOTAL TIME COMPLETED         76.0    


  INCREMENT    77 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.128E+04   TIME AVG. FORCE       1.309E+04
 LARGEST SCALED RESIDUAL FORCE      1.198E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.198E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.063E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.513E-05   TIME AVG. HEAT FLUX   8.304E-05
 LARGEST RESIDUAL HEAT FLUX        -2.675E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.182       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.550E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -5.378E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.182    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.770    
 STEP TIME COMPLETED        77.0    ,  TOTAL TIME COMPLETED         77.0    


  INCREMENT    78 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.142E+04   TIME AVG. FORCE       1.320E+04
 LARGEST SCALED RESIDUAL FORCE      1.175E-05   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.175E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.049E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.461E-05   TIME AVG. HEAT FLUX   8.255E-05
 LARGEST RESIDUAL HEAT FLUX        -2.626E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.179       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.498E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -5.269E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.179    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.780    
 STEP TIME COMPLETED        78.0    ,  TOTAL TIME COMPLETED         78.0    


  INCREMENT    79 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.155E+04   TIME AVG. FORCE       1.331E+04
 LARGEST SCALED RESIDUAL FORCE      1.154E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.154E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.035E-08   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.410E-05   TIME AVG. HEAT FLUX   8.206E-05
 LARGEST RESIDUAL HEAT FLUX        -2.579E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.177       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.448E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -5.162E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.177    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.790    
 STEP TIME COMPLETED        79.0    ,  TOTAL TIME COMPLETED         79.0    


  INCREMENT    80 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.169E+04   TIME AVG. FORCE       1.341E+04
 LARGEST SCALED RESIDUAL FORCE      1.132E-05   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.132E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.022E-08   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.360E-05   TIME AVG. HEAT FLUX   8.158E-05
 LARGEST RESIDUAL HEAT FLUX        -2.533E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.175       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.398E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -5.059E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.175    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.800    
 STEP TIME COMPLETED        80.0    ,  TOTAL TIME COMPLETED         80.0    


  INCREMENT    81 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.182E+04   TIME AVG. FORCE       1.352E+04
 LARGEST SCALED RESIDUAL FORCE      1.112E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.112E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        1.009E-08   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.311E-05   TIME AVG. HEAT FLUX   8.111E-05
 LARGEST RESIDUAL HEAT FLUX        -2.488E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.172       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.351E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.958E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.172    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.810    
 STEP TIME COMPLETED        81.0    ,  TOTAL TIME COMPLETED         81.0    


  INCREMENT    82 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.195E+04   TIME AVG. FORCE       1.362E+04
 LARGEST SCALED RESIDUAL FORCE      1.092E-05   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.092E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        9.964E-09   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.263E-05   TIME AVG. HEAT FLUX   8.064E-05
 LARGEST RESIDUAL HEAT FLUX        -2.444E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.170       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.304E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.860E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.170    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.820    
 STEP TIME COMPLETED        82.0    ,  TOTAL TIME COMPLETED         82.0    


  INCREMENT    83 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.208E+04   TIME AVG. FORCE       1.372E+04
 LARGEST SCALED RESIDUAL FORCE      1.072E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.072E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        9.838E-09   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.215E-05   TIME AVG. HEAT FLUX   8.017E-05
 LARGEST RESIDUAL HEAT FLUX        -2.401E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.168       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.258E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.764E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.168    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.830    
 STEP TIME COMPLETED        83.0    ,  TOTAL TIME COMPLETED         83.0    


  INCREMENT    84 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.220E+04   TIME AVG. FORCE       1.382E+04
 LARGEST SCALED RESIDUAL FORCE      1.053E-05   AT NODE          1   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.053E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        9.715E-09   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.169E-05   TIME AVG. HEAT FLUX   7.972E-05
 LARGEST RESIDUAL HEAT FLUX        -2.359E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.165       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.214E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.670E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.165    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.840    
 STEP TIME COMPLETED        84.0    ,  TOTAL TIME COMPLETED         84.0    


  INCREMENT    85 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.233E+04   TIME AVG. FORCE       1.392E+04
 LARGEST SCALED RESIDUAL FORCE      1.034E-05   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.034E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        9.594E-09   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.123E-05   TIME AVG. HEAT FLUX   7.926E-05
 LARGEST RESIDUAL HEAT FLUX        -2.318E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.163       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.171E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.580E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.163    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.850    
 STEP TIME COMPLETED        85.0    ,  TOTAL TIME COMPLETED         85.0    


  INCREMENT    86 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.245E+04   TIME AVG. FORCE       1.402E+04
 LARGEST SCALED RESIDUAL FORCE      1.015E-05   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      1.015E-05
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        9.475E-09   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.078E-05   TIME AVG. HEAT FLUX   7.881E-05
 LARGEST RESIDUAL HEAT FLUX        -2.278E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.161       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.129E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.491E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.161    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.860    
 STEP TIME COMPLETED        86.0    ,  TOTAL TIME COMPLETED         86.0    


  INCREMENT    87 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.257E+04   TIME AVG. FORCE       1.412E+04
 LARGEST SCALED RESIDUAL FORCE      9.975E-06   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      9.975E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        9.358E-09   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.034E-05   TIME AVG. HEAT FLUX   7.837E-05
 LARGEST RESIDUAL HEAT FLUX        -2.239E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.159       AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.088E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.405E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.159    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.870    
 STEP TIME COMPLETED        87.0    ,  TOTAL TIME COMPLETED         87.0    


  INCREMENT    88 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.269E+04   TIME AVG. FORCE       1.422E+04
 LARGEST SCALED RESIDUAL FORCE      9.800E-06   AT NODE          2   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      9.800E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        9.244E-09   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.990E-05   TIME AVG. HEAT FLUX   7.794E-05
 LARGEST RESIDUAL HEAT FLUX        -2.201E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.157       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.048E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.321E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.157    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.880    
 STEP TIME COMPLETED        88.0    ,  TOTAL TIME COMPLETED         88.0    


  INCREMENT    89 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.281E+04   TIME AVG. FORCE       1.431E+04
 LARGEST SCALED RESIDUAL FORCE      9.628E-06   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      9.628E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        9.131E-09   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.948E-05   TIME AVG. HEAT FLUX   7.750E-05
 LARGEST RESIDUAL HEAT FLUX        -2.164E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.155       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -2.009E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.239E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.155    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.890    
 STEP TIME COMPLETED        89.0    ,  TOTAL TIME COMPLETED         89.0    


  INCREMENT    90 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.293E+04   TIME AVG. FORCE       1.441E+04
 LARGEST SCALED RESIDUAL FORCE      9.461E-06   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      9.461E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        9.020E-09   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.906E-05   TIME AVG. HEAT FLUX   7.708E-05
 LARGEST RESIDUAL HEAT FLUX        -2.127E-07   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.153       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.971E-03   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.159E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.153    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.900    
 STEP TIME COMPLETED        90.0    ,  TOTAL TIME COMPLETED         90.0    


  INCREMENT    91 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.304E+04   TIME AVG. FORCE       1.450E+04
 LARGEST SCALED RESIDUAL FORCE      9.297E-06   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      9.297E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        8.911E-09   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.864E-05   TIME AVG. HEAT FLUX   7.665E-05
 LARGEST RESIDUAL HEAT FLUX        -2.092E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.151       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.934E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.081E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.151    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.910    
 STEP TIME COMPLETED        91.0    ,  TOTAL TIME COMPLETED         91.0    


  INCREMENT    92 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.315E+04   TIME AVG. FORCE       1.460E+04
 LARGEST SCALED RESIDUAL FORCE      9.137E-06   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      9.137E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        8.804E-09   AT NODE          6   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.824E-05   TIME AVG. HEAT FLUX   7.624E-05
 LARGEST RESIDUAL HEAT FLUX        -2.057E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.149       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.898E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -4.005E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.149    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.920    
 STEP TIME COMPLETED        92.0    ,  TOTAL TIME COMPLETED         92.0    


  INCREMENT    93 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  0ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.327E+04   TIME AVG. FORCE       1.469E+04
 LARGEST SCALED RESIDUAL FORCE      8.981E-06   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      8.981E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        8.699E-09   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.784E-05   TIME AVG. HEAT FLUX   7.582E-05
 LARGEST RESIDUAL HEAT FLUX        -2.023E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.147       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.863E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -3.930E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.147    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.930    
 STEP TIME COMPLETED        93.0    ,  TOTAL TIME COMPLETED         93.0    


  INCREMENT    94 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.338E+04   TIME AVG. FORCE       1.478E+04
 LARGEST SCALED RESIDUAL FORCE      8.828E-06   AT NODE          4   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      8.828E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        8.596E-09   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.745E-05   TIME AVG. HEAT FLUX   7.542E-05
 LARGEST RESIDUAL HEAT FLUX        -1.990E-07   AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.145       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.829E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -3.858E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.145    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.940    
 STEP TIME COMPLETED        94.0    ,  TOTAL TIME COMPLETED         94.0    


  INCREMENT    95 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.349E+04   TIME AVG. FORCE       1.487E+04
 LARGEST SCALED RESIDUAL FORCE      8.678E-06   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      8.678E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        8.494E-09   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.706E-05   TIME AVG. HEAT FLUX   7.501E-05
 LARGEST RESIDUAL HEAT FLUX        -1.957E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.144       AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.795E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -3.787E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.144    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.950    
 STEP TIME COMPLETED        95.0    ,  TOTAL TIME COMPLETED         95.0    


  INCREMENT    96 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.359E+04   TIME AVG. FORCE       1.497E+04
 LARGEST SCALED RESIDUAL FORCE      8.532E-06   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      8.532E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        8.394E-09   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.668E-05   TIME AVG. HEAT FLUX   7.461E-05
 LARGEST RESIDUAL HEAT FLUX        -1.926E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.142       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.762E-03   AT NODE          8   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -3.718E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.142    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.960    
 STEP TIME COMPLETED        96.0    ,  TOTAL TIME COMPLETED         96.0    


  INCREMENT    97 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.370E+04   TIME AVG. FORCE       1.506E+04
 LARGEST SCALED RESIDUAL FORCE      8.389E-06   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      8.389E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        8.296E-09   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.631E-05   TIME AVG. HEAT FLUX   7.422E-05
 LARGEST RESIDUAL HEAT FLUX        -1.895E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.140       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.730E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -3.651E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.140    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.970    
 STEP TIME COMPLETED        97.0    ,  TOTAL TIME COMPLETED         97.0    


  INCREMENT    98 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.380E+04   TIME AVG. FORCE       1.514E+04
 LARGEST SCALED RESIDUAL FORCE      8.249E-06   AT NODE          3   DOF  1
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      8.249E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        8.200E-09   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.594E-05   TIME AVG. HEAT FLUX   7.383E-05
 LARGEST RESIDUAL HEAT FLUX        -1.864E-07   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.138       AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.699E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -3.585E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.138    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.980    
 STEP TIME COMPLETED        98.0    ,  TOTAL TIME COMPLETED         98.0    


  INCREMENT    99 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.391E+04   TIME AVG. FORCE       1.523E+04
 LARGEST SCALED RESIDUAL FORCE      8.112E-06   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      8.112E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        8.105E-09   AT NODE          1   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.558E-05   TIME AVG. HEAT FLUX   7.344E-05
 LARGEST RESIDUAL HEAT FLUX        -1.834E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.137       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.669E-03   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -3.521E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.137    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.990    
 STEP TIME COMPLETED        99.0    ,  TOTAL TIME COMPLETED         99.0    


  INCREMENT   100 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  32
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      2.189e+04
        SOLVER ELAPSED TIME:  1ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      2.401E+04   TIME AVG. FORCE       1.532E+04
 LARGEST SCALED RESIDUAL FORCE      7.978E-06   AT NODE          5   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
  CORRESPONDING RESIDUAL FORCE      7.978E-06
 LARGEST INCREMENT OF DISP.         1.000E-05   AT NODE          1   DOF  2
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO DISP.        8.011E-09   AT NODE          2   DOF  3
   INSTANCE: CUBE_ASSEMBLY                                                                   
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.522E-05   TIME AVG. HEAT FLUX   7.306E-05
 LARGEST RESIDUAL HEAT FLUX        -1.805E-07   AT NODE          4   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST INCREMENT OF TEMP.         0.135       AT NODE          2   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 LARGEST CORRECTION TO TEMP.       -1.639E-03   AT NODE          6   DOF 11
   INSTANCE: CUBE_ASSEMBLY                                                                   
 ESTIMATE OF TEMP.    CORRECTION   -3.459E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.135    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED   1.00    
 STEP TIME COMPLETED        100.    ,  TOTAL TIME COMPLETED         100.    


          THE ANALYSIS HAS BEEN COMPLETED



     ANALYSIS SUMMARY:
     TOTAL OF        100  INCREMENTS
                       0  CUTBACKS IN AUTOMATIC INCREMENTATION
                     140  ITERATIONS INCLUDING CONTACT ITERATIONS IF PRESENT
                     140  PASSES THROUGH THE EQUATION SOLVER OF WHICH 
                     140  INVOLVE MATRIX DECOMPOSITION, INCLUDING
                       0  DECOMPOSITION(S) OF THE MASS MATRIX
                       1  REORDERING OF EQUATIONS TO MINIMIZE WAVEFRONT
                       0  ADDITIONAL RESIDUAL EVALUATIONS FOR LINE SEARCHES
                       0  ADDITIONAL OPERATOR EVALUATIONS FOR LINE SEARCHES
                       5  WARNING MESSAGES DURING USER INPUT PROCESSING
                       0  WARNING MESSAGES DURING ANALYSIS
                       0  ANALYSIS WARNINGS ARE NUMERICAL PROBLEM MESSAGES
                       0  ANALYSIS WARNINGS ARE NEGATIVE EIGENVALUE MESSAGES
                       0  ERROR MESSAGES



     JOB TIME SUMMARY
       USER TIME (SEC)      =      2.7    
       SYSTEM TIME (SEC)    =      2.0    
       TOTAL CPU TIME (SEC) =      4.7    
       WALLCLOCK TIME (SEC) =            9
       MEMORY PEAK (GB)     =            0
