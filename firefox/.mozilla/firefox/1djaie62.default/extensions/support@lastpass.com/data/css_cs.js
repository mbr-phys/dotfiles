function LP_getElementByCSSSelector(e,r){if(e||(e=LP_derive_doc()),!e||!r)return null;return void 0!==e.querySelector?e.querySelector(r):pass,null}function LP_getElementsByCSSSelector(e,r){if(e||(e=LP_derive_doc()),!e||!r)return null;var t=[];return void 0!==e.querySelectorAll?t=e.querySelectorAll(r):pass,t||(t=[]),t}function LP_createCSSSelector(e){return""}