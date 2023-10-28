xquery version "3.1";
module namespace re = "http://www.ilit.bas.bg/repertorium/ns/3.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare variable $re:genres as element(genre)+ :=
    doc("/db/apps/exist-import-test/aux/genres.xml")/descendant::genre;

declare function re:bgMsName($ms as element(tei:TEI)) as xs:string {
    let $individual as element(tei:msName)* := $ms/descendant::tei:msIdentifier/tei:msName[lang('bg')][@type eq 'individual']  
    let $specific as element(bg)* :=
        let $specificNames as element(tei:msName)* := $ms/descendant::tei:msIdentifier/tei:msName[@type eq 'specific']
        let $en as element(en)* := $re:genres/en[. = $specificNames]
        return $en/../bg
    let $general as element(bg)* :=
        let $generalNames as element(tei:msName)* := $ms/descendant::tei:msIdentifier/tei:msName[@type eq 'general']
        let $en as element(en)* := $re:genres/en[. = $generalNames]
        return $en/../bg
    return ($individual, $specific, $general)[1] ! normalize-space(.)
};

