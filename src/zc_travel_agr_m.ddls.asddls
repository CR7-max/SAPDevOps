@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection View'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true // to have separate metadata extenion files
define root view entity ZC_TRAVEL_AGR_M
  provider contract transactional_query
  as projection on ZI_TRAVEL_AGR_M
{
  key TravelId,

      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId, // object model text ABAP level, we want Agency name in place of Agency ID

      _Agency.Name       as AgencyName,

      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,

      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee, //can't use it in metadataextension file

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      CurrencyCode,
      Description,

      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,

      _Status._Text.Text as OverallStatusText : localized,
      //      CreatedBy,
      //      CreatedAt,
      //      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_BOOKING_AGR_M,
      _Currency,
      _Customer,
      _Status
}
