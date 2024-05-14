library NonEmergencyAmbulanceTransportationRule version '0.1.0'
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0' called FHIRHelpers

parameter Patient Patient
parameter service_request ServiceRequest
parameter appointment Appointment
parameter Coverage Coverage

define RULE_APPLIES:
  true

define PRIORAUTH_REQUIRED:
  true 

define DOCUMENTATION_REQUIRED:
  true

define RESULT_InfoLink:
  'https://ExampleUMVendor.com/link/'
  
// TODO - need to define the questionnaire in next story
define RESULT_QuestionnaireOrderUri:
  'Questionnaire/NonEmergencyAmbulanceTransportation'

define RESULT_QuestionnairePARequestUri:
  'Questionnaire/NonEmergencyAmbulanceTransportationPARequest'

define RESULT_QuestionnaireProgressNoteUri:
  'Questionnaire/NonEmergencyAmbulanceTransportationProgressNote'

define RESULT_requestId:
  service_request

define RESULT_appointmentId:
  appointment

define "network" : Coverage.network

define OUT_NETWORK:
 if not (network in {'GoldCare Network'})
  then true
else false

define SPECIAL_INSTRUCTIONS:
  'Blood Test and Allergy Checks to the Radioactive dye are required to be performed'
