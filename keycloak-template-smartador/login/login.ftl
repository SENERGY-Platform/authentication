<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
<div class="form_outer">
<form class="mdl-shadow--2dp" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
    <h4>${msg("doLogIn")}</h4>
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
        <label for="username" class="mdl-textfield__label">${msg("username")}</label>
        <input tabindex="1" id="username" class="mdl-textfield__input" name="username" type="text"
            autocomplete="off" />
    </div>

    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
        <label for="password" class="mdl-textfield__label">${msg("password")}</label>
        <input tabindex="2" id="password" class="mdl-textfield__input" name="password" type="password" autocomplete="off" />
    </div>


    <#if message?has_content>
        <span class="kc-feedback-text">${msg("invalidUserMessage")}</span>
    </#if>

    <div class="login_outer">
        <input name="login" class="button mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" type="submit" value="${msg(" Login ")}"/>
       <#if realm.registrationAllowed> 
        <a tabindex="6" href="${url.registrationUrl}">
            <span class="button mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">${msg("doRegister")}</span>
        </a>
    </#if>
    </div>
</form>
</div>

</@layout.registrationLayout>
