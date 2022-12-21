/**
* @name Find SuppressWarnings("PMD") annotations
* @description Find SuppressWarnings("PMD") annotations
* @kind problem
* @problem.severity recommendation
* @id java/suppresswarnings-pmd
* @tags security
*       maintainability
*       quality
* @precision medium
* @languages java
* 
**/

import java

from Annotation ann, AnnotationType anntp
where anntp = ann.getType() 
    and anntp.hasQualifiedName("java.lang", "SuppressWarnings")
    and ann.getValue("value").(CompileTimeConstantExpr).getStringValue().toUpperCase() = "PMD"
select ann 