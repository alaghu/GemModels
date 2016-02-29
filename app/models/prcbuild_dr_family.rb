# mapping PrcbuildDrEnv from prcbuild_dr_family as a class
class PrcbuildDrFamily < ActiveRecord::Base
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
  # create synonym PRCBUILD_DR_FAMILY for PRCQA.PRCBUILD_DR_FAMILY@FARMJANGO;
  self.table_name = 'prcbuild_dr_family'

  # Mapping Primary key
  self.primary_key = 'id'

  # How to obtain columns names
  # ----------------------
  # in sqlplus
  # >desc PRCQA.PRCBUILD_DR_FAMILY@FARMJANGO
  # not sure why we have to provide @FARMJANGO when rpthead did not need it.

  # Ignoring columns
  # ----------------------
  # Not ignoring any for now.

  # How to get a list and count of columns mapped to attributes
  # ----------------------
  # in Rails console
  # > PrcbuildDrFamily.attribute_names.count
  # 12

  # Mapping column data type to ruby types
  # ----------------------
  # Integer mapping
  set_integer_columns :id, :env_id, :family_monitor, :family_bug_from_qc

  # Date mapping
  set_datetime_columns :last_updated_date, :created_date
end
