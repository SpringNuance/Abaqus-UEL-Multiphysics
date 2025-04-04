subroutine HETVAL_heat_transfer(cmname,temp,dtemp,time,dtime,statev, &
    r,drdt,predef,dpred)

    use precision
    use common_block
    include 'aba_param.inc'

    character(len=80) :: cmname

    dimension statev(*),predef(*),time(2),dpred(*)

    r = 0.0d0
    drdt = 0.0d0
end