declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace m="http://repertorium.obdurodon.org/model";
declare namespace html="http://www.w3.org/1999/xhtml";

import module namespace re = 'http://www.ilit.bas.bg/repertorium/ns/3.0' at "re-lib.xqm";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "xhtml";
declare option output:html-version "5.0";
declare option output:indent "yes";

(: Housekeeping :)
declare variable $exist:root as xs:string :=
    request:get-attribute("$exist:root");
declare variable $exist:controller as xs:string :=
    request:get-attribute("$exist:controller");

declare variable $filename as xs:string := request:get-parameter("filename", "Error: no filename!");
declare variable $ms-path as xs:string :=
    concat($exist:root, $exist:controller, '/mss/', $filename);
declare variable $ms as element(tei:TEI) := doc($ms-path)/*;

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Index page</title>
    </head>
    <body>
        <h1>File information</h1>
        <ul>
            <li>Filename: {$filename}</li>
            <li>Path to manuscript: {$ms-path}</li>
            <li>Manuscript name: {re:bgMsName($ms)}</li>
        </ul>
    </body>
</html>
