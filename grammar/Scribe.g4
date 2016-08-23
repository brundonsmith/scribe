grammar Scribe;

scribe: 'foo ' ID;

PROPER_NOUN: 'foo';
PRONOUN: 'foo';
ENTITY_TYPE: 'foo';
PROPERTY: 'foo';
LITERAL: 'foo';

SET
  : PROPER_NOUN
  | PRONOUN
  | SET SET_OPERATION SET
  | PLURAL
  | PLURAL CONDITIONAL
  | PLURAL SORT
  | PLURAL CONDITIONAL SORT
  | [0-9]+ PLURAL CONDITIONAL
  | [0-9]+ PLURAL SORT
  | [0-9]+ PLURAL CONDITIONAL SORT
  ;

SET_OPERATION
  : 'and'
  | 'except'
  ;

PLURAL
  : 'things'
  | ENTITY_TYPE
  | ENTITY_TYPE's'
  ;

CONDITIONAL
  : PROPERTY ' is ' VALUE
  | PROPERTY ' is ' COMPARATOR VALUE
  ;

VALUE
  : LITERAL
  | PROPERTY
  ;

COMPARATOR
  : 'greater than'
  | 'more than'
  | 'less than'
  | 'lower than'
  | 'equal to'
  ;

SORT
  : 'sorted by ' PROPERTY
  | 'sorted by ' PROPERTY SORT_DIRECTION
  ;

SORT_DIRECTION
  : 'ascending'
  | 'descending'
  ;
