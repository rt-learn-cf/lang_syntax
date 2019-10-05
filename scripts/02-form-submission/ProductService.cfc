import com.adobe.coldfusion.query;
import lang_app.common.StringUtils;
import "lang_app.scripts.02-form-submission.criteria.*";

/**
 *
 */
component ProductService accessors="true" {

    property name="queryService" type="com.adobe.coldfusion.query";
    property name="dataSource" type="String" default="crm";
    property name="productRepo"
      type="lang_app.scripts.02-form-submission.ProductRepository" ;

    this.IDX = {
        SIZEGB: 1,
        PRICE: 2,
        DATASTOP: 3,
        VCT: 4,
        MIN300: 5,
        ACTIVE: 6,
        GF: 7
    };

    this.stringUtils = new StringUtils();

    this.anMb = 1024;
    this.oneGb = this.anMb * this.anMb;

    /**
     * [init description]
     * @return {[type]} [description]
     */
    ProductService function init() {
        setQueryService(new query());
        setDataSource("crm");
        setProductRepo(new ProductRepository());
        variables.productLines = [];
        return this;
    }

    /**
     * [addProductSet description]
     * @baseId {[type]} required Numeric baseId [description]
     */
    public Void function addProductSet(required Numeric baseId) {
        variables.baseId = arguments.baseId;
    }


    /**
     * [addProductLine description]
     * @productLine {[type]} required String productLine [description]
     */
    Void function addProductLine(required String productLine) {
        arrayAppend(variables.productLines, arguments.productLine);
    }

    /**
     * [generateProductPlans description]
     * @return {[type]} [description]
     */
    String function generateProductPlans() {
        var output = "
        INSERT INTO `owi_productplans`
          (`owi_productplanid`, `plan_code`, `product_name`, `usage_id`, `allowmanage`, `product_type`, `isthreeg`
         , `onbar`, `auto_prov`, `partition_incl`, `partition_id`, `pplan_expiry`, `max_acc`, `max_rm`, `rollover`, `amount`
         , `rp1`, `rp2`, `rp3`, `rp4`, `rp5`, `rp6`, `rp7`, `rp8`, `dm30`, `dm39`, `VoucherType`, `DateTimeInserted`, `rp10`
         , `partition_incl_rp10`, `fkfeatures_name_enabled`, `fkfeatures_name_grandfathered`, `short_code`, `short_name`
         , `promo_code`, `sms_short_code`)
        VALUES ";

        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            if (i > 1) {
                output &= ',';
            }
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);

            var sizeGb = product[this.IDX.SIZEGB];
            var activeOn = product[this.IDX.ACTIVE];
            var gfOn = product[this.IDX.GF] == 'NULL' ? 'NULL' : "'#product[this.IDX.GF]#'";
            var voucherType = product[this.IDX.VCT];
            var price = mid(product[this.IDX.PRICE], 2, len(product[this.IDX.PRICE]) - 1);
            var with300 = lcase(product[this.IDX.MIN300]) == 'yes';

            var productId = variables.baseId + sizeGb;

            output &= "
            (#productId#, 'RP#productId#', 'Unlimited #product[this.IDX.SIZEGB]#GB', 'RP#productId#', 0, 20, 0
            , 0, 0, #sizeGb# * 1024 * 1024, 0, 28, 0, 0, 0, #price#
            , 0, 0, 0, #sizeGb# * 1024 * 1024, 0, 0, 0, 0, 2.01, 0, #voucherType#, 'NOW()', #(with300 ? '18000': 'NULL')#
            , #(with300 ? '18000': '0')#, '#activeOn#', #gfOn#, 'UNL#sizeGb#', 'UNL#sizeGb#_#productId#'
            , 'UNL#sizeGb#_#productId#', 'UNL#sizeGb#GB')";
        }
        output &= ';';
        return output;
    }

    /**
     * [degenerateProductPlans description]
     * @return {[type]} [description]
     */
    String function degenerateProductPlans() {
        var output = "
        DELETE FROM `owi_productplans`
        WHERE owi_productplanid in (";

        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);

            if (i > 1) {
                output &= ',';
            }
            var sizeGb = product[this.IDX.SIZEGB];
            var productId = variables.baseId + sizeGb;

            output &= "#productId#";
        }
        output &= ');';

        return output;
    }

    /**
     * [generateRatePlans description]
     * @return {[type]} [description]
     */
    String function generateRatePlans() {
        var output = "
        INSERT INTO `owi_pplantorplan` (`fkowi_productplanid`, `fkowi_rateplanid`)
        VALUES";

        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            if (i > 1) {
                output &= ',';
            }
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);

            var sizeGb = product[this.IDX.SIZEGB];
            var voucherType = product[this.IDX.VCT];
            var productId = variables.baseId + sizeGb;

            if (vouchertype == '797') {
                output &= "
                (#productId#, 10),
                (#productId#, 11)";
            } else {
                output &= "
                (#productId#, 6),
                (#productId#, 7)";
            }
        }
        output &= ';';
        return output;
    }

    /**
     * [degenerateRatePlans description]
     * @return {[type]} [description]
     */
    String function degenerateRatePlans() {
        var output = "
        DELETE FROM `owi_pplantorplan`
        WHERE fkowi_productplanid in (";

        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);

            if (i > 1) {
                output &= ',';
            }
            var sizeGb = product[this.IDX.SIZEGB];
            var productId = variables.baseId + sizeGb;

            output &= "#productId#";
        }
        output &= ');';
        return output;
    }

    /**
     * [generateMockProductsJson description]
     * @return {[type]} [description]
     */
    String function generateMockProductsJson() {
        var output = "";

        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);

            var sizeGb = product[this.IDX.SIZEGB];
            var productId = variables.baseId + sizeGb;

            output &= ',
            {
                "id"            : #productId#
            }';

        }
        return output;
    }

    /**
     * [generatePoseidonJson description]
     * @return {[type]} [description]
     */
    String function generatePoseidonJson() {
        var output = "";

        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);

            var sizeGb = product[this.IDX.SIZEGB];
            var gfed = (product[this.IDX.GF] == product[this.IDX.ACTIVE] ? 1 : 0);
            var productId = variables.baseId + sizeGb;
            var formattedId = reverse(this.stringUtils.splitEveryNth(reverse("#productId#"), 3, '_'));

            output &= ",
    { id: #formattedId#, name: '#sizeGb#GB',    type: TYPES[:mobile_plans], current: 1, grandfathered: #gfed# }";

        }
        return output;
    }

    /**
     * [generateServicesViews description]
     * @return {[type]} [description]
     */
    String function generateServicesViews() {
        var output = "";
        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);

            var sizeGb = product[this.IDX.SIZEGB];
            var sizeBytes = sizeGb * this.oneGb;
            var productId = variables.baseId + sizeGb;
            var voucherType = product[this.IDX.VCT];
            var with300 = lcase(product[this.IDX.MIN300]) == 'yes';
            var priceFormatted = "#mid(product[this.IDX.PRICE], 2, len(product[this.IDX.PRICE]) - 1)#00";
            var formattedSizeGb = reverse(this.stringUtils.splitEveryNth(reverse("#sizeBytes#"), 3, '_'));

            if (voucherType == 797) {
              output &= ',
              "#productId#": {
                "id": "#productId#",
                "code": "ult-#sizeGb#gb",
                "name": "UNLIMITED #sizeGb#GB",
                "product-category": "voice_and_text",
                "behaviour-type": null,
                "is-unlimited": true,
                "is-unlimited-international": false,
                "international-calls": null,
                "included-data": "#formattedSizeGb#",
                "included-credit": null,
                "price": #priceFormatted#,
                "is-data-pack": false,
                "can-auto-data-topup": false,
                "validity-period": 28,
                "terms-and-policies-url": "https://www.amaysim.com.au/terms-policies"
              }';
            } else if (with300) {
              output &= ',
              "#productId#": {
                "id": "#productId#",
                "code": "ult-#sizeGb#gb",
                "name": "UNLIMITED #sizeGb#GB",
                "product-category": "voice_and_text",
                "behaviour-type": null,
                "is-unlimited": true,
                "is-unlimited-international": true,
                "international-calls": 300,
                "included-data": "#formattedSizeGb#",
                "included-credit": null,
                "price": #priceFormatted#,
                "is-data-pack": false,
                "can-auto-data-topup": false,
                "validity-period": 28,
                "terms-and-policies-url": "https://www.amaysim.com.au/terms-policies"
              }';
            } else {
              output &= ',
              "#productId#": {
                "id": "#productId#",
                "code": "ult-#sizeGb#gb",
                "name": "UNLIMITED #sizeGb#GB",
                "product-category": "voice_and_text",
                "behaviour-type": null,
                "is-unlimited": true,
                "is-unlimited-international": true,
                "international-calls": 0,
                "included-data": "#formattedSizeGb#",
                "included-credit": null,
                "price": #priceFormatted#,
                "is-data-pack": false,
                "can-auto-data-topup": false,
                "validity-period": 28,
                "terms-and-policies-url": "https://www.amaysim.com.au/terms-policies"
              }';
            }
        }
        return output;
    }

    /**
     * [generateMobileApiJson description]
     * @return {[type]} [description]
     */
    String function generateMobileApiJson() {
        var output = "";
        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);

            var sizeGb = product[this.IDX.SIZEGB];
            var sizeBytes = sizeGb * this.oneGb;
            var productId = variables.baseId + sizeGb;
            var voucherType = product[this.IDX.VCT];
            var with300 = lcase(product[this.IDX.MIN300]) == 'yes';
            var price = product[this.IDX.PRICE];
            var priceFormatted = "#mid(product[this.IDX.PRICE], 2, len(product[this.IDX.PRICE]) - 1)#00";

            if (voucherType == 797) {
              output &= ',
     {
       "id": "#productId#",
       "type": "plans_info",
       "category": "voice_and_text",
       "attributes": {
         "name": "UNLIMITED #sizeGb#GB",
         "price": "#priceFormatted#",
         "ayg_data_rate": "15.4c/MB",
         "validity_period": "28 days",
         "plan_summary": "Unlimited talk and text in Australia.",
         "data_header": "#sizeGb#GB data",
         "data_body": "Optus 4G Plus network\nAdditional data (if you run out) is 15.4c/MB or $10/1GB",
         "calls_text_header": "unlimited talk & text",
         "calls_text_body": "Standard calls, SMS and MMS to mobiles & landlines\nCalls to 13 & 18 numbers, and voicemail",
         "intl_calls_text_header": null,
         "intl_calls_text_body": null,
         "renews_header": "renews every 28 days",
         "renews_body": "Automatically renews for #price# every 28 days",
         "cis_link": "https://www.amaysim.com.au/dms/amaysim/documents/critical-information-summary/critical-info-summary-unl-#productId#.pdf"
       }
     }';
            } else if (with300) {
              output &= ',
     {
       "id": "#productId#",
       "type": "plans_info",
       "category": "voice_and_text",
       "attributes": {
         "name": "UNLIMITED #sizeGb#GB",
         "price": "#priceFormatted#",
         "ayg_data_rate": "15.4c/MB",
         "validity_period": "28 days",
         "plan_summary": "Unlimited talk and text in Australia, with international inclusions.",
         "data_header": "#sizeGb#GB data",
         "data_body": "Optus 4G Plus network\nAdditional data (if you run out) is 15.4c/MB or $10/1GB",
         "calls_text_header": "unlimited talk & text",
         "calls_text_body": "Standard calls, SMS and MMS to mobiles & landlines\nCalls to 13 & 18 numbers, and voicemail",
         "intl_calls_text_header": "unlimited international",
         "intl_calls_text_body": "Standard calls to mobiles & landlines in 10 countries\nStandard SMS & MMS to mobiles in selected countries",
         "intl_calls_minutes_header": "300 mins international",
         "intl_calls_minutes_body": "Standard calls to mobiles & landlines to even more countries",
         "renews_header": "renews every 28 days",
         "renews_body": "Automatically renews for #price# every 28 days",
         "cis_link": "https://www.amaysim.com.au/dms/amaysim/documents/critical-information-summary/critical-info-summary-unl-#productId#.pdf"
       }
     }';
            } else {
              output &= ',
     {
       "id": "#productId#",
       "type": "plans_info",
       "category": "voice_and_text",
       "attributes": {
         "name": "UNLIMITED #sizeGb#GB",
         "price": "#priceFormatted#",
         "ayg_data_rate": "15.4c/MB",
         "validity_period": "28 days",
         "plan_summary": "Unlimited talk and text in Australia, with international inclusions.",
         "data_header": "#sizeGb#GB data",
         "data_body": "Optus 4G Plus network\nAdditional data (if you run out) is 15.4c/MB or $10/1GB",
         "calls_text_header": "unlimited talk & text",
         "calls_text_body": "Standard calls, SMS and MMS to mobiles & landlines\nCalls to 13 & 18 numbers, and voicemail",
         "intl_calls_text_header": "unlimited international",
         "intl_calls_text_body": "Standard calls to mobiles & landlines in 10 countries\nStandard SMS & MMS to mobiles in selected countries",
         "renews_header": "renews every 28 days",
         "renews_body": "Automatically renews for #price# every 28 days",
         "cis_link": "https://www.amaysim.com.au/dms/amaysim/documents/critical-information-summary/critical-info-summary-unl-#productId#.pdf"
       }
     }';
            }
        }
        return output;
    }

    /**
     * [generateMobileApiYaml description]
     * @return {[type]} [description]
     */
    String function generateMobileApiYaml() {
        var output = "";
        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);

            var sizeGb = product[this.IDX.SIZEGB];
            var sizeBytes = sizeGb * this.oneGb;
            var productId = variables.baseId + sizeGb;
            var voucherType = product[this.IDX.VCT];
            var with300 = lcase(product[this.IDX.MIN300]) == 'yes';
            var priceFormatted = "#mid(product[this.IDX.PRICE], 2, len(product[this.IDX.PRICE]) - 1)#00";
            var formattedSizeGb = reverse(this.stringUtils.splitEveryNth(reverse("#sizeBytes#"), 3, '_'));

            if (voucherType == 797) {
              output &= "
              '#productId#':
                id: '#productId#'
                code: 'ult-#sizeGb#gb'
                name: 'UNLIMITED #sizeGb#GB'
                product_category: 'voice_and_text'
                behaviour_type: null
                is_unlimited: true
                is_unlimited_international: false
                international_calls: null
                included_data: #formattedSizeGb#
                included_credit: null
                price: #priceFormatted#
                is_data_pack: false
                can_auto_data_topup: false
                validity_period: 28
                terms_and_policies_url: 'https://www.amaysim.com.au/terms-policies'";
            } else if (with300) {
              output &= "'#productId#':
                id: '#productId#'
                code: 'ult-#sizeGb#gb'
                name: 'UNLIMITED #sizeGb#GB'
                product_category: 'voice_and_text'
                behaviour_type: null
                is_unlimited: true
                is_unlimited_international: true
                international_calls: 300
                included_data: #formattedSizeGb#
                included_credit: null
                price: #priceFormatted#
                is_data_pack: false
                can_auto_data_topup: false
                validity_period: 28
                terms_and_policies_url: 'https://www.amaysim.com.au/terms-policies'
              ";
            } else {
              output &= "
              '#productId#':
                id: '#productId#'
                code: 'ult-#sizeGb#gb'
                name: 'UNLIMITED #sizeGb#GB'
                product_category: 'voice_and_text'
                behaviour_type: null
                is_unlimited: true
                is_unlimited_international: true
                international_calls: 0
                included_data: #formattedSizeGb#
                included_credit: null
                price: #priceFormatted#
                is_data_pack: false
                can_auto_data_topup: false
                validity_period: 28
                terms_and_policies_url: 'https://www.amaysim.com.au/terms-policies'
              ";
            }
        }
        return output;
    }

    /**
     * [generateMockProductFilesJson description]
     * @return {[type]} [description]
     */
    Void function generateMockProductFilesJson() {
        var output = "";

        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);
            var voucherType = product[this.IDX.VCT];

            var sizeGb = product[this.IDX.SIZEGB];
            var productId = variables.baseId + sizeGb;
            var with300 = lcase(product[this.IDX.MIN300]) == 'yes';

            if (voucherType == 797) {
                fileWrite(expandPath("./target/#productId#.json"), '{
  "id": #productId#,
  "productName": "Unlimited #sizeGb#GB",
  "voucherType": 797,
  "partitions": {
    "provider": [
      { "id":  2, "amount": 2147483647, "expiryDays": 28 },
      { "id":  3, "amount": 2147483647, "expiryDays": 28 }
    ],
    "uplift": [
      { "id":  4, "amount":   #sizeGb * this.oneGb#, "expiryDays": 28 }
    ]
  },
  "dedicatedMoneyAmount": 2.01,
  "rateplans": {
    "prepaid": 610014,
    "postpaid": 620014
  }
}');
            } else if (with300) {
                fileWrite(expandPath("./target/#productId#.json"), '{
  "id": #productId#,
  "productName": "Unlimited #sizeGb#GB",
  "voucherType": 960,
  "partitions": {
    "provider": [
      { "id":  2, "amount": 2147483647, "expiryDays": 28 },
      { "id":  3, "amount": 2147483647, "expiryDays": 28 },
      { "id": 12, "amount": 2147483647, "expiryDays": 28 }
    ],
    "uplift": [
      { "id":  4, "amount":   #sizeGb * this.oneGb#, "expiryDays": 28 },
      { "id": 10, "amount":      18000, "expiryDays": 28 }
    ]
  },
  "dedicatedMoneyAmount": 2.01
}');
            } else {
                fileWrite(expandPath("./target/#productId#.json"), '{
  "id": #productId#,
  "productName": "Unlimited #sizeGb#GB",
  "voucherType": 960,
  "partitions": {
    "provider": [
      { "id":  2, "amount": 2147483647, "expiryDays": 28 },
      { "id":  3, "amount": 2147483647, "expiryDays": 28 },
      { "id": 12, "amount": 2147483647, "expiryDays": 28 }
    ],
    "uplift": [
      { "id":  4, "amount":   #sizeGb * this.oneGb#, "expiryDays": 28 }
    ]
  },
  "dedicatedMoneyAmount": 2.01
}');
            }
        }
    }

    /**
     * [generateTransitions description]
     * @return {[type]} [description]
     */
    String function generateTransitions() {
        var output = "
        INSERT INTO `owi_productplans_matrix` (`fkproductplanid_current`, `fkproductplanid_current_data`
            , `fkproductplanid_new` , `can_purchase`, `data_threshold`, `purchase_type`, `migration_time`
            , `description`, `dtInserted`, `fkfeatures_name_active`)
        VALUES";

        var inMarketCriteria = new ProductsInMarket();
        var inMarketProducts = getProductRepo().get(inMarketCriteria);

        var firstRun = true;
        for (var i=1;i<=arrayLen(variables.productLines);i++) {
            var productLine = variables.productLines[i];
            var product = listToArray(productLine);

            var sizeGb = product[this.IDX.SIZEGB];
            var sizeBytes = sizeGb * this.oneGb;
            var productId = variables.baseId + sizeGb;
            var activeOn = product[this.IDX.ACTIVE];
            var price = val(mid(product[this.IDX.PRICE], 2, len(product[this.IDX.PRICE]) - 1));


            for (var product in inMarketProducts) {

                var isUpgrade = sizeBytes < product.partition_incl;
                var purchaseType = 'upgrade';
                var migrationTime = 'immediate';
                if (!isUpgrade) {
                    purchaseType = 'downgrade';
                    migrationTime = 'scheduled';
                }

                // Check for good deals.
                var samePrice = product.amount == price;
                var lowerPrice = product.amount < price;

                var greaterInclusion = product.partition_incl > sizeBytes;
                var sameInclusion = product.partition_incl == sizeBytes;
                var lowerInclusion = product.partition_incl < sizeBytes;

                if (greaterInclusion || lowerPrice && sameInclusion || lowerPrice && lowerInclusion) {
                    if (!firstRun) {
                        output &= ',';
                    }

                    output &= "
                (#productId#, 0, #product.productId#, 'yes', 0.00, '#purchaseType#', '#migrationTime#', 'The purchase is allowed', NOW(), '#activeOn#')";
                } else {
                    output &= "
                        -- Skip #productId# to #product.productId# Price #price# to #product.amount#, Size #sizeBytes# to #product.partition_incl#";

                }
                firstRun = false;
            }
            output &= ",
                (#productId#, 0, 0, 'yes', 0.00, 'downgrade', 'scheduled', 'The purchase is allowed', NOW(), '#activeOn#'),";
            output &= "
                (#productId#, 0, 6010, 'yes', 0.00, 'addition', 'immediate', 'The purchase is allowed', NOW(), '#activeOn#')";


        }
        output &= ';';
        return output;
    }

    /**
     * [generateNewProductsTransitions description]
     * @return {[type]} [description]
     */
    String function generateNewProductsTransitions() {
        var output = "
        INSERT INTO `owi_productplans_matrix` (`fkproductplanid_current`, `fkproductplanid_current_data`
            , `fkproductplanid_new` , `can_purchase`, `data_threshold`, `purchase_type`, `migration_time`
            , `description`, `dtInserted`, `fkfeatures_name_active`)
        VALUES";

        var gfCriteria = new ProductsGrandfathered();
        var gfProducts = getProductRepo().get(gfCriteria);

        var firstRun = true;

        for (var product in gfProducts) {
            for (var i=1;i<=arrayLen(variables.productLines);i++) {
                var productLine = variables.productLines[i];
                var newProduct = listToArray(productLine);

                var sizeGb = newProduct[this.IDX.SIZEGB];
                var sizeBytes = sizeGb * this.oneGb;
                var productId = variables.baseId + sizeGb;
                var activeOn = newProduct[this.IDX.ACTIVE];
                var price = val(mid(newProduct[this.IDX.PRICE], 2, len(newProduct[this.IDX.PRICE]) - 1));

                var isUpgrade = sizeBytes > product.partition_incl;
                var purchaseType = 'upgrade';
                var migrationTime = 'immediate';

                if (!isUpgrade) {
                    purchaseType = 'downgrade';
                    migrationTime = 'scheduled';
                }

                // Check for good deals.
                var samePrice = product.amount == price;
                var lowerPrice = product.amount > price;

                var greaterInclusion = product.partition_incl < sizeBytes;
                var sameInclusion = product.partition_incl == sizeBytes;
                var lowerInclusion = product.partition_incl > sizeBytes;

                if (greaterInclusion || lowerPrice && sameInclusion || lowerPrice && lowerInclusion) {
                    if (!firstRun) {
                        output &= ',';
                    }

                    output &= "
                (#product.productId#, 0, #productId#, 'yes', 0.00, '#purchaseType#', '#migrationTime#', 'The purchase is allowed', NOW(), '#activeOn#')";
                } else {
                    output &= "
                        -- Skip #productId# to #product.productId# Price #price# to #product.amount#, Size #sizeBytes# to #product.partition_incl#";

                }

                // output &= "
                //     -- #product.productId# to #productId# Price #product.amount# to #price#, Size  #product.partition_incl# to #sizeBytes#";

                firstRun = false;
            }
        }
        output &= ';';
        return output;
    }

    /**
     * [queryEnabledProducts description]
     * @return {[type]} [description]
     */
    Query function queryEnabledProducts() {
        var dao = getQueryService();
        dao.setDatasource(getDataSource());
        dao.setSQL("
            SELECT *
              FROM owi_productplans plan
             WHERE product_type IN (20, 22)
               AND (fkfeatures_name_disabled IS NULL OR fkfeatures_name_disabled NOT IN (SELECT NAME FROM features WHERE NOW() BETWEEN IFNULL(active_from, NOW()) AND IFNULL(active_to, NOW())))
             ORDER BY product_type ASC
                    , owi_productplanid ASC;

        ");
        return dao.execute().getResult();
    }
}
