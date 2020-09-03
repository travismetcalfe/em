      program testff

      implicit none

      double precision data(36),fitness
      real userff
      integer npar,i,myid
      character*80 par_string

      npar = COMMAND_ARGUMENT_COUNT()
      do i=1,npar
         CALL GET_COMMAND_ARGUMENT(i,par_string)
         READ(par_string,*) data(i)
      enddo

      if ((data(1).gt.1).or.(data(4).gt.1))
     + stop "please enter scaled units"

c  scaled units => fitting data
      myid=1

      fitness = userff(npar,data,myid)
      print *,'chisq_r=',1./fitness

      end
