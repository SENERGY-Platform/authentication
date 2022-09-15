<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">
        <title>SENERGY | Login</title>
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
                margin: 50px 0;
                padding: 20px;
                width: 35%;
            }

            form label,
            form input {
                width: 100%;
            }

            form .button {
                width: 150px;
                padding: 0;
            }

            .logo {
                height: 48px;
            }

            .toolbar {
                width: 100%;
                height: 64px;
                background-color: rgb(68, 132 ,206);
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
                color: rgb(68, 132 ,206) !important;
            }

          
            .mdl-textfield__label:after {
               background-color: rgb(68, 132 ,206)!important;
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
                color: rgb(68, 132 ,206);
            }

            .mdl-button--raised {
                background: rgb(68, 132 ,206);
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
        <div class="toolbar">
        <div>
            <img class="logo" src="${url.resourcesPath}/img/logo.png">
        </div>
            <#if realm.internationalizationEnabled>
                <div id="kc-locale" class="${properties.kcLocaleClass!}">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div class="kc-dropdown" id="kc-locale-dropdown">
                                <#list locale.supported as l>
                                    <#if locale.current = l.label>
                                        
                                    <#else>
                                        <a href="${l.url}">
                                                <#if l.label = 'de'>
                                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGzSURBVHjaYvTxcWb4+53h3z8GZpZff/79+v3n/7/fDAz/GHAAgABi+f37e3FxOZD1Dwz+/v3z9y+E/AMFv3//+Qumfv9et241QACxMDExAVWfOHkJJAEW/gUEP0EQDn78+AHE/gFOQJUAAcQiy8Ag8O+fLFj1n1+/QDp+/gQioK7fP378+vkDqOH39x9A/RJ/gE5lAAhAYhzcAACCQBDkgRXRjP034R0IaDTZTFZn0DItot37S94KLOINerEcI7aKHAHE8v/3r/9//zIA1f36/R+o4tevf1ANYNVA9P07RD9IJQMDQACxADHD3z8Ig4GMHz+AqqHagKp//fwLVA0U//v7LwMDQACx/LZiYFD7/5/53/+///79BqK/EMZ/UPACSYa/v/8DyX9A0oTxx2EGgABi+a/H8F/m339BoCoQ+g8kgRaCQvgPJJiBYmAuw39hxn+uDAABxMLwi+E/0PusRkwMvxhBGoDkH4b/v/+D2EDyz///QB1/QLb8+sP0lQEggFh+vGXYM2/SP6A2Zoaf30Ex/J+PgekHwz9gQDAz/P0FYrAyMfz7wcDAzPDtFwNAgAEAd3SIyRitX1gAAAAASUVORK5CYII=" title="Deutsch" alt="Deutsch">
                                                </#if>
                                                <#if l.label = 'Deutsch'>
                                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGzSURBVHjaYvTxcWb4+53h3z8GZpZff/79+v3n/7/fDAz/GHAAgABi+f37e3FxOZD1Dwz+/v3z9y+E/AMFv3//+Qumfv9et241QACxMDExAVWfOHkJJAEW/gUEP0EQDn78+AHE/gFOQJUAAcQiy8Ag8O+fLFj1n1+/QDp+/gQioK7fP378+vkDqOH39x9A/RJ/gE5lAAhAYhzcAACCQBDkgRXRjP034R0IaDTZTFZn0DItot37S94KLOINerEcI7aKHAHE8v/3r/9//zIA1f36/R+o4tevf1ANYNVA9P07RD9IJQMDQACxADHD3z8Ig4GMHz+AqqHagKp//fwLVA0U//v7LwMDQACx/LZiYFD7/5/53/+///79BqK/EMZ/UPACSYa/v/8DyX9A0oTxx2EGgABi+a/H8F/m339BoCoQ+g8kgRaCQvgPJJiBYmAuw39hxn+uDAABxMLwi+E/0PusRkwMvxhBGoDkH4b/v/+D2EDyz///QB1/QLb8+sP0lQEggFh+vGXYM2/SP6A2Zoaf30Ex/J+PgekHwz9gQDAz/P0FYrAyMfz7wcDAzPDtFwNAgAEAd3SIyRitX1gAAAAASUVORK5CYII=" title="Deutsch" alt="Deutsch">
                                                </#if>
                                                <#if l.label = 'English'>
                                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAflJREFUeNpinDRzn5qN3uFDt16+YWBg+Pv339+KGN0rbVP+//2rW5tf0Hfy/2+mr99+yKpyOl3Ydt8njEWIn8f9zj639NC7j78eP//8739GVUUhNUNuhl8//ysKeZrJ/v7z10Zb2PTQTIY1XZO2Xmfad+f7XgkXxuUrVB6cjPVXef78JyMjA8PFuwyX7gAZj97+T2e9o3d4BWNp84K1NzubTjAB3fH0+fv6N3qP/ir9bW6ozNQCijB8/8zw/TuQ7r4/ndvN5mZgkpPXiis3Pv34+ZPh5t23//79Rwehof/9/NDEgMrOXHvJcrllgpoRN8PFOwy/fzP8+gUlgZI/f/5xcPj/69e/37//AUX+/mXRkN555gsOG2xt/5hZQMwF4r9///75++f3nz8nr75gSms82jfvQnT6zqvXPjC8e/srJQHo9P9fvwNtAHmG4f8zZ6dDc3bIyM2LTNlsbtfM9OPHH3FhtqUz3eXX9H+cOy9ZMB2o6t/Pn0DHMPz/b+2wXGTvPlPGFxdcD+mZyjP8+8MUE6sa7a/xo6Pykn1s4zdzIZ6///8zMGpKM2pKAB0jqy4UE7/msKat6Jw5mafrsxNtWZ6/fjvNLW29qv25pQd///n+5+/fxDDVbcc//P/zx/36m5Ub9zL8+7t66yEROcHK7q5bldMBAgwADcRBCuVLfoEAAAAASUVORK5CYII=" title="English" alt="English">
                                                </#if>
                                                <#if l.label = 'en'>
                                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAflJREFUeNpinDRzn5qN3uFDt16+YWBg+Pv339+KGN0rbVP+//2rW5tf0Hfy/2+mr99+yKpyOl3Ydt8njEWIn8f9zj639NC7j78eP//8739GVUUhNUNuhl8//ysKeZrJ/v7z10Zb2PTQTIY1XZO2Xmfad+f7XgkXxuUrVB6cjPVXef78JyMjA8PFuwyX7gAZj97+T2e9o3d4BWNp84K1NzubTjAB3fH0+fv6N3qP/ir9bW6ozNQCijB8/8zw/TuQ7r4/ndvN5mZgkpPXiis3Pv34+ZPh5t23//79Rwehof/9/NDEgMrOXHvJcrllgpoRN8PFOwy/fzP8+gUlgZI/f/5xcPj/69e/37//AUX+/mXRkN555gsOG2xt/5hZQMwF4r9///75++f3nz8nr75gSms82jfvQnT6zqvXPjC8e/srJQHo9P9fvwNtAHmG4f8zZ6dDc3bIyM2LTNlsbtfM9OPHH3FhtqUz3eXX9H+cOy9ZMB2o6t/Pn0DHMPz/b+2wXGTvPlPGFxdcD+mZyjP8+8MUE6sa7a/xo6Pykn1s4zdzIZ6///8zMGpKM2pKAB0jqy4UE7/msKat6Jw5mafrsxNtWZ6/fjvNLW29qv25pQd///n+5+/fxDDVbcc//P/zx/36m5Ub9zL8+7t66yEROcHK7q5bldMBAgwADcRBCuVLfoEAAAAASUVORK5CYII=" title="English" alt="English">
                                                </#if>
                                        </a>
                                    </#if>
                                </#list>
                        </div>
                    </div>
                </div>
            </#if>

        </div>

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