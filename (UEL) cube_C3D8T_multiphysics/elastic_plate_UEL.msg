1

   Abaqus 2023.HF4                                  Date 06-Apr-2025   Time 20:48:42
   For use by AALTO UNIVERSITY under license from Dassault Systemes or its subsidiary.

                                                                                 
                                                                                 
 STEP    1     INCREMENT     1     STEP TIME    0.00    


                        S T E P       1     C O U P L E D - T E M P E R A T U R E - D I S P L A C E M E N T   A N A L Y S I S


                                                                                          

     AUTOMATIC TIME CONTROL WITH -
          A SUGGESTED INITIAL TIME INCREMENT OF                 1.00    
          AND A TOTAL TIME PERIOD OF                            100.    
          THE MINIMUM TIME INCREMENT ALLOWED IS                1.000E-04
          THE MAXIMUM TIME INCREMENT ALLOWED IS                 1.00    

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


  INCREMENT     1 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  12918
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      9.052e+08
        SOLVER ELAPSED TIME:  41ms

 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 929 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 58 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 4 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 875 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 931 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 60 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 59 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 930 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 934 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 63 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 62 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 933 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 61 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 932 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 1389 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 518 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 927 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 56 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 55 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 926 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 924 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 53 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 877 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 6 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 50 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 921 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 51 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 922 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 923 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 52 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 54 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 925 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 928 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 57 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 1454 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 583 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 991 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 120 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 119 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 990 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 5 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 876 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 936 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 65 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 66 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 937 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 67 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 938 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: SOLVER PROBLEM.  ZERO PIVOT WHEN PROCESSING NODE 939 INSTANCE 
             ELASTIC_PLATE_1 D.O.F. 11
  Typically a zero pivot is associated with an overconstraint in the model. 
 However, Abaqus was not able to identify any chains of constraints that might 
 lead to an overconstraint at this node. This suggests that the model might be 
 in fact insufficiently constrained in this particular degree of freedom. 
 Please check the constraints used in this model. 


 ***WARNING: Solver problem. Zero pivot when processing D.O.F. 11 of 49 nodes. 
             The nodes have been identified in node set 
             WarnNodeSolvProbZeroPiv_11_1_1_1_1.

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      0.200       TIME AVG. FORCE       0.200    
 LARGEST SCALED RESIDUAL FORCE      1.218E-05   AT NODE       2149   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.218E-05
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          DISP.    CORRECTION TOO LARGE COMPARED TO DISP.    INCREMENT

 AVERAGE HEAT FLUX                  5.379E-29   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.736E-27   AT NODE       3022   DOF 11
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          100.       AT NODE       2083   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.         100.       AT NODE       2083   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  12918
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      9.052e+08
        SOLVER ELAPSED TIME:  41ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      0.200       TIME AVG. FORCE       0.200    
 LARGEST SCALED RESIDUAL FORCE     -2.107E-10   AT NODE        932   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.107E-10
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        4.498E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  5.403E-29   TIME AVG. HEAT FLUX   1.000E-02
 LARGEST RESIDUAL HEAT FLUX        -2.770E-27   AT NODE       2939   DOF 11
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          100.       AT NODE       2083   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.661E-17   AT NODE       1454   DOF 11
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THERE IS ZERO HEAT FLUX EVERYWHERE
 

 ***WARNING: THERE IS ZERO HEAT FLUX EVERYWHERE IN THE MODEL BASED ON THE 
             DEFAULT CRITERION. PLEASE CHECK THE VALUE OF THE AVERAGE HEAT FLUX 
             DURING THE CURRENT ITERATION TO VERIFY THAT THE HEAT FLUX IS SMALL 
             ENOUGH TO BE TREATED AS ZERO. IF NOT, PLEASE USE THE SOLUTION 
             CONTROLS TO RESET THE CRITERION FOR ZERO HEAT FLUX.

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   2.676E-17

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  1.000E-02
 STEP TIME COMPLETED        1.00    ,  TOTAL TIME COMPLETED         1.00    


  INCREMENT     2 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                      0.800       TIME AVG. FORCE       0.500    
 LARGEST SCALED RESIDUAL FORCE     -6.493E-10   AT NODE        929   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -6.493E-10
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.995E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.210E-04   TIME AVG. HEAT FLUX   2.210E-04
 LARGEST RESIDUAL HEAT FLUX         3.706E-02   AT NODE       3117   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          4.11       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -100.       AT NODE       2083   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                      0.800       TIME AVG. FORCE       0.500    
 LARGEST SCALED RESIDUAL FORCE      1.015E-13   AT NODE       3008   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.015E-13
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        2.714E-16   AT NODE        875   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.207E-04   TIME AVG. HEAT FLUX   2.207E-04
 LARGEST RESIDUAL HEAT FLUX         5.731E-03   AT NODE       3097   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          12.8       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.         8.73       AT NODE       2218   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                      0.800       TIME AVG. FORCE       0.500    
 LARGEST SCALED RESIDUAL FORCE     -9.637E-14   AT NODE       2358   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -9.637E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        1.959E-20   AT NODE        110   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.202E-04   TIME AVG. HEAT FLUX   2.202E-04
 LARGEST RESIDUAL HEAT FLUX         1.032E-03   AT NODE       3097   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          14.1       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.         1.28       AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     4


 AVERAGE FORCE                      0.800       TIME AVG. FORCE       0.500    
 LARGEST SCALED RESIDUAL FORCE     -9.193E-14   AT NODE       2678   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -9.193E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -2.037E-22   AT NODE       2757   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.201E-04   TIME AVG. HEAT FLUX   2.201E-04
 LARGEST RESIDUAL HEAT FLUX         2.011E-04   AT NODE       3097   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          14.4       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        0.224       AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  80ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     5


 AVERAGE FORCE                      0.800       TIME AVG. FORCE       0.500    
 LARGEST SCALED RESIDUAL FORCE     -9.392E-14   AT NODE       2358   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -9.392E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -2.005E-22   AT NODE       2849   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.201E-04   TIME AVG. HEAT FLUX   2.201E-04
 LARGEST RESIDUAL HEAT FLUX         4.113E-05   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          14.4       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        4.273E-02   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     6


 AVERAGE FORCE                      0.800       TIME AVG. FORCE       0.500    
 LARGEST SCALED RESIDUAL FORCE     -1.075E-13   AT NODE       2678   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.075E-13
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        1.660E-22   AT NODE       2678   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.201E-04   TIME AVG. HEAT FLUX   2.201E-04
 LARGEST RESIDUAL HEAT FLUX        -9.465E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          14.4       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        8.607E-03   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     7


 AVERAGE FORCE                      0.800       TIME AVG. FORCE       0.500    
 LARGEST SCALED RESIDUAL FORCE     -8.638E-14   AT NODE       2358   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -8.638E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -1.881E-22   AT NODE       2678   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.201E-04   TIME AVG. HEAT FLUX   2.201E-04
 LARGEST RESIDUAL HEAT FLUX        -2.208E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          14.4       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.886E-03   AT NODE       2131   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     8


 AVERAGE FORCE                      0.800       TIME AVG. FORCE       0.500    
 LARGEST SCALED RESIDUAL FORCE     -1.070E-13   AT NODE       2678   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.070E-13
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        2.011E-22   AT NODE       2537   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.201E-04   TIME AVG. HEAT FLUX   2.201E-04
 LARGEST RESIDUAL HEAT FLUX        -5.167E-07   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          14.4       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.393E-04   AT NODE       2131   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    14.4    

 ITERATION SUMMARY FOR THE INCREMENT:   8 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  8 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  2.000E-02
 STEP TIME COMPLETED        2.00    ,  TOTAL TIME COMPLETED         2.00    


  INCREMENT     3 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       1.20       TIME AVG. FORCE       0.733    
 LARGEST SCALED RESIDUAL FORCE      1.040E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.040E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.995E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.258E-03   TIME AVG. HEAT FLUX   2.239E-03
 LARGEST RESIDUAL HEAT FLUX        -2.650E-03   AT NODE       3017   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          11.2       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -3.25       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  66ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       1.20       TIME AVG. FORCE       0.733    
 LARGEST SCALED RESIDUAL FORCE     -2.071E-13   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.071E-13
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        4.381E-16   AT NODE          4   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  5.109E-03   TIME AVG. HEAT FLUX   2.665E-03
 LARGEST RESIDUAL HEAT FLUX        -5.200E-04   AT NODE       2957   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          10.6       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.574       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                       1.20       TIME AVG. FORCE       0.733    
 LARGEST SCALED RESIDUAL FORCE      6.661E-14   AT NODE       2999   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      6.661E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -4.265E-20   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  4.645E-03   TIME AVG. HEAT FLUX   2.433E-03
 LARGEST RESIDUAL HEAT FLUX         1.072E-04   AT NODE       2938   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          10.5       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.110       AT NODE       2538   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     4


 AVERAGE FORCE                       1.20       TIME AVG. FORCE       0.733    
 LARGEST SCALED RESIDUAL FORCE     -7.949E-14   AT NODE       2836   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -7.949E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -2.160E-22   AT NODE       2678   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  4.645E-03   TIME AVG. HEAT FLUX   2.433E-03
 LARGEST RESIDUAL HEAT FLUX         2.503E-05   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          10.5       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.234E-02   AT NODE       2538   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  80ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     5


 AVERAGE FORCE                       1.20       TIME AVG. FORCE       0.733    
 LARGEST SCALED RESIDUAL FORCE      7.017E-14   AT NODE       3140   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      7.017E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        2.741E-22   AT NODE       2533   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  4.645E-03   TIME AVG. HEAT FLUX   2.433E-03
 LARGEST RESIDUAL HEAT FLUX         5.844E-06   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          10.4       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        4.985E-03   AT NODE       2217   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    10.4    

 ITERATION SUMMARY FOR THE INCREMENT:   5 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  5 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  3.000E-02
 STEP TIME COMPLETED        3.00    ,  TOTAL TIME COMPLETED         3.00    


  INCREMENT     4 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  67ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       1.60       TIME AVG. FORCE       0.949    
 LARGEST SCALED RESIDUAL FORCE      1.623E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.623E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.995E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  4.258E-03   TIME AVG. HEAT FLUX   3.041E-03
 LARGEST RESIDUAL HEAT FLUX        -1.664E-03   AT NODE       3177   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          8.27       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -2.18       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       1.60       TIME AVG. FORCE       0.949    
 LARGEST SCALED RESIDUAL FORCE     -3.706E-13   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.706E-13
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        6.048E-16   AT NODE          4   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  4.258E-03   TIME AVG. HEAT FLUX   3.041E-03
 LARGEST RESIDUAL HEAT FLUX        -3.156E-04   AT NODE       3117   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          7.91       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.365       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  76ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                       1.60       TIME AVG. FORCE       0.949    
 LARGEST SCALED RESIDUAL FORCE      7.239E-14   AT NODE       2297   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      7.239E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -7.486E-20   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.930E-03   TIME AVG. HEAT FLUX   2.932E-03
 LARGEST RESIDUAL HEAT FLUX        -6.325E-05   AT NODE       2937   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          7.84       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.769E-02   AT NODE       2538   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     4


 AVERAGE FORCE                       1.60       TIME AVG. FORCE       0.949    
 LARGEST SCALED RESIDUAL FORCE      6.439E-14   AT NODE       2274   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      6.439E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        2.213E-22   AT NODE       2533   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.930E-03   TIME AVG. HEAT FLUX   2.932E-03
 LARGEST RESIDUAL HEAT FLUX         1.357E-05   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          7.83       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.334E-02   AT NODE       2218   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    7.83    

 ITERATION SUMMARY FOR THE INCREMENT:   4 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  4 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  4.000E-02
 STEP TIME COMPLETED        4.00    ,  TOTAL TIME COMPLETED         4.00    


  INCREMENT     5 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       2.00       TIME AVG. FORCE        1.16    
 LARGEST SCALED RESIDUAL FORCE      2.206E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.206E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.994E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.649E-03   TIME AVG. HEAT FLUX   3.111E-03
 LARGEST RESIDUAL HEAT FLUX        -1.072E-03   AT NODE       3177   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          6.32       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -1.50       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       2.00       TIME AVG. FORCE        1.16    
 LARGEST SCALED RESIDUAL FORCE     -5.902E-13   AT NODE         55   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -5.902E-13
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        7.714E-16   AT NODE        875   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.930E-03   TIME AVG. HEAT FLUX   3.181E-03
 LARGEST RESIDUAL HEAT FLUX        -1.958E-04   AT NODE       2957   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          6.08       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.239       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  67ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                       2.00       TIME AVG. FORCE        1.16    
 LARGEST SCALED RESIDUAL FORCE     -1.181E-13   AT NODE       3137   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.181E-13
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -1.162E-19   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.930E-03   TIME AVG. HEAT FLUX   3.181E-03
 LARGEST RESIDUAL HEAT FLUX        -3.814E-05   AT NODE       2937   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          6.04       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.250E-02   AT NODE       2218   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     4


 AVERAGE FORCE                       2.00       TIME AVG. FORCE        1.16    
 LARGEST SCALED RESIDUAL FORCE      1.013E-13   AT NODE       2598   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.013E-13
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -5.104E-22   AT NODE       2222   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.930E-03   TIME AVG. HEAT FLUX   3.181E-03
 LARGEST RESIDUAL HEAT FLUX        -7.761E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          6.03       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.124E-03   AT NODE       2218   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    6.03    

 ITERATION SUMMARY FOR THE INCREMENT:   4 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  4 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  5.000E-02
 STEP TIME COMPLETED        5.00    ,  TOTAL TIME COMPLETED         5.00    


  INCREMENT     6 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  82ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       2.40       TIME AVG. FORCE        1.37    
 LARGEST SCALED RESIDUAL FORCE      2.789E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.789E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.994E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.406E-03   TIME AVG. HEAT FLUX   3.226E-03
 LARGEST RESIDUAL HEAT FLUX        -7.042E-04   AT NODE       3017   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          4.97       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.        -1.06       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       2.40       TIME AVG. FORCE        1.37    
 LARGEST SCALED RESIDUAL FORCE     -8.589E-13   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -8.589E-13
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        9.380E-16   AT NODE        875   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.406E-03   TIME AVG. HEAT FLUX   3.226E-03
 LARGEST RESIDUAL HEAT FLUX        -1.235E-04   AT NODE       2937   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          4.81       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.159       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  75ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                       2.40       TIME AVG. FORCE        1.37    
 LARGEST SCALED RESIDUAL FORCE      8.438E-14   AT NODE       2338   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      8.438E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -1.665E-19   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.406E-03   TIME AVG. HEAT FLUX   3.226E-03
 LARGEST RESIDUAL HEAT FLUX        -2.329E-05   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          4.78       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.714E-02   AT NODE       2218   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  66ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     4


 AVERAGE FORCE                       2.40       TIME AVG. FORCE        1.37    
 LARGEST SCALED RESIDUAL FORCE     -6.839E-14   AT NODE       2457   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -6.839E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        4.931E-22   AT NODE       2896   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.406E-03   TIME AVG. HEAT FLUX   3.226E-03
 LARGEST RESIDUAL HEAT FLUX        -4.622E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          4.78       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.017E-03   AT NODE       2133   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    4.78    

 ITERATION SUMMARY FOR THE INCREMENT:   4 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  4 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  6.000E-02
 STEP TIME COMPLETED        6.00    ,  TOTAL TIME COMPLETED         6.00    


  INCREMENT     7 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       2.80       TIME AVG. FORCE        1.57    
 LARGEST SCALED RESIDUAL FORCE      3.372E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.372E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.994E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.193E-03   TIME AVG. HEAT FLUX   3.221E-03
 LARGEST RESIDUAL HEAT FLUX        -4.742E-04   AT NODE       3017   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          4.01       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.773       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       2.80       TIME AVG. FORCE        1.57    
 LARGEST SCALED RESIDUAL FORCE     -1.179E-12   AT NODE         55   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.179E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        1.105E-15   AT NODE          4   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.406E-03   TIME AVG. HEAT FLUX   3.256E-03
 LARGEST RESIDUAL HEAT FLUX        -7.955E-05   AT NODE       3097   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.90       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.109       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  65ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                       2.80       TIME AVG. FORCE        1.57    
 LARGEST SCALED RESIDUAL FORCE      6.128E-14   AT NODE       2777   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      6.128E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -2.257E-19   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.406E-03   TIME AVG. HEAT FLUX   3.256E-03
 LARGEST RESIDUAL HEAT FLUX        -1.450E-05   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.88       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.772E-02   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    3.88    

 ITERATION SUMMARY FOR THE INCREMENT:   3 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  3 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  7.000E-02
 STEP TIME COMPLETED        7.00    ,  TOTAL TIME COMPLETED         7.00    


  INCREMENT     8 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       3.20       TIME AVG. FORCE        1.77    
 LARGEST SCALED RESIDUAL FORCE      3.955E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.955E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.993E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.005E-03   TIME AVG. HEAT FLUX   3.220E-03
 LARGEST RESIDUAL HEAT FLUX        -3.303E-04   AT NODE       3017   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.30       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.580       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       3.20       TIME AVG. FORCE        1.77    
 LARGEST SCALED RESIDUAL FORCE     -1.543E-12   AT NODE         55   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.543E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        1.271E-15   AT NODE          4   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.005E-03   TIME AVG. HEAT FLUX   3.220E-03
 LARGEST RESIDUAL HEAT FLUX        -5.302E-05   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.22       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.692E-02   AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                       3.20       TIME AVG. FORCE        1.77    
 LARGEST SCALED RESIDUAL FORCE      1.181E-13   AT NODE       2176   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.181E-13
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -2.943E-19   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.005E-03   TIME AVG. HEAT FLUX   3.220E-03
 LARGEST RESIDUAL HEAT FLUX        -9.338E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          3.21       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.196E-02   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    3.21    

 ITERATION SUMMARY FOR THE INCREMENT:   3 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  3 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  8.000E-02
 STEP TIME COMPLETED        8.00    ,  TOTAL TIME COMPLETED         8.00    


  INCREMENT     9 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       3.60       TIME AVG. FORCE        1.98    
 LARGEST SCALED RESIDUAL FORCE      4.537E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.537E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.993E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  3.005E-03   TIME AVG. HEAT FLUX   3.193E-03
 LARGEST RESIDUAL HEAT FLUX        -2.327E-04   AT NODE       3177   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.78       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.442       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  76ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       3.60       TIME AVG. FORCE        1.98    
 LARGEST SCALED RESIDUAL FORCE     -1.973E-12   AT NODE         55   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.973E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        1.438E-15   AT NODE          4   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.005E-03   TIME AVG. HEAT FLUX   3.193E-03
 LARGEST RESIDUAL HEAT FLUX        -3.559E-05   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.78       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.502E-02   AT NODE       2258   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  90ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                       3.60       TIME AVG. FORCE        1.98    
 LARGEST SCALED RESIDUAL FORCE     -7.461E-14   AT NODE       2218   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -7.461E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -3.717E-19   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  3.005E-03   TIME AVG. HEAT FLUX   3.193E-03
 LARGEST RESIDUAL HEAT FLUX        -6.028E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.78       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.142E-03   AT NODE       2133   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.78    

 ITERATION SUMMARY FOR THE INCREMENT:   3 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  3 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  9.000E-02
 STEP TIME COMPLETED        9.00    ,  TOTAL TIME COMPLETED         9.00    


  INCREMENT    10 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       4.00       TIME AVG. FORCE        2.18    
 LARGEST SCALED RESIDUAL FORCE      5.119E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.119E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.993E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.785E-03   TIME AVG. HEAT FLUX   3.148E-03
 LARGEST RESIDUAL HEAT FLUX        -1.678E-04   AT NODE       2957   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.58       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.344       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       4.00       TIME AVG. FORCE        2.18    
 LARGEST SCALED RESIDUAL FORCE     -2.442E-12   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.442E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        1.604E-15   AT NODE          4   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.689E-03   TIME AVG. HEAT FLUX   3.137E-03
 LARGEST RESIDUAL HEAT FLUX        -2.441E-05   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.57       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.024E-02   AT NODE       2133   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                       4.00       TIME AVG. FORCE        2.18    
 LARGEST SCALED RESIDUAL FORCE     -7.816E-14   AT NODE       3060   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -7.816E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -4.578E-19   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.689E-03   TIME AVG. HEAT FLUX   3.137E-03
 LARGEST RESIDUAL HEAT FLUX        -3.971E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.57       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.661E-03   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.57    

 ITERATION SUMMARY FOR THE INCREMENT:   3 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  3 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.100    
 STEP TIME COMPLETED        10.0    ,  TOTAL TIME COMPLETED         10.0    


  INCREMENT    11 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       4.40       TIME AVG. FORCE        2.38    
 LARGEST SCALED RESIDUAL FORCE      5.701E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.701E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.992E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.689E-03   TIME AVG. HEAT FLUX   3.093E-03
 LARGEST RESIDUAL HEAT FLUX        -1.236E-04   AT NODE       3097   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.38       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.273       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  76ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       4.40       TIME AVG. FORCE        2.38    
 LARGEST SCALED RESIDUAL FORCE     -2.960E-12   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -2.960E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        1.770E-15   AT NODE        875   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.689E-03   TIME AVG. HEAT FLUX   3.093E-03
 LARGEST RESIDUAL HEAT FLUX        -1.711E-05   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.37       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.005E-02   AT NODE       2133   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     3


 AVERAGE FORCE                       4.40       TIME AVG. FORCE        2.38    
 LARGEST SCALED RESIDUAL FORCE     -9.237E-14   AT NODE       2977   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -9.237E-14
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.       -5.533E-19   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.689E-03   TIME AVG. HEAT FLUX   3.093E-03
 LARGEST RESIDUAL HEAT FLUX        -2.670E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.37       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.020E-03   AT NODE       2133   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.37    

 ITERATION SUMMARY FOR THE INCREMENT:   3 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  3 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.110    
 STEP TIME COMPLETED        11.0    ,  TOTAL TIME COMPLETED         11.0    


  INCREMENT    12 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       4.80       TIME AVG. FORCE        2.58    
 LARGEST SCALED RESIDUAL FORCE      6.282E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      6.282E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.992E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.640E-03   TIME AVG. HEAT FLUX   3.051E-03
 LARGEST RESIDUAL HEAT FLUX        -9.293E-05   AT NODE       3097   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.20       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.220       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       4.80       TIME AVG. FORCE        2.58    
 LARGEST SCALED RESIDUAL FORCE     -3.526E-12   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -3.526E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        1.937E-15   AT NODE          4   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.689E-03   TIME AVG. HEAT FLUX   3.056E-03
 LARGEST RESIDUAL HEAT FLUX        -1.224E-05   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.19       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.288E-02   AT NODE       2133   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -3.013E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.19    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.120    
 STEP TIME COMPLETED        12.0    ,  TOTAL TIME COMPLETED         12.0    


  INCREMENT    13 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  74ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       5.20       TIME AVG. FORCE        2.78    
 LARGEST SCALED RESIDUAL FORCE      6.864E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      6.864E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.992E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.432E-03   TIME AVG. HEAT FLUX   3.004E-03
 LARGEST RESIDUAL HEAT FLUX        -7.313E-05   AT NODE       2937   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.03       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.184       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       5.20       TIME AVG. FORCE        2.78    
 LARGEST SCALED RESIDUAL FORCE     -4.161E-12   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.161E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        2.103E-15   AT NODE          4   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.432E-03   TIME AVG. HEAT FLUX   3.004E-03
 LARGEST RESIDUAL HEAT FLUX        -9.248E-06   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          2.02       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.818E-02   AT NODE       2133   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    2.02    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.130    
 STEP TIME COMPLETED        13.0    ,  TOTAL TIME COMPLETED         13.0    


  INCREMENT    14 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  67ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       5.60       TIME AVG. FORCE        2.98    
 LARGEST SCALED RESIDUAL FORCE      7.445E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      7.445E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.991E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.432E-03   TIME AVG. HEAT FLUX   2.960E-03
 LARGEST RESIDUAL HEAT FLUX        -5.670E-05   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.88       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.152       AT NODE       2861   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  80ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       5.60       TIME AVG. FORCE        2.98    
 LARGEST SCALED RESIDUAL FORCE     -4.829E-12   AT NODE         55   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -4.829E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        2.269E-15   AT NODE         59   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.432E-03   TIME AVG. HEAT FLUX   2.960E-03
 LARGEST RESIDUAL HEAT FLUX        -6.827E-06   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.88       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.426E-02   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.88    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.140    
 STEP TIME COMPLETED        14.0    ,  TOTAL TIME COMPLETED         14.0    


  INCREMENT    15 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  78ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       6.00       TIME AVG. FORCE        3.18    
 LARGEST SCALED RESIDUAL FORCE      8.026E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      8.026E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.991E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.393E-03   TIME AVG. HEAT FLUX   2.919E-03
 LARGEST RESIDUAL HEAT FLUX        -4.461E-05   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.75       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.128       AT NODE       2857   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  95ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       6.00       TIME AVG. FORCE        3.18    
 LARGEST SCALED RESIDUAL FORCE     -5.553E-12   AT NODE         55   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -5.553E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        2.436E-15   AT NODE        930   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.432E-03   TIME AVG. HEAT FLUX   2.922E-03
 LARGEST RESIDUAL HEAT FLUX        -5.117E-06   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.74       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.133E-02   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.74    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.150    
 STEP TIME COMPLETED        15.0    ,  TOTAL TIME COMPLETED         15.0    


  INCREMENT    16 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  88ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       6.40       TIME AVG. FORCE        3.39    
 LARGEST SCALED RESIDUAL FORCE      8.606E-09   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      8.606E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.991E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.221E-03   TIME AVG. HEAT FLUX   2.875E-03
 LARGEST RESIDUAL HEAT FLUX        -3.562E-05   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.63       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.114       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  87ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       6.40       TIME AVG. FORCE        3.39    
 LARGEST SCALED RESIDUAL FORCE     -6.323E-12   AT NODE         55   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -6.323E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        2.602E-15   AT NODE        930   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.221E-03   TIME AVG. HEAT FLUX   2.875E-03
 LARGEST RESIDUAL HEAT FLUX        -3.899E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.62       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.136E-03   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.62    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.160    
 STEP TIME COMPLETED        16.0    ,  TOTAL TIME COMPLETED         16.0    


  INCREMENT    17 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  75ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       6.80       TIME AVG. FORCE        3.59    
 LARGEST SCALED RESIDUAL FORCE      9.187E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      9.187E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.990E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.221E-03   TIME AVG. HEAT FLUX   2.835E-03
 LARGEST RESIDUAL HEAT FLUX        -2.882E-05   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.52       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -0.102       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  75ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       6.80       TIME AVG. FORCE        3.59    
 LARGEST SCALED RESIDUAL FORCE     -7.152E-12   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -7.152E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        2.768E-15   AT NODE        930   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.221E-03   TIME AVG. HEAT FLUX   2.835E-03
 LARGEST RESIDUAL HEAT FLUX        -3.016E-06   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.51       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.457E-03   AT NODE       2133   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.51    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.170    
 STEP TIME COMPLETED        17.0    ,  TOTAL TIME COMPLETED         17.0    


  INCREMENT    18 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  77ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       7.20       TIME AVG. FORCE        3.79    
 LARGEST SCALED RESIDUAL FORCE      9.767E-09   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      9.767E-09
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.990E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.221E-03   TIME AVG. HEAT FLUX   2.798E-03
 LARGEST RESIDUAL HEAT FLUX        -2.360E-05   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.42       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.243E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       7.20       TIME AVG. FORCE        3.79    
 LARGEST SCALED RESIDUAL FORCE     -8.015E-12   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -8.015E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        2.935E-15   AT NODE         59   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.221E-03   TIME AVG. HEAT FLUX   2.798E-03
 LARGEST RESIDUAL HEAT FLUX        -2.365E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.41       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.154E-03   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.41    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.180    
 STEP TIME COMPLETED        18.0    ,  TOTAL TIME COMPLETED         18.0    


  INCREMENT    19 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  77ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       7.59       TIME AVG. FORCE        3.99    
 LARGEST SCALED RESIDUAL FORCE      1.035E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.035E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.990E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.043E-03   TIME AVG. HEAT FLUX   2.756E-03
 LARGEST RESIDUAL HEAT FLUX        -1.953E-05   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.33       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.362E-02   AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       7.59       TIME AVG. FORCE        3.99    
 LARGEST SCALED RESIDUAL FORCE     -8.939E-12   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -8.939E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        3.101E-15   AT NODE         59   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.043E-03   TIME AVG. HEAT FLUX   2.756E-03
 LARGEST RESIDUAL HEAT FLUX        -1.878E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.33       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.130E-03   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.33    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.190    
 STEP TIME COMPLETED        19.0    ,  TOTAL TIME COMPLETED         19.0    


  INCREMENT    20 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       7.99       TIME AVG. FORCE        4.19    
 LARGEST SCALED RESIDUAL FORCE      1.093E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.093E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.989E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.043E-03   TIME AVG. HEAT FLUX   2.719E-03
 LARGEST RESIDUAL HEAT FLUX        -1.632E-05   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.25       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.583E-02   AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  94ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       7.99       TIME AVG. FORCE        4.19    
 LARGEST SCALED RESIDUAL FORCE     -9.915E-12   AT NODE         55   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -9.915E-12
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        3.267E-15   AT NODE        930   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.043E-03   TIME AVG. HEAT FLUX   2.719E-03
 LARGEST RESIDUAL HEAT FLUX        -1.508E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.25       AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.315E-03   AT NODE       2132   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.25    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.200    
 STEP TIME COMPLETED        20.0    ,  TOTAL TIME COMPLETED         20.0    


  INCREMENT    21 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  67ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       8.39       TIME AVG. FORCE        4.39    
 LARGEST SCALED RESIDUAL FORCE      1.151E-08   AT NODE        927   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.151E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.989E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  2.043E-03   TIME AVG. HEAT FLUX   2.685E-03
 LARGEST RESIDUAL HEAT FLUX        -1.376E-05   AT NODE       3057   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.18       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.894E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          HEAT FLUX EQUILIBRIUM NOT ACHIEVED WITHIN TOLERANCE.
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     2


 AVERAGE FORCE                       8.39       TIME AVG. FORCE        4.39    
 LARGEST SCALED RESIDUAL FORCE     -1.093E-11   AT NODE        926   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE     -1.093E-11
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        3.433E-15   AT NODE         59   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM EQUATIONS HAVE CONVERGED

 AVERAGE HEAT FLUX                  2.043E-03   TIME AVG. HEAT FLUX   2.685E-03
 LARGEST RESIDUAL HEAT FLUX        -1.223E-06   AT NODE       2897   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.17       AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.765E-03   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE HEAT FLUX EQUILIBRIUM EQUATIONS HAVE CONVERGED

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.17    

 ITERATION SUMMARY FOR THE INCREMENT:   2 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  2 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.210    
 STEP TIME COMPLETED        21.0    ,  TOTAL TIME COMPLETED         21.0    


  INCREMENT    22 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       8.79       TIME AVG. FORCE        4.59    
 LARGEST SCALED RESIDUAL FORCE      1.209E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.209E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.989E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.964E-03   TIME AVG. HEAT FLUX   2.651E-03
 LARGEST RESIDUAL HEAT FLUX        -1.214E-05   AT NODE       3018   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.12       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.285E-02   AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -3.422E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.12    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.220    
 STEP TIME COMPLETED        22.0    ,  TOTAL TIME COMPLETED         22.0    


  INCREMENT    23 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       9.19       TIME AVG. FORCE        4.79    
 LARGEST SCALED RESIDUAL FORCE      1.264E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.264E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.988E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.891E-03   TIME AVG. HEAT FLUX   2.616E-03
 LARGEST RESIDUAL HEAT FLUX        -1.164E-05   AT NODE       3018   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.08       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.090E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -3.285E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.08    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.230    
 STEP TIME COMPLETED        23.0    ,  TOTAL TIME COMPLETED         23.0    


  INCREMENT    24 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       9.59       TIME AVG. FORCE        4.99    
 LARGEST SCALED RESIDUAL FORCE      1.323E-08   AT NODE         56   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.323E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.988E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.891E-03   TIME AVG. HEAT FLUX   2.585E-03
 LARGEST RESIDUAL HEAT FLUX        -1.042E-05   AT NODE       3178   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.04       AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.593E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.945E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.04    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.240    
 STEP TIME COMPLETED        24.0    ,  TOTAL TIME COMPLETED         24.0    


  INCREMENT    25 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  76ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       9.99       TIME AVG. FORCE        5.19    
 LARGEST SCALED RESIDUAL FORCE      1.381E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.381E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.988E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.891E-03   TIME AVG. HEAT FLUX   2.556E-03
 LARGEST RESIDUAL HEAT FLUX        -9.276E-06   AT NODE       3118   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.          1.00       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.127E-02   AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.628E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS    1.00    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.250    
 STEP TIME COMPLETED        25.0    ,  TOTAL TIME COMPLETED         25.0    


  INCREMENT    26 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  96ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       10.4       TIME AVG. FORCE        5.39    
 LARGEST SCALED RESIDUAL FORCE      1.439E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.439E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.987E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.761E-03   TIME AVG. HEAT FLUX   2.524E-03
 LARGEST RESIDUAL HEAT FLUX        -8.276E-06   AT NODE       3098   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.967       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.709E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.350E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.967    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.260    
 STEP TIME COMPLETED        26.0    ,  TOTAL TIME COMPLETED         26.0    


  INCREMENT    27 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       10.8       TIME AVG. FORCE        5.59    
 LARGEST SCALED RESIDUAL FORCE      1.497E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.497E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.987E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.761E-03   TIME AVG. HEAT FLUX   2.495E-03
 LARGEST RESIDUAL HEAT FLUX        -7.404E-06   AT NODE       2938   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.932       AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.336E-02   AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.107E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.932    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.270    
 STEP TIME COMPLETED        27.0    ,  TOTAL TIME COMPLETED         27.0    


  INCREMENT    28 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       11.2       TIME AVG. FORCE        5.79    
 LARGEST SCALED RESIDUAL FORCE      1.555E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.555E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.987E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.761E-03   TIME AVG. HEAT FLUX   2.468E-03
 LARGEST RESIDUAL HEAT FLUX        -6.643E-06   AT NODE       3098   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.899       AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.002E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.894E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.899    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.280    
 STEP TIME COMPLETED        28.0    ,  TOTAL TIME COMPLETED         28.0    


  INCREMENT    29 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       11.6       TIME AVG. FORCE        5.99    
 LARGEST SCALED RESIDUAL FORCE      1.613E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.613E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.986E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.761E-03   TIME AVG. HEAT FLUX   2.442E-03
 LARGEST RESIDUAL HEAT FLUX        -5.976E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.868       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.703E-02   AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.707E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.868    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.290    
 STEP TIME COMPLETED        29.0    ,  TOTAL TIME COMPLETED         29.0    


  INCREMENT    30 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       12.0       TIME AVG. FORCE        6.19    
 LARGEST SCALED RESIDUAL FORCE      1.671E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.671E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.986E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.647E-03   TIME AVG. HEAT FLUX   2.415E-03
 LARGEST RESIDUAL HEAT FLUX        -5.391E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.838       AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.433E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.543E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.838    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.300    
 STEP TIME COMPLETED        30.0    ,  TOTAL TIME COMPLETED         30.0    


  INCREMENT    31 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  68ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       12.4       TIME AVG. FORCE        6.39    
 LARGEST SCALED RESIDUAL FORCE      1.728E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.728E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.986E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.647E-03   TIME AVG. HEAT FLUX   2.389E-03
 LARGEST RESIDUAL HEAT FLUX        -4.876E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.810       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.190E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.398E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.810    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.310    
 STEP TIME COMPLETED        31.0    ,  TOTAL TIME COMPLETED         31.0    


  INCREMENT    32 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  74ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       12.8       TIME AVG. FORCE        6.59    
 LARGEST SCALED RESIDUAL FORCE      1.786E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.786E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.985E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.647E-03   TIME AVG. HEAT FLUX   2.365E-03
 LARGEST RESIDUAL HEAT FLUX        -4.421E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.783       AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.970E-02   AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.270E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.783    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.320    
 STEP TIME COMPLETED        32.0    ,  TOTAL TIME COMPLETED         32.0    


  INCREMENT    33 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       13.2       TIME AVG. FORCE        6.79    
 LARGEST SCALED RESIDUAL FORCE      1.844E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.844E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.985E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.647E-03   TIME AVG. HEAT FLUX   2.343E-03
 LARGEST RESIDUAL HEAT FLUX        -4.019E-06   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.758       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.770E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.156E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.758    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.330    
 STEP TIME COMPLETED        33.0    ,  TOTAL TIME COMPLETED         33.0    


  INCREMENT    34 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       13.6       TIME AVG. FORCE        6.99    
 LARGEST SCALED RESIDUAL FORCE      1.902E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.902E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.985E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.629E-03   TIME AVG. HEAT FLUX   2.321E-03
 LARGEST RESIDUAL HEAT FLUX        -3.662E-06   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.734       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.589E-02   AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.055E-03
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.734    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.340    
 STEP TIME COMPLETED        34.0    ,  TOTAL TIME COMPLETED         34.0    


  INCREMENT    35 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  67ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       14.0       TIME AVG. FORCE        7.19    
 LARGEST SCALED RESIDUAL FORCE      1.960E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      1.960E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.984E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.547E-03   TIME AVG. HEAT FLUX   2.298E-03
 LARGEST RESIDUAL HEAT FLUX        -3.344E-06   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.711       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.423E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -9.651E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.711    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.350    
 STEP TIME COMPLETED        35.0    ,  TOTAL TIME COMPLETED         35.0    


  INCREMENT    36 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       14.4       TIME AVG. FORCE        7.39    
 LARGEST SCALED RESIDUAL FORCE      2.018E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.018E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.984E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.547E-03   TIME AVG. HEAT FLUX   2.277E-03
 LARGEST RESIDUAL HEAT FLUX        -3.060E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.689       AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.272E-02   AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -8.845E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.689    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.360    
 STEP TIME COMPLETED        36.0    ,  TOTAL TIME COMPLETED         36.0    


  INCREMENT    37 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  74ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       14.8       TIME AVG. FORCE        7.59    
 LARGEST SCALED RESIDUAL FORCE      2.075E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.075E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.984E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.547E-03   TIME AVG. HEAT FLUX   2.257E-03
 LARGEST RESIDUAL HEAT FLUX        -2.807E-06   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.668       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.133E-02   AT NODE       2862   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -8.123E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.668    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.370    
 STEP TIME COMPLETED        37.0    ,  TOTAL TIME COMPLETED         37.0    


  INCREMENT    38 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  102ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       15.2       TIME AVG. FORCE        7.79    
 LARGEST SCALED RESIDUAL FORCE      2.133E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.133E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.983E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.547E-03   TIME AVG. HEAT FLUX   2.238E-03
 LARGEST RESIDUAL HEAT FLUX        -2.579E-06   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.648       AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.006E-02   AT NODE       2856   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -7.474E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.648    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.380    
 STEP TIME COMPLETED        38.0    ,  TOTAL TIME COMPLETED         38.0    


  INCREMENT    39 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  91ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       15.6       TIME AVG. FORCE        7.99    
 LARGEST SCALED RESIDUAL FORCE      2.191E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.191E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.983E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.459E-03   TIME AVG. HEAT FLUX   2.217E-03
 LARGEST RESIDUAL HEAT FLUX        -2.375E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.629       AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.906E-02   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -6.948E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.629    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.390    
 STEP TIME COMPLETED        39.0    ,  TOTAL TIME COMPLETED         39.0    


  INCREMENT    40 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  113ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       16.0       TIME AVG. FORCE        8.19    
 LARGEST SCALED RESIDUAL FORCE      2.248E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.248E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.983E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.459E-03   TIME AVG. HEAT FLUX   2.198E-03
 LARGEST RESIDUAL HEAT FLUX        -2.190E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.610       AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.819E-02   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -6.429E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.610    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.400    
 STEP TIME COMPLETED        40.0    ,  TOTAL TIME COMPLETED         40.0    


  INCREMENT    41 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  100ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       16.4       TIME AVG. FORCE        8.39    
 LARGEST SCALED RESIDUAL FORCE      2.306E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.306E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.982E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.459E-03   TIME AVG. HEAT FLUX   2.179E-03
 LARGEST RESIDUAL HEAT FLUX        -2.024E-06   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.596       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.737E-02   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -5.944E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.596    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.410    
 STEP TIME COMPLETED        41.0    ,  TOTAL TIME COMPLETED         41.0    


  INCREMENT    42 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  112ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       16.8       TIME AVG. FORCE        8.59    
 LARGEST SCALED RESIDUAL FORCE      2.364E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.364E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.982E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.458E-03   TIME AVG. HEAT FLUX   2.162E-03
 LARGEST RESIDUAL HEAT FLUX        -1.873E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.584       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.659E-02   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -5.505E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.584    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.420    
 STEP TIME COMPLETED        42.0    ,  TOTAL TIME COMPLETED         42.0    


  INCREMENT    43 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  92ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       17.2       TIME AVG. FORCE        8.79    
 LARGEST SCALED RESIDUAL FORCE      2.421E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.421E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.982E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.458E-03   TIME AVG. HEAT FLUX   2.145E-03
 LARGEST RESIDUAL HEAT FLUX        -1.736E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.571       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.586E-02   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -5.106E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.571    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.430    
 STEP TIME COMPLETED        43.0    ,  TOTAL TIME COMPLETED         43.0    


  INCREMENT    44 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  109ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       17.6       TIME AVG. FORCE        8.99    
 LARGEST SCALED RESIDUAL FORCE      2.479E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.479E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.981E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.380E-03   TIME AVG. HEAT FLUX   2.127E-03
 LARGEST RESIDUAL HEAT FLUX        -1.612E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.559       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.518E-02   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -4.744E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.559    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.440    
 STEP TIME COMPLETED        44.0    ,  TOTAL TIME COMPLETED         44.0    


  INCREMENT    45 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  151ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       18.0       TIME AVG. FORCE        9.19    
 LARGEST SCALED RESIDUAL FORCE      2.536E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.536E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.981E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.380E-03   TIME AVG. HEAT FLUX   2.110E-03
 LARGEST RESIDUAL HEAT FLUX        -1.499E-06   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.548       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.453E-02   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -4.414E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.548    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.450    
 STEP TIME COMPLETED        45.0    ,  TOTAL TIME COMPLETED         45.0    


  INCREMENT    46 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  109ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       18.4       TIME AVG. FORCE        9.39    
 LARGEST SCALED RESIDUAL FORCE      2.594E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.594E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.981E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.380E-03   TIME AVG. HEAT FLUX   2.094E-03
 LARGEST RESIDUAL HEAT FLUX        -1.396E-06   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.537       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.392E-02   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -4.112E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.537    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.460    
 STEP TIME COMPLETED        46.0    ,  TOTAL TIME COMPLETED         46.0    


  INCREMENT    47 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  93ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       18.8       TIME AVG. FORCE        9.59    
 LARGEST SCALED RESIDUAL FORCE      2.651E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.651E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.980E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.379E-03   TIME AVG. HEAT FLUX   2.078E-03
 LARGEST RESIDUAL HEAT FLUX        -1.302E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.526       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.334E-02   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -3.837E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.526    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.470    
 STEP TIME COMPLETED        47.0    ,  TOTAL TIME COMPLETED         47.0    


  INCREMENT    48 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  76ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       19.2       TIME AVG. FORCE        9.79    
 LARGEST SCALED RESIDUAL FORCE      2.709E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.709E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.980E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.379E-03   TIME AVG. HEAT FLUX   2.063E-03
 LARGEST RESIDUAL HEAT FLUX        -1.216E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.515       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.279E-02   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -3.585E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.515    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.480    
 STEP TIME COMPLETED        48.0    ,  TOTAL TIME COMPLETED         48.0    


  INCREMENT    49 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  83ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       19.6       TIME AVG. FORCE        9.99    
 LARGEST SCALED RESIDUAL FORCE      2.766E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.766E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.980E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.379E-03   TIME AVG. HEAT FLUX   2.049E-03
 LARGEST RESIDUAL HEAT FLUX        -1.137E-06   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.505       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.227E-02   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -3.353E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.505    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.490    
 STEP TIME COMPLETED        49.0    ,  TOTAL TIME COMPLETED         49.0    


  INCREMENT    50 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       20.0       TIME AVG. FORCE        10.2    
 LARGEST SCALED RESIDUAL FORCE      2.823E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.823E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.979E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.309E-03   TIME AVG. HEAT FLUX   2.034E-03
 LARGEST RESIDUAL HEAT FLUX        -1.064E-06   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.495       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.179E-02   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -3.141E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.495    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.500    
 STEP TIME COMPLETED        50.0    ,  TOTAL TIME COMPLETED         50.0    


  INCREMENT    51 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  74ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       20.4       TIME AVG. FORCE        10.4    
 LARGEST SCALED RESIDUAL FORCE      2.881E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.881E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.979E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.309E-03   TIME AVG. HEAT FLUX   2.020E-03
 LARGEST RESIDUAL HEAT FLUX        -9.973E-07   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.485       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.132E-02   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.945E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.485    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.510    
 STEP TIME COMPLETED        51.0    ,  TOTAL TIME COMPLETED         51.0    


  INCREMENT    52 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  82ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       20.8       TIME AVG. FORCE        10.6    
 LARGEST SCALED RESIDUAL FORCE      2.938E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.938E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.979E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.309E-03   TIME AVG. HEAT FLUX   2.006E-03
 LARGEST RESIDUAL HEAT FLUX        -9.358E-07   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.475       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.088E-02   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.765E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.475    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.520    
 STEP TIME COMPLETED        52.0    ,  TOTAL TIME COMPLETED         52.0    


  INCREMENT    53 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  78ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       21.2       TIME AVG. FORCE        10.8    
 LARGEST SCALED RESIDUAL FORCE      2.995E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      2.995E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.978E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.309E-03   TIME AVG. HEAT FLUX   1.992E-03
 LARGEST RESIDUAL HEAT FLUX        -8.790E-07   AT NODE       2898   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.466       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.047E-02   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.599E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.466    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.530    
 STEP TIME COMPLETED        53.0    ,  TOTAL TIME COMPLETED         53.0    


  INCREMENT    54 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  78ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       21.6       TIME AVG. FORCE        11.0    
 LARGEST SCALED RESIDUAL FORCE      3.053E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.053E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.978E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.309E-03   TIME AVG. HEAT FLUX   1.979E-03
 LARGEST RESIDUAL HEAT FLUX        -8.266E-07   AT NODE       3058   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.457       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -1.007E-02   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.445E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.457    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.540    
 STEP TIME COMPLETED        54.0    ,  TOTAL TIME COMPLETED         54.0    


  INCREMENT    55 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  79ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       22.0       TIME AVG. FORCE        11.2    
 LARGEST SCALED RESIDUAL FORCE      3.110E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.110E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.978E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.245E-03   TIME AVG. HEAT FLUX   1.966E-03
 LARGEST RESIDUAL HEAT FLUX        -7.828E-07   AT NODE       3099   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.449       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.695E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.316E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.449    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.550    
 STEP TIME COMPLETED        55.0    ,  TOTAL TIME COMPLETED         55.0    


  INCREMENT    56 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  85ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       22.4       TIME AVG. FORCE        11.4    
 LARGEST SCALED RESIDUAL FORCE      3.167E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.167E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.977E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.245E-03   TIME AVG. HEAT FLUX   1.953E-03
 LARGEST RESIDUAL HEAT FLUX        -7.440E-07   AT NODE       2939   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.440       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.339E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.203E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.440    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.560    
 STEP TIME COMPLETED        56.0    ,  TOTAL TIME COMPLETED         56.0    


  INCREMENT    57 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       22.8       TIME AVG. FORCE        11.6    
 LARGEST SCALED RESIDUAL FORCE      3.225E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.225E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.977E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.245E-03   TIME AVG. HEAT FLUX   1.940E-03
 LARGEST RESIDUAL HEAT FLUX        -7.076E-07   AT NODE       2939   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.432       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -9.000E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -2.096E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.432    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.570    
 STEP TIME COMPLETED        57.0    ,  TOTAL TIME COMPLETED         57.0    


  INCREMENT    58 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  84ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       23.2       TIME AVG. FORCE        11.8    
 LARGEST SCALED RESIDUAL FORCE      3.282E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.282E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.977E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.245E-03   TIME AVG. HEAT FLUX   1.928E-03
 LARGEST RESIDUAL HEAT FLUX        -6.733E-07   AT NODE       3099   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.424       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.678E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.995E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.424    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.580    
 STEP TIME COMPLETED        58.0    ,  TOTAL TIME COMPLETED         58.0    


  INCREMENT    59 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  83ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       23.6       TIME AVG. FORCE        12.0    
 LARGEST SCALED RESIDUAL FORCE      3.339E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.339E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.976E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.245E-03   TIME AVG. HEAT FLUX   1.916E-03
 LARGEST RESIDUAL HEAT FLUX        -6.411E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.416       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.371E-03   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.901E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.416    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.590    
 STEP TIME COMPLETED        59.0    ,  TOTAL TIME COMPLETED         59.0    


  INCREMENT    60 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  85ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       24.0       TIME AVG. FORCE        12.2    
 LARGEST SCALED RESIDUAL FORCE      3.396E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.396E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.976E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.245E-03   TIME AVG. HEAT FLUX   1.905E-03
 LARGEST RESIDUAL HEAT FLUX        -6.108E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.409       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -8.079E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.812E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.409    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.600    
 STEP TIME COMPLETED        60.0    ,  TOTAL TIME COMPLETED         60.0    


  INCREMENT    61 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  78ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       24.4       TIME AVG. FORCE        12.4    
 LARGEST SCALED RESIDUAL FORCE      3.453E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.453E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.976E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.189E-03   TIME AVG. HEAT FLUX   1.893E-03
 LARGEST RESIDUAL HEAT FLUX        -5.823E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.401       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.800E-03   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.728E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.401    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.610    
 STEP TIME COMPLETED        61.0    ,  TOTAL TIME COMPLETED         61.0    


  INCREMENT    62 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       24.8       TIME AVG. FORCE        12.6    
 LARGEST SCALED RESIDUAL FORCE      3.510E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.510E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.975E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.188E-03   TIME AVG. HEAT FLUX   1.881E-03
 LARGEST RESIDUAL HEAT FLUX        -5.554E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.394       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.535E-03   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.649E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.394    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.620    
 STEP TIME COMPLETED        62.0    ,  TOTAL TIME COMPLETED         62.0    


  INCREMENT    63 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  95ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       25.2       TIME AVG. FORCE        12.8    
 LARGEST SCALED RESIDUAL FORCE      3.567E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.567E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.975E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.187E-03   TIME AVG. HEAT FLUX   1.870E-03
 LARGEST RESIDUAL HEAT FLUX        -5.300E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.387       AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.282E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.574E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.387    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.630    
 STEP TIME COMPLETED        63.0    ,  TOTAL TIME COMPLETED         63.0    


  INCREMENT    64 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  76ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       25.6       TIME AVG. FORCE        13.0    
 LARGEST SCALED RESIDUAL FORCE      3.624E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.624E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.975E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.185E-03   TIME AVG. HEAT FLUX   1.859E-03
 LARGEST RESIDUAL HEAT FLUX        -5.061E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.381       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -7.040E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.503E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.381    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.640    
 STEP TIME COMPLETED        64.0    ,  TOTAL TIME COMPLETED         64.0    


  INCREMENT    65 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  82ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       26.0       TIME AVG. FORCE        13.2    
 LARGEST SCALED RESIDUAL FORCE      3.681E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.681E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.974E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.183E-03   TIME AVG. HEAT FLUX   1.848E-03
 LARGEST RESIDUAL HEAT FLUX        -4.835E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.374       AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.810E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.437E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.374    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.650    
 STEP TIME COMPLETED        65.0    ,  TOTAL TIME COMPLETED         65.0    


  INCREMENT    66 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       26.4       TIME AVG. FORCE        13.4    
 LARGEST SCALED RESIDUAL FORCE      3.738E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.738E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.974E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.177E-03   TIME AVG. HEAT FLUX   1.838E-03
 LARGEST RESIDUAL HEAT FLUX        -4.622E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.369       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.589E-03   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.374E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.369    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.660    
 STEP TIME COMPLETED        66.0    ,  TOTAL TIME COMPLETED         66.0    


  INCREMENT    67 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  78ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       26.8       TIME AVG. FORCE        13.6    
 LARGEST SCALED RESIDUAL FORCE      3.795E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.795E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.974E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.137E-03   TIME AVG. HEAT FLUX   1.828E-03
 LARGEST RESIDUAL HEAT FLUX        -4.420E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.364       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.378E-03   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.315E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.364    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.670    
 STEP TIME COMPLETED        67.0    ,  TOTAL TIME COMPLETED         67.0    


  INCREMENT    68 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  75ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       27.2       TIME AVG. FORCE        13.8    
 LARGEST SCALED RESIDUAL FORCE      3.852E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.852E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.973E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.133E-03   TIME AVG. HEAT FLUX   1.817E-03
 LARGEST RESIDUAL HEAT FLUX        -4.230E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.359       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -6.177E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.258E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.359    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.680    
 STEP TIME COMPLETED        68.0    ,  TOTAL TIME COMPLETED         68.0    


  INCREMENT    69 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       27.6       TIME AVG. FORCE        14.0    
 LARGEST SCALED RESIDUAL FORCE      3.909E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.909E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.973E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.132E-03   TIME AVG. HEAT FLUX   1.807E-03
 LARGEST RESIDUAL HEAT FLUX        -4.049E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.354       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.984E-03   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.205E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.354    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.690    
 STEP TIME COMPLETED        69.0    ,  TOTAL TIME COMPLETED         69.0    


  INCREMENT    70 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  90ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       28.0       TIME AVG. FORCE        14.2    
 LARGEST SCALED RESIDUAL FORCE      3.966E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      3.966E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.973E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.127E-03   TIME AVG. HEAT FLUX   1.797E-03
 LARGEST RESIDUAL HEAT FLUX        -3.878E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.349       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.799E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.155E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.349    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.700    
 STEP TIME COMPLETED        70.0    ,  TOTAL TIME COMPLETED         70.0    


  INCREMENT    71 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  78ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       28.4       TIME AVG. FORCE        14.4    
 LARGEST SCALED RESIDUAL FORCE      4.023E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.023E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.973E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.123E-03   TIME AVG. HEAT FLUX   1.788E-03
 LARGEST RESIDUAL HEAT FLUX        -3.716E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.344       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.622E-03   AT NODE       2855   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.107E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.344    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.710    
 STEP TIME COMPLETED        71.0    ,  TOTAL TIME COMPLETED         71.0    


  INCREMENT    72 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       28.8       TIME AVG. FORCE        14.6    
 LARGEST SCALED RESIDUAL FORCE      4.080E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.080E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.972E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.120E-03   TIME AVG. HEAT FLUX   1.778E-03
 LARGEST RESIDUAL HEAT FLUX        -3.563E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.340       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.453E-03   AT NODE       2863   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.062E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.340    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.720    
 STEP TIME COMPLETED        72.0    ,  TOTAL TIME COMPLETED         72.0    


  INCREMENT    73 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       29.2       TIME AVG. FORCE        14.8    
 LARGEST SCALED RESIDUAL FORCE      4.137E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.137E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.972E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.116E-03   TIME AVG. HEAT FLUX   1.769E-03
 LARGEST RESIDUAL HEAT FLUX        -3.418E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.335       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.301E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -1.021E-04
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.335    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.730    
 STEP TIME COMPLETED        73.0    ,  TOTAL TIME COMPLETED         73.0    


  INCREMENT    74 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       29.6       TIME AVG. FORCE        15.0    
 LARGEST SCALED RESIDUAL FORCE      4.194E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.194E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.972E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.078E-03   TIME AVG. HEAT FLUX   1.760E-03
 LARGEST RESIDUAL HEAT FLUX        -3.280E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.331       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.167E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -9.817E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.331    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.740    
 STEP TIME COMPLETED        74.0    ,  TOTAL TIME COMPLETED         74.0    


  INCREMENT    75 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  82ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       30.0       TIME AVG. FORCE        15.2    
 LARGEST SCALED RESIDUAL FORCE      4.250E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.250E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.971E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.070E-03   TIME AVG. HEAT FLUX   1.750E-03
 LARGEST RESIDUAL HEAT FLUX        -3.149E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.327       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -5.038E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -9.427E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.327    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.750    
 STEP TIME COMPLETED        75.0    ,  TOTAL TIME COMPLETED         75.0    


  INCREMENT    76 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       30.4       TIME AVG. FORCE        15.4    
 LARGEST SCALED RESIDUAL FORCE      4.307E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.307E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.971E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.065E-03   TIME AVG. HEAT FLUX   1.741E-03
 LARGEST RESIDUAL HEAT FLUX        -3.024E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.323       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.913E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -9.056E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.323    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.760    
 STEP TIME COMPLETED        76.0    ,  TOTAL TIME COMPLETED         76.0    


  INCREMENT    77 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  90ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       30.8       TIME AVG. FORCE        15.6    
 LARGEST SCALED RESIDUAL FORCE      4.364E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.364E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.971E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.060E-03   TIME AVG. HEAT FLUX   1.732E-03
 LARGEST RESIDUAL HEAT FLUX        -2.906E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.318       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.792E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -8.703E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.318    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.770    
 STEP TIME COMPLETED        77.0    ,  TOTAL TIME COMPLETED         77.0    


  INCREMENT    78 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       31.2       TIME AVG. FORCE        15.8    
 LARGEST SCALED RESIDUAL FORCE      4.420E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.420E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.970E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.055E-03   TIME AVG. HEAT FLUX   1.723E-03
 LARGEST RESIDUAL HEAT FLUX        -2.793E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.314       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.675E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -8.368E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.314    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.780    
 STEP TIME COMPLETED        78.0    ,  TOTAL TIME COMPLETED         78.0    


  INCREMENT    79 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  102ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       31.6       TIME AVG. FORCE        16.0    
 LARGEST SCALED RESIDUAL FORCE      4.477E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.477E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.970E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.047E-03   TIME AVG. HEAT FLUX   1.715E-03
 LARGEST RESIDUAL HEAT FLUX        -2.686E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.310       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.562E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -8.048E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.310    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.790    
 STEP TIME COMPLETED        79.0    ,  TOTAL TIME COMPLETED         79.0    


  INCREMENT    80 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  74ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       32.0       TIME AVG. FORCE        16.2    
 LARGEST SCALED RESIDUAL FORCE      4.534E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.534E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.970E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.041E-03   TIME AVG. HEAT FLUX   1.706E-03
 LARGEST RESIDUAL HEAT FLUX        -2.584E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.306       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.452E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -7.745E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.306    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.800    
 STEP TIME COMPLETED        80.0    ,  TOTAL TIME COMPLETED         80.0    


  INCREMENT    81 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  69ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       32.4       TIME AVG. FORCE        16.4    
 LARGEST SCALED RESIDUAL FORCE      4.590E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.590E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.969E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.008E-03   TIME AVG. HEAT FLUX   1.697E-03
 LARGEST RESIDUAL HEAT FLUX        -2.487E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.303       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.346E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -7.455E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.303    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.810    
 STEP TIME COMPLETED        81.0    ,  TOTAL TIME COMPLETED         81.0    


  INCREMENT    82 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  80ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       32.8       TIME AVG. FORCE        16.6    
 LARGEST SCALED RESIDUAL FORCE      4.647E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.647E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.969E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.005E-03   TIME AVG. HEAT FLUX   1.689E-03
 LARGEST RESIDUAL HEAT FLUX        -2.395E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.299       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.244E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -7.179E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.299    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.820    
 STEP TIME COMPLETED        82.0    ,  TOTAL TIME COMPLETED         82.0    


  INCREMENT    83 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       33.2       TIME AVG. FORCE        16.8    
 LARGEST SCALED RESIDUAL FORCE      4.704E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.704E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.969E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  1.001E-03   TIME AVG. HEAT FLUX   1.680E-03
 LARGEST RESIDUAL HEAT FLUX        -2.307E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.295       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.144E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -6.916E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.295    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.830    
 STEP TIME COMPLETED        83.0    ,  TOTAL TIME COMPLETED         83.0    


  INCREMENT    84 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  84ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       33.6       TIME AVG. FORCE        17.0    
 LARGEST SCALED RESIDUAL FORCE      4.760E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.760E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.968E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.947E-04   TIME AVG. HEAT FLUX   1.672E-03
 LARGEST RESIDUAL HEAT FLUX        -2.223E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.292       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -4.048E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -6.666E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.292    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.840    
 STEP TIME COMPLETED        84.0    ,  TOTAL TIME COMPLETED         84.0    


  INCREMENT    85 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  94ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       34.0       TIME AVG. FORCE        17.2    
 LARGEST SCALED RESIDUAL FORCE      4.817E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.817E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.968E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.906E-04   TIME AVG. HEAT FLUX   1.664E-03
 LARGEST RESIDUAL HEAT FLUX        -2.142E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.288       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.954E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -6.426E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.288    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.850    
 STEP TIME COMPLETED        85.0    ,  TOTAL TIME COMPLETED         85.0    


  INCREMENT    86 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  80ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       34.4       TIME AVG. FORCE        17.4    
 LARGEST SCALED RESIDUAL FORCE      4.873E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.873E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.968E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.847E-04   TIME AVG. HEAT FLUX   1.656E-03
 LARGEST RESIDUAL HEAT FLUX        -2.066E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.284       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.864E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -6.198E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.284    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.860    
 STEP TIME COMPLETED        86.0    ,  TOTAL TIME COMPLETED         86.0    


  INCREMENT    87 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       34.8       TIME AVG. FORCE        17.6    
 LARGEST SCALED RESIDUAL FORCE      4.930E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.930E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.967E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.785E-04   TIME AVG. HEAT FLUX   1.648E-03
 LARGEST RESIDUAL HEAT FLUX        -1.993E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.281       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.776E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -5.979E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.281    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.870    
 STEP TIME COMPLETED        87.0    ,  TOTAL TIME COMPLETED         87.0    


  INCREMENT    88 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  76ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       35.2       TIME AVG. FORCE        17.8    
 LARGEST SCALED RESIDUAL FORCE      4.986E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      4.986E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.967E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.487E-04   TIME AVG. HEAT FLUX   1.640E-03
 LARGEST RESIDUAL HEAT FLUX        -1.923E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.278       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.691E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -5.771E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.278    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.880    
 STEP TIME COMPLETED        88.0    ,  TOTAL TIME COMPLETED         88.0    


  INCREMENT    89 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  81ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       35.6       TIME AVG. FORCE        18.0    
 LARGEST SCALED RESIDUAL FORCE      5.043E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.043E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.967E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.450E-04   TIME AVG. HEAT FLUX   1.632E-03
 LARGEST RESIDUAL HEAT FLUX        -1.856E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.274       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.608E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -5.571E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.274    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.890    
 STEP TIME COMPLETED        89.0    ,  TOTAL TIME COMPLETED         89.0    


  INCREMENT    90 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       36.0       TIME AVG. FORCE        18.2    
 LARGEST SCALED RESIDUAL FORCE      5.099E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.099E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.966E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.413E-04   TIME AVG. HEAT FLUX   1.625E-03
 LARGEST RESIDUAL HEAT FLUX        -1.792E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.271       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.528E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -5.381E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.271    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.900    
 STEP TIME COMPLETED        90.0    ,  TOTAL TIME COMPLETED         90.0    


  INCREMENT    91 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  83ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       36.4       TIME AVG. FORCE        18.4    
 LARGEST SCALED RESIDUAL FORCE      5.155E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.155E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.966E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.356E-04   TIME AVG. HEAT FLUX   1.617E-03
 LARGEST RESIDUAL HEAT FLUX        -1.731E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.268       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.451E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -5.198E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.268    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.910    
 STEP TIME COMPLETED        91.0    ,  TOTAL TIME COMPLETED         91.0    


  INCREMENT    92 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  72ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       36.8       TIME AVG. FORCE        18.6    
 LARGEST SCALED RESIDUAL FORCE      5.212E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.212E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.966E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.300E-04   TIME AVG. HEAT FLUX   1.609E-03
 LARGEST RESIDUAL HEAT FLUX        -1.673E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.265       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.375E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -5.024E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.265    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.920    
 STEP TIME COMPLETED        92.0    ,  TOTAL TIME COMPLETED         92.0    


  INCREMENT    93 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  83ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       37.2       TIME AVG. FORCE        18.8    
 LARGEST SCALED RESIDUAL FORCE      5.268E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.268E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.965E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.251E-04   TIME AVG. HEAT FLUX   1.602E-03
 LARGEST RESIDUAL HEAT FLUX        -1.617E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.262       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.302E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -4.856E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.262    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.930    
 STEP TIME COMPLETED        93.0    ,  TOTAL TIME COMPLETED         93.0    


  INCREMENT    94 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       37.6       TIME AVG. FORCE        19.0    
 LARGEST SCALED RESIDUAL FORCE      5.324E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.324E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.965E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.174E-04   TIME AVG. HEAT FLUX   1.595E-03
 LARGEST RESIDUAL HEAT FLUX        -1.563E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.259       AT NODE       2853   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.231E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -4.696E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.259    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.940    
 STEP TIME COMPLETED        94.0    ,  TOTAL TIME COMPLETED         94.0    


  INCREMENT    95 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       38.0       TIME AVG. FORCE        19.2    
 LARGEST SCALED RESIDUAL FORCE      5.381E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.381E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.965E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  9.117E-04   TIME AVG. HEAT FLUX   1.587E-03
 LARGEST RESIDUAL HEAT FLUX        -1.512E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.256       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.162E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -4.543E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.256    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.950    
 STEP TIME COMPLETED        95.0    ,  TOTAL TIME COMPLETED         95.0    


  INCREMENT    96 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  73ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       38.4       TIME AVG. FORCE        19.4    
 LARGEST SCALED RESIDUAL FORCE      5.437E-08   AT NODE        928   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.437E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.964E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.823E-04   TIME AVG. HEAT FLUX   1.580E-03
 LARGEST RESIDUAL HEAT FLUX        -1.463E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.253       AT NODE       2865   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.095E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -4.396E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.253    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.960    
 STEP TIME COMPLETED        96.0    ,  TOTAL TIME COMPLETED         96.0    


  INCREMENT    97 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  74ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       38.8       TIME AVG. FORCE        19.6    
 LARGEST SCALED RESIDUAL FORCE      5.493E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.493E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.964E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.773E-04   TIME AVG. HEAT FLUX   1.573E-03
 LARGEST RESIDUAL HEAT FLUX        -1.416E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.250       AT NODE       2852   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -3.030E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -4.255E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.250    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.970    
 STEP TIME COMPLETED        97.0    ,  TOTAL TIME COMPLETED         97.0    


  INCREMENT    98 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  70ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       39.1       TIME AVG. FORCE        19.8    
 LARGEST SCALED RESIDUAL FORCE      5.549E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.549E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.964E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.695E-04   TIME AVG. HEAT FLUX   1.565E-03
 LARGEST RESIDUAL HEAT FLUX        -1.370E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.248       AT NODE       2894   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.967E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -4.119E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.248    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.980    
 STEP TIME COMPLETED        98.0    ,  TOTAL TIME COMPLETED         98.0    


  INCREMENT    99 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  75ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       39.5       TIME AVG. FORCE        20.0    
 LARGEST SCALED RESIDUAL FORCE      5.605E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.605E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.963E-12   AT NODE       1770   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.621E-04   TIME AVG. HEAT FLUX   1.558E-03
 LARGEST RESIDUAL HEAT FLUX        -1.327E-07   AT NODE       2899   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.245       AT NODE       2894   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.905E-03   AT NODE       2854   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -3.989E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.245    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED  0.990    
 STEP TIME COMPLETED        99.0    ,  TOTAL TIME COMPLETED         99.0    


  INCREMENT   100 STARTS. ATTEMPT NUMBER  1, TIME INCREMENT   1.00    
 
	UNSYMMETRIC NEW DIRECT SPARSE SOLVER RUNNING ON
 	1 HOST x 1 MPI RANK PER HOST x 1 THREAD PER RANK
        NUMBER OF EQUATIONS:  16080
        NUMBER OF RHS:        1
        NUMBER OF FLOPS:      1.760e+09
        SOLVER ELAPSED TIME:  71ms

               CONVERGENCE CHECKS FOR EQUILIBRIUM ITERATION     1


 AVERAGE FORCE                       39.9       TIME AVG. FORCE        20.2    
 LARGEST SCALED RESIDUAL FORCE      5.662E-08   AT NODE         57   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
  CORRESPONDING RESIDUAL FORCE      5.662E-08
 LARGEST INCREMENT OF DISP.         1.000E-06   AT NODE       2083   DOF  2
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO DISP.        8.963E-12   AT NODE       1764   DOF  1
   INSTANCE: ELASTIC_PLATE_1                                                                 
          THE FORCE     EQUILIBRIUM RESPONSE WAS LINEAR IN THIS INCREMENT

 AVERAGE HEAT FLUX                  8.576E-04   TIME AVG. HEAT FLUX   1.551E-03
 LARGEST RESIDUAL HEAT FLUX        -1.285E-07   AT NODE       3059   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST INCREMENT OF TEMP.         0.243       AT NODE       2894   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 LARGEST CORRECTION TO TEMP.       -2.846E-03   AT NODE       2864   DOF 12
   INSTANCE: ELASTIC_PLATE_1                                                                 
 ESTIMATE OF TEMP.    CORRECTION   -3.864E-05
 HEAT FLUX EQUILIB. ACCEPTED BASED ON SMALL RESIDUAL AND ESTIMATED CORRECTION

 MAXIMUM NON-PRESCRIBED INCREMENT IN TEMPERATURE IS   0.243    

 ITERATION SUMMARY FOR THE INCREMENT:   1 TOTAL ITERATIONS, OF WHICH
   0 ARE SEVERE DISCONTINUITY ITERATIONS AND  1 ARE EQUILIBRIUM ITERATIONS.

 TIME INCREMENT COMPLETED   1.00    ,  FRACTION OF STEP COMPLETED   1.00    
 STEP TIME COMPLETED        100.    ,  TOTAL TIME COMPLETED         100.    


          THE ANALYSIS HAS BEEN COMPLETED



     ANALYSIS SUMMARY:
     TOTAL OF        100  INCREMENTS
                       0  CUTBACKS IN AUTOMATIC INCREMENTATION
                     141  ITERATIONS INCLUDING CONTACT ITERATIONS IF PRESENT
                     141  PASSES THROUGH THE EQUATION SOLVER OF WHICH 
                     141  INVOLVE MATRIX DECOMPOSITION, INCLUDING
                       0  DECOMPOSITION(S) OF THE MASS MATRIX
                       1  REORDERING OF EQUATIONS TO MINIMIZE WAVEFRONT
                       0  ADDITIONAL RESIDUAL EVALUATIONS FOR LINE SEARCHES
                       0  ADDITIONAL OPERATOR EVALUATIONS FOR LINE SEARCHES
                       8  WARNING MESSAGES DURING USER INPUT PROCESSING
                    8208  WARNING MESSAGES DURING ANALYSIS
                    8206  ANALYSIS WARNINGS ARE NUMERICAL PROBLEM MESSAGES
                       0  ANALYSIS WARNINGS ARE NEGATIVE EIGENVALUE MESSAGES
                       0  ERROR MESSAGES



     JOB TIME SUMMARY
       USER TIME (SEC)      =      47.    
       SYSTEM TIME (SEC)    =      4.8    
       TOTAL CPU TIME (SEC) =      52.    
       WALLCLOCK TIME (SEC) =           65
       MEMORY PEAK (GB)     =            0
