xquery version "3.1";
module namespace re = "http://www.ilit.bas.bg/repertorium/ns/3.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare variable $re:genres as element(genre)+ :=
    doc("/db/apps/exist-import-test/aux/genres.xml")/descendant::genre;

declare function re:bgMsName($ms as element(tei:TEI)) {

  let $individual := $ms/descendant::tei:msIdentifier/tei:msName[fn:lang('bg')][@type eq 'individual']

  (: NOTE(AR) strangely if you replace the above line with one of these two lines it fixes the issue with the the use of $re:genres below - I suspect that fn:lang is somehow the culprit here :)
  (:
  let $individual := $ms/descendant::tei:msIdentifier/tei:msName[@xml:lang eq 'bg'][@type eq 'individual']
  let $individual := (<msName type="individual" xml:lang="bg">Виенски апокрифен сборник</msName>)
  :)
  
  let $specific := $re:genres/en[. = ("apocryphal miscellany", "mixed-content miscellany")]/../bg

  return $specific
};

