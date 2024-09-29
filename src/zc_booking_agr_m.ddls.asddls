@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Projection View'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_BOOKING_AGR_M
  as projection on ZI_BOOKING_AGR_M
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,

      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _Bookingsuppl : redirected to composition child ZC_BOOKSUPPL_AGR_M,
      _BOOKING_status,
      _Carrier,
      _Connection,
      _Customer,
      _Travel       : redirected to parent ZC_TRAVEL_AGR_M
}
