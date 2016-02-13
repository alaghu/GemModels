class BugController < ApplicationController
  def index
    @bugs= Rpthead.find_by rptno: '20129254'

    @anand = Rpthead.where(product_id: '4332').last(100)
    ## Very bad performance

    # From active Record

    # start up

    # (26524.0ms)  SELECT column_name AS name, data_type AS sql_type, data_default, nullable, virtual_column, hidden_column, data_type_owner AS sql_type_owner, DECODE(data_type, 'NUMBER', data_precision, 'FLOAT', data_precision, 'VARCHAR2', DECODE(char_used, 'C', char_length, data_length), 'RAW', DECODE(char_used, 'C', char_length, data_length), 'CHAR', DECODE(char_used, 'C', char_length, data_length), NULL) AS limit, DECODE(data_type, 'NUMBER', data_scale, NULL) AS scale FROM all_tab_cols@BUG.US.ORACLE.COM WHERE owner = 'BUG' AND table_name = 'RPTHEAD' AND hidden_column = 'NO' ORDER BY column_id
    # Rpthead Load (504.4ms)  SELECT  "RPTHEAD".* FROM "RPTHEAD" WHERE "RPTHEAD"."RPTNO" = :a1 AND ROWNUM <= 1   [["rptno", 20129254]]
    # (880.0ms)  SELECT DECODE(table_name, UPPER(table_name), LOWER(table_name), table_name) FROM all_tables WHERE owner = SYS_CONTEXT('userenv', 'session_user') AND secondary = 'N'
    # Sequence (613.2ms)  select us.sequence_name from all_sequences@BUG.US.ORACLE.COM us where us.sequence_owner = 'BUG' and us.sequence_name = 'RPTHEAD_SEQ'
    # Primary Key (1843.0ms)  SELECT cc.column_name FROM all_constraints@BUG.US.ORACLE.COM c, all_cons_columns@BUG.US.ORACLE.COM cc WHERE c.owner = 'BUG' AND c.table_name = 'RPTHEAD' AND c.constraint_type = 'P' AND cc.owner = c.owner AND cc.constraint_name = c.constraint_name
    # Rendered bug/index.html.erb within layouts/application (0.8ms)
    # Completed 200 OK in 33581ms (Views: 385.3ms | ActiveRecord: 30364.5ms)

    ## normal page load
      # Rpthead Load (306.2ms)  SELECT  "RPTHEAD".* FROM "RPTHEAD" WHERE "RPTHEAD"."RPTNO" = :a1 AND ROWNUM <= 1   [["rptno", 20129254]]
    # Rendered bug/index.html.erb within layouts/application (0.1ms)
    # Completed 200 OK in 319ms (Views: 11.7ms | ActiveRecord: 306.2ms)


    # From sqlplus
    # SELECT * FROM rpthead WHERE rptno= 20129254
    # complete in 0.62 seconds

  end
end
