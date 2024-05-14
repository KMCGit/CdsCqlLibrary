library RespiratoryAssistDevicesRule version '0.1.0'
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0' called FHIRHelpers

parameter Patient Patient
parameter device_request DeviceRequest
parameter appointment Appointment
parameter Coverage Coverage

define "Age":
    AgeInYears()

define RULE_APPLIES:
  true

define PRIORAUTH_REQUIRED:
  true

define DOCUMENTATION_REQUIRED:
  true

define APPROVE_PRIORAUTH:
  Age<70

define RESULT_InfoLink:
    'https://ExampleUMVendor.com/link/'

define RESULT_requestId:
  device_request

define RESULT_appointmentId:
  appointment

define "network" : Coverage.network

define OUT_NETWORK:
 if not (network in {'GoldCare Network'})
  then true
else false

define SPECIAL_INSTRUCTIONS:
  'Blood Test and Allergy Checks to the Radioactive dye are required to be performed'
