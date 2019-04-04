<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
        ${msg("errorTitle")}
    <#elseif section = "header">
        ${msg("errorTitleHtml")?no_esc}
    <#elseif section = "form">
        <div id="kc-error-message">
            <#if message.summary??> 
                <p class="instruction">${message.summary??}</p>
            </#if>
            <#if client?? && client.baseUrl?has_content>
                <p><a id="backToApplication" href="${client.baseUrl}">${msg("backToApplication")?no_esc}</a></p>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>