class PrcbuildDrEnv < ActiveRecord::Base
  #https://github.com/rsim/oracle-enhanced

  # Connecting through db link with a synonm
  # create synonym PRCBUILD_DR_ENV for PRCQA.PRCBUILD_DR_ENV@FARMJANGO;
  # desc PRCQA.PRCBUILD_DR_ENV@FARMJANGO
  self.table_name = 'prcbuild_dr_env'

end

