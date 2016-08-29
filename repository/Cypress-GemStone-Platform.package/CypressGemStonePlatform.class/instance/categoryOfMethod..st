method portability
categoryOfMethod: aMethod
  | category |
  category := (aMethod inClass categoryOfSelector: aMethod selector) asString.
  ^ category ifNil: [ ClassOrganizer default ]