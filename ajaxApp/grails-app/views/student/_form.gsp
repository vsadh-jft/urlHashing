<%@ page import="ajaxapp.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="student.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${studentInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'rollNo', 'error')} required">
	<label for="rollNo">
		<g:message code="student.rollNo.label" default="Roll No" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rollNo" type="number" value="${studentInstance.rollNo}" required=""/>

</div>

