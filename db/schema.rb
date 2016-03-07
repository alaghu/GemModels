# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "aq$_internet_agent_privs", id: false, force: :cascade do |t|
    t.string "agent_name",  limit: 30, null: false
    t.string "db_username", limit: 30, null: false
  end

  add_index "aq$_internet_agent_privs", ["agent_name", "db_username"], name: "unq_pairs", unique: true

  create_table "aq$_internet_agents", primary_key: "agent_name", force: :cascade do |t|
    t.integer "protocol",             precision: 38, null: false
    t.string  "spare1",   limit: 128
  end

  create_table "aq$_queue_tables", primary_key: "objno", force: :cascade do |t|
    t.string  "schema",        limit: 30,   null: false
    t.string  "name",          limit: 30,   null: false
    t.decimal "udata_type",                 null: false
    t.decimal "flags",                      null: false
    t.decimal "sort_cols",                  null: false
    t.string  "timezone",      limit: 64
    t.string  "table_comment", limit: 2000
  end

  add_index "aq$_queue_tables", ["objno", "schema", "flags"], name: "i1_queue_tables"

# Could not dump table "aq$_queues" because of following StandardError
#   Unknown type 'SYS.AQ$_SUBSCRIBERS' for column 'subscribers'

  create_table "aq$_schedules", id: false, force: :cascade do |t|
    t.raw      "oid",         limit: 16,  null: false
    t.string   "destination", limit: 128, null: false
    t.datetime "start_time"
    t.string   "duration",    limit: 8
    t.string   "next_time",   limit: 128
    t.string   "latency",     limit: 8
    t.datetime "last_time"
    t.decimal  "jobno"
  end

  add_index "aq$_schedules", ["jobno"], name: "aq$_schedules_check", unique: true

  create_table "def$_aqcall", id: false, force: :cascade do |t|
    t.string    "q_name",            limit: 30
    t.raw       "msgid",             limit: 16
    t.string    "corrid",            limit: 128
    t.decimal   "priority"
    t.decimal   "state"
    t.timestamp "delay",             limit: 6
    t.decimal   "expiration"
    t.timestamp "time_manager_info", limit: 6
    t.decimal   "local_order_no"
    t.decimal   "chain_no"
    t.decimal   "cscn"
    t.decimal   "dscn"
    t.timestamp "enq_time",          limit: 6
    t.decimal   "enq_uid"
    t.string    "enq_tid",           limit: 30,  null: false
    t.timestamp "deq_time",          limit: 6
    t.decimal   "deq_uid"
    t.string    "deq_tid",           limit: 30
    t.decimal   "retry_count"
    t.string    "exception_qschema", limit: 30
    t.string    "exception_queue",   limit: 30
    t.decimal   "step_no",                       null: false
    t.decimal   "recipient_key"
    t.raw       "dequeue_msgid",     limit: 16
    t.binary    "user_data"
  end

  add_index "def$_aqcall", ["cscn", "enq_tid"], name: "def$_tranorder"

  create_table "def$_aqerror", id: false, force: :cascade do |t|
    t.string    "q_name",            limit: 30
    t.raw       "msgid",             limit: 16
    t.string    "corrid",            limit: 128
    t.decimal   "priority"
    t.decimal   "state"
    t.timestamp "delay",             limit: 6
    t.decimal   "expiration"
    t.timestamp "time_manager_info", limit: 6
    t.decimal   "local_order_no"
    t.decimal   "chain_no"
    t.decimal   "cscn"
    t.decimal   "dscn"
    t.timestamp "enq_time",          limit: 6
    t.decimal   "enq_uid"
    t.string    "enq_tid",           limit: 30,  null: false
    t.timestamp "deq_time",          limit: 6
    t.decimal   "deq_uid"
    t.string    "deq_tid",           limit: 30
    t.decimal   "retry_count"
    t.string    "exception_qschema", limit: 30
    t.string    "exception_queue",   limit: 30
    t.decimal   "step_no",                       null: false
    t.decimal   "recipient_key"
    t.raw       "dequeue_msgid",     limit: 16
    t.binary    "user_data"
  end

  create_table "def$_calldest", id: false, force: :cascade do |t|
    t.string  "enq_tid",      limit: 22,                 null: false
    t.decimal "step_no",                                 null: false
    t.string  "dblink",       limit: 128,                null: false
    t.string  "schema_name",  limit: 30
    t.string  "package_name", limit: 30
    t.raw     "catchup",      limit: 16,  default: "00"
  end

  add_index "def$_calldest", ["dblink", "catchup"], name: "def$_calldest_n2"

  create_table "def$_defaultdest", primary_key: "dblink", force: :cascade do |t|
  end

  create_table "def$_destination", id: false, force: :cascade do |t|
    t.string  "dblink",                     limit: 128,                       null: false
    t.decimal "last_delivered",                          default: 0.0,        null: false
    t.string  "last_enq_tid",               limit: 22
    t.decimal "last_seq"
    t.boolean "disabled",                   limit: nil
    t.decimal "job"
    t.decimal "last_txn_count"
    t.decimal "last_error_number"
    t.string  "last_error_message",         limit: 2000
    t.string  "apply_init",                 limit: 4000
    t.raw     "catchup",                    limit: 16,   default: "00",       null: false
    t.boolean "alternate",                  limit: nil,  default: false
    t.decimal "total_txn_count",                         default: 0.0
    t.decimal "total_prop_time_throughput",              default: 0.0
    t.decimal "total_prop_time_latency",                 default: 0.0
    t.decimal "to_communication_size",                   default: 0.0
    t.decimal "from_communication_size",                 default: 0.0
    t.raw     "flag",                       limit: 4,    default: "00000000"
    t.decimal "spare1",                                  default: 0.0
    t.decimal "spare2",                                  default: 0.0
    t.decimal "spare3",                                  default: 0.0
    t.decimal "spare4",                                  default: 0.0
  end

  create_table "def$_error", primary_key: "enq_tid", force: :cascade do |t|
    t.string   "origin_tran_db", limit: 128
    t.string   "origin_enq_tid", limit: 22
    t.string   "destination",    limit: 128
    t.decimal  "step_no"
    t.decimal  "receiver"
    t.datetime "enq_time"
    t.decimal  "error_number"
    t.string   "error_msg",      limit: 2000
  end

  create_table "def$_lob", force: :cascade do |t|
    t.string "enq_tid",   limit: 22
    t.binary "blob_col"
    t.text   "clob_col"
    t.text   "nclob_col"
  end

  add_index "def$_lob", ["enq_tid"], name: "def$_lob_n1"

  create_table "def$_origin", id: false, force: :cascade do |t|
    t.string  "origin_db",     limit: 128
    t.string  "origin_dblink", limit: 128
    t.decimal "inusr"
    t.decimal "cscn"
    t.string  "enq_tid",       limit: 22
    t.decimal "reco_seq_no"
    t.raw     "catchup",       limit: 16,  default: "00"
  end

  create_table "def$_propagator", primary_key: "userid", force: :cascade do |t|
    t.string   "username", limit: 30, null: false
    t.datetime "created",             null: false
  end

  create_table "def$_pushed_transactions", primary_key: "source_site_id", force: :cascade do |t|
    t.integer "last_tran_id", limit: nil, default: 0
    t.boolean "disabled",     limit: nil, default: false
    t.string  "source_site",  limit: 128
  end

  create_table "help", id: false, force: :cascade do |t|
    t.string  "topic", limit: 50, null: false
    t.decimal "seq",              null: false
    t.string  "info",  limit: 80
  end

  create_table "logmnr_age_spill$", id: false, force: :cascade do |t|
    t.decimal "session#",   null: false
    t.decimal "xidusn",     null: false
    t.decimal "xidslt",     null: false
    t.decimal "xidsqn",     null: false
    t.decimal "chunk",      null: false
    t.decimal "sequence#",  null: false
    t.decimal "offset"
    t.binary  "spill_data"
    t.decimal "spare1"
    t.decimal "spare2"
  end

  create_table "logmnr_attrcol$", id: false, force: :cascade do |t|
    t.decimal "intcol#"
    t.string  "name",         limit: 4000
    t.decimal "obj#",                                     null: false
    t.integer "logmnr_uid",   limit: 22,   precision: 22
    t.integer "logmnr_flags", limit: 22,   precision: 22
  end

  add_index "logmnr_attrcol$", ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1attrcol$"

  create_table "logmnr_attribute$", id: false, force: :cascade do |t|
    t.decimal "version#"
    t.string  "name",          limit: 30
    t.decimal "attribute#"
    t.raw     "attr_toid",     limit: 16
    t.decimal "attr_version#"
    t.decimal "synobj#"
    t.decimal "properties"
    t.decimal "charsetid"
    t.decimal "charsetform"
    t.decimal "length"
    t.decimal "precision#"
    t.decimal "scale"
    t.string  "externname",    limit: 4000
    t.decimal "xflags"
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "spare3"
    t.decimal "spare4"
    t.decimal "spare5"
    t.decimal "setter"
    t.decimal "getter"
    t.raw     "toid",          limit: 16,                  null: false
    t.integer "logmnr_uid",    limit: 22,   precision: 22
    t.integer "logmnr_flags",  limit: 22,   precision: 22
  end

  add_index "logmnr_attribute$", ["logmnr_uid", "toid", "version#", "attribute#"], name: "logmnr_i1attribute$"

  create_table "logmnr_ccol$", id: false, force: :cascade do |t|
    t.decimal "con#"
    t.decimal "obj#"
    t.decimal "col#"
    t.decimal "pos#"
    t.decimal "intcol#",                                null: false
    t.integer "logmnr_uid",   limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
  end

  add_index "logmnr_ccol$", ["logmnr_uid", "con#", "intcol#"], name: "logmnr_i1ccol$"

  create_table "logmnr_cdef$", id: false, force: :cascade do |t|
    t.decimal "con#"
    t.decimal "cols"
    t.decimal "type#"
    t.decimal "robj#"
    t.decimal "rcon#"
    t.decimal "enabled"
    t.decimal "defer"
    t.decimal "obj#",                                   null: false
    t.integer "logmnr_uid",   limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
  end

  add_index "logmnr_cdef$", ["logmnr_uid", "con#"], name: "logmnr_i1cdef$"
  add_index "logmnr_cdef$", ["logmnr_uid", "robj#"], name: "logmnr_i2cdef$"

  create_table "logmnr_col$", id: false, force: :cascade do |t|
    t.integer "col#",         limit: 22, precision: 22
    t.integer "segcol#",      limit: 22, precision: 22
    t.string  "name",         limit: 30
    t.integer "type#",        limit: 22, precision: 22
    t.integer "length",       limit: 22, precision: 22
    t.integer "precision#",   limit: 22, precision: 22
    t.integer "scale",        limit: 22, precision: 22
    t.integer "null$",        limit: 22, precision: 22
    t.integer "intcol#",      limit: 22, precision: 22
    t.integer "property",     limit: 22, precision: 22
    t.integer "charsetid",    limit: 22, precision: 22
    t.integer "charsetform",  limit: 22, precision: 22
    t.integer "spare1",       limit: 22, precision: 22
    t.integer "spare2",       limit: 22, precision: 22
    t.integer "obj#",         limit: 22, precision: 22, null: false
    t.integer "logmnr_uid",   limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
  end

  add_index "logmnr_col$", ["logmnr_uid", "obj#", "col#"], name: "logmnr_i3col$"
  add_index "logmnr_col$", ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1col$"
  add_index "logmnr_col$", ["logmnr_uid", "obj#", "name"], name: "logmnr_i2col$"

  create_table "logmnr_coltype$", id: false, force: :cascade do |t|
    t.decimal "col#"
    t.decimal "intcol#"
    t.raw     "toid",         limit: 16
    t.decimal "version#"
    t.decimal "packed"
    t.decimal "intcols"
    t.raw     "intcol#s"
    t.decimal "flags"
    t.decimal "typidcol#"
    t.decimal "synobj#"
    t.decimal "obj#",                                   null: false
    t.integer "logmnr_uid",   limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
  end

  add_index "logmnr_coltype$", ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1coltype$"

# Could not dump table "logmnr_con$" because of following OCIError
#   ORA-03114: not connected to ORACLE

