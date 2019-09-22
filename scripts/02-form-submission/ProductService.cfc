import com.adobe.coldfusion.query;

/**
 *
 */
component ProductService accessors="true" {

    property name="queryService" type="com.adobe.coldfusion.query";
    property name="dataSource" type="String" default="crm";

    /**
     * [init description]
     * @return {[type]} [description]
     */
    ProductService function init() {
        setQueryService(new query());
        setDataSource("crm");
        return this;
    }

    /**
     * [queryActiveProducts description]
     * @return {[type]} [description]
     */
    Query function queryActiveProducts() {
        var dao = getQueryService();
        dao.setDatasource(getDataSource());
        dao.setSQL("
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
        ");
        return dao.execute().getResult();
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

    /**
     * [queryProductFeatures description]
     * @activeOnly flag to query only active products or all.
     * @return {[type]} [description]
     */
    Query function queryProductFeatures(required Boolean activeOnly=false) {
        var dao = getQueryService();
        dao.setDatasource(getDataSource());
        if (activeOnly) {
            dao.setSQL("
                SELECT NAME, active_from, active_to
                  FROM features
                  WHERE NOW() BETWEEN IFNULL(active_from, NOW()) AND IFNULL(active_to, NOW())
                   AND NAME IN (
                    -- PRODUCT FEATURES
                    SELECT NAME
                      FROM features
                     WHERE NAME IN (SELECT DISTINCT fkfeatures_name_enabled FROM owi_productplans)
                        OR NAME IN (SELECT DISTINCT fkfeatures_name_grandfathered FROM owi_productplans)
                        OR NAME IN (SELECT DISTINCT fkfeatures_name_disabled FROM owi_productplans)
                   )
                  ORDER BY active_from
            ");
        } else {
            dao.setSQL("
                SELECT NAME, active_from, active_to
                  FROM features
                 WHERE NAME IN (SELECT DISTINCT fkfeatures_name_enabled FROM owi_productplans)
                    OR NAME IN (SELECT DISTINCT fkfeatures_name_grandfathered FROM owi_productplans)
                    OR NAME IN (SELECT DISTINCT fkfeatures_name_disabled FROM owi_productplans)
                 ORDER BY active_from;
            ");
        }
        return dao.execute().getResult();
    }
}
