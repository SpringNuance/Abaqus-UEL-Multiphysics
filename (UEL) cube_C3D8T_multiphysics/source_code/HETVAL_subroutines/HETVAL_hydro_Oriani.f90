subroutine HETVAL_hydro_Oriani(cmname,CL_mol_t,dCL_mol,time,dtime,statev, &
    r_hydro,dr_hydro_dCL_mol,predef,dpred)

    use precision
    use common_block
    include 'aba_param.inc'

    character(len=80) :: cmname

    dimension statev(*),predef(*),time(2),dpred(*)

    r_hydro = 0.0d0
    dr_hydro_dCL_mol = 0.0d0
end