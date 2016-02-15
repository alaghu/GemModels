# mapping PrcbuildDrEnv from bug as a class
class PrcbuildDrEnv < ActiveRecord::Base
  # Overview
  # Mapping Table to Class
  # Not a table but a Synonym (of dblink)
  # Mapping Primary key
  # How to obtain columns names
  # Ignoring columns
  # How to get a list and count of columns mapped to attributes
  # Mapping column data type to ruby types

  # Mapping Table to Class
  # ----------------------
  # Mapping the exact table name as class.

  # Not a table but a Synonym (of dblink)
  # ----------------------
  # connecting though dblink to FARMJANGO
  # prcbuild_dr_env is a table in farmjango, which is a synonym
  # create synonym PRCBUILD_DR_ENV for PRCQA.PRCBUILD_DR_ENV@FARMJANGO;
  self.table_name = 'prcbuild_dr_env'

  # Mapping Primary key
  self.primary_key = 'id'

  # How to obtain columns names
  # ----------------------
  # in sqlplus
  # >desc PRCQA.PRCBUILD_DR_ENV@FARMJANGO
  # not sure why we have to provide @FARMJANGO when rpthead did not need it.

  # Ignoring columns
  # ----------------------
  # Not ignoring any for now.

  # How to get a list and count of columns mapped to attributes
  # ----------------------
  # in Rails console
  # > PrcbuildDrEnv.attribute_names.count
  # 23

  # Mapping column data type to ruby types
  # ----------------------
  # Integer mapping
  set_integer_columns :id, :env_monitor, :env_dr_objective,
                      :env_dr_objective_required, :env_archive

  # Date mapping
  set_datetime_columns :last_updated_date, :last_updated_date
end
