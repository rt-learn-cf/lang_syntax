/**
 * [extends description]
 * @type {String}
 */
component ProductsInMarket implements="Criteria" {
    /**
     * [getSql description]
     * @return {[type]} [description]
     */
    String function getSql() {
        return "
                SELECT
                          owi_productplanid as productId
                        , product_name
                        , partition_incl
                        , pplan_expiry
                        , amount
                        , rp4
                        , vouchertype as voucher_type
                        , IF(rp10, 'Yes', 'No') rp10
                        , partition_incl_rp10
                        , fkfeatures_name_enabled
                        , fkfeatures_name_grandfathered
                  FROM owi_productplans plan
                 WHERE product_type IN (20)
                   AND (fkfeatures_name_enabled IS NULL OR fkfeatures_name_enabled IN (SELECT NAME FROM features WHERE NOW() BETWEEN IFNULL(active_from, NOW()) AND IFNULL(active_to, NOW())))
                   AND (fkfeatures_name_grandfathered IS NULL OR fkfeatures_name_grandfathered NOT IN (SELECT NAME FROM features WHERE NOW() BETWEEN IFNULL(active_from, NOW()) AND IFNULL(active_to, NOW())))
                   AND (fkfeatures_name_disabled IS NULL OR fkfeatures_name_disabled NOT IN (SELECT NAME FROM features WHERE NOW() BETWEEN IFNULL(active_from, NOW()) AND IFNULL(active_to, NOW())))
                 ORDER BY owi_productplanid ASC;
        ";
    }
}
