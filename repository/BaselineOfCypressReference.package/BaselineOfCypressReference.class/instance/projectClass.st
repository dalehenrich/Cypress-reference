accessing
projectClass
  "bullet proof until the day when MetacelloCypressBaselineProject is loaded in all images"

  ^ Smalltalk
    at: #'MetacelloCypressBaselineProject'
    ifAbsent: [ super projectClass ]