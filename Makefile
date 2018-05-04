.SUFFIXES: .f90   .mod  

EXE = rcsfgenerate90_shorten
BINDIR = ${GRASP}/bin
GRASPLIB = ${GRASP}/lib
BINFILE = $(BINDIR)/$(EXE)
SRCLIBDIR = ../../lib
MODDIR = ${SRCLIBDIR}/libmod
MODL9290 = ${SRCLIBDIR}/lib9290
MODLRANG90 = ${SRCLIBDIR}/librang90
GRASPLIBS =-l9290 -lmod
FC = gfortran
FC_FLAGS = -fno-automatic

MOD_OBJ= \
       adder_I.o      fivefirst_I.o    lasa2_I.o     matcin_I.o    reffa_I.o   \
       blanda_I.o     fivelines_I.o    lika_I.o      mergeb_I.o    sluggo_I.o  \
       blandb_I.o     kopp1_I.o        lockad_I.o    merge_I.o     slug_I.o    \
       blandc_I.o     kopp2_I.o        matain_I.o    open79_I.o    test_I.o    \
       copy7t9_I.o    lasa1_I.o        matbin_I.o    reada_I.o     gen_I.o

APP_OBJ= \
       adder.o blanda.o blandc.o blandb.o fivefirst.o fivelines.o \
       genb.o jjgen15b.o kopp1.o kopp2.o lasa1.o lasa2.o lika.o \
       lockad.o matain.o matcin.o matbin.o merge.o mergeb.o \
       reada.o reffa.o slug.o sluggo.o test.o copy7t9.o open79.o \
       rcsfblock.o rcsfexcitation.o wrapper.o 

$(EXE): $(MOD_OBJ)  $(APP_OBJ)
	$(FC) -o $(BINFILE) $(LD_FLAGS) $(APP_OBJ) -L$(GRASPLIB) $(GRASPLIBS) 

.f90.o:
	$(FC) -c $(FC_FLAGS) $< -I .  -I ${MODDIR} -I $(MODL9290)  -o $@


.f.o:
	$(FC) -c $(FC_FLAGS) $< -o $@

clean:
	-rm -f *.o core *.mod
