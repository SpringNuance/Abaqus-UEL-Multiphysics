1

   Abaqus 2023.HF4                                  Date 09-Apr-2025   Time 22:18:50
   For use by AALTO UNIVERSITY under license from Dassault Systemes or its subsidiary.

                                                                                 
                                                                                 
 STEP    1     INCREMENT     1     STEP TIME    0.00    


                        S T E P       1     C O U P L E D - T E M P E R A T U R E - D I S P L A C E M E N T   A N A L Y S I S


                                                                                          

     AUTOMATIC TIME CONTROL WITH -
          A SUGGESTED INITIAL TIME INCREMENT OF                1.000E+07
          AND A TOTAL TIME PERIOD OF                           1.000E+09
          THE MINIMUM TIME INCREMENT ALLOWED IS                1.000E-04
          THE MAXIMUM TIME INCREMENT ALLOWED IS                1.000E+07

          CREEP AND SWELLING EFFECTS ARE OMITTED IN THIS STEP

     THE SIZE OF THE TIME INCREMENT IS CONTROLLED BY -
          THE TEMPERATURE CHANGE PER INCREMENT NOT EXCEEDING           1.000E+05
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

     THE MAXIMUM NUMBER OF INCREMENTS IN THIS STEP IS                 *******

          LARGE DISPLACEMENT THEORY WILL BE USED

          UNSYMMETRIC MATRIX STORAGE AND SOLUTION WILL BE USED

     LINEAR EXTRAPOLATION WILL BE USED

     CHARACTERISTIC ELEMENT LENGTH     9.764E-04

     DETAILS REGARDING ACTUAL SOLUTION WAVEFRONT REQUESTED

     DETAILED OUTPUT OF DIAGNOSTICS TO DATABASE REQUESTED

     PRINT OF INCREMENT NUMBER, TIME, ETC., TO THE MESSAGE FILE EVERY     1  INCREMENTS

     COLLECTING MODEL CONSTRAINT INFORMATION FOR OVERCONSTRAINT CHECKS

     COLLECTING STEP CONSTRAINT INFORMATION FOR OVERCONSTRAINT CHECKS


  INCREMENT     1 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  9702
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      3.856e+08
        SOLVER ELAPSED TIME:  26ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      0.200       TIME AVG. FORCE       0.200    
 LARGEST SCALED RESIDUAL FORCE      1.218E-05   AT NODE       2127   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.218E-05
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          DISP.    CORRECTION TOO LARGE COMPARED TO DISP.    INCREMENT

 AVERAGE HEAT FLUX                   0.00       TIME AVG. HEAT FLUX   1.000E-02
 ALL HEAT FLUX RESIDUALS ARE ZERO
 LARGEST INCREMENT OF TEMP.          100.       AT NODE       2083   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.         100.       AT NODE       2083   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  9702
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      3.856e+08
        SOLVER ELAPSED TIME:  23ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      0.200       TIME AVG. FORCE       0.200    
 LARGEST SCALED RESIDUAL FORCE     -2.280E-10   AT NODE         61   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.280E-10
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        4.498E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                   0.00       TIME AVG. HEAT FLUX   1.000E-02
 ALL HEAT FLUX RESIDUALS ARE ZERO
 LARGEST INCREMENT OF TEMP.          100.       AT NODE       2083   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.         0.00       AT NODE       2083   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    0.00    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  1.000E-02
 STEP TIME COMPLETED       1.000E+07,  TOTAL TIME COMPLETED        1.000E+07


  INCREMENT     2 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  67ms

 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2740 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2420 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2421 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2741 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2744 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2424 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2423 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2743 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2742 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2422 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2780 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2460 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2760 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2440 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2441 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2761 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2442 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2762 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2461 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2781 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2462 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2782 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2784 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2464 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2824 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2504 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2804 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2484 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2764 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2443 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2444 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2463 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2763 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2783 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2483 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2803 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2820 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2500 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2501 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2821 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2801 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2480 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2481 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2482 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2502 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2503 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2800 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2802 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 2822 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: Solver problem. Zero pivot when processing D.O.F. 11 of 49 nodes. 
             The nodes have been identified in node set 
             WarnNodeSolvProbZeroPiv_11_1_2_1_1.

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      0.800       TIME AVG. FORCE       0.500    
 LARGEST SCALED RESIDUAL FORCE      4.937E-10   AT NODE       1147   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.937E-10
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.588E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.201E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         6.691E-09   AT NODE       2937   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          77.4       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -100.       AT NODE       2083   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    77.4    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  2.000E-02
 STEP TIME COMPLETED       2.000E+07,  TOTAL TIME COMPLETED        2.000E+07


  INCREMENT     3 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       1.20       TIME AVG. FORCE       0.733    
 LARGEST SCALED RESIDUAL FORCE     -8.643E-10   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -8.643E-10
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.587E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.199E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.062E-09   AT NODE       3097   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          18.5       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -66.8       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    18.5    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  3.000E-02
 STEP TIME COMPLETED       3.000E+07,  TOTAL TIME COMPLETED        3.000E+07


  INCREMENT     4 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       1.60       TIME AVG. FORCE       0.949    
 LARGEST SCALED RESIDUAL FORCE     -1.325E-09   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.325E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.587E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.188E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.923E-10   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          10.5       AT NODE       2894   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -10.2       AT NODE       2130   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    10.5    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  4.000E-02
 STEP TIME COMPLETED       4.000E+07,  TOTAL TIME COMPLETED        4.000E+07


  INCREMENT     5 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  77ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       2.00       TIME AVG. FORCE        1.16    
 LARGEST SCALED RESIDUAL FORCE     -1.785E-09   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.785E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.586E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.167E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.811E-11   AT NODE       3018   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          7.36       AT NODE       2889   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -3.93       AT NODE       2128   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    7.36    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  5.000E-02
 STEP TIME COMPLETED       5.000E+07,  TOTAL TIME COMPLETED        5.000E+07


  INCREMENT     6 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       2.40       TIME AVG. FORCE        1.37    
 LARGEST SCALED RESIDUAL FORCE     -2.254E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.254E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.586E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.134E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.471E-12   AT NODE       3040   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          5.69       AT NODE       2848   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -2.07       AT NODE       2149   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    5.69    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  6.000E-02
 STEP TIME COMPLETED       6.000E+07,  TOTAL TIME COMPLETED        6.000E+07


  INCREMENT     7 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  76ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       2.80       TIME AVG. FORCE        1.57    
 LARGEST SCALED RESIDUAL FORCE     -2.723E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.723E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.585E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.090E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         1.859E-12   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          4.67       AT NODE       2875   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -1.26       AT NODE       2126   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    4.67    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  7.000E-02
 STEP TIME COMPLETED       7.000E+07,  TOTAL TIME COMPLETED        7.000E+07


  INCREMENT     8 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       3.20       TIME AVG. FORCE        1.77    
 LARGEST SCALED RESIDUAL FORCE     -3.192E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.192E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.585E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.037E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         1.639E-12   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          4.01       AT NODE       2874   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.839       AT NODE       2154   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    4.01    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  8.000E-02
 STEP TIME COMPLETED       8.000E+07,  TOTAL TIME COMPLETED        8.000E+07


  INCREMENT     9 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       3.60       TIME AVG. FORCE        1.98    
 LARGEST SCALED RESIDUAL FORCE     -3.661E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.661E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.585E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.978E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         1.303E-12   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.58       AT NODE       2842   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.592       AT NODE       2167   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    3.58    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  9.000E-02
 STEP TIME COMPLETED       9.000E+07,  TOTAL TIME COMPLETED        9.000E+07


  INCREMENT    10 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       4.00       TIME AVG. FORCE        2.18    
 LARGEST SCALED RESIDUAL FORCE     -4.129E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.129E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.584E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.914E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         9.786E-13   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.30       AT NODE       2844   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.433       AT NODE       2173   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    3.30    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.100    
 STEP TIME COMPLETED       1.000E+08,  TOTAL TIME COMPLETED        1.000E+08


  INCREMENT    11 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       4.40       TIME AVG. FORCE        2.38    
 LARGEST SCALED RESIDUAL FORCE     -4.598E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.598E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.584E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.848E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         7.082E-13   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.14       AT NODE       2887   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.326       AT NODE       2896   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    3.14    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.110    
 STEP TIME COMPLETED       1.100E+08,  TOTAL TIME COMPLETED        1.100E+08


  INCREMENT    12 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       4.80       TIME AVG. FORCE        2.58    
 LARGEST SCALED RESIDUAL FORCE     -5.066E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -5.066E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.583E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.781E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         4.980E-13   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.07       AT NODE         23   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.254       AT NODE       2847   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    3.07    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.120    
 STEP TIME COMPLETED       1.200E+08,  TOTAL TIME COMPLETED        1.200E+08


  INCREMENT    13 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       5.20       TIME AVG. FORCE        2.78    
 LARGEST SCALED RESIDUAL FORCE     -5.534E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -5.534E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.583E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.713E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         3.408E-13   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.03       AT NODE        975   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.203       AT NODE       2882   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    3.03    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.130    
 STEP TIME COMPLETED       1.300E+08,  TOTAL TIME COMPLETED        1.300E+08


  INCREMENT    14 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       5.60       TIME AVG. FORCE        2.98    
 LARGEST SCALED RESIDUAL FORCE     -6.002E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -6.002E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.582E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.647E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         2.256E-13   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.97       AT NODE        963   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.166       AT NODE       2874   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.97    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.140    
 STEP TIME COMPLETED       1.400E+08,  TOTAL TIME COMPLETED        1.400E+08


  INCREMENT    15 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       6.00       TIME AVG. FORCE        3.18    
 LARGEST SCALED RESIDUAL FORCE     -6.470E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -6.470E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.582E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.582E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         1.424E-13   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.90       AT NODE          7   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.141       AT NODE       2841   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.90    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.150    
 STEP TIME COMPLETED       1.500E+08,  TOTAL TIME COMPLETED        1.500E+08


  INCREMENT    16 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       6.40       TIME AVG. FORCE        3.39    
 LARGEST SCALED RESIDUAL FORCE     -6.938E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -6.938E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.581E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.518E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         8.308E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.82       AT NODE       1762   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.123       AT NODE       2842   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.82    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.160    
 STEP TIME COMPLETED       1.600E+08,  TOTAL TIME COMPLETED        1.600E+08


  INCREMENT    17 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       6.80       TIME AVG. FORCE        3.59    
 LARGEST SCALED RESIDUAL FORCE     -7.406E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -7.406E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.581E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.457E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         4.109E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.73       AT NODE       1750   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.111       AT NODE       2892   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.73    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.170    
 STEP TIME COMPLETED       1.700E+08,  TOTAL TIME COMPLETED        1.700E+08


  INCREMENT    18 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       7.20       TIME AVG. FORCE        3.79    
 LARGEST SCALED RESIDUAL FORCE     -7.873E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -7.873E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.581E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.397E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.577E-14   AT NODE       3047   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.63       AT NODE       1767   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.103       AT NODE       2846   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.63    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.180    
 STEP TIME COMPLETED       1.800E+08,  TOTAL TIME COMPLETED        1.800E+08


  INCREMENT    19 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       7.59       TIME AVG. FORCE        3.99    
 LARGEST SCALED RESIDUAL FORCE     -8.341E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -8.341E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.580E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.339E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.997E-14   AT NODE       3207   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.54       AT NODE       1812   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.870E-02   AT NODE         46   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.54    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.190    
 STEP TIME COMPLETED       1.900E+08,  TOTAL TIME COMPLETED        1.900E+08


  INCREMENT    20 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       7.99       TIME AVG. FORCE        4.19    
 LARGEST SCALED RESIDUAL FORCE     -8.808E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -8.808E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.580E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.284E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.257E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.44       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.683E-02   AT NODE          3   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.44    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.200    
 STEP TIME COMPLETED       2.000E+08,  TOTAL TIME COMPLETED        2.000E+08


  INCREMENT    21 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  85ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       8.39       TIME AVG. FORCE        4.39    
 LARGEST SCALED RESIDUAL FORCE     -9.275E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -9.275E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.579E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.231E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.183E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.35       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.536E-02   AT NODE        106   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.35    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.210    
 STEP TIME COMPLETED       2.100E+08,  TOTAL TIME COMPLETED        2.100E+08


  INCREMENT    22 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  85ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       8.79       TIME AVG. FORCE        4.59    
 LARGEST SCALED RESIDUAL FORCE     -9.742E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -9.742E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.579E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.180E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.780E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.26       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.326E-02   AT NODE         98   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.26    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.220    
 STEP TIME COMPLETED       2.200E+08,  TOTAL TIME COMPLETED        2.200E+08


  INCREMENT    23 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       9.19       TIME AVG. FORCE        4.79    
 LARGEST SCALED RESIDUAL FORCE     -1.021E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.021E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.578E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.131E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.144E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.17       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.073E-02   AT NODE        962   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.17    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.230    
 STEP TIME COMPLETED       2.300E+08,  TOTAL TIME COMPLETED        2.300E+08


  INCREMENT    24 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  78ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       9.59       TIME AVG. FORCE        4.99    
 LARGEST SCALED RESIDUAL FORCE     -1.068E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.068E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.578E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.083E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.344E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.08       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.794E-02   AT NODE          7   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.08    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.240    
 STEP TIME COMPLETED       2.400E+08,  TOTAL TIME COMPLETED        2.400E+08


  INCREMENT    25 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  75ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       9.99       TIME AVG. FORCE        5.19    
 LARGEST SCALED RESIDUAL FORCE     -1.114E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.114E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.577E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.038E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.429E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.99       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.499E-02   AT NODE          7   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.99    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.250    
 STEP TIME COMPLETED       2.500E+08,  TOTAL TIME COMPLETED        2.500E+08


  INCREMENT    26 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       10.4       TIME AVG. FORCE        5.39    
 LARGEST SCALED RESIDUAL FORCE     -1.161E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.161E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.577E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.948E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.434E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.91       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.196E-02   AT NODE       1762   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.91    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.260    
 STEP TIME COMPLETED       2.600E+08,  TOTAL TIME COMPLETED        2.600E+08


  INCREMENT    27 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       10.8       TIME AVG. FORCE        5.59    
 LARGEST SCALED RESIDUAL FORCE     -1.208E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.208E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.577E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.532E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.385E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.83       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.892E-02   AT NODE       1754   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.83    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.270    
 STEP TIME COMPLETED       2.700E+08,  TOTAL TIME COMPLETED        2.700E+08


  INCREMENT    28 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       11.2       TIME AVG. FORCE        5.79    
 LARGEST SCALED RESIDUAL FORCE     -1.254E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.254E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.576E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.134E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.298E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.76       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.590E-02   AT NODE       1767   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.76    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.280    
 STEP TIME COMPLETED       2.800E+08,  TOTAL TIME COMPLETED        2.800E+08


  INCREMENT    29 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       11.6       TIME AVG. FORCE        5.99    
 LARGEST SCALED RESIDUAL FORCE     -1.301E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.301E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.576E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.751E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.188E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.68       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.294E-02   AT NODE       1808   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.68    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.290    
 STEP TIME COMPLETED       2.900E+08,  TOTAL TIME COMPLETED        2.900E+08


  INCREMENT    30 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       12.0       TIME AVG. FORCE        6.19    
 LARGEST SCALED RESIDUAL FORCE     -1.347E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.347E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.575E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.385E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.062E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.61       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.005E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.61    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.300    
 STEP TIME COMPLETED       3.000E+08,  TOTAL TIME COMPLETED        3.000E+08


  INCREMENT    31 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       12.4       TIME AVG. FORCE        6.39    
 LARGEST SCALED RESIDUAL FORCE     -1.394E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.394E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.575E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.034E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.927E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.55       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.724E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.55    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.310    
 STEP TIME COMPLETED       3.100E+08,  TOTAL TIME COMPLETED        3.100E+08


  INCREMENT    32 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  82ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       12.8       TIME AVG. FORCE        6.59    
 LARGEST SCALED RESIDUAL FORCE     -1.441E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.441E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.574E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.698E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.788E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.48       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.452E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.48    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.320    
 STEP TIME COMPLETED       3.200E+08,  TOTAL TIME COMPLETED        3.200E+08


  INCREMENT    33 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       13.2       TIME AVG. FORCE        6.79    
 LARGEST SCALED RESIDUAL FORCE     -1.487E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.487E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.574E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.376E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.647E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.42       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.188E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.42    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.330    
 STEP TIME COMPLETED       3.300E+08,  TOTAL TIME COMPLETED        3.300E+08


  INCREMENT    34 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       13.6       TIME AVG. FORCE        6.99    
 LARGEST SCALED RESIDUAL FORCE     -1.534E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.534E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.573E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.067E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.507E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.36       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.934E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.36    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.340    
 STEP TIME COMPLETED       3.400E+08,  TOTAL TIME COMPLETED        3.400E+08


  INCREMENT    35 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       14.0       TIME AVG. FORCE        7.19    
 LARGEST SCALED RESIDUAL FORCE     -1.580E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.580E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.573E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.771E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.369E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.30       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.689E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.30    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.350    
 STEP TIME COMPLETED       3.500E+08,  TOTAL TIME COMPLETED        3.500E+08


  INCREMENT    36 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       14.4       TIME AVG. FORCE        7.39    
 LARGEST SCALED RESIDUAL FORCE     -1.627E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.627E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.573E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.488E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.235E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.25       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.453E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.25    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.360    
 STEP TIME COMPLETED       3.600E+08,  TOTAL TIME COMPLETED        3.600E+08


  INCREMENT    37 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       14.8       TIME AVG. FORCE        7.59    
 LARGEST SCALED RESIDUAL FORCE     -1.673E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.673E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.572E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.216E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.104E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.20       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.227E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.20    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.370    
 STEP TIME COMPLETED       3.700E+08,  TOTAL TIME COMPLETED        3.700E+08


  INCREMENT    38 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       15.2       TIME AVG. FORCE        7.79    
 LARGEST SCALED RESIDUAL FORCE     -1.720E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.720E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.572E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.956E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.977E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.15       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.009E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.15    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.380    
 STEP TIME COMPLETED       3.800E+08,  TOTAL TIME COMPLETED        3.800E+08


  INCREMENT    39 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  66ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       15.6       TIME AVG. FORCE        7.99    
 LARGEST SCALED RESIDUAL FORCE     -1.766E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.766E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.571E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.707E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.854E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.10       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.801E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.10    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.390    
 STEP TIME COMPLETED       3.900E+08,  TOTAL TIME COMPLETED        3.900E+08


  INCREMENT    40 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  65ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       16.0       TIME AVG. FORCE        8.19    
 LARGEST SCALED RESIDUAL FORCE     -1.813E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.813E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.571E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.468E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.736E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.05       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.600E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.05    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.400    
 STEP TIME COMPLETED       4.000E+08,  TOTAL TIME COMPLETED        4.000E+08


  INCREMENT    41 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       16.4       TIME AVG. FORCE        8.39    
 LARGEST SCALED RESIDUAL FORCE     -1.859E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.859E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.570E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.239E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.623E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.01       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.408E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.01    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.410    
 STEP TIME COMPLETED       4.100E+08,  TOTAL TIME COMPLETED        4.100E+08


  INCREMENT    42 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       16.8       TIME AVG. FORCE        8.59    
 LARGEST SCALED RESIDUAL FORCE     -1.905E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.905E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.570E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.020E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.514E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.967       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.224E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.967    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.420    
 STEP TIME COMPLETED       4.200E+08,  TOTAL TIME COMPLETED        4.200E+08


  INCREMENT    43 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       17.2       TIME AVG. FORCE        8.79    
 LARGEST SCALED RESIDUAL FORCE     -1.952E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.952E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.569E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.810E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.409E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.927       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.047E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.927    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.430    
 STEP TIME COMPLETED       4.300E+08,  TOTAL TIME COMPLETED        4.300E+08


  INCREMENT    44 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  66ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       17.6       TIME AVG. FORCE        8.99    
 LARGEST SCALED RESIDUAL FORCE     -1.998E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.998E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.569E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.608E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.309E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.888       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.878E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.888    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.440    
 STEP TIME COMPLETED       4.400E+08,  TOTAL TIME COMPLETED        4.400E+08


  INCREMENT    45 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       18.0       TIME AVG. FORCE        9.19    
 LARGEST SCALED RESIDUAL FORCE     -2.045E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.045E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.569E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.416E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.212E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.851       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.716E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.851    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.450    
 STEP TIME COMPLETED       4.500E+08,  TOTAL TIME COMPLETED        4.500E+08


  INCREMENT    46 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  67ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       18.4       TIME AVG. FORCE        9.39    
 LARGEST SCALED RESIDUAL FORCE     -2.091E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.091E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.568E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.231E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.120E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.815       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.560E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.815    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.460    
 STEP TIME COMPLETED       4.600E+08,  TOTAL TIME COMPLETED        4.600E+08


  INCREMENT    47 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       18.8       TIME AVG. FORCE        9.59    
 LARGEST SCALED RESIDUAL FORCE     -2.137E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.137E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.568E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.054E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.031E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.781       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.411E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.781    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.470    
 STEP TIME COMPLETED       4.700E+08,  TOTAL TIME COMPLETED        4.700E+08


  INCREMENT    48 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  67ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       19.2       TIME AVG. FORCE        9.79    
 LARGEST SCALED RESIDUAL FORCE     -2.184E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.184E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.567E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.884E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.946E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.748       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.268E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.748    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.480    
 STEP TIME COMPLETED       4.800E+08,  TOTAL TIME COMPLETED        4.800E+08


  INCREMENT    49 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  67ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       19.6       TIME AVG. FORCE        9.99    
 LARGEST SCALED RESIDUAL FORCE     -2.230E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.230E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.567E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.722E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.865E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.717       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.131E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.717    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.490    
 STEP TIME COMPLETED       4.900E+08,  TOTAL TIME COMPLETED        4.900E+08


  INCREMENT    50 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       20.0       TIME AVG. FORCE        10.2    
 LARGEST SCALED RESIDUAL FORCE     -2.277E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.277E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.566E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.566E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.787E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.687       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.000E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.687    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.500    
 STEP TIME COMPLETED       5.000E+08,  TOTAL TIME COMPLETED        5.000E+08


  INCREMENT    51 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       20.4       TIME AVG. FORCE        10.4    
 LARGEST SCALED RESIDUAL FORCE     -2.323E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.323E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.566E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.417E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.712E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.658       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.875E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.658    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.510    
 STEP TIME COMPLETED       5.100E+08,  TOTAL TIME COMPLETED        5.100E+08


  INCREMENT    52 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       20.8       TIME AVG. FORCE        10.6    
 LARGEST SCALED RESIDUAL FORCE     -2.369E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.369E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.565E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.274E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.640E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.631       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.754E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.631    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.520    
 STEP TIME COMPLETED       5.200E+08,  TOTAL TIME COMPLETED        5.200E+08


  INCREMENT    53 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  66ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       21.2       TIME AVG. FORCE        10.8    
 LARGEST SCALED RESIDUAL FORCE     -2.415E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.415E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.565E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.137E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.572E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.604       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.639E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.604    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.530    
 STEP TIME COMPLETED       5.300E+08,  TOTAL TIME COMPLETED        5.300E+08


  INCREMENT    54 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  78ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       21.6       TIME AVG. FORCE        11.0    
 LARGEST SCALED RESIDUAL FORCE     -2.462E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.462E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.565E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.005E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.506E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.579       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.528E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.579    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.540    
 STEP TIME COMPLETED       5.400E+08,  TOTAL TIME COMPLETED        5.400E+08


  INCREMENT    55 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  67ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       22.0       TIME AVG. FORCE        11.2    
 LARGEST SCALED RESIDUAL FORCE     -2.508E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.508E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.564E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.880E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.443E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.555       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.423E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.555    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.550    
 STEP TIME COMPLETED       5.500E+08,  TOTAL TIME COMPLETED        5.500E+08


  INCREMENT    56 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       22.4       TIME AVG. FORCE        11.4    
 LARGEST SCALED RESIDUAL FORCE     -2.554E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.554E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.564E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.759E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.382E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.531       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.321E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.531    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.560    
 STEP TIME COMPLETED       5.600E+08,  TOTAL TIME COMPLETED        5.600E+08


  INCREMENT    57 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       22.8       TIME AVG. FORCE        11.6    
 LARGEST SCALED RESIDUAL FORCE     -2.600E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.600E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.563E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.644E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.324E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.509       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.224E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.509    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.570    
 STEP TIME COMPLETED       5.700E+08,  TOTAL TIME COMPLETED        5.700E+08


  INCREMENT    58 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       23.2       TIME AVG. FORCE        11.8    
 LARGEST SCALED RESIDUAL FORCE     -2.647E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.647E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.563E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.533E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.269E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.488       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.131E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.488    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.580    
 STEP TIME COMPLETED       5.800E+08,  TOTAL TIME COMPLETED        5.800E+08


  INCREMENT    59 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       23.6       TIME AVG. FORCE        12.0    
 LARGEST SCALED RESIDUAL FORCE     -2.693E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.693E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.562E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.427E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.216E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.468       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.042E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.468    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.590    
 STEP TIME COMPLETED       5.900E+08,  TOTAL TIME COMPLETED        5.900E+08


  INCREMENT    60 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       24.0       TIME AVG. FORCE        12.2    
 LARGEST SCALED RESIDUAL FORCE     -2.739E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.739E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.562E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.326E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.165E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.448       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.956E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.448    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.600    
 STEP TIME COMPLETED       6.000E+08,  TOTAL TIME COMPLETED        6.000E+08


  INCREMENT    61 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  75ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       24.4       TIME AVG. FORCE        12.4    
 LARGEST SCALED RESIDUAL FORCE     -2.785E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.785E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.561E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.228E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.116E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.429       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.874E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.429    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.610    
 STEP TIME COMPLETED       6.100E+08,  TOTAL TIME COMPLETED        6.100E+08


  INCREMENT    62 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       24.8       TIME AVG. FORCE        12.6    
 LARGEST SCALED RESIDUAL FORCE     -2.831E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.831E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.561E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.135E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.069E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.411       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.796E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.411    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.620    
 STEP TIME COMPLETED       6.200E+08,  TOTAL TIME COMPLETED        6.200E+08


  INCREMENT    63 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  74ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       25.2       TIME AVG. FORCE        12.8    
 LARGEST SCALED RESIDUAL FORCE     -2.878E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.878E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.561E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.046E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.025E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.394       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.721E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.394    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.630    
 STEP TIME COMPLETED       6.300E+08,  TOTAL TIME COMPLETED        6.300E+08


  INCREMENT    64 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       25.6       TIME AVG. FORCE        13.0    
 LARGEST SCALED RESIDUAL FORCE     -2.924E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.924E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.560E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.960E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -9.818E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.378       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.649E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.378    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.640    
 STEP TIME COMPLETED       6.400E+08,  TOTAL TIME COMPLETED        6.400E+08


  INCREMENT    65 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       26.0       TIME AVG. FORCE        13.2    
 LARGEST SCALED RESIDUAL FORCE     -2.970E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.970E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.560E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.878E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -9.407E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.362       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.580E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.362    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.650    
 STEP TIME COMPLETED       6.500E+08,  TOTAL TIME COMPLETED        6.500E+08


  INCREMENT    66 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  67ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       26.4       TIME AVG. FORCE        13.4    
 LARGEST SCALED RESIDUAL FORCE     -3.016E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.016E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.559E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.800E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -9.013E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.347       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.513E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.347    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.660    
 STEP TIME COMPLETED       6.600E+08,  TOTAL TIME COMPLETED        6.600E+08


  INCREMENT    67 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       26.8       TIME AVG. FORCE        13.6    
 LARGEST SCALED RESIDUAL FORCE     -3.062E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.062E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.559E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.724E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -8.636E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.332       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.450E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.332    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.670    
 STEP TIME COMPLETED       6.700E+08,  TOTAL TIME COMPLETED        6.700E+08


  INCREMENT    68 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  80ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       27.2       TIME AVG. FORCE        13.8    
 LARGEST SCALED RESIDUAL FORCE     -3.108E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.108E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.558E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.652E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -8.274E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.318       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.389E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.318    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.680    
 STEP TIME COMPLETED       6.800E+08,  TOTAL TIME COMPLETED        6.800E+08


  INCREMENT    69 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  80ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       27.6       TIME AVG. FORCE        14.0    
 LARGEST SCALED RESIDUAL FORCE     -3.154E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.154E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.558E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.583E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -7.928E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.305       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.331E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.305    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.690    
 STEP TIME COMPLETED       6.900E+08,  TOTAL TIME COMPLETED        6.900E+08


  INCREMENT    70 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       28.0       TIME AVG. FORCE        14.2    
 LARGEST SCALED RESIDUAL FORCE     -3.200E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.200E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.557E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.517E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -7.596E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.292       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.275E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.292    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.700    
 STEP TIME COMPLETED       7.000E+08,  TOTAL TIME COMPLETED        7.000E+08


  INCREMENT    71 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       28.4       TIME AVG. FORCE        14.4    
 LARGEST SCALED RESIDUAL FORCE     -3.246E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.246E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.557E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.454E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -7.278E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.280       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.222E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.280    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.710    
 STEP TIME COMPLETED       7.100E+08,  TOTAL TIME COMPLETED        7.100E+08


  INCREMENT    72 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       28.8       TIME AVG. FORCE        14.6    
 LARGEST SCALED RESIDUAL FORCE     -3.292E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.292E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.557E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.393E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -6.974E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.268       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.171E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.268    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.720    
 STEP TIME COMPLETED       7.200E+08,  TOTAL TIME COMPLETED        7.200E+08


  INCREMENT    73 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       29.2       TIME AVG. FORCE        14.8    
 LARGEST SCALED RESIDUAL FORCE     -3.338E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.338E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.556E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.335E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -6.682E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.257       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.122E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.257    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.730    
 STEP TIME COMPLETED       7.300E+08,  TOTAL TIME COMPLETED        7.300E+08


  INCREMENT    74 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       29.6       TIME AVG. FORCE        15.0    
 LARGEST SCALED RESIDUAL FORCE     -3.385E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.385E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.556E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.279E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -6.402E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.246       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.075E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.246    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.740    
 STEP TIME COMPLETED       7.400E+08,  TOTAL TIME COMPLETED        7.400E+08


  INCREMENT    75 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  79ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       30.0       TIME AVG. FORCE        15.2    
 LARGEST SCALED RESIDUAL FORCE     -3.431E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.431E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.555E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.225E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -6.134E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.236       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.030E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.236    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.750    
 STEP TIME COMPLETED       7.500E+08,  TOTAL TIME COMPLETED        7.500E+08


  INCREMENT    76 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       30.4       TIME AVG. FORCE        15.4    
 LARGEST SCALED RESIDUAL FORCE     -3.477E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.477E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.555E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.174E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -5.878E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.226       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.868E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.226    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.760    
 STEP TIME COMPLETED       7.600E+08,  TOTAL TIME COMPLETED        7.600E+08


  INCREMENT    77 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       30.8       TIME AVG. FORCE        15.6    
 LARGEST SCALED RESIDUAL FORCE     -3.522E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.522E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.554E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.125E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -5.632E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.217       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.455E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.217    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.770    
 STEP TIME COMPLETED       7.700E+08,  TOTAL TIME COMPLETED        7.700E+08


  INCREMENT    78 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       31.2       TIME AVG. FORCE        15.8    
 LARGEST SCALED RESIDUAL FORCE     -3.568E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.568E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.554E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.078E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -5.396E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.208       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.060E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.208    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.780    
 STEP TIME COMPLETED       7.800E+08,  TOTAL TIME COMPLETED        7.800E+08


  INCREMENT    79 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       31.6       TIME AVG. FORCE        16.0    
 LARGEST SCALED RESIDUAL FORCE     -3.614E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.614E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.553E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.033E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -5.170E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.199       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.681E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.199    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.790    
 STEP TIME COMPLETED       7.900E+08,  TOTAL TIME COMPLETED        7.900E+08


  INCREMENT    80 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       32.0       TIME AVG. FORCE        16.2    
 LARGEST SCALED RESIDUAL FORCE     -3.660E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.660E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.553E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.897E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.954E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.191       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.317E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.191    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.800    
 STEP TIME COMPLETED       8.000E+08,  TOTAL TIME COMPLETED        8.000E+08


  INCREMENT    81 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  82ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       32.4       TIME AVG. FORCE        16.4    
 LARGEST SCALED RESIDUAL FORCE     -3.706E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.706E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.553E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.483E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.747E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.183       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.969E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.183    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.810    
 STEP TIME COMPLETED       8.100E+08,  TOTAL TIME COMPLETED        8.100E+08


  INCREMENT    82 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       32.8       TIME AVG. FORCE        16.6    
 LARGEST SCALED RESIDUAL FORCE     -3.752E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.752E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.552E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.087E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.548E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.175       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.636E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.175    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.820    
 STEP TIME COMPLETED       8.200E+08,  TOTAL TIME COMPLETED        8.200E+08


  INCREMENT    83 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  134ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       33.2       TIME AVG. FORCE        16.8    
 LARGEST SCALED RESIDUAL FORCE     -3.798E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.798E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.552E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.707E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.358E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.168       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.316E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.168    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.830    
 STEP TIME COMPLETED       8.300E+08,  TOTAL TIME COMPLETED        8.300E+08


  INCREMENT    84 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  133ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       33.6       TIME AVG. FORCE        17.0    
 LARGEST SCALED RESIDUAL FORCE     -3.844E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.844E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.551E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.343E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.176E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.161       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.010E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.161    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.840    
 STEP TIME COMPLETED       8.400E+08,  TOTAL TIME COMPLETED        8.400E+08


  INCREMENT    85 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  120ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       34.0       TIME AVG. FORCE        17.2    
 LARGEST SCALED RESIDUAL FORCE     -3.890E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.890E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.551E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.994E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.001E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.154       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.717E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.154    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.850    
 STEP TIME COMPLETED       8.500E+08,  TOTAL TIME COMPLETED        8.500E+08


  INCREMENT    86 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  158ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       34.4       TIME AVG. FORCE        17.4    
 LARGEST SCALED RESIDUAL FORCE     -3.936E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.936E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.550E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.660E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.834E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.148       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.436E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.148    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.860    
 STEP TIME COMPLETED       8.600E+08,  TOTAL TIME COMPLETED        8.600E+08


  INCREMENT    87 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       34.8       TIME AVG. FORCE        17.6    
 LARGEST SCALED RESIDUAL FORCE     -3.982E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.982E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.550E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.340E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.673E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.141       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.167E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.141    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.870    
 STEP TIME COMPLETED       8.700E+08,  TOTAL TIME COMPLETED        8.700E+08


  INCREMENT    88 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       35.2       TIME AVG. FORCE        17.8    
 LARGEST SCALED RESIDUAL FORCE     -4.027E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.027E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.550E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.033E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.520E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.135       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.909E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.135    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.880    
 STEP TIME COMPLETED       8.800E+08,  TOTAL TIME COMPLETED        8.800E+08


  INCREMENT    89 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       35.6       TIME AVG. FORCE        18.0    
 LARGEST SCALED RESIDUAL FORCE     -4.073E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.073E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.549E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.739E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.372E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.130       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.661E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.130    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.890    
 STEP TIME COMPLETED       8.900E+08,  TOTAL TIME COMPLETED        8.900E+08


  INCREMENT    90 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  74ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       36.0       TIME AVG. FORCE        18.2    
 LARGEST SCALED RESIDUAL FORCE     -4.119E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.119E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.549E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.458E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.231E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.124       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.425E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.124    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.900    
 STEP TIME COMPLETED       9.000E+08,  TOTAL TIME COMPLETED        9.000E+08


  INCREMENT    91 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  79ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       36.4       TIME AVG. FORCE        18.4    
 LARGEST SCALED RESIDUAL FORCE     -4.165E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.165E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.548E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.188E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.096E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.119       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.198E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.119    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.910    
 STEP TIME COMPLETED       9.100E+08,  TOTAL TIME COMPLETED        9.100E+08


  INCREMENT    92 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       36.8       TIME AVG. FORCE        18.6    
 LARGEST SCALED RESIDUAL FORCE     -4.211E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.211E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.548E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.929E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.967E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.114       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.980E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.114    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.920    
 STEP TIME COMPLETED       9.200E+08,  TOTAL TIME COMPLETED        9.200E+08


  INCREMENT    93 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  109ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       37.2       TIME AVG. FORCE        18.8    
 LARGEST SCALED RESIDUAL FORCE     -4.256E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.256E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.547E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.681E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.843E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.109       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.772E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.109    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.930    
 STEP TIME COMPLETED       9.300E+08,  TOTAL TIME COMPLETED        9.300E+08


  INCREMENT    94 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       37.6       TIME AVG. FORCE        19.0    
 LARGEST SCALED RESIDUAL FORCE     -4.302E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.302E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.547E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.444E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.724E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.105       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.572E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.105    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.940    
 STEP TIME COMPLETED       9.400E+08,  TOTAL TIME COMPLETED        9.400E+08


  INCREMENT    95 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  94ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       37.9       TIME AVG. FORCE        19.2    
 LARGEST SCALED RESIDUAL FORCE     -4.348E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.348E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.546E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  5.217E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.610E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.100       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.381E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.100    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.950    
 STEP TIME COMPLETED       9.500E+08,  TOTAL TIME COMPLETED        9.500E+08


  INCREMENT    96 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       38.3       TIME AVG. FORCE        19.4    
 LARGEST SCALED RESIDUAL FORCE     -4.394E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.394E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.546E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.999E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.501E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         9.624E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.198E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   9.624E-02

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.960    
 STEP TIME COMPLETED       9.600E+08,  TOTAL TIME COMPLETED        9.600E+08


  INCREMENT    97 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  93ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       38.7       TIME AVG. FORCE        19.6    
 LARGEST SCALED RESIDUAL FORCE     -4.439E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.439E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.546E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.790E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.396E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         9.222E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.022E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   9.222E-02

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.970    
 STEP TIME COMPLETED       9.700E+08,  TOTAL TIME COMPLETED        9.700E+08


  INCREMENT    98 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       39.1       TIME AVG. FORCE        19.8    
 LARGEST SCALED RESIDUAL FORCE     -4.485E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.485E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.545E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.590E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.296E-15   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         8.837E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.854E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   8.837E-02

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.980    
 STEP TIME COMPLETED       9.800E+08,  TOTAL TIME COMPLETED        9.800E+08


  INCREMENT    99 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       39.5       TIME AVG. FORCE        20.0    
 LARGEST SCALED RESIDUAL FORCE     -4.531E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.531E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.545E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.398E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.200E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         8.467E-02   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.693E-03   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   8.467E-02

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED  0.990    
 STEP TIME COMPLETED       9.900E+08,  TOTAL TIME COMPLETED        9.900E+08


  INCREMENT   100 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT  1.000E+07
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.776e+09
        SOLVER ELAPSED TIME:  88ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       39.9       TIME AVG. FORCE        20.2    
 LARGEST SCALED RESIDUAL FORCE     -4.576E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.576E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.544E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.214E-11   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.108E-15   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         8.114E-02   AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.538E-03   AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   8.114E-02

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED  1.000E+07,  FRACTION OF STEP COMPLETED   1.00    
 STEP TIME COMPLETED       1.000E+09,  TOTAL TIME COMPLETED        1.000E+09


          THE ANALYSIS HAS BEEN COMPLETED



     ANALYSIS SUMMARY:
     TOTAL OF        100  INCREMENTS
                       0  CUTBACKS IN AUTOMATIC INCREMENTATION
                     101  ITERATIONS INCLUDING CONTACT ITERATIONS IF PRESENT
                     101  PASSES THROUGH THE EQUATION SOLVER OF WHICH 
                     101  INVOLVE MATRIX DECOMPOSITION, INCLUDING
                       0  DECOMPOSITION(S) OF THE MASS MATRIX
                       1  REORDERING OF EQUATIONS TO MINIMIZE WAVEFRONT
                       0  ADDITIONAL RESIDUAL EVALUATIONS FOR LINE SEARCHES
                       0  ADDITIONAL OPERATOR EVALUATIONS FOR LINE SEARCHES
                       8  WARNING MESSAGES DURING USER INPUT PROCESSING
                  318483  WARNING MESSAGES DURING ANALYSIS
                  318384  ANALYSIS WARNINGS ARE NUMERICAL PROBLEM MESSAGES
                       0  ANALYSIS WARNINGS ARE NEGATIVE EIGENVALUE MESSAGES
                       0  ERROR MESSAGES



     JOB TIME SUMMARY
       USER TIME (SEC)      =      45.    
       SYSTEM TIME (SEC)    =      4.1    
       TOTAL CPU TIME (SEC) =      49.    
       WALLCLOCK TIME (SEC) =           59
       MEMORY PEAK (GB)     =            0
