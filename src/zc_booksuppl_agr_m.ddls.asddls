@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Suppliment Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_BOOKSUPPL_AGR_M
  as projection on ZI_BOOKSUPPL_AGR_M
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,

      CurrencyCode,
      LastChangedAt,

      /* Associations */
      _Travel  : redirected to ZC_TRAVEL_AGR_M,
      _Booking : redirected to parent ZC_BOOKING_AGR_M,
      _Supplement,
      _SupplementText
}
