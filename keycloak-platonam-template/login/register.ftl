<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<div class="form_outer">
        <form id="kc-register-form" action="${url.registrationAction}" method="post">
          <input type="text" readonly value="this is not a login form" style="display: none;">
          <input type="password" readonly value="this is not a login form" style="display: none;">

          <#if !realm.registrationEmailAsUsername>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <label for="username" class="mdl-textfield__label">${msg("username")}</label>
                    <input type="text" id="username" class="mdl-textfield__input" name="username" value="${(register.formData.username!'')}" />
            </div>
          </#if>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <label for="firstName" class="mdl-textfield__label">${msg("firstName")}</label>
                    <input type="text" id="firstName" class="mdl-textfield__input" name="firstName" value="${(register.formData.firstName!'')}" />
            </div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <label for="lastName" class="mdl-textfield__label">${msg("lastName")}</label>
                    <input type="text" id="lastName" class="mdl-textfield__input" name="lastName" value="${(register.formData.lastName!'')}" />
            </div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <label for="email" class="mdl-textfield__label">${msg("email")}</label>
                    <input type="text" id="email" class="mdl-textfield__input" name="email" value="${(register.formData.email!'')}" />
            </div>

            <#if passwordRequired>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <label for="password" class="mdl-textfield__label">${msg("password")}</label>
                    <input type="password" id="password" class="mdl-textfield__input" name="password" />
            </div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <label for="password-confirm" class="mdl-textfield__label">${msg("passwordConfirm")}</label>
                    <input type="password" id="password-confirm" class="mdl-textfield__input" name="password-confirm" />
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <#if realm.registrationAllowed>  
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="">
                    <input class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
            </#if>
        </form>
        </div>
</@layout.registrationLayout>