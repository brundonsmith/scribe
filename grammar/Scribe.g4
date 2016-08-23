grammar Scribe;

scribe
  : STATEMENT (','' '?STATEMENT)*
  ;

STATEMENT
  : EVENT_BINDING
  | IMPERATIVE
  ;

PRONOUN: 'foo';

EVENT_BINDING
  : 'when ' EVENT ', ' IMPERATIVE
  | IMPERATIVE 'until' EVENT
  | 'when ' CONDITIONAL ', ' IMPERATIVE
  | IMPERATIVE ' until ' CONDITIONAL
  ;

EVENT
  : SET EVENT_NAME
  | SET EVENT_NAME CONDITIONAL
  ;

EVENT_NAME
  : ('a'..'z'|'A'..'Z')+
  ;

IMPERATIVE
  : IMPERATIVE_NAME
  | SET IMPERATIVE_NAME
  | SET IMPERATIVE_NAME SET
  ;

IMPERATIVE_NAME
  : ('a'..'z'|'A'..'Z')+
  ;

SET
  : PROPER_NOUN
  | PRONOUN
  | 'all ' SET SET_OPERATION SET
  | PLURAL
  | PLURAL CONDITIONAL
  | PLURAL SORT
  | PLURAL CONDITIONAL SORT
  | [0-9]+ PLURAL CONDITIONAL
  | [0-9]+ PLURAL SORT
  | [0-9]+ PLURAL CONDITIONAL SORT
  ;

SET_OPERATION
  : ' and '
  | ' except '
  ;

PLURAL
  : 'things'
  | ENTITY_TYPE
  | ENTITY_TYPE's'
  ;

CONDITIONAL
  : SET PROPERTY_NAME ' is ' VALUE
  | SET PROPERTY_NAME ' is ' COMPARATOR VALUE
  ;

VALUE
  : LITERAL
  | SET PROPERTY_NAME
  ;

PROPERTY_NAME
  : ('a'..'z'|'A'..'Z')+
  ;

ENTITY_TYPE
  : ('a'..'z'|'A'..'Z')+
  ;

PROPER_NOUN
  : ('a'..'z'|'A'..'Z')+
  ;

LITERAL
  : '"'.*'"'
  | [0-9]+
  ;

COMPARATOR
  : ' greater than '
  | ' more than '
  | ' less than '
  | ' lower than '
  | ' equal to '
  ;

SORT
  : 'sorted by ' PROPERTY_NAME
  | 'sorted by ' PROPERTY_NAME SORT_DIRECTION
  ;

SORT_DIRECTION
  : ' ascending '
  | ' descending '
  ;
