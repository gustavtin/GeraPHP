/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

   $(function() {
            // Make sure correct fields are displayed based on initial account type
            updatedAccountType();

            // Bind country - province - city combos
       /*
        *
           var provinceCombo = $('#provinceCombo');
            var countryCombo = $('#countryCombo');
            var cityCombo = $('#cityCombo');

            provinceCombo.fillItemsFrom(countryCombo, function(id) { return provinces[id]; });
            cityCombo.fillItemsFrom(provinceCombo, function(id) { return cities[id]; });

            // Bind category and subcategory combos
            var categCombo = $('#categCombo');
            var subcategCombo = $('#subcategCombo');

            subcategCombo.fillItemsFrom(categCombo, function(id) { return subcategories[id]; });
 */ 
            // Create masks for every input text
            $('input:text').setMask();

            // Listen to change in id type combo to update mask on the number field
            $('#idTypeCombo').change(updateIdTypeMasks);
            updateIdTypeMasks(true);
        });

        function updateIdTypeMasks(dontclear) {
            var idTypeCombo = $('#idTypeCombo');
            var idType = idTypeCombo.val();
            var maskKey = isPersonalAccount() ? personaldocmasks[idType] : enterprisedocmask;

            var idNumberInput = $('#idNumberInput');
            idNumberInput.unsetMask();
            if (dontclear !== true) idNumberInput.val('');
            idNumberInput.setMask(maskKey);
        }

        function isPersonalAccount() {
            return ($("input[@name='AccountType']:checked").val() == '1');
        }

        function updatedAccountType() {
            // Toggle visibility of fields according to account type
            var isPersonal = isPersonalAccount();
            $('.field_personal').toggleClass('nodisplay', !isPersonal);
            $('.field_enterprise').toggleClass('nodisplay', isPersonal);

            // Change contents of document type combo
            $('#idTypeCombo').empty().addItems(isPersonal ? personaldocs : enterprisedocs);
            updateIdTypeMasks();
        }

		$.mask.rules['k'] = /[0-9K]/;
		$.mask.rules['m'] = /[MH]/;

		$.mask.rules['n'] = /[^a-zA-Z]/;

        $.mask.masks = $.extend($.mask.masks,{
            CNPJ:{ mask: '99.999.999/9999-99'},
            CPF:{ mask: '999.999.999-99'},
            RG:{ mask: '*********'},
            CEP:{ mask: '99999-999'},
            CUIT:{ mask: '99-99.999.999-9'},
            CUIL:{ mask: '99-99.999.999-9'},
            LC:{ mask: '9.999.999'},
            LE:{ mask: '9.999.999'},
            DNI:{ mask: '99.999.999'},
            postal_code:{ mask: '9999' },
            //RFC:{ mask: 'aaaa999999***' },
            RFC:{ mask: '********************' },
            CURP:{ mask: '********************' },
            Lic:{ mask: 'a********' },
            IFE:{ mask: '9999999999999' },
            RUT:{ mask: '99.999.999-k' },
            postal_code_mx:{ mask: '99999' },
            postal_code_cl:{ mask: '9999999' },
            number: { mask: 'n', type: 'repeat', fixedChars:"[']" },
            number_ddd: { mask: 'nnn', fixedChars:"[']" },
            phone_number: { mask: 'nnnnnnnnnnnnnnnnn', fixedChars:"[']" }
        });



