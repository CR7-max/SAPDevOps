class zcl_agr_demo_timestamps definition
  public
  final
  create public .

  public section.
    interfaces zif_bs_demo_timestamps.

  protected section.

  private section.
endclass.



class zcl_agr_demo_timestamps implementation.
  method zif_bs_demo_timestamps~get.
    get time stamp field rd_result.
  endmethod.
endclass.
