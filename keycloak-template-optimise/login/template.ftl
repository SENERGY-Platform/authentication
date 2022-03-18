<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">
        <title>OPTIMISE | Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <style>
            .form_outer {
                display: flex;
                justify-content: center;
            }

            form {
                display: flex;
                flex-direction: column;
                width: 35%;
            }

            form label,
            form input {
                width: 100%;
            }

            form .button {
                padding: 0;
            }

            .logo {
                height: 48px;
            }

            .toolbar {
                width: 100%;
                height: 64px;
                background-color: #32b8ba;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .toolbar > div:nth-child(1) {
                margin-left: 10px;
            }

            .toolbar > div:nth-child(2) {
                margin-right: 10px;
            }

            .mdl-textfield {
                width: 100%;
            }

            .mdl-textfield--floating-label.is-focused .mdl-textfield__label,
            .mdl-textfield--floating-label.is-dirty .mdl-textfield__label,
            .mdl-textfield--floating-label.has-placeholder .mdl-textfield__label {
                color: #32b8ba !important;
            }

          
            .mdl-textfield__label:after {
               background-color: #32b8ba!important;
            }

            .login_outer {
                display: flex;
                justify-content: space-between;
            }

            .image_outer {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .image_outer img:nth-child(1) {
                margin-right: 10px;
            }

            .image_outer img:nth-child(2) {
                margin-left: 10px;
            }

            .is-focused {
                color: #32b8ba;
            }

            .mdl-button--raised {
                background: #32b8ba;
                color: white;
            }

            .mdl-button--raised:hover {
                background: rgb(241, 159, 77);
            }

            i {
                color: white;
            } 

            a {
                text-decoration: none;
            }

            .kc-feedback-text {
                padding: 0 0 20px;
            }

            @media screen and (min-width: 1400px) {
                form {
                    width: 25%;
                }
            }

            @media screen and (max-width: 800px) {
                form {
                    width: 85%;
                }

                .image_outer {
                    flex-direction: column;
                }

            }
        </style>

        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <#if properties.meta?has_content>
            <#list properties.meta?split( ' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}" />
            </#list>
        </#if>
        <title>
            <#nested "title">
        </title>
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
        <#if properties.styles?has_content>
            <#list properties.styles?split( ' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split( ' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>
    </head>

    <body class="${properties.kcBodyClass!}">
       <div id="kc-container" class="${properties.kcContainerClass!}">
            <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">
                <div id="kc-content" class="${properties.kcContentClass!}">
                    <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">
                        <div id="kc-form" class="${properties.kcFormAreaClass!}">
                            <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                                <#nested "form">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>
</#macro>
