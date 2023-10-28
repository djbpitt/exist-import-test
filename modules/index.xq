declare namespace m="http://repertorium.obdurodon.org/model";
declare namespace html="http://www.w3.org/1999/xhtml";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "xhtml";
declare option output:html-version "5.0";
declare option output:indent "yes";

(: Housekeeping :)
declare variable $exist:root as xs:string :=
    request:get-attribute("$exist:root");
declare variable $exist:controller as xs:string :=
    request:get-attribute("$exist:controller");
declare variable $pathToMss as xs:string :=
    concat($exist:root, $exist:controller, '/mss');

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Index page</title>
    </head>
    <body>
        <h1>Files</h1>
        <p><strong>Note:</strong> Links assume that app is installed as <i>http://localhost:8080/exist/apps/exist-import-test/</i></p>
        <ul>
            <li><a href="read?filename=AM149NBW.xml">AM149NBW</a> 
            (<a href="http://localhost:8080/exist/apps/exist-import-test/modules/read.xq?filename=AM149NBW.xml">direct link, bypassing controller</a>)</li>
            <li><a href="read?filename=AM76NBW.xml">AM76NBW</a>
            (<a href="http://localhost:8080/exist/apps/exist-import-test/modules/read.xq?filename=AM76NBW.xml">direct link, bypassing controller</a>)</li>
        </ul>
    </body>
</html>