<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/init.jsp" %>

<%
long accountId = ParamUtil.getLong(request, "accountId");

MailManager mailManager = MailManager.getInstance(request);
%>

<c:if test="<%= Validator.isNotNull(mailManager) %>">
	<div class="row-fluid">
		<%
		List<Account> mailAccounts = mailManager.getAccounts();
		%>

		<c:choose>
			<c:when test="<%= !mailAccounts.isEmpty() %>">
				<div class="span9">
					<ul class="nav nav-pills">

						<%
						for (Account mailAccount : mailAccounts) {
						%>

							<li class="tab <%= (mailAccount.getAccountId() == accountId) ? "active" : "" %>">
								<aui:a cssClass="folders-link" data-accountId="<%= mailAccount.getAccountId() %>" data-inboxFolderId="<%= mailAccount.getInboxFolderId() %>" href="javascript:;" label="<%= mailAccount.getAddress() %>" />
							</li>

						<%
						}
						%>

					</ul>
				</div>

				<div class="span3 text-right">
					<aui:button cssClass="add-account-button" onClick="Liferay.Mail.addAccount();" value="add-mail-account" />
				</div>
			</c:when>
			<c:otherwise>
				<div class="span12">
					<div class="alert alert-info">
						<aui:a href="javascript:;" onClick="Liferay.Mail.addAccount();"><liferay-ui:message key="add-a-new-email-account" /></aui:a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</c:if>