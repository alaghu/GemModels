class Rpthead < ActiveRecord::Base
  # Look to https://github.com/rsim/oracle-enhanced for more details
  # Why Rpthead and not bug?
  # Since all sql queries would connect to bugdb and use rpthead,
  # it would be prudent to keep the model names in sync with table names.
  # When required, change the attributes in view.Also, can change in controller.

  #Connecting through db link to rpthead, which is a synonym
  self.table_name = 'rpthead'

  self.primary_key = 'rptno'


  # Finding the different columns and data types
  # Connect to bugdb through sqlplus. Execute
  # desc BUG.rpthead
  # not sure why it needs BUG.rpthead
  # There are approximately 86 columns. Excluding around 51 columns

  ignore_table_columns :generic_or_port_specific,:pub,:portid,:commit_to_fix,:error_prefix,:error_number,:track

  ignore_table_columns :pub_by,:pub_date,:release_status,:pl_group,:porting_exception,:language_porting_kit_ver

  ignore_table_columns :pos_vote_avg,:neg_vote_avg,:enh_resp_code,:pri_for_supp,:bug_type,:os_version,:enh_oracle_response

  ignore_table_columns :enh_desirability,:enh_dev_cost,:wa_avail_date,:patch_avail_date,:prob_stmt_avail_date,:mail_response_type

  ignore_table_columns :third_party_product,:third_party_product_version,:test_status,:test_name,:source,:test_date,:dev_date

  ignore_table_columns :confirm_flag,:confirm_date,:release_id,:error_number2,:security_flag,:source_system,:patch_rup_number

  ignore_table_columns :patch_del_method,:res_process,:res_activity,:activity_eta,:activity_state,:skip_reason,:regression_status

  ignore_table_columns :product_line_version_id,:fix_avail_date,:database,:security_compliance

  # After ignoring the above columns, converting

  # Ensuring all number columns are mapped to integer.Else, it was
  # mapping to BigDecimal. Eg rptno 20129254 was shown as 20129254.0
  set_integer_columns :rptno,:status,:cs_priority,:base_rptno,:ver_fixed_numeric,:responsibility,:util_version_numeric,:product_id,:test_priority,:version_broken_numeric

  set_date_columns :rptdate,:upd_date,:fixed_date,:closed_date



end