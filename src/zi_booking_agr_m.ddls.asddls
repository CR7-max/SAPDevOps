@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface View - Managed'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BOOKING_AGR_M
  as select from zbooking_agr_m
  association        to parent ZI_TRAVEL_AGR_M   as _Travel         on  $projection.TravelId = _Travel.TravelId
  //establish the child entity
  composition [0..*] of ZI_BOOKSUPPL_AGR_M       as _Bookingsuppl
  association [1..1] to /DMO/I_Carrier           as _Carrier        on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Customer          as _Customer       on  $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Connection        as _Connection     on  $projection.CarrierId    = _Connection.AirlineID
                                                                    and $projection.ConnectionId = _Connection.ConnectionID
  association [1..1] to /DMO/I_Booking_Status_VH as _BOOKING_status on  $projection.BookingStatus = _BOOKING_status.BookingStatus

{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,

      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,

      _Bookingsuppl,
      _Travel,
      _Carrier,
      _Customer,
      _Connection,
      _BOOKING_status
}
