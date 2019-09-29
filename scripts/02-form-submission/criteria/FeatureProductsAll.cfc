/**
 * [extends description]
 * @type {String}
 */
component FeatureProductsAll implements="Criteria" {
    /**
     * [getSql description]
     * @return {[type]} [description]
     */
    String function getSql() {
        return "
                SELECT *
                  FROM features
                 WHERE NAME IN (SELECT DISTINCT fkfeatures_name_enabled FROM owi_productplans)
                    OR NAME IN (SELECT DISTINCT fkfeatures_name_grandfathered FROM owi_productplans)
                    OR NAME IN (SELECT DISTINCT fkfeatures_name_disabled FROM owi_productplans)
                 ORDER BY active_from;
            ";
    }
}
