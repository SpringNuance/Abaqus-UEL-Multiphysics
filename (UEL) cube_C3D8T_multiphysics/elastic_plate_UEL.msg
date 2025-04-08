1

   Abaqus 2023.HF4                                  Date 08-Apr-2025   Time 09:53:41
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
        SOLVER ELAPSED TIME:  59ms

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
        SOLVER ELAPSED TIME:  29ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      0.200       TIME AVG. FORCE       0.200    
 LARGEST SCALED RESIDUAL FORCE     -5.190E-10   AT NODE        929   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -5.190E-10
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
        SOLVER ELAPSED TIME:  99ms

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
 LARGEST SCALED RESIDUAL FORCE      1.086E-09   AT NODE        205   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.086E-09
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
        SOLVER ELAPSED TIME:  170ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       1.20       TIME AVG. FORCE       0.733    
 LARGEST SCALED RESIDUAL FORCE     -1.718E-09   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.718E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.587E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.199E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.062E-09   AT NODE       2937   DOF 12
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
        SOLVER ELAPSED TIME:  100ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       1.60       TIME AVG. FORCE       0.949    
 LARGEST SCALED RESIDUAL FORCE     -2.463E-09   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.463E-09
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
 LARGEST CORRECTION TO TEMP.        -10.2       AT NODE       2153   DOF 12
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
        SOLVER ELAPSED TIME:  139ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       2.00       TIME AVG. FORCE        1.16    
 LARGEST SCALED RESIDUAL FORCE     -3.208E-09   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.208E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.586E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.167E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.811E-11   AT NODE       3178   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          7.36       AT NODE       2850   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -3.93       AT NODE       2143   DOF 12
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
        SOLVER ELAPSED TIME:  160ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       2.40       TIME AVG. FORCE        1.37    
 LARGEST SCALED RESIDUAL FORCE     -3.953E-09   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.953E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.586E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.134E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.471E-12   AT NODE       3200   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          5.69       AT NODE       2896   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -2.07       AT NODE       2127   DOF 12
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
        SOLVER ELAPSED TIME:  139ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       2.80       TIME AVG. FORCE        1.57    
 LARGEST SCALED RESIDUAL FORCE     -4.703E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.703E-09
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
        SOLVER ELAPSED TIME:  163ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       3.20       TIME AVG. FORCE        1.77    
 LARGEST SCALED RESIDUAL FORCE     -5.455E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -5.455E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.585E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.037E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         1.639E-12   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          4.01       AT NODE       2840   DOF 12
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
        SOLVER ELAPSED TIME:  143ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       3.60       TIME AVG. FORCE        1.98    
 LARGEST SCALED RESIDUAL FORCE     -6.206E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -6.206E-09
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
 LARGEST CORRECTION TO TEMP.       -0.592       AT NODE       2155   DOF 12
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
        SOLVER ELAPSED TIME:  114ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       4.00       TIME AVG. FORCE        2.18    
 LARGEST SCALED RESIDUAL FORCE     -6.958E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -6.958E-09
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
 LARGEST CORRECTION TO TEMP.       -0.433       AT NODE       2166   DOF 12
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
        SOLVER ELAPSED TIME:  157ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       4.40       TIME AVG. FORCE        2.38    
 LARGEST SCALED RESIDUAL FORCE     -7.709E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -7.709E-09
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
        SOLVER ELAPSED TIME:  141ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       4.80       TIME AVG. FORCE        2.58    
 LARGEST SCALED RESIDUAL FORCE     -8.460E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -8.460E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.583E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.781E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         4.980E-13   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.07       AT NODE        894   DOF 12
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
        SOLVER ELAPSED TIME:  139ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       5.20       TIME AVG. FORCE        2.78    
 LARGEST SCALED RESIDUAL FORCE     -9.210E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -9.210E-09
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
        SOLVER ELAPSED TIME:  84ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       5.60       TIME AVG. FORCE        2.98    
 LARGEST SCALED RESIDUAL FORCE     -9.961E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -9.961E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.582E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.647E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         2.256E-13   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.97       AT NODE         92   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.166       AT NODE       2840   DOF 12
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
        SOLVER ELAPSED TIME:  113ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       6.00       TIME AVG. FORCE        3.18    
 LARGEST SCALED RESIDUAL FORCE     -1.071E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.071E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.582E-12   AT NODE       1769   DOF  1
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
        SOLVER ELAPSED TIME:  100ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       6.40       TIME AVG. FORCE        3.39    
 LARGEST SCALED RESIDUAL FORCE     -1.146E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.146E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.581E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.518E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         8.308E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.82       AT NODE       1762   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.123       AT NODE       2868   DOF 12
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
        SOLVER ELAPSED TIME:  75ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       6.80       TIME AVG. FORCE        3.59    
 LARGEST SCALED RESIDUAL FORCE     -1.221E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.221E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.581E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.457E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX         4.109E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.73       AT NODE       1754   DOF 12
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
        SOLVER ELAPSED TIME:  76ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       7.20       TIME AVG. FORCE        3.79    
 LARGEST SCALED RESIDUAL FORCE     -1.296E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.296E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.581E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.397E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.577E-14   AT NODE       3047   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.63       AT NODE       1763   DOF 12
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
        SOLVER ELAPSED TIME:  81ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       7.59       TIME AVG. FORCE        3.99    
 LARGEST SCALED RESIDUAL FORCE     -1.371E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.371E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.580E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.339E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -1.997E-14   AT NODE       3047   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.54       AT NODE       1812   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.870E-02   AT NODE        917   DOF 12
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
        SOLVER ELAPSED TIME:  75ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       7.99       TIME AVG. FORCE        4.19    
 LARGEST SCALED RESIDUAL FORCE     -1.446E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.446E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.580E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.284E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.257E-14   AT NODE        879   DOF 12
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
        SOLVER ELAPSED TIME:  83ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       8.39       TIME AVG. FORCE        4.39    
 LARGEST SCALED RESIDUAL FORCE     -1.521E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.521E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.579E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.231E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.183E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.35       AT NODE       1769   DOF 12
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
        SOLVER ELAPSED TIME:  122ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       8.79       TIME AVG. FORCE        4.59    
 LARGEST SCALED RESIDUAL FORCE     -1.596E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.596E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.579E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.180E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.780E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.26       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.326E-02   AT NODE        969   DOF 12
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
        SOLVER ELAPSED TIME:  155ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       9.19       TIME AVG. FORCE        4.79    
 LARGEST SCALED RESIDUAL FORCE     -1.671E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.671E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.578E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.131E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.144E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.17       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.073E-02   AT NODE         91   DOF 12
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
        SOLVER ELAPSED TIME:  172ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       9.59       TIME AVG. FORCE        4.99    
 LARGEST SCALED RESIDUAL FORCE     -1.746E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.746E-08
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
        SOLVER ELAPSED TIME:  135ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       9.99       TIME AVG. FORCE        5.19    
 LARGEST SCALED RESIDUAL FORCE     -1.821E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.821E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.577E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.038E-09   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.429E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.99       AT NODE       1769   DOF 12
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
        SOLVER ELAPSED TIME:  156ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       10.4       TIME AVG. FORCE        5.39    
 LARGEST SCALED RESIDUAL FORCE     -1.896E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.896E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.577E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.948E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.434E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.91       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.196E-02   AT NODE       1752   DOF 12
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
        SOLVER ELAPSED TIME:  94ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       10.8       TIME AVG. FORCE        5.59    
 LARGEST SCALED RESIDUAL FORCE     -1.970E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.970E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.577E-12   AT NODE       1768   DOF  1
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
        SOLVER ELAPSED TIME:  84ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       11.2       TIME AVG. FORCE        5.79    
 LARGEST SCALED RESIDUAL FORCE     -2.045E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.045E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.576E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.134E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.298E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.76       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.590E-02   AT NODE       1763   DOF 12
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
        SOLVER ELAPSED TIME:  74ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       11.6       TIME AVG. FORCE        5.99    
 LARGEST SCALED RESIDUAL FORCE     -2.120E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.120E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.576E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.751E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.188E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.68       AT NODE       1768   DOF 12
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
        SOLVER ELAPSED TIME:  78ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       12.0       TIME AVG. FORCE        6.19    
 LARGEST SCALED RESIDUAL FORCE     -2.195E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.195E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.575E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.385E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -4.062E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.61       AT NODE       1769   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.005E-02   AT NODE       1768   DOF 12
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
        SOLVER ELAPSED TIME:  77ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       12.4       TIME AVG. FORCE        6.39    
 LARGEST SCALED RESIDUAL FORCE     -2.270E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.270E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.575E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.034E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.927E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.55       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.724E-02   AT NODE       1769   DOF 12
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
        SOLVER ELAPSED TIME:  124ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       12.8       TIME AVG. FORCE        6.59    
 LARGEST SCALED RESIDUAL FORCE     -2.344E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.344E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.574E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.698E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.788E-14   AT NODE        879   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.48       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.452E-02   AT NODE       1769   DOF 12
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
        SOLVER ELAPSED TIME:  86ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       13.2       TIME AVG. FORCE        6.79    
 LARGEST SCALED RESIDUAL FORCE     -2.419E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.419E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.574E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.376E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.647E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.42       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.188E-02   AT NODE       1768   DOF 12
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
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       13.6       TIME AVG. FORCE        6.99    
 LARGEST SCALED RESIDUAL FORCE     -2.494E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.494E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.573E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  7.067E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.507E-14   AT NODE          8   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.36       AT NODE       1768   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.934E-02   AT NODE       1769   DOF 12
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
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       14.0       TIME AVG. FORCE        7.19    
 LARGEST SCALED RESIDUAL FORCE     -2.569E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.569E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.573E-12   AT NODE       1768   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.771E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.369E-14   AT NODE          8   DOF 12
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
        SOLVER ELAPSED TIME:  74ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       14.4       TIME AVG. FORCE        7.39    
 LARGEST SCALED RESIDUAL FORCE     -2.643E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.643E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.573E-12   AT NODE       1769   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  6.488E-10   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -3.235E-14   AT NODE        879   DOF 12
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
        SOLVER ELAPSED TIME:  2ms

 ***ERROR: Unable to access the new solver solution.



     ANALYSIS SUMMARY:
     TOTAL OF         37  INCREMENTS
                       0  CUTBACKS IN AUTOMATIC INCREMENTATION
                      38  ITERATIONS INCLUDING CONTACT ITERATIONS IF PRESENT
                      37  PASSES THROUGH THE EQUATION SOLVER OF WHICH 
                      38  INVOLVE MATRIX DECOMPOSITION, INCLUDING
                       0  DECOMPOSITION(S) OF THE MASS MATRIX
                       1  REORDERING OF EQUATIONS TO MINIMIZE WAVEFRONT
                       0  ADDITIONAL RESIDUAL EVALUATIONS FOR LINE SEARCHES
                       0  ADDITIONAL OPERATOR EVALUATIONS FOR LINE SEARCHES
                       8  WARNING MESSAGES DURING USER INPUT PROCESSING
                  112595  WARNING MESSAGES DURING ANALYSIS
                  112560  ANALYSIS WARNINGS ARE NUMERICAL PROBLEM MESSAGES
                       0  ANALYSIS WARNINGS ARE NEGATIVE EIGENVALUE MESSAGES
                       1  ERROR MESSAGES



     JOB TIME SUMMARY
       USER TIME (SEC)      =      25.    
       SYSTEM TIME (SEC)    =      2.9    
       TOTAL CPU TIME (SEC) =      28.    
       WALLCLOCK TIME (SEC) =           34
       MEMORY PEAK (GB)     =            0
