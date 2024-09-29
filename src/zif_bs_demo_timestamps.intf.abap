interface zif_bs_demo_timestamps

  public.
  types td_timestamp type timestampl.


  "Get current time stamp in TIMESTAMPL format
  "@parameter rd_result | Actual time stamp
  methods get
    returning value(rd_result) type td_timestamp.

endinterface.
