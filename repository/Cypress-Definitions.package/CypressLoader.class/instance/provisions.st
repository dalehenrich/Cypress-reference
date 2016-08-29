accessing
provisions
  ^ provisions
    ifNil: [ provisions := (Smalltalk allClasses collect: [ :cl | cl name asString ]) asSet ]