NCVHDL = /afs/umbc.edu/users/j/k/jkielty1/home/cmpe-640/cadence/run_ncvhdl.bash
NCELAB = /afs/umbc.edu/users/j/k/jkielty1/home/cmpe-640/cadence/run_ncelab.bash
NCSIM = /afs/umbc.edu/users/j/k/jkielty1/home/cmpe-640/cadence/run_ncsim.bash

CDSLIB = /afs/umbc.edu/users/j/k/jkielty1/home/cmpe-640/cadence/cds.lib
HDLVAR = /afs/umbc.edu/users/j/k/jkielty1/home/cmpe-640/cadence/hdl.var

COMPILE = $(NCVHDL) -messages -linedebug -cdslib $(CDSLIB) -hdlvar $(HDLVAR) -smartorder
ELABORATE = $(NCELAB) -messages -access rwc -cdslib $(CDSLIB) -hdlvar $(HDLVAR)
SIMULATE = $(NCSIM) -input ncsim.run -messages -cdslib $(CDSLIB) -hdlvar $(HDLVAR)

all: alu_4_test alu_4_test_elaborate alue_4_test_simulate

# build commands
and2:
	$(COMPILE) and2.vhd

and3:
	$(COMPILE) and3.vhd

or3:
	$(COMPILE) or3.vhd

or4:
	$(COMPILE) or4.vhd

xor2:
	$(COMPILE) xor2.vhd

zerogenerator4:
	$(COMPILE) zerogenerator4.vhd

onegenerator4:
	$(COMPILE) onegenerator4.vhd

inverter:
	$(COMPILE) inverter.vhd

inverter4:
	$(COMPILE) inverter4.vhd inverter.vhd

mux4to1:
	$(COMPILE) mux4to1.vhd inverter.vhd or4.vhd and3.vhd

nibblemux4to1:
	$(COMPILE) nibblemux4to1.vhd mux4to1.vhd inverter.vhd or4.vhd and3.vhd

adder1:
	$(COMPILE) adder1.vhd xor2.vhd and2.vhd or3.vhd

adder4:
	$(COMPILE) adder4.vhd adder1.vhd xor2.vhd and2.vhd or3.vhd

ybox:
	$(COMPILE) ybox.vhd zerogenerator4.vhd onegenerator4.vhd nibblemux4to1.vhd mux4to1.vhd or4.vhd and3.vhd inverter4.vhd inverter.vhd

alu_4:
	$(COMPILE) alu_4.vhd adder4.vhd adder1.vhd xor2.vhd and2.vhd or3.vhd ybox.vhd zerogenerator4.vhd onegenerator4.vhd nibblemux4to1.vhd mux4to1.vhd inverter.vhd or4.vhd and3.vhd inverter4.vhd inverter.vhd

alu_4_test:
	$(COMPILE) alu_4_test.vhd alu_4.vhd adder4.vhd adder1.vhd xor2.vhd and2.vhd or3.vhd ybox.vhd zerogenerator4.vhd onegenerator4.vhd nibblemux4to1.vhd mux4to1.vhd inverter.vhd or4.vhd and3.vhd inverter4.vhd inverter.vhd

# elaborate commands
alu_4_test_elaborate:
	$(ELABORATE) alu_4_test

# simulate commands
alue_4_test_simulate:
	$(SIMULATE) alu_4_test
