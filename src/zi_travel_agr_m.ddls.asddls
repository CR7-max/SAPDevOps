@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Roo tEntity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//defining root view entity
define root view entity ZI_TRAVEL_AGR_M
  as select from ztravel_agr_m
  // establishing the child entity
  composition [0..*] of ZI_BOOKING_AGR_M         as _Booking

  // to get this agency details we have to
  // create an interface view using the agency master table and associate that interface view
  // with this cds interface view

  // SAP provide interface view will be reused
  // 1. /DMO/I_AGENCY
  // 2. /DMO/I_Customer
  // 3. /DMO/I_Overall_Status_VH
  // 4. I_Currency
  association [0..1] to /DMO/I_Agency            as _Agency   on $projection.AgencyId = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [0..1] to I_Currency               as _Currency on $projection.CurrencyCode = _Currency.Currency
  association [1..1] to /DMO/I_Overall_Status_VH as _Status   on $projection.OverallStatus = _Status.OverallStatus

{
  key travel_id       as TravelId,
      agency_id       as AgencyId,
      customer_id     as CustomerId,
      begin_date      as BeginDate,
      end_date        as EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee     as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price     as TotalPrice,

      currency_code   as CurrencyCode,
      description     as Description,
      overall_status  as OverallStatus,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt,

      // expose the association
      _Booking,
      _Agency,
      _Customer,
      _Currency,
      _Status
}
